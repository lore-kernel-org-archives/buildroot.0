From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 6 Jan 2010 23:43:41 +0000 (UTC)
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
Message-ID: <hi377d$1i5$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The u-boot-env-tools-on-target build was failing because mtd.h
wasn't found, so in an attempt to fix that I tried selecting
BR2_PACKAGE_MTD and BR2_PACKAGE_MTD_UTILS.  Now that's failing
to build because of undefined references to bcopy, bcmp, bzero
(make output below).

Is there a trick to get mtd stuff to build?

Is BR2_PACKAGE_MTD/BR2_PACKAGE_MTD_UTILS actually what I need
to provide mtd.h for building the u-boot env set/get target
tools, or does mtd.h come from somewhere else?


   [...]
   /usr/bin/make -j2 CFLAGS="-I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/" \
   		LDFLAGS="--sysroot /home/nextgen/buildroot/buildroot/output/staging/" \
   		BUILDDIR=/home/nextgen/buildroot/buildroot/output/build/mtd_orig \
   		CROSS=/home/nextgen/buildroot/toolchain/usr/bin/arm-linux- CC=/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc LINUXDIR=/home/nextgen/buildroot/buildroot/output/build/linux-2.6.28.2 WITHOUT_XATTR=1 -C /home/nextgen/buildroot/buildroot/output/build/mtd_orig
   make[1]: Entering directory `/home/nextgen/buildroot/buildroot/output/build/mtd_orig'
   mkdir -p /home/nextgen/buildroot/buildroot/output/build/mtd_orig
   [...]
   mkdir -p /home/nextgen/buildroot/buildroot/output/build/mtd_orig
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -I./include -DWITHOUT_XATTR -I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -c -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/serve_image.o serve_image.c -g -Wp,-MD,/home/nextgen/buildroot/buildroot/output/build/mtd_orig/.serve_image.c.dep
   mkdir -p /home/nextgen/buildroot/buildroot/output/build/mtd_orig
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -I./include -DWITHOUT_XATTR -I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -c -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o fec.c -g -Wp,-MD,/home/nextgen/buildroot/buildroot/output/build/mtd_orig/.fec.c.dep
   fec.c: In function 'invert_mat':
   fec.c:436: warning: incompatible implicit declaration of built-in function 'bzero'
   fec.c: In function 'fec_new':
   fec.c:707: warning: incompatible implicit declaration of built-in function 'bzero'
   fec.c: In function 'fec_encode':
   fec.c:734: warning: incompatible implicit declaration of built-in function 'bcopy'
   fec.c:737: warning: incompatible implicit declaration of built-in function 'bzero'
   fec.c: In function 'fec_encode_linear':
   fec.c:754: warning: incompatible implicit declaration of built-in function 'bcopy'
   fec.c:757: warning: incompatible implicit declaration of built-in function 'bzero'
   fec.c: In function 'build_decode_matrix':
   fec.c:817: warning: incompatible implicit declaration of built-in function 'bzero'
   fec.c:822: warning: incompatible implicit declaration of built-in function 'bcopy'
   fec.c: In function 'fec_decode':
   fec.c:873: warning: incompatible implicit declaration of built-in function 'bzero'
   fec.c:883: warning: incompatible implicit declaration of built-in function 'bcopy'
   mkdir -p /home/nextgen/buildroot/buildroot/output/build/mtd_orig
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -I./include -DWITHOUT_XATTR -I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -c -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/recv_image.o recv_image.c -g -Wp,-MD,/home/nextgen/buildroot/buildroot/output/build/mtd_orig/.recv_image.c.dep
   mkdir -p /home/nextgen/buildroot/buildroot/output/build/mtd_orig
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -I./include -DWITHOUT_XATTR -I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -c -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/sumtool.o sumtool.c -g -Wp,-MD,/home/nextgen/buildroot/buildroot/output/build/mtd_orig/.sumtool.c.dep
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -g -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/ftl_format /home/nextgen/buildroot/buildroot/output/build/mtd_orig/ftl_format.o
   [...]
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -I. -I./include -I/home/nextgen/buildroot/buildroot/output/toolchain/linux/include -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -g -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/rfdformat /home/nextgen/buildroot/buildroot/output/build/mtd_orig/rfdformat.o
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/serve_image /home/nextgen/buildroot/buildroot/output/build/mtd_orig/serve_image.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/crc32.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o: In function `fec_encode_linear':
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.c:754: undefined reference to `bcopy'
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o: In function `fec_encode':
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.c:734: undefined reference to `bcopy'
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o: In function `build_decode_matrix':
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.c:822: undefined reference to `bcopy'
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o: In function `invert_mat':
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.c:516: undefined reference to `bcmp'
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.o: In function `fec_decode':
   /home/nextgen/buildroot/buildroot/output/build/mtd_orig/fec.c:883: undefined reference to `bcopy'
   collect2: ld returned 1 exit status
   make[1]: *** [/home/nextgen/buildroot/buildroot/output/build/mtd_orig/serve_image] Error 1
   make[1]: *** Waiting for unfinished jobs....
   rm /home/nextgen/buildroot/buildroot/output/build/mtd_orig/nandwrite.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/mtd_debug.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/ftl_format.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_otp_dump.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/rfdformat.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/nftldump.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_unlock.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_lock.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flashcp.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/nftl_format.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/doc_loadbios.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_erase.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_otp_info.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/rfddump.o /home/nextgen/b
 uildroot/buildroot/output/build/mtd_orig/nandtest.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/nanddump.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/docfdisk.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_info.o /home/nextgen/buildroot/buildroot/output/build/mtd_orig/ftl_check.o
   make[1]: Leaving directory `/home/nextgen/buildroot/buildroot/output/build/mtd_orig'
   make: *** [/home/nextgen/buildroot/buildroot/output/build/mtd_orig/flash_erase] Error 2


-- 
Grant Edwards                   grante             Yow! Loni Anderson's hair
                                  at               should be LEGALIZED!!
                               visi.com            
