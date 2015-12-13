From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Dec 2015 21:07:26 +0100
Subject: [Buildroot] Wrong rpath after linking with libmysqlclient
Message-ID: <566DCFFE.5070504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 First of all, the symptomps: build the defconfig in attachment, run with

qemu-system-arm -M nuri -kernel output/images/zImage -append \
 "console=ttySAC1,115200" -smp 2 -serial null -serial stdio

and you'll see:

Starting php-fpm /usr/sbin/php-fpm: error while loading shared libraries:
libmysqlclient.so.16: cannot open shared object file: No such file or directory


 readelf reveals:

Library rpath: [.../host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql]

 i.e. rpath points to staging instead of the on-target directory.

 Indeed, in libmysqlclient.la we find:

libdir='.../host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql'


 This happens because our 'Fixing libtool files' step makes sure that all
absolute paths have STAGING_DIR prepended to them.


 This problem will occur for any library that doesn't install in /lib or
/usr/lib and that uses libtool.


 My first idea was to install libmysqlclient.so in /usr/lib instead, but that's
probably a great idea. So the next idea is to skip the libdir= line when fixing
up the libtool files. However, I'm not sure if that won't have some other
effects (i.e. missing required link flags). But worse, it doesn't even work:
php's libtool still converts it into
-Wl,--rpath -Wl,.../host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/mysql
(and gives warnings that the libraries have moved.

 Any idea?

 A final option is to fix up the rpaths of all ELF files in the target after
build. I believe Yann has a series that does exactl that, no?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
--
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_FPU_VFPV3D16=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.92"
BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_PHP=y
# BR2_PACKAGE_PHP_EXT_SESSION is not set
# BR2_PACKAGE_PHP_EXT_ZLIB is not set
BR2_PACKAGE_PHP_EXT_MYSQLI=y
BR2_PACKAGE_PHP_SAPI_CLI_FPM=y
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_TAR is not set
