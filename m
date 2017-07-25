From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 24 Jul 2017 17:07:00 -0700
Subject: [Buildroot] [PATCH v3] zstd: add new package
Message-ID: <20170725000700.19035-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package to provide Zstandard compression tools
(see https://facebook.github.io/zstd)

Minimal config snippet for utils/test-pkg is as follows:

BR2_PACKAGE_ZSTD=y

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since [v2]:

    - Bump package version to the latest release: 1.3.0

Changes since [v1]:

    - Remove all excessive configuration options and simplify
      installation rules to just calling "make install"

    - Add support for HAVE_LZ4

    - Add missing hash file

[v1] http://lists.busybox.net/pipermail/buildroot/2017-July/196739.html
[v2] http://lists.busybox.net/pipermail/buildroot/2017-July/197641.html

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/zstd/Config.in | 13 +++++++++++++
 package/zstd/zstd.hash |  3 +++
 package/zstd/zstd.mk   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/zstd/Config.in
 create mode 100644 package/zstd/zstd.hash
 create mode 100644 package/zstd/zstd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c9b5ed6e3..7e5c878a81 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -100,6 +100,7 @@ F:	package/python-scandir/
 F:	package/python-simplegeneric/
 F:	package/python-systemd/
 F:	package/python-traitlets/
+F:	package/zstd/
 
 N:	Andrey Yurovsky <yurovsky@gmail.com>
 F:	package/rauc/
diff --git a/package/Config.in b/package/Config.in
index 59db51e20c..390477072d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -73,6 +73,7 @@ menu "Compressors and decompressors"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
 	source "package/zip/Config.in"
+	source "package/zstd/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
diff --git a/package/zstd/Config.in b/package/zstd/Config.in
new file mode 100644
index 0000000000..0e97c64e0a
--- /dev/null
+++ b/package/zstd/Config.in
@@ -0,0 +1,13 @@
+menuconfig BR2_PACKAGE_ZSTD
+	bool "zstd"
+	help
+	  Zstandard, or zstd as short version, is a fast lossless
+	  compression algorithm, targeting real-time compression
+	  scenarios at zlib-level and better compression ratios
+
+	  For more info see https://facebook.github.io/zstd
+
+	  The selection of other packages will enable some features:
+
+	  - xz, lz4 and/or zlib will enable support for corresponding
+	    compression formats
\ No newline at end of file
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
new file mode 100644
index 0000000000..d09e6b46f4
--- /dev/null
+++ b/package/zstd/zstd.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 0fdba643b438b7cbce700dcc0e7b3e3da6d829088c63757a5984930e2f70b348 zstd-v1.3.0.tar.gz
+
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
new file mode 100644
index 0000000000..ad26bae6fd
--- /dev/null
+++ b/package/zstd/zstd.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# zstd
+#
+################################################################################
+
+ZSTD_VERSION = v1.3.0
+ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_LICENSE = BSD-3-Clause
+ZSTD_LICENSE_FILES = LICENSE PATENTS
+
+ZSTD_OPTS = DESTDIR=$(TARGET_DIR)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZSTD_OPTS += HAVE_THREAD=1
+else
+ZSTD_OPTS += HAVE_THREAD=0
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ZSTD_DEPENDENCIES += zlib
+ZSTD_OPTS += HAVE_ZLIB=1
+else
+ZSTD_OPTS += HAVE_ZLIB=0
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+ZSTD_DEPENDENCIES += xz
+ZSTD_OPTS += HAVE_LZMA=1
+else
+ZSTD_OPTS += HAVE_LZMA=0
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+ZSTD_DEPENDENCIES += lz4
+ZSTD_OPTS += HAVE_LZ4=1
+else
+ZSTD_OPTS += HAVE_LZ4=0
+endif
+
+define ZSTD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) -C $(@D) zstd
+endef
+
+define ZSTD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) -C $(@D)/programs install
+endef
+
+$(eval $(generic-package))
-- 
2.13.3
