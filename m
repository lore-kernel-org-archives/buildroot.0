From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Aug 2014 22:58:46 +0200
Subject: [Buildroot] [PATCH] package/lame: Fix compile on 32bit Intel
 with gcc-4.9.x
In-Reply-To: <20140817145508.22d9d4ed@free-electrons.com>
References: <1408227494-20770-1-git-send-email-bernd.kuhls@t-online.de>
 <20140817093621.664fad88@free-electrons.com>
 <XnsA38C830E65DF6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140817145508.22d9d4ed@free-electrons.com>
Message-ID: <53FF9806.8040305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/17/14 14:55, Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
> 
> On Sun, 17 Aug 2014 12:53:00 +0200, Bernd Kuhls wrote:
> 
>> I understand, but removing the gcc version check, which would remove 
>> support for xmmintrin.h in all i386 builds, would remove the mmx support 
>> for lame on many builds, where it is not necessary.
> 
> Yes, understood. Maybe instead add some conditional code in lame to
> enable the MMX stuff only with known working gcc versions? I think
> there are some #define you can test to get the gcc version.

 Since the work is done in a hook, it can be as simple as:

ifeq ($(BR2_i386),y)
define LAME_COMPILE_FIX
	if $(CC) --version | grep -q '4\.9'; then \
		$(SED) '/xmmintrin\.h/d' $(@D)/configure; \
	fi
endef
endif


 However, it should be a post-patch hook, not a pre-configure hook. The
convention is that anything that manipulates the source itself should be done in
the patch (or extract) step.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
