From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:12 +0800
Subject: [Buildroot] [PATCH 10/19] gzip : convert to autotools
	infrastructure & bump to 1.4
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-11-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/gzip/gzip-1.3.12-rename-futimens.patch |   48 --------------------
 package/gzip/gzip.mk                           |   56 ++----------------------
 2 files changed, 4 insertions(+), 100 deletions(-)
 delete mode 100644 package/gzip/gzip-1.3.12-rename-futimens.patch

diff --git a/package/gzip/gzip-1.3.12-rename-futimens.patch b/package/gzip/gzip-1.3.12-rename-futimens.patch
deleted file mode 100644
index 8315d7c..0000000
--- a/package/gzip/gzip-1.3.12-rename-futimens.patch
+++ /dev/null
@@ -1,48 +0,0 @@
----
- gzip.c        |    2 +-
- lib/utimens.c |    4 ++--
- lib/utimens.h |    2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-Index: gzip-1.3.12/gzip.c
-===================================================================
---- gzip-1.3.12.orig/gzip.c
-+++ gzip-1.3.12/gzip.c
-@@ -1637,7 +1637,7 @@
- 	}
-       }
- 
--    if (futimens (ofd, ofname, timespec) != 0)
-+    if (gz_futimens (ofd, ofname, timespec) != 0)
-       {
- 	int e = errno;
- 	WARN ((stderr, "%s: ", program_name));
-Index: gzip-1.3.12/lib/utimens.c
-===================================================================
---- gzip-1.3.12.orig/lib/utimens.c
-+++ gzip-1.3.12/lib/utimens.c
-@@ -75,7 +75,7 @@
-    Return 0 on success, -1 (setting errno) on failure.  */
- 
- int
--futimens (int fd ATTRIBUTE_UNUSED,
-+gz_futimens (int fd ATTRIBUTE_UNUSED,
- 	  char const *file, struct timespec const timespec[2])
- {
-   /* Some Linux-based NFS clients are buggy, and mishandle time stamps
-@@ -185,5 +185,5 @@
- int
- utimens (char const *file, struct timespec const timespec[2])
- {
--  return futimens (-1, file, timespec);
-+  return gz_futimens (-1, file, timespec);
- }
-Index: gzip-1.3.12/lib/utimens.h
-===================================================================
---- gzip-1.3.12.orig/lib/utimens.h
-+++ gzip-1.3.12/lib/utimens.h
-@@ -1,3 +1,3 @@
- #include <time.h>
--int futimens (int, char const *, struct timespec const [2]);
-+int gz_futimens (int, char const *, struct timespec const [2]);
- int utimens (char const *, struct timespec const [2]);
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 3feb49a..8bc4c33 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -3,59 +3,11 @@
 # gzip
 #
 #############################################################
-GZIP_VERSION:=1.3.12
+GZIP_VERSION:=1.4
 GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
 GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
-GZIP_DIR:=$(BUILD_DIR)/gzip-$(GZIP_VERSION)
-GZIP_CAT:=$(ZCAT)
-GZIP_BINARY:=$(GZIP_DIR)/gzip
-GZIP_TARGET_BINARY:=$(TARGET_DIR)/bin/zmore
 
-$(DL_DIR)/$(GZIP_SOURCE):
-	 $(call DOWNLOAD,$(GZIP_SITE),$(GZIP_SOURCE))
+GZIP_INSTALL_STAGING = NO
+GZIP_INSTALL_TARGET = YES
 
-gzip-source: $(DL_DIR)/$(GZIP_SOURCE)
-
-$(GZIP_DIR)/.unpacked: $(DL_DIR)/$(GZIP_SOURCE)
-	$(GZIP_CAT) $(DL_DIR)/$(GZIP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GZIP_DIR) package/gzip gzip\*.patch
-	touch $(GZIP_DIR)/.unpacked
-
-$(GZIP_DIR)/.configured: $(GZIP_DIR)/.unpacked
-	(cd $(GZIP_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/ \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $(GZIP_DIR)/.configured
-
-$(GZIP_BINARY): $(GZIP_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GZIP_DIR)
-
-$(GZIP_TARGET_BINARY): $(GZIP_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GZIP_DIR) install-strip
-
-gzip: $(GZIP_TARGET_BINARY)
-
-gzip-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GZIP_DIR) uninstall
-	-$(MAKE) -C $(GZIP_DIR) clean
-
-gzip-dirclean:
-	rm -rf $(GZIP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GZIP),y)
-TARGETS+=gzip
-endif
+$(eval $(call AUTOTARGETS,package,gzip))
-- 
1.7.0.4
