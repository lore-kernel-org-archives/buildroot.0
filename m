From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:10:52 +0200
Subject: [Buildroot] [git commit] zstd: new package
Message-ID: <20170725200645.D2E5781F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e751df23ab68f32fbbde1568f3a565ac24caaff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add package to provide Zstandard compression tools
(see https://facebook.github.io/zstd)

Minimal config snippet for utils/test-pkg is as follows:

BR2_PACKAGE_ZSTD=y

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[Thomas:
 - use "config" instead of "menuconfig" in Config.in
 - add missing final newline in Config.in
 - pass DESTDIR=$(TARGET_DIR) only at install time
 - wrap too long lines in the .mk file
 - remove useless empty newline at end of .hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/zstd/Config.in | 12 ++++++++++++
 package/zstd/zstd.hash |  6 ++++++
 package/zstd/zstd.mk   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c9b5ed..7e5c878 100644
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
index 618bcf5..484c753 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -69,6 +69,7 @@ menu "Compressors and decompressors"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
 	source "package/zip/Config.in"
+	source "package/zstd/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
diff --git a/package/zstd/Config.in b/package/zstd/Config.in
new file mode 100644
index 0000000..9fa70c6
--- /dev/null
+++ b/package/zstd/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ZSTD
+	bool "zstd"
+	help
+	  Zstandard, or zstd as short version, is a fast lossless
+	  compression algorithm, targeting real-time compression
+	  scenarios at zlib-level and better compression ratios
+
+	  The selection of other packages will enable some features:
+	  xz, lz4 and/or zlib will enable support for corresponding
+	  compression formats
+
+	  https://facebook.github.io/zstd
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
new file mode 100644
index 0000000..60641aa
--- /dev/null
+++ b/package/zstd/zstd.hash
@@ -0,0 +1,6 @@
+# Locally computed
+sha256 0fdba643b438b7cbce700dcc0e7b3e3da6d829088c63757a5984930e2f70b348 zstd-v1.3.0.tar.gz
+
+# License files (locally computed as well)
+sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
+sha256 3a508245dd3c486bb9d78a8269091322359443ea54612c3648327a0b3512f23f PATENTS
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
new file mode 100644
index 0000000..cad8068
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
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		-C $(@D) zstd
+endef
+
+define ZSTD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
+endef
+
+$(eval $(generic-package))
