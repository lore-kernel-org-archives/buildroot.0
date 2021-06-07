From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:35 -0000
Subject: [Buildroot] [git commit] package/edk2-platforms: new package
Message-ID: <20210607144652.1D17481191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33aa59e7b500e60f2d736a17183c7d49b7baf5bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

EDK2 firmware is usually built from two sources; the core EDK2
environment, and additional platform description files maintained
separately. This package adds the latter set of description files to
staging so that the core EDK2 package can build with these for certain
platforms during the building process.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                          |  1 +
 package/edk2-platforms/Config.in           |  8 ++++++++
 package/edk2-platforms/edk2-platforms.hash |  3 +++
 package/edk2-platforms/edk2-platforms.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 82b28d2835..45d75c71d0 100644
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
