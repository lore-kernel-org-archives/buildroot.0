From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:35:27 +0200
Subject: [Buildroot] [PATCH v2] arch/x86: remove support for i386
In-Reply-To: <57155148.9030702@mind.be>
References: <1460928694-22593-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <57155148.9030702@mind.be>
Message-ID: <20160418233527.3b10c900@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 23:27:36 +0200, Arnout Vandecappelle wrote:

> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

> > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> > index ff759a0..d6f57a1 100644
> > --- a/toolchain/toolchain-external/Config.in
> > +++ b/toolchain/toolchain-external/Config.in
> > @@ -615,8 +615,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
> >   	bool "Musl 1.1.12 toolchain (experimental)"
> >   	depends on (BR2_arm && BR2_ARM_EABI) || \
> >   		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
> 
>   With this patch I notice this... Huh? AFAIK ARMv4 cannot have VFPv2, so it 
> can't be EABIhf, right? I guess, Thomas, that you just blindly set this because 
> the EABIhf version of the toolchain is ARMv5, without realizing that it's ARMv5 
> because EABIhf doesn't exist for v4?

You're right!

So I guess something like this could be applied, right:

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ff759a0..65a0655 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -613,9 +613,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
        bool "Musl 1.1.12 toolchain (experimental)"
-       depends on (BR2_arm && BR2_ARM_EABI) || \
-               (BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
-               (BR2_armeb && BR2_ARM_EABI) || \
+       depends on BR2_arm || (BR2_armeb && BR2_ARM_EABI) || \
                (BR2_i386 && !BR2_x86_i386) || \
                (BR2_mips && !BR2_SOFT_FLOAT) || \
                BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \

Thanks for spotting this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
