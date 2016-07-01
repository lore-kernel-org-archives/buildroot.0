From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 1 Jul 2016 10:10:48 -0300 (BRT)
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot 2016.05
Message-ID: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

My company is developing a board based on a vendor reference design which depends on a custom U-Boot, based on v2012.10. We were able to build the custom U-Boot using Buildroot before this commit:

commit 0dca644e443c8f28bfe5aa1c98201dc3b49e1165
Author: Julien Boibessot <julien.boibessot@armadeus.com>
Date:   Fri May 20 06:57:24 2016 +0200

    boot/uboot: fix missing host-openssl for i.MX28 target
    
    Building an U-Boot image for the i.MX23 or i.MX28 target requires to run the
    bootloaders 'mxsimage' tool on the host. As mxsimage needs unconditionally
    OpenSSL, building U-Boot for those targets fails if it is not available on
    the host:
    
    tools/mxsimage.c:18:25: fatal error: openssl/evp.h: No such file or directory
      #include <openssl/evp.h>
    
    Add the required dependency 'host-openssl' to all the different U-Boot image
    types used to build a bootloader image for an i.MX23/i.MX28 target.
    
    Also pass HOST_CFLAGS and HOST_LDFLAGS to the U-Boot build process so the right
    -I/-L options will be used to find OpenSSL.
    
    Ported from the Armadeus project:
    https://sourceforge.net/p/armadeus/mailman/message/33595402/
    
    Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
    [J?rg: port to recent Buildroot version]
    Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

The problem is easily reproducible using the following defconfig, based on "beaglebone", in which BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE was set to "2012.10":

BR2_arm=y
BR2_cortex_a8=y
BR2_DL_DIR="/store/Mirror/CT-NG-Buildroot"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
BR2_PACKAGE_AM33X_CM3=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2012.10"
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

$ make uboot BR2_JLEVEL=1
umask 0022 && make -C /work/Buildroot O=/work/bcm95615x/. uboot
>>> uboot 2012.10 Building
PATH="/work/bcm95615x/host/bin:/work/bcm95615x/host/sbin:/work/bcm95615x/host/usr/bin:/work/bcm95615x/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin" AR="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ar" AS="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-as" LD="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld" NM="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-nm" CC="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc" GCC="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc" CPP="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-cpp" CXX="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++" FC="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran" RANLIB="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib" READELF="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf" STRIP="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip" OBJCOPY="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-objcopy" OBJDUMP="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/work/bcm95615x/host/usr/include" CFLAGS_FOR_BUILD="-O2 -I/work/bcm95615x/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/work/bcm95615x/host/usr/include" LDFLAGS_FOR_BUILD="-L/work/bcm95615x/host/lib -L/work/bcm95615x/host/usr/lib -Wl,-rpath,/work/bcm95615x/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-as" DEFAULT_LINKER="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" FCFLAGS="" PKG_CONFIG="/work/bcm95615x/host/usr/bin/pkg-config" STAGING_DIR="/work/bcm95615x/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot" INTLTOOL_PERL=/usr/bin/perl CXX=false /usr/bin/make -j1 -C /work/bcm95615x/build/uboot-2012.10 CROSS_COMPILE="/work/bcm95615x/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-" ARCH=arm HOSTCFLAGS="-O2 -I/work/bcm95615x/host/usr/include" HOSTLDFLAGS="-L/work/bcm95615x/host/lib -L/work/bcm95615x/host/usr/lib -Wl,-rpath,/work/bcm95615x/host/usr/lib" 
for dir in tools examples/standalone examples/api arch/arm/cpu/armv7  ; do \
		/usr/bin/make -C $dir _depend ; done
make[3]: Nothing to be done for '_depend'.
make[3]: Nothing to be done for '_depend'.
make[3]: Nothing to be done for '_depend'.
make[3]: Nothing to be done for '_depend'.
/usr/bin/make -C tools all
gcc -O2 -I/work/bcm95615x/host/usr/include   -o img2srec.o img2srec.c -c
In file included from img2srec.c:55:0:
os_support.h:22:22: fatal error: compiler.h: No such file or directory
compilation terminated.
/work/bcm95615x/build/uboot-2012.10/rules.mk:64: recipe for target 'img2srec.o' failed
make[3]: *** [img2srec.o] Error 1
Makefile:544: recipe for target 'tools' failed
make[2]: *** [tools] Error 2
package/pkg-generic.mk:201: recipe for target '/work/bcm95615x/build/uboot-2012.10/.stamp_built' failed
make[1]: *** [/work/bcm95615x/build/uboot-2012.10/.stamp_built] Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

The build succeeds if I apply the following patch, which partially reverts the aforementioned commit:

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a2274ee..5d171dd 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -92,9 +92,7 @@ endif
 
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	ARCH=$(UBOOT_ARCH) \
-	HOSTCFLAGS="$(HOST_CFLAGS)" \
-	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+	ARCH=$(UBOOT_ARCH)
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc

But this breaks the build fir the i.MX2[38] targets (freescale_imx28evk). A better workaround would be something like this:

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a2274ee..5b7663d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -92,9 +92,15 @@ endif
 
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	ARCH=$(UBOOT_ARCH) \
+	ARCH=$(UBOOT_ARCH)
+
+ifeq ($(or $(BR2_TARGET_UBOOT_FORMAT_SB),$(BR2_TARGET_UBOOT_FORMAT_SD),$(BR2_TARGET_UBOOT_FORMAT_NAND)),y)
+# Pass HOST_CFLAGS and HOST_LDFLAGS to the U-Boot build process so the right
+# -I/-L options will be used to find OpenSSL.
+UBOOT_MAKE_OPTS += \
 	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc

Do you agree?

Carlos Santos (Casantos) - DATACOM, P&D
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
casantos at datacom.ind.br          +55 51 3933.3000 ext. 3627
http://www.datacom.ind.br
