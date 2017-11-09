From: Chu, Zhuliang (NSB - CN/Shanghai) <zhuliang.chu@nokia-sbell.com>
Date: Thu, 9 Nov 2017 05:02:24 +0000
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171107181307.58471ad9@windsurf>,
 <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
Message-ID: <5DBA847110A28B46BBA17BE675F0C9B2181AA436@cnshjmbx01>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

>By the way there will also be a problem when host-tar is part of
>DEPENDENCIES_HOST_PREREQ: ccache needs host-tar to be able to build, but there
>is no explicit dependency between them, it relies purely on left-to-right order.

the host-ccache mainly because its directory is defined in the top-level Makefile as below.
 453 ifeq ($(BR2_CCACHE),y)
 454 CCACHE := $(HOST_DIR)/bin/ccache
 455 BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
 456 export BR_CACHE_DIR
 457 HOSTCC := $(CCACHE) $(HOSTCC)
 458 HOSTCXX := $(CCACHE) $(HOSTCXX)
 459 else
 460 export BR_NO_CCACHE
 461 endif

In the top Makefile, $(CCACHE) is defined as 'output/host/bin/ccache'. So during the compilation process, the $(CCACHE) will do not be found. 
In fact, its real location is in `output/per-package/host-ccache/host/bin/ccache`.
The path to host-tar is not defined in top Makefile, So host-tar did not report the same error.

Chu,Zhuliang
Best Regards?

________________________________________
From: Arnout Vandecappelle [arnout at mind.be]
Sent: Wednesday, November 08, 2017 1:55
To: Thomas Petazzoni; Chu, Zhuliang (NSB - CN/Shanghai)
Cc: buildroot at uclibc.org; yann.morin.1998 at free.fr; peter at korsgaard.com; patrickdepinguin+buildroot at gmail.com
Subject: Re: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories

On 07-11-17 18:13, Thomas Petazzoni wrote:
>> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
>> index afbec44..66bfcad 100644
>> --- a/package/ccache/ccache.mk
>> +++ b/package/ccache/ccache.mk
>> @@ -50,6 +50,7 @@ BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
>>  ifneq ($(BR_CCACHE_INITIAL_SETUP),)
>>  define HOST_CCACHE_DO_INITIAL_SETUP
>>      @$(call MESSAGE,"Applying initial settings")
>> +    rsync -au --link-dest=$(HOST_DIR) $(HOST_DIR) $(call qstrip,$(BR2_HOST_DIR))
>>      $(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
>>      $(CCACHE) -s
>>  endef
> I don't think that's what we want. The global HOST_DIR (output/host)
> should basically be empty during the entire build process. Instead,
> what we want is to have the ccache host tools installed in the
> per-package SDK. This means that all packages have to have a dependency
> on host-ccache, which is not currently the case. So we probably instead
> want something like:
>
> ifeq ($(BR2_CCACHE),y)
> $(2)_DEPENDENCIES += host-ccache
> endif
>
> in package/pkg-generic.mk. But of course, we need to exclude the
> host-ccache package from this, otherwise we would have a circular
> dependency. Do you want to try something like this?

 Ha, I didn't understand the original problem but now I see. The issue is that
ccache is part of DEPENDENCIES_HOST_PREREQ, and DEPENDENCIES_HOST_PREREQ is
*not* added to each package's DEPENDENCIES, instead it is added to the
core-dependencies target and each package depends on that. It's an easy way to
avoid circular dependencies, I guess.

 So I think the proper solution would be to add DEPENDENCIES_HOST_PREREQ to the
dependencies of all packages except themselves, similar to how it's done for
toolchain.

 By the way there will also be a problem when host-tar is part of
DEPENDENCIES_HOST_PREREQ: ccache needs host-tar to be able to build, but there
is no explicit dependency between them, it relies purely on left-to-right order.

 Regards,
 Arnout

--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
