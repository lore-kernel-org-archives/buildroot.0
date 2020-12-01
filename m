From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  1 Dec 2020 21:31:02 +0100
Subject: [Buildroot] [PATCH/next v1] package/mfgtools: bump version to
 uuu_1.4.43
Message-ID: <20201201203102.29535-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove dependency on BR2_arm
- update Config.in.host help text (mention NXP, mention uuu)
- change upstream URL to https://github.com/NXPmicro/mfgtools (as
  https://github.com/codeauroraforum/mfgtools redirects to it)
- remove legacy patch 0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
- remove legacy readme.txt
- update licence and LICENSE hash
- remove legacy README.txt license hash
- use upload tar.gz archive
- add new dependencies: host-pkgconf host-bzip2 host-libzip

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - @Gary Bisson: as it seems a complete rewrite of the tool
    (compared to the old mfgtoolcli) and you provided an
    fix for the old one lately: does it make sense to update/overwrite
    the mfgtools package or should I provide the uuu tool as a
    new package (any naming suggestions)?
---
 ...onflicting-declaration-of-__time64_t.patch | 27 --------
 package/mfgtools/Config.in.host               |  8 +--
 package/mfgtools/mfgtools.hash                |  5 +-
 package/mfgtools/mfgtools.mk                  | 32 ++-------
 package/mfgtools/readme.txt                   | 69 -------------------
 5 files changed, 12 insertions(+), 129 deletions(-)
 delete mode 100644 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
 delete mode 100644 package/mfgtools/readme.txt

diff --git a/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch b/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
deleted file mode 100644
index 7d0d3974a2..0000000000
--- a/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1af7bc09451e0b779f7bfb0dcc58ffb3abe9c584 Mon Sep 17 00:00:00 2001
-From: Gary Bisson <bisson.gary@gmail.com>
-Date: Tue, 11 Feb 2020 15:30:12 +0100
-Subject: [PATCH] lnx_def.h: fix conflicting declaration of __time64_t
-
-Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
----
- MfgToolLib/lnx_def.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/MfgToolLib/lnx_def.h b/MfgToolLib/lnx_def.h
-index c6869dd..a38bb99 100644
---- a/MfgToolLib/lnx_def.h
-+++ b/MfgToolLib/lnx_def.h
-@@ -124,7 +124,9 @@ typedef unsigned long * ULONG_PTR;
- typedef char * LPOLESTR;
- typedef void * HDEVINFO;
- typedef unsigned long long ULONGLONG;
-+#ifndef __time64_t
- typedef long long __time64_t;
-+#endif
- typedef long long __int64;
- typedef unsigned long DWORD_PTR;
- typedef unsigned int UINT;
--- 
-2.25.0
-
diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 6f2f3a3268..6cb968aa2f 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_HOST_MFGTOOLS
 	bool "host mfgtools"
-	depends on BR2_arm
 	help
-	  This package contains the Freescale manufacturing tool.
+	  This package contains the Freescale/NXP I.MX Chip image
+	  deploy tool (uuu), an evolution of MFGTools (aka MFGTools v3).
 	  It is designed to program firmware to i.MX boards during
 	  production. The communication is done over USB using the
-	  Freescale UTP protocol.
+	  Freescale/NXP UTP protocol.
 
-	  https://github.com/codeauroraforum/mfgtools
+	  https://github.com/NXPmicro/mfgtools
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
index 0b215f5295..f073e7e512 100644
--- a/package/mfgtools/mfgtools.hash
+++ b/package/mfgtools/mfgtools.hash
@@ -1,4 +1,3 @@
 # locally computed
-sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-0.02.tar.gz
-sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
-sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
+sha256  f31148c3ed42e5dde48d92a295fe716fd82f770ff5da51a900e55cbafe65b124  uuu_source-1.4.43.tar.gz
+sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index 48ce5dda28..63e7a1f5c0 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -4,31 +4,11 @@
 #
 ################################################################################
 
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
+MFGTOOLS_VERSION = 1.4.43
+MFGTOOLS_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(MFGTOOLS_VERSION)
+MFGTOOLS_SOURCE = uuu_source-$(MFGTOOLS_VERSION).tar.gz
+MFGTOOLS_LICENSE = BSD-3-Clause
+MFGTOOLS_LICENSE_FILES = LICENSE
+HOST_MFGTOOLS_DEPENDENCIES = host-pkgconf host-bzip2 host-libusb host-libzip
 
 $(eval $(host-cmake-package))
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
2.29.2
