From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:36:08 +0000
Subject: [Buildroot] [PATCH v5 01/10] package/edk2-platforms: new package
Message-ID: <buGUzSnm6tM6CssMCskxGQMGXna4RCOMCb9cIxDgMg@cp3-web-024.plabs.ch>
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

Revision 5:

 * check-package fixes
 * Bumped to the latest stable version

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
---
 package/Config.in                          |  1 +
 package/edk2-platforms/Config.in           |  8 ++++++++
 package/edk2-platforms/edk2-platforms.hash |  3 +++
 package/edk2-platforms/edk2-platforms.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/edk2-platforms/Config.in
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

diff --git a/package/Config.in b/package/Config.in
index 6181aaac2c..bfb8d5a78b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ endmenu
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
+	source "package/edk2-platforms/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/edk2-platforms/Config.in b/package/edk2-platforms/Config.in
new file mode 100644
index 0000000000..17633c0fdd
--- /dev/null
+++ b/package/edk2-platforms/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_EDK2_PLATFORMS
+	bool
+	help
+	  EDK2 description files for all supported platforms.
+	  The main EDK2 bootloader package will depend on these
+	  description files while building firmware for some platforms.
+
+	  https://github.com/tianocore/edk2-platforms
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
new file mode 100644
index 0000000000..30ae235078
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  dfdc34fea86e5037a3a6cbd2a83b1f655f16b4c9ab4f5ff9da91e45a358c9a14  edk2-platforms-db922e1253cb6f1fc456805bc42fb7d401eed5c2.tar.gz
+sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
new file mode 100644
index 0000000000..47e6b1c51d
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# edk2-platforms
+#
+################################################################################
+
+# Keep in sync with latest commit as of the release date for boot/edk2
+EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
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
2.30.2
