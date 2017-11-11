From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 11:20:01 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <5DBA847110A28B46BBA17BE675F0C9B2181AA436@cnshjmbx01>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171107181307.58471ad9@windsurf>
 <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
 <5DBA847110A28B46BBA17BE675F0C9B2181AA436@cnshjmbx01>
Message-ID: <6dc6ae96-ac4c-8f47-fe89-ac158f99b16e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-11-17 06:02, Chu, Zhuliang (NSB - CN/Shanghai) wrote:
> Hello,
> 
>> By the way there will also be a problem when host-tar is part of
>> DEPENDENCIES_HOST_PREREQ: ccache needs host-tar to be able to build, but there
>> is no explicit dependency between them, it relies purely on left-to-right order.
> the host-ccache mainly because its directory is defined in the top-level Makefile as below.

 Good catch!

>  453 ifeq ($(BR2_CCACHE),y)
>  454 CCACHE := $(HOST_DIR)/bin/ccache
>  455 BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
>  456 export BR_CACHE_DIR
>  457 HOSTCC := $(CCACHE) $(HOSTCC)
>  458 HOSTCXX := $(CCACHE) $(HOSTCXX)

 The problem is that these things are assigned with := instead of = so
$(HOST_DIR) will not get expanded to per-package like it should. Putting = here
will lead to a self-referencing recursive variable. The obvious thing would be
to change it into
HOSTCC_CCACHE = $(CCACHE) $(HOSTCC)
and use HOSTCC_CCACHE everywhere. Unfortunately, that is *very* risky because we
export HOSTCC, so we have no full control over all its uses. (Admittedly, the
risk is limited to not using ccache in some cases, which is not that bad.)

 Perhaps the following can work:

HOSTCC_ORIG := $(HOSTCC)
HOSTCC = $(CCACHE) $(HOSTCC_ORIG)

(and we can probably reuse HOSTCC_NOCCACHE instead of HOSTCC_ORIG). This does
seem to work from a very quick check.

>  459 else
>  460 export BR_NO_CCACHE
>  461 endif
> 
> In the top Makefile, $(CCACHE) is defined as 'output/host/bin/ccache'. So during the compilation process, the $(CCACHE) will do not be found. 

 For CCACHE itself there is no real problem, we can use = instead of := there,
it does not reference itself.

 Regards,
 Arnout

> In fact, its real location is in `output/per-package/host-ccache/host/bin/ccache`.
> The path to host-tar is not defined in top Makefile, So host-tar did not report the same error.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
