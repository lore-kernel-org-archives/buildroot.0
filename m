From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 31 Jul 2012 10:59:39 -0500
Subject: [Buildroot] Troubles with initramfs
Message-ID: <CAE9DZUQ+QfGcX+K_Byf1p_E2bvkP48-7CQ9Kn3jC6Vs1FepuAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings:

I recently tried turning on initramfs in my buildroot configuration.
Prior to this I was able to build everything fine and run.  Now after
simply selection initramfs under filesystem images, I'm getting a
linker error during the final stages of building the kernel.  Some
google searching seems to indicate that this may have something to do
with the size of the initramfs and maximum branch distance for the ARM
processor (see http://www.spinics.net/lists/arm-kernel/msg65093.html).

The size of the initramfs contents seem to be reasonable:

[dallasc /development/dallasc/buildroot-2011.05-sdk6.0] ls -l output/images/
total 76116
-rw-r--r-- 1 dallasc dallasc   514194 Jul 31 15:30 rootfs.initramfs
-rw-r--r-- 1 dallasc dallasc 77424640 Jul 31 15:16 rootfs.tar

Does anyone have any ideas for me on how to get past this error?

>>> toolchain Invoking  /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp//bin/arm-marvell-linux-gnueabi-gcc /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp//bin/arm-marvell-linux-gnueabi-gcc /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp//bin/arm-marvell-linux-gnueabi-gcc --sysroot /development/dallasc/TS-3400/buildroot-2011.05-sdk6.0/output/host/usr/arm-unknown-linux-gnueabi/sysroot -march=armv7-a -mtune=marvell-fv7 -mabi=aapcs-linux -msoft-float -mlittle-endian -Wp,-MD,usr/.initramfs_data.o.d -nostdinc -isystem /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp/bin/../lib/gcc/arm-marvell-linux-gnueabi/4.4.5/include -I/development/dallasc/TS-3400/buildroot-2011.05-sdk6.0/output/build/linux-3.0.6/arch/arm/include -Iarch/arm/include/generated -Iinclude -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-armadaxp/include -Iarch/arm/plat-armada/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -gdwarf-2 -DINITRAMFS_IMAGE=usr/initramfs_data.cpio.gz -c -o usr/initramfs_data.o usr/initramfs_data.S
  LD      usr/built-in.o
  LD      vmlinux.o
  MODPOST vmlinux.o
WARNING: modpost: Found 3 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
>>> toolchain Invoking  /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp//bin/arm-marvell-linux-gnueabi-gcc /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp//bin/arm-marvell-linux-gnueabi-gcc /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp//bin/arm-marvell-linux-gnueabi-gcc --sysroot /development/dallasc/TS-3400/buildroot-2011.05-sdk6.0/output/host/usr/arm-unknown-linux-gnueabi/sysroot -march=armv7-a -mtune=marvell-fv7 -mabi=aapcs-linux -msoft-float -mlittle-endian -Wp,-MD,init/.version.o.d -nostdinc -isystem /opt/armada-sdk-5.0-64k/armv7-marvell-linux-gnueabi-softfp/bin/../lib/gcc/arm-marvell-linux-gnueabi/4.4.5/include -I/development/dallasc/TS-3400/buildroot-2011.05-sdk6.0/output/build/linux-3.0.6/arch/arm/include -Iarch/arm/include/generated -Iinclude -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-armadaxp/include -Iarch/arm/plat-armada/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DKBUILD_STR(s)=#s -DKBUILD_BASENAME=KBUILD_STR(version) -DKBUILD_MODNAME=KBUILD_STR(version) -c -o init/version.o init/version.c
  LD      init/built-in.o
  LD      .tmp_vmlinux1
kernel/built-in.o:(.fixup+0x11c): relocation truncated to fit:
R_ARM_JUMP24 against `.init.text'
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory
`/development/dallasc/TS-3400/buildroot-2011.05-sdk6.0/output/build/linux-3.0.6'
make: *** [/development/dallasc/buildroot-2011.05-sdk6.0/output/build/linux-3.0.6/.stamp_initramfs_rebuilt]
Error 2

Thanks,

Dallas
