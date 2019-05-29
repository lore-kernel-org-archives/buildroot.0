From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 May 2019 12:52:17 +0200
Subject: [Buildroot] [PATCH for-next] package/zziplib: new package
Message-ID: <20190529105217.24928-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force the build system to use python2 interpreter.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Tested using test-pkg with the useful subset of toolchains.
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/zziplib/Config.in    | 11 +++++++++++
 package/zziplib/zziplib.hash |  3 +++
 package/zziplib/zziplib.mk   | 18 ++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/zziplib/Config.in
 create mode 100644 package/zziplib/zziplib.hash
 create mode 100644 package/zziplib/zziplib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 66dc2504ff..29fc91dabb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1949,6 +1949,7 @@ F:	package/tk/
 F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
+F:	package/zziplib/
 F:	toolchain/toolchain-external/toolchain-external-arm-aarch64/
 F:	toolchain/toolchain-external/toolchain-external-arm-aarch64-be/
 F:	toolchain/toolchain-external/toolchain-external-arm-arm/
diff --git a/package/Config.in b/package/Config.in
index 6f1c4593e6..f61009410d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1189,6 +1189,7 @@ menu "Compression and decompression"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
+	source "package/zziplib/Config.in"
 endmenu
 
 menu "Crypto"
diff --git a/package/zziplib/Config.in b/package/zziplib/Config.in
new file mode 100644
index 0000000000..6b55572a4d
--- /dev/null
+++ b/package/zziplib/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ZZIPLIB
+	bool "zziplib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  The zziplib provides read access to zipped files in a
+	  zip-archive, using compression based solely on free algorithms
+	  provided by zlib. It also provides a functionality to overlay
+	  the archive filesystem with the filesystem of the operating
+	  system environment.
+
+	  http://zziplib.sourceforge.net
diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
new file mode 100644
index 0000000000..ab191cc21e
--- /dev/null
+++ b/package/zziplib/zziplib.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256 846246d7cdeee405d8d21e2922c6e97f55f24ecbe3b6dcf5778073a88f120544  zziplib-v0.13.69.tar.gz
+sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
new file mode 100644
index 0000000000..7b0dd5283d
--- /dev/null
+++ b/package/zziplib/zziplib.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# zziplib
+#
+################################################################################
+
+ZZIPLIB_VERSION = v0.13.69
+ZZIPLIB_SITE = $(call github,gdraheim,zziplib,$(ZZIPLIB_VERSION))
+ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
+ZZIPLIB_LICENSE_FILES = COPYING.LIB
+ZZIPLIB_INSTALL_STAGING = YES
+
+ZZIPLIB_DEPENDENCIES = host-pkgconf host-python zlib
+
+# zziplib is not python3 friendly, so force the python interpreter
+ZZIPLIB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+
+$(eval $(autotools-package))
-- 
2.21.0
