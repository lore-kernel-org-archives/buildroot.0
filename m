From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 26 Oct 2016 18:08:02 +0200
Subject: [Buildroot] [PATCH v2 1/2] mfgtools: new package
In-Reply-To: <20161026160803.30262-1-gary.bisson@boundarydevices.com>
References: <20161026160803.30262-1-gary.bisson@boundarydevices.com>
Message-ID: <20161026160803.30262-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains the Freescale manufacturing tool.
It is designed to program firmware to i.MX boards during production.
The communication is done over USB using the Freescale UTP protocol.

The project is maintained on NXPMicro Github repository:
https://github.com/NXPmicro/mfgtools

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changelog v1 -> v2:
- Use host-cmake-package and build the CLI as a post build hook
- Fix licenses: now BSD-3c and CPOL
- Fix MFGTOOLS_CFLAGS and rename it HOST_MFGTOOLS_CFLAGS
- Use HOST_LDFLAGS instead of specifyin the rpath manually
- Fix install commands to have the full destination path
- Add readme.txt file
---
 package/Config.in.host          |  1 +
 package/mfgtools/Config.in.host | 10 ++++++++
 package/mfgtools/mfgtools.hash  |  2 ++
 package/mfgtools/mfgtools.mk    | 34 +++++++++++++++++++++++++
 package/mfgtools/readme.txt     | 56 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+)
 create mode 100644 package/mfgtools/Config.in.host
 create mode 100644 package/mfgtools/mfgtools.hash
 create mode 100644 package/mfgtools/mfgtools.mk
 create mode 100644 package/mfgtools/readme.txt

diff --git a/package/Config.in.host b/package/Config.in.host
index 1140c70..e33cbb5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -22,6 +22,7 @@ menu "Host utilities"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
+	source "package/mfgtools/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
new file mode 100644
index 0000000..8bba9e2
--- /dev/null
+++ b/package/mfgtools/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_MFGTOOLS
+	bool "host mfgtools"
+	depends on BR2_arm
+	help
+	  This package contains the Freescale manufacturing tool.
+	  It is designed to program firmware to i.MX boards during
+	  production. The communication is done over USB using the
+	  Freescale UTP protocol.
+
+	  https://github.com/NXPmicro/mfgtools
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
new file mode 100644
index 0000000..e73a7fa
--- /dev/null
+++ b/package/mfgtools/mfgtools.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  6ce93a33c269282df305cf7e517d2d14fde78203537d8ea75b064966afe48464  mfgtools-b219fc219a35c365010897ed093c40750f8cdac6.tar.gz
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
new file mode 100644
index 0000000..fcc28ab
--- /dev/null
+++ b/package/mfgtools/mfgtools.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# mfgtools
+#
+################################################################################
+
+MFGTOOLS_VERSION = b219fc219a35c365010897ed093c40750f8cdac6
+MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,$(MFGTOOLS_VERSION))
+MFGTOOLS_SUBDIR = MfgToolLib
+MFGTOOLS_LICENSE = BSD-3c or CPOL
+MFGTOOLS_LICENSE_FILES = LICENSE
+HOST_MFGTOOLS_DEPENDENCIES = host-cmake host-libusb
+
+HOST_MFGTOOLS_CFLAGS = \
+	$(HOST_CFLAGS) $(HOST_LDFLAGS) -std=c++11 -lpthread \
+	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
+	-lusb-1.0 -I$(HOST_DIR)/usr/include/libusb-1.0 \
+	-fpermissive -Wno-write-strings
+
+define HOST_MFGTOOLS_CLI_BUILD
+	$(HOST_CONFIGURE_OPTS) $(MAKE) CC=$(HOSTCXX) \
+		CFLAGS="$(HOST_MFGTOOLS_CFLAGS)" -C $(@D)/TestPrgm
+endef
+
+HOST_MFGTOOLS_POST_BUILD_HOOKS += HOST_MFGTOOLS_CLI_BUILD
+
+define HOST_MFGTOOLS_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
+		$(HOST_DIR)/usr/lib/libMfgToolLib.so
+	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
+		$(HOST_DIR)/usr/bin/mfgtoolcli
+endef
+
+$(eval $(host-cmake-package))
diff --git a/package/mfgtools/readme.txt b/package/mfgtools/readme.txt
new file mode 100644
index 0000000..3f25f6e
--- /dev/null
+++ b/package/mfgtools/readme.txt
@@ -0,0 +1,56 @@
+MfgTools How To:
+
+Here is an example on how to use the MfgTools with Buildroot:
+1- Build your mfgtool image:
+   - Make sure to enable the following Buildroot options:
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_IMX_UUC=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+   - Also modify your kernel configuration to have:
+CONFIG_USB_GADGET=y
+CONFIG_USB_MASS_STORAGE=y
+CONFIG_FSL_UTP=y
+CONFIG_MMC_BLOCK_MINORS=16
+
+2- Go into the output and create the necessary folders:
+$ cd output
+$ mkdir -p "Profiles/Linux/OS Firmware/firmware"
+
+3- Create your XML update script named ucl2.xml:
+   - You can find a sample XML here:
+$ wget https://storage.googleapis.com/boundarydevices.com/ucl2.xml \
+  -O Profiles/Linux/OS\ Firmware/ucl2.xml
+
+4- Copy the mfgtools U-Boot, Kernel and initramfs images created:
+$ cp images/u-boot.imx images/zImage images/imx6q-sabrelite.dtb \
+  images/rootfs.cpio.uboot Profiles/Linux/OS\ Firmware/firmware/
+
+5- Copy the prebuilt binaries to be flashed:
+   - Depends on your ucl2.xml file, the sample doesn't flash anything.
+
+6- Execute the MfgTools client:
+$ ./host/usr/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
+  -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
+  -s mmc=1 -p 1
+
+For more information about the tools options, please read the
+"Manufacturing Tool V2 Quick Start Guide.docx" documentation contained in
+every mfgtools package from NXP website[1].
+
+Note: All the above commands require your Linux host user to have permissions
+to access the USB devices. Please make sure to have udev rules that allow the
+user to communicate with the BootROM IDs (Freescale USB recovery) as well as
+the one used for the UTP Linux image (0x066F:0x37FF).
+Using 'sudo' in front of the mfgtoolcli command would also grant you the
+necessary permission but it is *not* recommended.
+
+Also, if your U-Boot environment doesn't include mfgtools bootargs, make sure
+to set the following:
+setenv bootargs "console=${console},${baudrate} g_mass_storage.stall=0 \
+	g_mass_storage.removable=1 g_mass_storage.idVendor=0x066F \
+	g_mass_storage.idProduct=0x37FF g_mass_storage.iSerialNumber=\"\" \
+	g_mass_storage.file=/fat"
+
+[1] http://www.nxp.com/products/software-and-tools/software-development-tools/i.mx-software-and-tools/i.mx-6-series-software-and-development-tool-resources:IMX6_SW
-- 
2.9.3
