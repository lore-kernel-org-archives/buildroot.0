From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Fri, 11 Nov 2016 07:41:51 -0600
Subject: [Buildroot] Fwd: Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <20161111043706.nrzzr7ca5nybi2ir@tarshish>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
Message-ID: <CALD51P_HZZzqLcn-JqLwdO95f8J8x3P6v4+L7fKZdtnGmo5t0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you so much for your help, Baruch
I took your advice and applied the change to the Config.in in nodejs
package. Since my .config does not have BR2_ARM_CPU_HAS_VFPV3,  I used
BR2_ARM_CPU_MAYBE_HAS_VFPV3 instead. The issue seems to have fixed.
Thank you so much again, Baruch.
Lijun QIN

BR2_ARCH_HAS_MMU_OPTIONAL=y
# BR2_arcle is not set
# BR2_arceb is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_aarch64 is not set
# BR2_aarch64_be is not set
# BR2_bfin is not set
# BR2_i386 is not set
# BR2_microblazeel is not set
# BR2_microblazebe is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_mips64 is not set
# BR2_mips64el is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_powerpc64 is not set
# BR2_powerpc64le is not set
# BR2_sh is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="cortex-a9"
BR2_GCC_TARGET_FPU="vfpv3"
BR2_GCC_TARGET_FLOAT_ABI="hard"
BR2_GCC_TARGET_MODE="arm"
BR2_ARCH_HAS_ATOMICS=y
BR2_BINFMT_SUPPORTS_SHARED=y
BR2_BINFMT_ELF=y
BR2_ARM_CPU_MAYBE_HAS_NEON=y
BR2_ARM_CPU_MAYBE_HAS_VFPV2=y
BR2_ARM_CPU_MAYBE_HAS_VFPV3=y
BR2_ARM_CPU_HAS_ARM=y
BR2_ARM_CPU_HAS_THUMB2=y
BR2_ARM_CPU_ARMV7A=y
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm1136j_s is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_cortex_a5 is not set
# BR2_cortex_a7 is not set
# BR2_cortex_a8 is not set
BR2_cortex_a9=y
# BR2_cortex_a12 is not set
# BR2_cortex_a15 is not set
# BR2_cortex_m3 is not set
# BR2_fa526 is not set
# BR2_pj4 is not set
# BR2_strongarm is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
# BR2_ARM_EABI is not set
BR2_ARM_EABIHF=y
# BR2_ARM_ENABLE_NEON is not set
# BR2_ARM_FPU_VFPV2 is not set
BR2_ARM_FPU_VFPV3=y
# BR2_ARM_FPU_VFPV3D16 is not set
BR2_ARM_INSTRUCTIONS_ARM=y
# BR2_ARM_INSTRUCTIONS_THUMB2 is not set

#
# Build options
#



---------- Forwarded message ----------
From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, Nov 10, 2016 at 10:37 PM
Subject: Re: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
To: Lijun QIN <lijun.qin2008@gmail.com>
Cc: buildroot at busybox.net


Hi Lijun QIN,

On Thu, Nov 10, 2016 at 07:28:13PM -0600, Lijun QIN wrote:
> Hello Buildroot supporter,
>
> I have Buildroot 2015.11 with some Marvell flavor.
> According to Mavell's instructions, I did
> (1) make mvebu_armv7_le_defconfig
> (2) select external toolchain gcc5.2-HF
> (3) I run make menuconfig, trying to select Node.JS 4.1.2 package in
> Interpreter languages and scripting selection, but only node.JS 0.10.40 is
> available.

That's because nodejs 4.1.2 on Buildroot 2015.11 (and 6.7.0 on current
master)
depends on BR2_ARM_CPU_HAS_VFPV2:

config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
        bool
        # On supported architectures other than ARM, no special requirement
        default y if !BR2_arm
        # On ARM, at least ARMv6+ with VFPv2+ is needed
        default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2

The comment seems indicates that BR2_ARM_CPU_HAS_VFPV3 should also be fine.
You may try changing this line to

        default y if !BR2_ARM_CPU_ARMV5 && (BR2_ARM_CPU_HAS_VFPV2 ||
BR2_ARM_CPU_HAS_VFPV3)

Yann, you added this dependency in commit f443386c5d. Is that the right fix?

baruch

> # BR2_ARM_FPU_VFPV2 is not set
> BR2_ARM_FPU_VFPV3=y

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161111/95615d00/attachment.html>
