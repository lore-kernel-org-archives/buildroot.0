From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:41:42 -0700
Subject: [Buildroot] [PATCH v2] zstd: add new package
Message-ID: <20170712024142.2648-1-andrew.smirnov@gmail.com>
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

Changes since [v1]:

    - Remove all of the excessive configuration options and simplify
      installation rules to just calling "make install"

    - Add support for HAVE_LZ4

    - Add missing hash file

[v1] http://lists.busybox.net/pipermail/buildroot/2017-July/196739.html

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/zstd/Config.in | 13 +++++++++++++
 package/zstd/zstd.hash |  2 ++
 package/zstd/zstd.mk   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 package/zstd/Config.in
 create mode 100644 package/zstd/zstd.hash
 create mode 100644 package/zstd/zstd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4380cbc..dc4e09e 100644
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
index a88e355..4025072 100644
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
index 0000000..0e97c64
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
index 0000000..1bd9016
--- /dev/null
+++ b/package/zstd/zstd.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4a7e4593a3638276ca7f2a09dc4f38e674d8317bbea51626393ca73fc047cbfb zstd-v1.2.0.tar.gz
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
new file mode 100644
index 0000000..0fb1d3c
--- /dev/null
+++ b/package/zstd/zstd.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# zstd
+#
+################################################################################
+
+ZSTD_VERSION = v1.2.0
+ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_LICENSE = BSD-3-Clause
+ZSTD_LICENSE_FILES = LICENSE PATENTS
+
+ZSTD_OPTS = DESTDIR=$(TARGET_DIR) PREFIX=/usr
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
2.9.4
