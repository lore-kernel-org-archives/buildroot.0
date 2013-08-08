From: Martin Hicks <mort@bork.org>
Date: Thu,  8 Aug 2013 13:38:54 -0400
Subject: [Buildroot] [PATCH] Add package 'zip'
Message-ID: <1375983534-5555-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A compressor/archiver for creating and modifying zipfiles.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/Config.in     |    1 +
 package/zip/Config.in |    6 ++++++
 package/zip/zip.mk    |   22 ++++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/zip/Config.in
 create mode 100644 package/zip/zip.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..45eeb56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -14,6 +14,7 @@ source "package/infozip/Config.in"
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
 source "package/xz/Config.in"
+source "package/zip/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
diff --git a/package/zip/Config.in b/package/zip/Config.in
new file mode 100644
index 0000000..c43e37e
--- /dev/null
+++ b/package/zip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ZIP
+	bool "zip"
+	help
+	  A compressor/archiver for creating and modifying zipfiles.
+
+	  http://info-zip.org/
diff --git a/package/zip/zip.mk b/package/zip/zip.mk
new file mode 100644
index 0000000..d3a7288
--- /dev/null
+++ b/package/zip/zip.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# zip
+#
+#############################################################
+ZIP_VERSION=30
+ZIP_SOURCE=zip$(ZIP_VERSION).tgz
+ZIP_SITE:=ftp://ftp.info-zip.org/pub/infozip/src
+
+define ZIP_BUILD_CMDS
+	$(MAKE) -C $(@D) -f unix/Makefile generic CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define ZIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/zip $(TARGET_DIR)/usr/bin/zip
+endef
+
+define ZIP_UNINSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -f unix/Makefile uninstall prefix=$(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
