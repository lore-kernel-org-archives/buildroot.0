From: Eelco Chaudron <echaudron@xiot.nl>
Date: Sun, 20 Dec 2015 13:32:43 +0100
Subject: [Buildroot] buildroot support for OrangePI PC
In-Reply-To: <56748758.7040908@mind.be>
References: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
 <56748758.7040908@mind.be>
Message-ID: <56769FEB.60400@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I decided to give this a shot, but I already get stuck at doing the 
u-boot part...
Looks like some toolchain issue, so before I dig into it more let me see 
if some one here has ran into something similar.

This is my config:

BR2_armeb=y
BR2_cortex_a7=y
BR2_ARM_EABI=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="orangepi_pc"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4832e17787acb29734d895751bc7a594908aecc6"
BR2_TARGET_UBOOT_SPL=y

It all goes wrong when linking u-boot. Here are some snippets from the 
output:
   LD      u-boot
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
Warning: size of symbol `invalidate_dcache_range' changed from 168 in 
arch/arm/cpu/armv7/built-in.o to 4 in arch/arm/lib/built-in.o
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
Warning: size of symbol `enable_caches' changed from 4 in 
arch/arm/cpu/armv7/built-in.o to 12 in arch/arm/lib/built-in.o
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
Warning: size of symbol `arm_init_before_mmu' changed from 40 in 
arch/arm/cpu/armv7/built-in.o to 4 in arch/arm/lib/built-in.o
...
...
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
/home/echaudron/buildroot_opi/output/host/usr/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/4.9.3/libgcc.a(_dvmd_lnx.o): 
compiled for a big endian system and target is little endian
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
failed to merge target specific data of file 
/home/echaudron/buildroot_opi/output/host/usr/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/4.9.3/libgcc.a(_dvmd_lnx.o)
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
BFD (GNU Binutils) 2.24 assertion fail elf32-arm.c:12387
...
...
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
BFD (GNU Binutils) 2.24 assertion fail elf32-arm.c:12387
/home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
BFD (GNU Binutils) 2.24 assertion fail elf32-arm.c:12387
Segmentation fault (core dumped)
Makefile:1193: recipe for target 'u-boot' failed
make[2]: *** [u-boot] Error 139

When I build the same u-boot version using the ubuntu provided 
"arm-linux-gnueabihf-" toolchain it works fine.
I'm using the following to build it;

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- orangepi_pc_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

Any ideas?

//Eelco


> Arnout Vandecappelle <mailto:arnout@mind.be>
> December 18, 2015 at 23:23
>
> Not that I know of. But it should be quite similar to the cubieboard I 
> think.
>
> If you make a defconfig for it, consider using genimage rather than a 
> custom
> script like mkcubiecard.
>
> Regards,
> Arnout
>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151220/af382638/attachment.html>
