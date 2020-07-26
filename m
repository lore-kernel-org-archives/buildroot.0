From: D. Olsson <hi@senzilla.io>
Date: Sun, 26 Jul 2020 10:06:26 +0000
Subject: [Buildroot] [PATCH v2 1/6] package/edk2-platforms: new package
Message-ID: <20200726100541.7710-2-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dick Olsson <hi@senzilla.io>

EDK2 firmware is usually built from two sources; the core EDK2 environment,
and additional platform description files maintained separately.
This host package adds the latter set of description files that the core EDK2
package will depend on for certain platforms during the building process.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 2:

 * Now installs all description files into HOST_DIR so other packages do not
   have to compile from its BUILD_DIR (suggested by Thomas Petazzoni)
---
 package/Config.in.host                     |  1 +
 package/edk2-platforms/Config.in.host      |  8 ++++++++
 package/edk2-platforms/edk2-platforms.hash |  2 ++
 package/edk2-platforms/edk2-platforms.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/edk2-platforms/Config.in.host
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 647fc24841..5efe824199 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
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
index 0000000000..a6c6e652b4
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b1ce41b6fb5d1ad5a0877c9cee7751d85aafda3a81cd54898254b07a9a42c5e7  edk2-platforms-608d71ec939692eace78e6b4b2a44ea7b6e75927.tar.gz
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
new file mode 100644
index 0000000000..279afb16e7
--- /dev/null
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -0,0 +1,12 @@
+EDK2_PLATFORMS_VERSION = 608d71ec939692eace78e6b4b2a44ea7b6e75927
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
2.20.1
