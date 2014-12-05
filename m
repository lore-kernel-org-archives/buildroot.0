From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 14:01:35 +0100
Subject: [Buildroot] Float error on SAMA5D3 Xplained using nodejs
In-Reply-To: <WC20141205121112.0100A6@til-technologies.fr>
References: <WC20141205121112.0100A6@til-technologies.fr>
Message-ID: <20141205140135.606fff5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric HEYMAN,

On Fri, 05 Dec 2014 13:11:12 +0100, C?dric HEYMAN wrote:

> Trying to use nodejs's npm (built with buildroot 2014.11) on SAMA5D3 
> Xplained returns following error : 'ERROR: Binary compiled with 
> -mfloat-abi=hard but without -DUSE_EABI_HARDFLOAT'

Thanks for your bug report.

> 
> Looking in nodejs.mk shows that : 
> '....
> NODEJS_CPU = arm
> # V8 needs to know what floating point ABI the target is using.  There's 
> also
> # a 'hard' option which we're not exposing here at the moment, because
> # buildroot itself doesn't really support it at present.

This comment seems bogus. I don't remember if it used to be true back
when nodejs was added, but Buildroot definitely has support for 'hard'.

> ifeq ($(BR2_SOFT_FLOAT),y)
> NODEJS_ARM_FP = soft
> else
> NODEJS_ARM_FP = softfp
> endif
> ....'
> 
> It seems there is no support for 'hard' floating point for now.
> 
> To solve that, I intend to force '-DUSE_EABI_HARDFLOAT' in nodejs 
> compilation package, but I don't know the way to do that; any advice ?
> 
> Another way to solve the problem could be to use 'soft' or 'softfp' floating 
> point strategy but menuconfig does not propose this tuning, maybe...

It does propose this tuning. Basically, you have three cases:

 * soft float, i.e 'soft' in nodejs speak. This is enabled in Buildroot
   when BR2_ARM_EABI=y and BR2_SOFT_FLOAT=y.

 * hard float using integer registers to pass floating point arguments,
   i.e 'softfp' in nodejs speak. This is enabled in Buildroot when
   BR2_ARM_EABI=y and BR2_SOFT_FLOAT is disabled.

 * hard float using floating pointer registers to pass floating point
   arguments, i.e 'hard' in nodejs speak. This is enabled in Buildroot
   when BR2_ARM_EABIHF=y.

So I assume that you got this error in a BR2_ARM_EABIHF=y build,
correct?

Can you try the completely untested patch below?

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 312aaa9..a776d5e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -59,11 +59,15 @@ NODEJS_CPU = arm
 # V8 needs to know what floating point ABI the target is using.  There's also
 # a 'hard' option which we're not exposing here at the moment, because
 # buildroot itself doesn't really support it at present.
+ifeq ($(BR2_ARM_EABIHF),y)
+NODEJS_ARM_FP = hard
+else
 ifeq ($(BR2_SOFT_FLOAT),y)
 NODEJS_ARM_FP = soft
 else
 NODEJS_ARM_FP = softfp
-endif
+endif # BR2_SOFT_FLOAT
+endif # BR2_ARM_EABIHF
 endif
 
 define NODEJS_CONFIGURE_CMDS

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
