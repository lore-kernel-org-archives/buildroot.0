From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Dec 2015 23:08:16 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <20151215230351.5dc6e91d@free-electrons.com>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
Message-ID: <5671E0D0.3030002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-12-15 23:03, Thomas Petazzoni wrote:
> Paul,
> 
> On Sun, 13 Dec 2015 19:28:40 -0600, Paul Enman wrote:
[snip]
>> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2),y)
>> +define UCLIBC_ARM_THUMB_CONFIG
>> +	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> 
> According to the help text of this uClibc option:
> 
>           Say 'y' here to force building uClibc in thumb mode.
>           Say 'n' to use your compiler's default mode.
> 
> When you have BR2_ARM_INSTRUCTIONS_THUMB2, the compiler already
> produces Thumb2 code by default, because the compiler is built with
> --with-mode=thumb.

 And in fact, the only thing that this option does is add -mthumb to CFLAGS,
which is indeed quite useless for our internal compiler.

 Or actually, it's not, because it also selects USE_BX and USE_LDREXSTREX.
USE_BX is currently handled by BR2_UCLIBC_ARM_BX but this is a cleaner way I
think. USE_LDREXSTREX is a better alternative to the SWP instruction so that's
interesting as well.

 Hm, looking at the uClibc code, there's something I don't quite understand.
USE_LDREXSTREX is selected by COMPILE_IN_THUMB_MODE, but in fact ldrex/strex are
only available on ARMv6+, so won't this break down on ARMv5?


 Regards,
 Arnout


> 
> So could you be more specific on which cases this patch is fixing by
> expanding the commit log?

[snip]



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
