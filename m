From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:42:32 +0000
Subject: [Buildroot] [PATCH v4 01/10] package/edk2-platforms: new package
Message-ID: <34j7jMPklxbGS9VL3KH4ywYUUSnP2J5paG6i58IM9Uk@cp3-web-024.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EDK2 firmware is usually built from two sources; the core EDK2
environment, and additional platform description files maintained
separately. This package adds the latter set of description files to
staging so that the core EDK2 package can build with these for certain
platforms during the building process.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 4:

 * Addressed review items from Yann Morin
 * Install description files to the staging dir instead of the host dir
 * Updated to HEAD as of 7 Jan, 2021

Revision 3:

 * Added standard comment header
 * Added sha256 of the license file
 * Updated to hash matching edk2 202008

Revision 2:

 * Now installs all description files into HOST_DIR so other packages do not
   have to compile from its BUILD_DIR (suggested by Thomas Petazzoni)

edk2-platforms fixes

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/Config.in                          |  1 +
 package/edk2-platforms/Config.in           |  8 ++++++++
 package/edk2-platforms/edk2-platforms.hash |  3 +++
 package/edk2-platforms/edk2-platforms.mk   | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/edk2-platforms/Config.in
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

diff --git a/package/Config.in b/package/Config.in
index d278e78b68..580c9b154a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -458,6 +458,7 @@ endmenu
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
+	source "package/edk2-platforms/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/edk2-platforms/Config.in b/package/edk2-platforms/Config.in
new file mode 100644
index 0000000000..c6002ba019
--- /dev/null
+++ b/package/edk2-platforms/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_EDK2_PLATFORMS
+	bool
+	help
+	  EDK II description files for all supported platforms. The main EDK2
+	  bootloader package will depend on these description files while building
+	  firmware for certain platforms.
+
+	  https://github.com/tianocore/edk2-platforms
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
new file mode 100644
index 0000000000..5b57f653b6
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 b90b923425f81ca1b1ae37a5adc02853cdb609d716f08f64482b735ac5d253a7  edk2-platforms-f8958b86e8863432b815a132a0f0fe82950c6dd1.tar.gz
+sha256 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
new file mode 100644
index 0000000000..b9e3f0fb1b
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# edk2-platforms
+#
+################################################################################
+
+EDK2_PLATFORMS_VERSION = f8958b86e8863432b815a132a0f0fe82950c6dd1
+EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
+EDK2_PLATFORMS_LICENSE = BSD-2-Clause
+EDK2_PLATFORMS_LICENSE_FILE = License.txt
+EDK2_PLATFORMS_INSTALL_TARGET = NO
+EDK2_PLATFORMS_INSTALL_STAGING = YES
+
+# There is nothing to build for edk2-platforms. All we need to do is to copy
+# all description files to staging, for other packages to build with.
+define EDK2_PLATFORMS_INSTALL_STAGING_CMDS
+	rm -rf $(STAGING_DIR)/usr/share/edk2-platforms
+	cp -rf $(@D) $(STAGING_DIR)/usr/share/edk2-platforms
+endef
+
+$(eval $(generic-package))
-- 
2.24.3 (Apple Git-128)
