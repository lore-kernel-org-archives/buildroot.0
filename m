From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 14:52:31 +0200
Subject: [Buildroot] [git commit] package/odroidc2-firmware: new package
Message-ID: <20200903183904.3D53487A17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0de62b7066c58a88207f0edf98ae49a23649421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AmLogic Odroid C2 boards use an ATF version for which the source
code is not available. The mainline U-Boot documentation at
doc/board/amlogic/odroid-c2.rst details how to build a bootable U-Boot
image for this platform: it requires fetching the ATF binary files
from https://github.com/hardkernel/u-boot.git as well as a tool called
fip_create from the same repository.

This commit therefore implements a simple Buildroot package that
retrieves this repository, installs the firmware files, and
builds/installs the host fip_create utility.

This package really installs target images (firmware files) and one
host utility, so we had to take an arbitrary decision on whether it
should be a target package or a host package, and we've chosen to make
it a target package.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/odroidc2-firmware/Config.in              | 11 +++++++++
 package/odroidc2-firmware/odroidc2-firmware.hash |  2 ++
 package/odroidc2-firmware/odroidc2-firmware.mk   | 31 ++++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 21301fb333..8c3f47cdb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -636,6 +636,7 @@ F:	package/kvm-unit-tests
 
 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/meson-tools/
+F:	package/odroidc2-firmware/
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index e625241da1..8c2726b4ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ menu "Firmware"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
+	source "package/odroidc2-firmware/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/rpi-wifi-firmware/Config.in"
diff --git a/package/odroidc2-firmware/Config.in b/package/odroidc2-firmware/Config.in
new file mode 100644
index 0000000000..d55003af34
--- /dev/null
+++ b/package/odroidc2-firmware/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ODROIDC2_FIRMWARE
+	bool "odroidc2-firmware"
+	help
+	  This package extracts from
+	  https://github.com/hardkernel/u-boot/tree/odroidc2-v2015.01
+	  the pre-built firmware files, as well as the host tool
+	  fip_create that are needed to create bootable images for the
+	  Odroid C2 platform. See doc/board/amlogic/odroid-c2.rst in
+	  upstream U-Boot for more details.
+
+	  https://github.com/hardkernel/u-boot/tree/odroidc2-v2015.01
diff --git a/package/odroidc2-firmware/odroidc2-firmware.hash b/package/odroidc2-firmware/odroidc2-firmware.hash
new file mode 100644
index 0000000000..67d046e8de
--- /dev/null
+++ b/package/odroidc2-firmware/odroidc2-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a2fba4c6d9332ecc5f04283f370d5c275f35d6cb62dba1f685d011269bacb6d0  odroidc2-firmware-s905_6.0.1_v5.5.tar.gz
diff --git a/package/odroidc2-firmware/odroidc2-firmware.mk b/package/odroidc2-firmware/odroidc2-firmware.mk
new file mode 100644
index 0000000000..acd5ce237f
--- /dev/null
+++ b/package/odroidc2-firmware/odroidc2-firmware.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# odroidc2-firmware
+#
+################################################################################
+
+ODROIDC2_FIRMWARE_VERSION = s905_6.0.1_v5.5
+ODROIDC2_FIRMWARE_SITE = $(call github,hardkernel,u-boot,$(ODROIDC2_FIRMWARE_VERSION))
+ODROIDC2_FIRMWARE_INSTALL_IMAGES = YES
+
+define ODROIDC2_FIRMWARE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		-C $(@D)/tools/fip_create/
+endef
+
+ODROIDC2_FIRMWARE_FILES = \
+	fip/gxb/bl301.bin \
+	fip/gxb/bl30.bin \
+	fip/gxb/bl31.bin \
+	fip/gxb/bl2.package \
+	sd_fuse/bl1.bin.hardkernel
+
+define ODROIDC2_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(foreach f,$(ODROIDC2_FIRMWARE_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/$(f) $(BINARIES_DIR)/$(notdir $(f))
+	)
+	$(INSTALL) -D -m0755 $(@D)/tools/fip_create/fip_create \
+		$(HOST_DIR)/bin/fip_create
+endef
+
+$(eval $(generic-package))
