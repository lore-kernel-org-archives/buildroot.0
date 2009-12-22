From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Dec 2009 08:51:43 +0100
Subject: [Buildroot] [git commit master] xfsprogs: bump version
Message-ID: <20091222075238.6CFB1777D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=858d4dbf7fad0fccee4bdc2746a5c2c6adc8fbfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    2 +-
 package/xfsprogs/Config.in      |    9 +++--
 package/xfsprogs/xfsprogs.mk    |    9 ++---
 package/xfsprogs/xfsprogs.patch |   59 ---------------------------------------
 4 files changed, 10 insertions(+), 69 deletions(-)
 delete mode 100644 package/xfsprogs/xfsprogs.patch

diff --git a/CHANGES b/CHANGES
index 3e9979a..20089ed 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, e2fsprogs, gst-plugins-bad, hal, iw, libfuse, libpcap,
 	lighttpd, mesa, mpg123, mtd-utils, neon, pcre, qt, sshfs,
-	tremor, u-boot, usbutils
+	tremor, u-boot, usbutils, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 2f462cb..12bc69e 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,16 +1,17 @@
 
-comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED enabled"
+comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
 	depends on BR2_PACKAGE_XFSPROGS
 
+comment "xfsprogs requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 	help
 	  The XFS file system utilities and libraries
 
 	  http://oss.sgi.com/projects/xfs/
 
-comment "xfssprogs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
-
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 89db6c1..866e9b2 100644
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
+xfsprogs: e2fsprogs $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
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
1.6.3.3
