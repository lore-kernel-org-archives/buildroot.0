From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Jan 2020 11:02:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/mfgtools: drop package
In-Reply-To: <20200109100257.91010-1-joerg.krause@embedded.rocks>
References: <20200109100257.91010-1-joerg.krause@embedded.rocks>
Message-ID: <20200109100257.91010-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested in [1] the package mfgtools is dropped.

NXP did replaced the old mfgtools with the version number 0.2
enterily with the uuu (Universal Update Utility) which is somehow
named mfgtools 3.0 although the version scheme for the uuu tool is
1.xx.yyy.

As the old mfgtools scripts are not compatible with the new uuu
tool and as imx-uuu goes hand-in-hand with imx-uuc, which we ship
for the target, the mfgtools package is dropped.

Users should switch to use imx-uuu instead.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 Config.in.legacy                |  7 ++++
 DEVELOPERS                      |  1 -
 package/Config.in.host          |  1 -
 package/mfgtools/Config.in.host | 10 -----
 package/mfgtools/mfgtools.hash  |  4 --
 package/mfgtools/mfgtools.mk    | 34 ----------------
 package/mfgtools/readme.txt     | 69 ---------------------------------
 7 files changed, 7 insertions(+), 119 deletions(-)
 delete mode 100644 package/mfgtools/Config.in.host
 delete mode 100644 package/mfgtools/mfgtools.hash
 delete mode 100644 package/mfgtools/mfgtools.mk
 delete mode 100644 package/mfgtools/readme.txt

diff --git a/Config.in.legacy b/Config.in.legacy
index c483ac3856..0f5666c98e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_HOST_MFGTOOLS
+	bool "host mfgtools was removed"
+	select BR2_LEGACY
+	help
+	  mfgtools is not maintained anymore. Switch to imx-uuc
+	  instead.
+
 config BR2_PACKAGE_PERL_NET_PING
 	bool "perl-net-ping was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e1d63e17d2..f3b4aab6ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -967,7 +967,6 @@ F:	configs/nitrogen*
 F:	package/freescale-imx/
 F:	package/gstreamer1/gst1-imx/
 F:	package/libimxvpuapi/
-F:	package/mfgtools/
 F:	package/sshpass/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index de0cdbae49..687cd59002 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -41,7 +41,6 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
-	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
deleted file mode 100644
index 6f2f3a3268..0000000000
--- a/package/mfgtools/Config.in.host
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_HOST_MFGTOOLS
-	bool "host mfgtools"
-	depends on BR2_arm
-	help
-	  This package contains the Freescale manufacturing tool.
-	  It is designed to program firmware to i.MX boards during
-	  production. The communication is done over USB using the
-	  Freescale UTP protocol.
-
-	  https://github.com/codeauroraforum/mfgtools
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
deleted file mode 100644
index 0b215f5295..0000000000
--- a/package/mfgtools/mfgtools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# locally computed
-sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-0.02.tar.gz
-sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
-sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
deleted file mode 100644
index 48ce5dda28..0000000000
--- a/package/mfgtools/mfgtools.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# mfgtools
-#
-################################################################################
-
-MFGTOOLS_VERSION = 0.02
-MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,v$(MFGTOOLS_VERSION))
-MFGTOOLS_SUBDIR = MfgToolLib
-MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
-MFGTOOLS_LICENSE_FILES = LICENSE README.txt
-HOST_MFGTOOLS_DEPENDENCIES = host-libusb
-
-HOST_MFGTOOLS_CFLAGS = \
-	$(HOST_CFLAGS) $(HOST_LDFLAGS) -std=c++11 -lpthread \
-	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
-	-lusb-1.0 -I$(HOST_DIR)/include/libusb-1.0 \
-	-fpermissive -Wno-write-strings
-
-define HOST_MFGTOOLS_CLI_BUILD
-	$(HOST_CONFIGURE_OPTS) $(MAKE) CC="$(HOSTCXX)" \
-		CFLAGS="$(HOST_MFGTOOLS_CFLAGS)" -C $(@D)/TestPrgm
-endef
-
-HOST_MFGTOOLS_POST_BUILD_HOOKS += HOST_MFGTOOLS_CLI_BUILD
-
-define HOST_MFGTOOLS_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
-		$(HOST_DIR)/lib/libMfgToolLib.so
-	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
-		$(HOST_DIR)/bin/mfgtoolcli
-endef
-
-$(eval $(host-cmake-package))
diff --git a/package/mfgtools/readme.txt b/package/mfgtools/readme.txt
deleted file mode 100644
index 320e6ec493..0000000000
--- a/package/mfgtools/readme.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-MfgTools Howto
-==============
-
-1. Build your mfgtool image
-
-Make sure to enable the following Buildroot options:
-
-BR2_PACKAGE_FREESCALE_IMX=y
-BR2_PACKAGE_IMX_UUC=y
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
-
-Also modify your kernel configuration to have:
-
-CONFIG_USB_GADGET=y
-CONFIG_USB_MASS_STORAGE=y
-CONFIG_FSL_UTP=y
-CONFIG_MMC_BLOCK_MINORS=16
-
-2. Go into the output and create the necessary folders
-
-$ cd output
-$ mkdir -p "Profiles/Linux/OS Firmware/firmware"
-
-3. Create your XML update script named ucl2.xml
-
-You can find a sample XML at:
-
-$ wget https://storage.googleapis.com/boundarydevices.com/ucl2.xml \
-  -O Profiles/Linux/OS\ Firmware/ucl2.xml
-
-4. Copy the U-Boot, Kernel and initramfs images to the appropriate
-folder
-
-$ cp images/u-boot.imx images/zImage images/imx6q-sabrelite.dtb \
-  images/rootfs.cpio.uboot Profiles/Linux/OS\ Firmware/firmware/
-
-5. Copy the prebuilt binaries to be flashed
-
-Depending on your ucl2.xml file, the sample doesn't flash anything.
-
-6. Run the MfgTools client:
-
-$ ./host/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
-  -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
-  -s mmc=1 -p 1
-
-For more information about the tools options, please read the
-"Manufacturing Tool V2 Quick Start Guide.docx" documentation contained
-in every mfgtools package from NXP website[1].
-
-Note: All the above commands require your Linux host user to have
-permissions to access the USB devices. Please make sure to have udev
-rules that allow the user to communicate with the BootROM IDs
-(Freescale USB recovery) as well as the one used for the UTP Linux
-image (0x066F:0x37FF).  Using 'sudo' in front of the mfgtoolcli
-command would also grant you the necessary permission but it is *not*
-recommended.
-
-Also, if your U-Boot environment doesn't include mfgtools bootargs,
-make sure to set the following:
-
-setenv bootargs "console=${console},${baudrate} g_mass_storage.stall=0 \
-	g_mass_storage.removable=1 g_mass_storage.idVendor=0x066F \
-	g_mass_storage.idProduct=0x37FF g_mass_storage.iSerialNumber=\"\" \
-	g_mass_storage.file=/fat"
-
-[1] http://www.nxp.com/products/software-and-tools/software-development-tools/i.mx-software-and-tools/i.mx-6-series-software-and-development-tool-resources:IMX6_SW
-- 
2.24.1
