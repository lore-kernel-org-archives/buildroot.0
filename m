From: Jan Pedersen <jp@jp-embedded.com>
Date: Thu, 10 Jan 2013 11:13:27 +0100
Subject: [Buildroot] [PATCH 1/2] added infozip package
Message-ID: <1357812808-3317-1-git-send-email-jp@jp-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
---
 package/Config.in          |    1 +
 package/infozip/Config.in  |   10 ++++++++++
 package/infozip/infozip.mk |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/infozip/Config.in
 create mode 100644 package/infozip/infozip.mk

diff --git a/package/Config.in b/package/Config.in
index bd1db6b..1c2b228 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -14,6 +14,7 @@ endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
 source "package/xz/Config.in"
+source "package/infozip/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
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
index 0000000..996a709
--- /dev/null
+++ b/package/infozip/infozip.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# infozip
+#
+#############################################################
+INFOZIP_VERSION:=30
+INFOZIP_SOURCE:=zip$(INFOZIP_VERSION).tgz
+INFOZIP_SITE:=ftp://ftp.info-zip.org/pub/infozip/src/
+INFOZIP_DIR = $(BUILD_DIR)/zip$(INFOZIP_VERSION)
+
+$(DL_DIR)/$(INFOZIP_SOURCE):
+	$(call DOWNLOAD,$(INFOZIP_SITE)/$(INFOZIP_SOURCE))
+
+$(INFOZIP_DIR)/.source: $(DL_DIR)/$(INFOZIP_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(INFOZIP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(INFOZIP_DIR)/.build: $(INFOZIP_DIR)/.source
+	make -C $(INFOZIP_DIR) -f unix/Makefile generic CC=$(TARGET_CC)
+	touch $@
+
+$(INFOZIP_DIR)/.install: $(INFOZIP_DIR)/.build
+	make -C $(INFOZIP_DIR) -f unix/Makefile install prefix=$(TARGET_DIR)/usr CC=$(TARGET_CC)
+	touch $@
+
+infozip: $(INFOZIP_DIR)/.install
+
+infozip-source: $(DL_DIR)/$(INFOZIP_SOURCE)
+
+infozip-clean:
+	rm -rf $(INFOZIP_DIR)
+
+infozip-dirclean:
+	rm -rf $(INFOZIP_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_INFOZIP),y)
+TARGETS += infozip
+endif
-- 
1.7.10.4
