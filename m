From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Thu, 26 Apr 2007 10:02:59 +0200
Subject: [Buildroot] gcc-4.1.2 eabi softfloat toolchain,
	undefined reference to "raise"
Message-ID: <20070426080257.GA7608@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a toolcahin working quite well: gcc-4.1.2 binutils-2.17, generic
arm softfloat supporting EABI. This works with kernel and userspace
well. Only on u-boot it fails at the final stage:

UNDEF_SYM=`arm-linux-objdump -x lib_generic/libgeneric.a board/scb9328/libscb9328.a cpu/arm920t/libarm920t.a cpu/arm920t/imx/libimx.a lib_arm/libarm.a fs/cramfs/libcramfs.a fs/fat/libfat.a fs/fdos/libfdos.a fs/jffs2/libjffs2.a fs/reiserfs/libreiserfs.a fs/ext2/libext2fs.a net/libnet.a disk/libdisk.a rtc/librtc.a dtt/libdtt.a drivers/libdrivers.a drivers/nand/libnand.a drivers/nand_legacy/libnand_legacy.a drivers/sk98lin/libsk98lin.a post/libpost.a post/cpu/libcpu.a common/libcommon.a |sed  -n -e 's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`;\
                cd /usr/src/u-boot/1.2.0 && arm-linux-ld -Bstatic -T /usr/src/u-boot/1.2.0/board/scb9328/u-boot.lds -Ttext 0x08f00000  $UNDEF_SYM cpu/arm920t/start.o \
                        --start-group lib_generic/libgeneric.a board/scb9328/libscb9328.a cpu/arm920t/libarm920t.a cpu/arm920t/imx/libimx.a lib_arm/libarm.a fs/cramfs/libcramfs.a fs/fat/libfat.a fs/fdos/libfdos.a fs/jffs2/libjffs2.a fs/reiserfs/libreiserfs.a fs/ext2/libext2fs.a net/libnet.a disk/libdisk.a rtc/librtc.a dtt/libdtt.a drivers/libdrivers.a drivers/nand/libnand.a drivers/nand_legacy/libnand_legacy.a drivers/sk98lin/libsk98lin.a post/libpost.a post/cpu/libcpu.a common/libcommon.a --end-group -L /usr/local/arm/gcc-4.1.2/lib/gcc/arm-linux-uclibcgnueabi/4.1.2 -lgcc \
                        -Map u-boot.map -o u-boot
/usr/local/arm/gcc-4.1.2/lib/gcc/arm-linux-uclibcgnueabi/4.1.2/libgcc.a(_dvmd_lnx.o): In function `__div0':
/usr/src/br/buildroot-20070206/toolchain_build_arm_nofpu/gcc-4.1.2-20070128/gcc/config/arm/lib1funcs.asm:1000: undefined reference to `raise'
make: *** [u-boot] Error 1

Well, compiling u-boot works fine with another arch (pxa xscale), only my arm9 
i.MX arch triggers a bug here. Does somebody have an advise or tip for
me how to fix this?

Kind Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
