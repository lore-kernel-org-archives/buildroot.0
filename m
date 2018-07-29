From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 29 Jul 2018 15:19:18 -0400
Subject: [Buildroot] [PATCH v8 2/5] prelink-cross: new package
In-Reply-To: <20180729191921.11216-1-aduskett@gmail.com>
References: <20180729191921.11216-1-aduskett@gmail.com>
Message-ID: <20180729191921.11216-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Prelink-cross emulates a runtime linker for a given sysroot. This is
necessary to allow gobject-introspection to build it's typelib files
during cross-compiling.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v7:
  - Add patch to series.

Changes v7 -> v8:
  - None

 package/Config.in.host                   |  1 +
 package/prelink-cross/Config.in.host     |  6 ++++++
 package/prelink-cross/prelink-cross.hash |  3 +++
 package/prelink-cross/prelink-cross.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/prelink-cross/Config.in.host
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 7838ffc219..9ce23b181d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -41,6 +41,7 @@ menu "Host utilities"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
 	source "package/pkgconf/Config.in.host"
+	source "package/prelink-cross/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
diff --git a/package/prelink-cross/Config.in.host b/package/prelink-cross/Config.in.host
new file mode 100644
index 0000000000..8394935529
--- /dev/null
+++ b/package/prelink-cross/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PRELINK_CROSS
+	bool "host prelink-cross"
+	help
+	  Emulate a runtime linker for a given sysroot.
+
+	  https://wiki.yoctoproject.org/wiki/Cross-Prelink
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
new file mode 100644
index 0000000000..ed8e7b211a
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7f2f864f330d4e44abba252d36e2795e6639e46b0ca927aa477cfd1419ca4995  prelink-cross-05aeafd053e56356ec8c62f4bb8f7b95bae192f3.tar.gz
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
new file mode 100644
index 0000000000..2cecf12f48
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# host-prelink-cross
+#
+################################################################################
+
+HOST_PRELINK_CROSS_VERSION = 05aeafd053e56356ec8c62f4bb8f7b95bae192f3
+HOST_PRELINK_CROSS_SITE = git://git.yoctoproject.org/prelink-cross
+HOST_PRELINK_CROSS_SITE_METHOD = git
+HOST_PRELINK_CROSS_LICENSE = GPL-2.0
+HOST_PRELINK_CROSS_LICENSE_FILES = COPYING
+HOST_PRELINK_CROSS_AUTORECONF = YES
+HOST_PRELINK_CROSS_DEPENDENCIES = host-binutils
+
+$(eval $(host-autotools-package))
-- 
2.17.1
