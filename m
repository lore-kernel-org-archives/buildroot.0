From: Jan Pedersen <jp@jp-embedded.com>
Date: Mon, 14 Jan 2013 14:30:00 +0100
Subject: [Buildroot] [PATCH 1/1] infozip: new package
Message-ID: <1358170201-26050-1-git-send-email-jp@jp-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a package for infozip, compression and file
packaging/archive utility.

Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
---
 package/Config.in          |    1 +
 package/infozip/Config.in  |   10 ++++++++++
 package/infozip/infozip.mk |   20 ++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/infozip/Config.in
 create mode 100644 package/infozip/infozip.mk

diff --git a/package/Config.in b/package/Config.in
index 4f05665..ad2a742 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -11,6 +11,7 @@ source "package/bzip2/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
+source "package/infozip/Config.in"
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
 source "package/xz/Config.in"
diff --git a/package/infozip/Config.in b/package/infozip/Config.in
new file mode 100644
index 0000000..1a4b756
--- /dev/null
+++ b/package/infozip/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_INFOZIP
+	bool "infozip"
+	help
+	  Zip is a compression and file packaging/archive utility. 
+	  Although highly compatible both with PKWARE's PKZIP and 
+	  PKUNZIP utilities for MS-DOS and with Info-ZIP's own UnZip, 
+ 	  our primary objectives have been portability and other-than-MSDOS 
+	  functionality. 
+
+	  http://infozip.sourceforge.net/Zip.html
diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
new file mode 100644
index 0000000..fd0c15c
--- /dev/null
+++ b/package/infozip/infozip.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# infozip
+#
+#############################################################
+INFOZIP_VERSION = 30
+INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
+INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
+INFOZIP_LICENSE = Info-ZIP
+INFOZIP_LICENSE_FILES = LICENSE
+
+define INFOZIP_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile generic
+endef
+
+define INFOZIP_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install prefix=$(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
