From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 23:03:10 +0100
Subject: [Buildroot] [PATCH 04/16] uclibc: Enable compile in thumb mode
 when selected
In-Reply-To: <8737ro6aq7.fsf@dell.be.48ers.dk>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zitx5oz0.fsf@dell.be.48ers.dk>
 <20160317222550.7232666c@free-electrons.com>
 <8737ro6aq7.fsf@dell.be.48ers.dk>
Message-ID: <20160317230310.1d40d224@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 22:44:16 +0100, Peter Korsgaard wrote:

>  > USE_LDREXSTREX is mandatory for uClibc to build on Thumb2 (see commit
>  > https://lists.uclibc.org/pipermail/uclibc/2014-November/048704.html).
>  > Otherwise, the build fails with:
> 
> Ahh, ok - Good to know. So this is only really needed for thumb2-only
> CPUs (cortex-M).

Mandatory for Thumb2-only CPUs, but perfectly usable for ARMv7-A as
well.

> Completely unrelated, but notice that my browser wouldn't let
> me visit https://lists.uclibc.org because of the HSTS header on
> uclibc.org and the lists.uclibc.org vhost using a certificate for
> *.osuosl.org.

Same here, I have to use Firefox to be able to bypass the "security
checks". Chromium doesn't allow to bypass such security checks (at
least by default).

> > So I think we should:
> 
>  >  1/ Enable COMPILE_IN_THUMB_MODE whenever ARM_INSTRUCTIONS_THUMB(2) is
>  >     enabled.
> 
> Ok.
> 
>  >  2/ Enable USE_BX whenever ARM_INSTRUCTIONS_THUMB(2) is enabled. I
>  >     don't see why USE_BX for later cores can cause performance problems,
>  >     it's just about using a simple bx instruction to switch between ARM
>  >     and Thumb modes.
> 
>  >  3/ Enable USE_LDREXSTREX whenver ARM_INSTRUCTIONS_THUMB(2) is enabled
>  >     *and* we're on ARMv7. Otherwise, disable it.
> 
> With ARMv7 I guess you mean thumb2-only CPUs (cortex-m)?
> 
> But COMPILE_IN_THUMB_MODE selects USE_BX / USE_LDREXTREX, so we cannot
> really do that.
> 
> I guess we should leave COMPILE_IN_THUMB_MODE alone (it just passes
> -mthumb in CFLAGS which we don't need), and just enable USE_BX/LDREXTREX
> when needed.

USE_LDREXSTREX depends on COMPILE_IN_THUMB_MODE, so you can't have
USE_LDREXSTREX without having COMPILE_IN_THUMB_MODE.

So, instead what I've done is cook a set of patches for uClibc that
simply remove USE_BX, USE_LDREXSTREX and COMPILE_IN_THUMB. None of
those options are needed, everything can be guessed by looking at the
selected ARM variant, and for COMPILE_IN_THUMB, by passing -mthumb.

See
https://github.com/tpetazzoni/uclibc-ng/commits/arm-simplifications.
Build testing in progress. I'm testing:

 * Cortex-M4, so a Thumb2-only core
 * Cortex-A in Thumb2 mode
 * ARM920T in Thumb mode
 * FA526, which is an ARMv4 (and therefore doesn't support Thumb)

Any other config you think is relevant?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
