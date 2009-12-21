From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:19:52 +0000
Subject: [Buildroot] [PATCH 1/1] Update xfsprogs
In-Reply-To: <cover.1261379989.git.nkukard@lbsd.net>
References: <cover.1261379989.git.nkukard@lbsd.net>
Message-ID: <dee3a736226f0c4a4df412fc48fbe0eabca4df9e.1261379989.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 package/xfsprogs/Config.in      |   10 +++---
 package/xfsprogs/xfsprogs.mk    |    9 ++---
 package/xfsprogs/xfsprogs.patch |   59 ---------------------------------------
 3 files changed, 9 insertions(+), 69 deletions(-)
 delete mode 100644 package/xfsprogs/xfsprogs.patch

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 2f462cb..77e4d61 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,6 +1,9 @@
 
-comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED enabled"
-	depends on BR2_PACKAGE_XFSPROGS
+comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
+ 	depends on BR2_PACKAGE_XFSPROGS
+
+comment "xfsprogs requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
@@ -11,6 +14,3 @@ config BR2_PACKAGE_XFSPROGS
 
 	  http://oss.sgi.com/projects/xfs/
 
-comment "xfssprogs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
-
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 89db6c1..e87485e 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -3,10 +3,9 @@
 # xfsprogs
 #
 #############################################################
-XFSPROGS_VERSION:=2.10.2
-XFSPROGS_SOURCE=xfsprogs_$(XFSPROGS_VERSION)-1.tar.gz
+XFSPROGS_VERSION:=3.0.3
+XFSPROGS_SOURCE=xfsprogs-$(XFSPROGS_VERSION).tar.gz
 XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
-#XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/
 XFSPROGS_DIR=$(BUILD_DIR)/xfsprogs-$(XFSPROGS_VERSION)
 XFSPROGS_CAT:=$(ZCAT)
 XFSPROGS_BINARY:=mkfs/mkfs.xfs
@@ -38,7 +37,6 @@ $(XFSPROGS_DIR)/.configured: $(XFSPROGS_DIR)/.unpacked
 		$(TARGET_CONFIGURE_ARGS) \
 		CPPFLAGS="-I$(E2FSPROGS_DIR)/lib" \
 		LDFLAGS="-L$(E2FSPROGS_DIR)/lib" \
-		LIBTOOL=$(LIBTOOL_DIR)/libtool \
 		INSTALL_USER=$(shell whoami) \
 		INSTALL_GROUP=$(shell groups | cut -d" " -f1) \
 		./configure $(QUIET) \
@@ -46,6 +44,7 @@ $(XFSPROGS_DIR)/.configured: $(XFSPROGS_DIR)/.unpacked
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--exec-prefix=/ \
+		--enable-gettext=no \
 		$(XFSPROGS_CONFIG_SHARED) \
 	)
 	touch $(XFSPROGS_DIR)/.configured
@@ -78,7 +77,7 @@ $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	touch -c $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
-xfsprogs: e2fsprogs libtool-cross $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
+xfsprogs: e2fsprogs libtool $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
 xfsprogs-clean:
 	rm -f $(TARGET_DIR)/bin/xfs_* $(TARGET_DIR)/sbin/xfs_* $(TARGET_DIR)/sbin/*.xfs
diff --git a/package/xfsprogs/xfsprogs.patch b/package/xfsprogs/xfsprogs.patch
deleted file mode 100644
index 091e65d..0000000
--- a/package/xfsprogs/xfsprogs.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-diff -urN xfsprogs-2.6.36.orig/libdisk/Makefile xfsprogs-2.6.36/libdisk/Makefile
---- xfsprogs-2.6.36.orig/libdisk/Makefile	2005-08-01 07:20:49.000000000 -0700
-+++ xfsprogs-2.6.36/libdisk/Makefile	2005-09-26 17:30:14.000000000 -0700
-@@ -53,6 +53,7 @@
- include $(BUILDRULES)
- 
- install: default
-+	$(INSTALL_LTLIB)
- 
- install-dev: default
--	$(INSTALL_LTLIB_STATIC)
-+	$(INSTALL_LTLIB_DEV)
-diff -urN xfsprogs-2.6.36.orig/libxcmd/Makefile xfsprogs-2.6.36/libxcmd/Makefile
---- xfsprogs-2.6.36.orig/libxcmd/Makefile	2005-08-01 07:20:49.000000000 -0700
-+++ xfsprogs-2.6.36/libxcmd/Makefile	2005-09-26 17:30:15.000000000 -0700
-@@ -45,6 +45,7 @@
- include $(BUILDRULES)
- 
- install: default
-+	$(INSTALL_LTLIB)
- 
- install-dev: default
--	$(INSTALL_LTLIB_STATIC)
-+	$(INSTALL_LTLIB_DEV)
-diff -urN xfsprogs-2.6.36.orig/libxfs/Makefile xfsprogs-2.6.36/libxfs/Makefile
---- xfsprogs-2.6.36.orig/libxfs/Makefile	2005-08-01 07:20:50.000000000 -0700
-+++ xfsprogs-2.6.36/libxfs/Makefile	2005-09-26 17:30:16.000000000 -0700
-@@ -70,6 +70,7 @@
- include $(BUILDRULES)
- 
- install: default
-+	$(INSTALL_LTLIB)
- 
- install-dev: default
--	$(INSTALL_LTLIB_STATIC)
-+	$(INSTALL_LTLIB_DEV)
-diff -urN xfsprogs-2.6.36.orig/libxlog/Makefile xfsprogs-2.6.36/libxlog/Makefile
---- xfsprogs-2.6.36.orig/libxlog/Makefile	2005-08-01 07:20:51.000000000 -0700
-+++ xfsprogs-2.6.36/libxlog/Makefile	2005-09-26 17:30:17.000000000 -0700
-@@ -48,6 +48,7 @@
- include $(BUILDRULES)
- 
- install: default
-+	$(INSTALL_LTLIB)
- 
- install-dev: default
--	$(INSTALL_LTLIB_STATIC)
-+	$(INSTALL_LTLIB_DEV)
---- xfsprogs-2.6.36.orig/mkfs/Makefile	2005-08-01 07:20:54.000000000 -0700
-+++ xfsprogs-2.6.36/mkfs/Makefile	2005-09-23 15:17:42.000000000 -0700
-@@ -51,7 +51,7 @@
- include $(BUILDRULES)
- 
- $(FSTYP):
--	$(LTLINK) $@.c -o $@ $(CFLAGS) $(LDFLAGS) $(LIBDISK) $(PLDLIBS)
-+	$(LTLINK) $@.c -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LIBDISK) $(PLDLIBS)
- 
- install: default
- 	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
-- 
1.6.4
