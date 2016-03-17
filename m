From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 22:44:16 +0100
Subject: [Buildroot] [PATCH 04/16] uclibc: Enable compile in thumb mode
	when selected
In-Reply-To: <20160317222550.7232666c@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 17 Mar 2016 22:25:50 +0100")
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zitx5oz0.fsf@dell.be.48ers.dk>
 <20160317222550.7232666c@free-electrons.com>
Message-ID: <8737ro6aq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 17 Mar 2016 12:21:55 +0100, Peter Korsgaard wrote:

 >> >  - Force ARM mode only when gcc 4.7 or 4.8 is selected with Thumb1 and
 >> >    threads. We also explicitly disable COMPILE_IN_THUMB_MODE when we
 >> >    fall in this situation. With newer gcc versions, starting 4.9, this
 >> >    problem is fixed and we can build uClibc in Thumb1 mode.
 >> 
 >> >  - Enable COMPILE_IN_THUMB_MODE when Thumb1 or Thumb2 is selected. We
 >> >    need to disable context functions since they don't build in Thumb
 >> >    mode.
 >> 
 >> Why do we need to tell uClibc that we are building in thumb1/2 mode?
 >> From a quick grep this just adds -mthumb to CFLAGS, which shouldn't be
 >> needed as we've already configured the compiler to do so by default and
 >> enables USE_BX + USE_LDREXSTREX.

 > USE_LDREXSTREX is mandatory for uClibc to build on Thumb2 (see commit
 > https://lists.uclibc.org/pipermail/uclibc/2014-November/048704.html).
 > Otherwise, the build fails with:

Ahh, ok - Good to know. So this is only really needed for thumb2-only
CPUs (cortex-M).

Completely unrelated, but notice that my browser wouldn't let
me visit https://lists.uclibc.org because of the HSTS header on
uclibc.org and the lists.uclibc.org vhost using a certificate for
*.osuosl.org.

It does work for lists.buildroot.org as we don't do HSTS for subdomains.


 > What makes you think it will fail to build ?

 > I believe you think:

 > #if defined(__USE_BX__)
 > # if (__ARM_ARCH <= 4 && !defined __ARM_ARCH_4T__)
 > #  error Use of BX was requested, but is not available on the target processor.
 > # endif /* ARCH level */
 > #endif /* __USE_BX__ */

 > will make it fail to build.

 > But ARM920T is an ARMv4T, not an ARMv4. Quoting from
 > http://www.atmel.com/Images/ARM_920T_TRM.pdf:

Ahh yes, true.

> So I think we should:

 >  1/ Enable COMPILE_IN_THUMB_MODE whenever ARM_INSTRUCTIONS_THUMB(2) is
 >     enabled.

Ok.

 >  2/ Enable USE_BX whenever ARM_INSTRUCTIONS_THUMB(2) is enabled. I
 >     don't see why USE_BX for later cores can cause performance problems,
 >     it's just about using a simple bx instruction to switch between ARM
 >     and Thumb modes.

 >  3/ Enable USE_LDREXSTREX whenver ARM_INSTRUCTIONS_THUMB(2) is enabled
 >     *and* we're on ARMv7. Otherwise, disable it.

With ARMv7 I guess you mean thumb2-only CPUs (cortex-m)?

But COMPILE_IN_THUMB_MODE selects USE_BX / USE_LDREXTREX, so we cannot
really do that.

I guess we should leave COMPILE_IN_THUMB_MODE alone (it just passes
-mthumb in CFLAGS which we don't need), and just enable USE_BX/LDREXTREX
when needed.

-- 
Venlig hilsen,
Peter Korsgaard 
