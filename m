From: Richard Fergusson <fergie4000@gmail.com>
Date: Sun, 11 Jan 2015 16:04:42 +1030
Subject: [Buildroot]  [PATCH v3] linux: add fbtft kernel extension
Message-ID: <54B20B72.7020107@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not sure I'm doing this right, but here goes. With this extension 
enabled the kernel will not build. It gives the error below. The problem 
seems to be with line 21 of linux-ext-fbtft.mk. I have edited the file 
to make it work and have attached the changed file.

- Richard

$ make linux
 >>> linux c256eb9968c8997dce47350d2075e42f1b3991d3 Download additional 
patches
 >>> linux c256eb9968c8997dce47350d2075e42f1b3991d3 Extracting
gzip -d -c 
/home/richard/buildroot/dl/linux-c256eb9968c8997dce47350d2075e42f1b3991d3.tar.gz 
| tar --strip-components=1 -C 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 
-xf -
 >>> linux c256eb9968c8997dce47350d2075e42f1b3991d3 Patching
if [ -e 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/fbdev 
]; then 
dest=/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/fbdev 
; else 
dest=/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/drivers/video/ 
; fi ; mkdir -p ${dest}/fbtft; cp -dpfr 
/home/richard/buildroot/output/build/fbtft-274035404701245e7491c0c6471c5b72ade4d491/* 
${dest}/fbtft/ ; echo 'source "drivers/video/fbdev/fbtft/Kconfig"' >> 
${dest}/Kconfig ; echo 'obj-y += fbtft/' >> ${dest}/Makefile
for p in board/raspi/kernel-patches/ ; do if echo $p | grep -q -E 
"^ftp://|^http://" ; then support/scripts/apply-patches.sh 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 
/home/richard/buildroot/dl `basename $p` ; elif test -d $p ; then 
support/scripts/apply-patches.sh 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 
$p linux-\*.patch ; else support/scripts/apply-patches.sh 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 
`dirname $p` `basename $p` ; fi done
 >>> linux c256eb9968c8997dce47350d2075e42f1b3991d3 Configuring
/usr/bin/install -m 0644 "board/raspi/linux.config" 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/arch/arm/configs/buildroot_defconfig
PATH="/home/richard/buildroot/output/host/bin:/home/richard/buildroot/output/host/sbin:/home/richard/buildroot/output/host/usr/bin:/home/richard/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/richard/Android/adt-bundle-linux-x86-20130514/sdk/platform-tools:/home/richard/Android/adt-bundle-linux-x86-20130514/sdk/platform-tools" 
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm 
INSTALL_MOD_PATH=/home/richard/buildroot/output/target CROSS_COMPILE=" 
/home/richard/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" 
DEPMOD=/home/richard/buildroot/output/host/sbin/depmod -C 
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3 
buildroot_defconfig
make[1]: Entering directory 
'/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3'
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/kconfig/conf.o
   SHIPPED scripts/kconfig/zconf.tab.c
   SHIPPED scripts/kconfig/zconf.lex.c
   SHIPPED scripts/kconfig/zconf.hash.c
   HOSTCC  scripts/kconfig/zconf.tab.o
   HOSTLD  scripts/kconfig/conf
drivers/video/Kconfig:2525: can't open file 
"drivers/video/fbdev/fbtft/Kconfig"
/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/scripts/kconfig/Makefile:105: 
recipe for target 'buildroot_defconfig' failed
make[2]: *** [buildroot_defconfig] Error 1
Makefile:503: recipe for target 'buildroot_defconfig' failed
make[1]: *** [buildroot_defconfig] Error 2
make[1]: Leaving directory 
'/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3'
package/pkg-generic.mk:172: recipe for target 
'/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/.stamp_configured' 
failed
make: *** 
[/home/richard/buildroot/output/build/linux-c256eb9968c8997dce47350d2075e42f1b3991d3/.stamp_configured] 
Error 2

-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-ext-fbtft.mk
Type: text/x-makefile
Size: 1093 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150111/12b9dd32/attachment.bin>
