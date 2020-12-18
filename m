From: Dick Olsson <hi@senzilla.io>
Date: Fri, 18 Dec 2020 20:27:21 +0000
Subject: [Buildroot] [PATCH v3 03/11] package/edk2-platforms: new package
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201218202646.1060123-4-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EDK2 firmware is usually built from two sources; the core EDK2
environment, and additional platform description files maintained
separately. This host package adds the latter set of description files
that the core EDK2 package will depend on for certain platforms during
the building process.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 3:

 * Added standard comment header
 * Added sha256 of the license file
 * Updated to hash matching edk2 202008

Revision 2:

 * Now installs all description files into HOST_DIR so other packages do not
   have to compile from its BUILD_DIR (suggested by Thomas Petazzoni)
---
 package/Config.in.host                     |  1 +
 package/edk2-platforms/Config.in.host      |  8 ++++++++
 package/edk2-platforms/edk2-platforms.hash |  3 +++
 package/edk2-platforms/edk2-platforms.mk   | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/edk2-platforms/Config.in.host
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index c69c756f3a..58d19795f6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -20,6 +20,7 @@ menu "Host utilities"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/environment-setup/Config.in.host"
+	source "package/edk2-platforms/Config.in.host"
 	source "package/erofs-utils/Config.in.host"
 	source "package/eudev/Config.in.host"
 	source "package/exfatprogs/Config.in.host"
diff --git a/package/edk2-platforms/Config.in.host b/package/edk2-platforms/Config.in.host
new file mode 100644
index 0000000000..d1e2deb1d1
--- /dev/null
+++ b/package/edk2-platforms/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_EDK2_PLATFORMS
+	bool "host edk2-platforms"
+	help
+	  EDK II description files for all supported platforms. The main EDK2
+	  bootloader package will depend on these description files while building
+	  firmware for certain platforms.
+
+	  https://github.com/tianocore/edk2-platforms
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
new file mode 100644
index 0000000000..217d520710
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 7cdbeb5671a77a3d9cf09a2f232ae7ed4730064465c8d40943a01d673607a2f6  edk2-platforms-7aab81a35aef7b295e73d7d6dfd528cc812790ed.tar.gz
+sha256 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
new file mode 100644
index 0000000000..6ba8bf130b
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# edk2-platforms
+#
+################################################################################
+
+EDK2_PLATFORMS_VERSION = 7aab81a35aef7b295e73d7d6dfd528cc812790ed
+EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
+EDK2_PLATFORMS_LICENSE = BSD-2-Clause
+EDK2_PLATFORMS_LICENSE_FILE = License.txt
+
+# There is nothing to build for edk2-platforms. All we need to do is to copy
+# all description files to the host directory for other packages to build with.
+define HOST_EDK2_PLATFORMS_INSTALL_CMDS
+	cp -rf $(@D) $(HOST_DIR)/share/edk2-platforms
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1
