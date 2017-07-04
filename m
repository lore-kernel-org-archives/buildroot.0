From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  4 Jul 2017 12:01:23 -0700
Subject: [Buildroot] [PATCH] zstd: add new package
Message-ID: <20170704190123.13231-1-andrew.smirnov@gmail.com>
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
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/zstd/Config.in | 25 ++++++++++++++++++++
 package/zstd/zstd.mk   | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 package/zstd/Config.in
 create mode 100644 package/zstd/zstd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 08a138a..d907e2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -96,6 +96,7 @@ F:	package/python-scandir/
 F:	package/python-simplegeneric/
 F:	package/python-systemd/
 F:	package/python-traitlets/
+F:	package/zstd/
 
 N:	Andrey Yurovsky <yurovsky@gmail.com>
 F:	package/rauc/
diff --git a/package/Config.in b/package/Config.in
index af1aa0c..1efdf26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -68,6 +68,7 @@ menu "Compressors and decompressors"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
 	source "package/zip/Config.in"
+	source "package/zstd/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
diff --git a/package/zstd/Config.in b/package/zstd/Config.in
new file mode 100644
index 0000000..20738b9
--- /dev/null
+++ b/package/zstd/Config.in
@@ -0,0 +1,25 @@
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
+	  - xz and/or zlib will enable support for support of
+	    corresponding compression formats
+
+if BR2_PACKAGE_ZSTD
+
+config BR2_PACKAGE_ZSTD_ZSTDLESS_ZSTDGREP
+	bool "enable zstdless, zstdgrep tools"
+	default n
+
+config BR2_PACKAGE_ZSTD_ZSTDCAT_UNZSTD_ZSTDMT
+	bool "enable zstdcat, unzstd and zstdmt tools"
+	default n
+
+endif
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
new file mode 100644
index 0000000..6edb3f7
--- /dev/null
+++ b/package/zstd/zstd.mk
@@ -0,0 +1,63 @@
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
+define ZSTD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) -C $(@D) zstd
+endef
+
+ifeq ($(BR2_PACKAGE_ZSTD_ZSTDLESS_ZSTDGREP),y)
+define ZSTD_INSTALL_TARGET_ZSTDLESS_ZSTDGREP
+	$(INSTALL) -D -m 0755 $(@D)/programs/zstdless $(TARGET_DIR)/usr/bin/zstdless
+	$(INSTALL) -D -m 0755 $(@D)/programs/zstdgrep $(TARGET_DIR)/usr/bin/zstdgrep
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD_ZSTDCAT_UNZSTD_ZSTDMT),y)
+define ZSTD_INSTALL_TARGET_ZSTDCAT_UNZSTD_ZSTDMT
+	for tool in zstdcat unzstd zstdmt; do \
+		ln -sf zstd $(TARGET_DIR)/usr/bin/$${tool}; \
+	done
+endef
+endif
+
+#
+# 'install' target provided with the package will unconditionally
+# install man pages and all of the tools. To avoid that we install all
+# of the binaries explicitly
+#
+define ZSTD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/zstd $(TARGET_DIR)/usr/bin/zstd
+
+	$(ZSTD_INSTALL_TARGET_ZSTDLESS_ZSTDGREP)
+	$(ZSTD_INSTALL_TARGET_ZSTDCAT_UNZSTD_ZSTDMT)
+endef
+
+$(eval $(generic-package))
-- 
2.9.4
