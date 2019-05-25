From: Gary Bisson <bisson.gary@gmail.com>
Date: Sat, 25 May 2019 16:18:00 +0200
Subject: [Buildroot] [PATCH v2] mfgtools: bump version to 1.2.91
Message-ID: <20190525141800.3991-1-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NXP deprecated the old mfgtools code, also called mfgtools v2 although
the releases were named v0.xx.

It has been replaced by the Universal Update Utility (uuu), also called
mfgtools v3 although the releases are named v1.x.yy.

This new tool actually resides in the same repository in the master
branch whereas the old one is now in a 'linux' branch.

Since the old tool has issues building lately, let's switch to the new
one. Note that uuu seems to be cleaner, supports much more features
(i.MX8/8M/8QXP boot, fastboot etc..) and has a better documentation:
https://github.com/NXPmicro/mfgtools/wiki

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Changelog v2:
- update Config.in help text to mention tool version
- update project URL (codeauroraforum doesn't apply to NXP repositories
  now that the Qualcomm merger isn't happening)
- add README.md to license files (like before)
---
 package/mfgtools/Config.in.host | 10 ++++----
 package/mfgtools/mfgtools.hash  |  6 ++---
 package/mfgtools/mfgtools.mk    | 31 ++++-------------------
 package/mfgtools/readme.txt     | 45 +++++----------------------------
 4 files changed, 20 insertions(+), 72 deletions(-)

diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 4bbdde38e2..dd4f037b6c 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -6,9 +6,9 @@ config BR2_PACKAGE_HOST_MFGTOOLS
 	depends on BR2_arm
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # needs C++11
 	help
-	  This package contains the Freescale manufacturing tool.
-	  It is designed to program firmware to i.MX boards during
-	  production. The communication is done over USB using the
-	  Freescale UTP protocol.
+	  This package contains the NXP Universal Update Utility
+	  (MFGTools v3) for i.MX boards.
+	  It allows to load a bootloader/kernel/ramdisk over USB SDP
+	  protocol as well as sending commands to flash a storage.
 
-	  https://github.com/codeauroraforum/mfgtools
+	  https://github.com/NXPmicro/mfgtools
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
index 4932a80dba..c5ba57ec72 100644
--- a/package/mfgtools/mfgtools.hash
+++ b/package/mfgtools/mfgtools.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-v0.02.tar.gz
-sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
-sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
+sha256  378caa930fdc1b06d49abf26811827f12103d995438b91302a7c6e34368419f9  mfgtools-1.2.91.tar.gz
+sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
+sha256  01a4b15843de543b01fb0600eba02248273182bcf11da60d2d7736440f0995b6  README.md
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index e4663a8af9..bfeb33f4e0 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -4,31 +4,10 @@
 #
 ################################################################################
 
-MFGTOOLS_VERSION = v0.02
-MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,$(MFGTOOLS_VERSION))
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
+MFGTOOLS_VERSION = 1.2.91
+MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,uuu_$(MFGTOOLS_VERSION))
+MFGTOOLS_LICENSE = BSD-3-Clause
+MFGTOOLS_LICENSE_FILES = LICENSE README.md
+HOST_MFGTOOLS_DEPENDENCIES = host-libusb host-bzip2 host-libzip host-zlib
 
 $(eval $(host-cmake-package))
diff --git a/package/mfgtools/readme.txt b/package/mfgtools/readme.txt
index 320e6ec493..8a916d1cae 100644
--- a/package/mfgtools/readme.txt
+++ b/package/mfgtools/readme.txt
@@ -18,45 +18,16 @@ CONFIG_USB_MASS_STORAGE=y
 CONFIG_FSL_UTP=y
 CONFIG_MMC_BLOCK_MINORS=16
 
-2. Go into the output and create the necessary folders
+2. Run the MfgTools (now called uuu) client to boot the board from USB:
 
-$ cd output
-$ mkdir -p "Profiles/Linux/OS Firmware/firmware"
+$ ./output/host/bin/uuu output/images/u-boot.imx
 
-3. Create your XML update script named ucl2.xml
+At this point you can either flash your kernel and rootfs image directly from
+U-Boot or use commands in order to load your ramdisk and execute commands from
+Linux OS.
 
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
+For more information about the tools options, please read this wiki:
+https://github.com/NXPmicro/mfgtools/wiki
 
 Also, if your U-Boot environment doesn't include mfgtools bootargs,
 make sure to set the following:
@@ -65,5 +36,3 @@ setenv bootargs "console=${console},${baudrate} g_mass_storage.stall=0 \
 	g_mass_storage.removable=1 g_mass_storage.idVendor=0x066F \
 	g_mass_storage.idProduct=0x37FF g_mass_storage.iSerialNumber=\"\" \
 	g_mass_storage.file=/fat"
-
-[1] http://www.nxp.com/products/software-and-tools/software-development-tools/i.mx-software-and-tools/i.mx-6-series-software-and-development-tool-resources:IMX6_SW
-- 
2.20.1
