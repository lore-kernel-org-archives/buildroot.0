From: Martin Banky <martin.banky@gmail.com>
Date: Fri,  8 Oct 2010 01:43:01 -0700
Subject: [Buildroot] [PATCH 2/9] pptp-linux: convert to gentargets and bump
	to 1.7.2
In-Reply-To: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286527389-29983-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../pptp-linux-1.7.0-001-susv3-legacy.patch        |   24 ------
 ...tp-linux-1.7.2-000-remove-stropts-include.patch |   15 ++++
 .../pptp-linux-1.7.2-001-susv3-legacy.patch        |   24 ++++++
 package/pptp-linux/pptp-linux.mk                   |   86 +++++--------------
 4 files changed, 62 insertions(+), 87 deletions(-)
 delete mode 100644 package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
 create mode 100644 package/pptp-linux/pptp-linux-1.7.2-000-remove-stropts-include.patch
 create mode 100644 package/pptp-linux/pptp-linux-1.7.2-001-susv3-legacy.patch

diff --git a/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch b/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
deleted file mode 100644
index f41b63f..0000000
--- a/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup pptp-linux-1.7.0/pptp_callmgr.c pptp-linux-1.7.0.orig/pptp_callmgr.c
---- pptp-linux-1.7.0/pptp_callmgr.c	2005-07-28 03:15:11.000000000 +0200
-+++ pptp-linux-1.7.0.orig/pptp_callmgr.c	2007-08-24 09:20:39.000000000 +0200
-@@ -314,7 +314,7 @@ int open_inetsock(struct in_addr inetadd
-         return s;
-     }
-     if (localbind.s_addr != INADDR_NONE) {
--        bzero(&src, sizeof(src));
-+        memset(&src, 0, sizeof(src));
-         src.sin_family = AF_INET;
-         src.sin_addr   = localbind;
-         if (bind(s, (struct sockaddr *) &src, sizeof(src)) != 0) {
-diff -rdup pptp-linux-1.7.0/pptp_gre.c pptp-linux-1.7.0.orig/pptp_gre.c
---- pptp-linux-1.7.0/pptp_gre.c	2005-07-28 03:15:11.000000000 +0200
-+++ pptp-linux-1.7.0.orig/pptp_gre.c	2007-08-24 09:20:56.000000000 +0200
-@@ -81,7 +81,7 @@ int pptp_gre_bind(struct in_addr inetadd
-     int s = socket(AF_INET, SOCK_RAW, PPTP_PROTO);
-     if (s < 0) { warn("socket: %s", strerror(errno)); return -1; }
-     if (localbind.s_addr != INADDR_NONE) {
--        bzero(&loc_addr, sizeof(loc_addr));
-+        memset(&loc_addr, 0, sizeof(loc_addr));
-         loc_addr.sin_family = AF_INET;
-         loc_addr.sin_addr   = localbind;
-         if (bind(s, (struct sockaddr *) &loc_addr, sizeof(loc_addr)) != 0) {
diff --git a/package/pptp-linux/pptp-linux-1.7.2-000-remove-stropts-include.patch b/package/pptp-linux/pptp-linux-1.7.2-000-remove-stropts-include.patch
new file mode 100644
index 0000000..ec38fbe
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-1.7.2-000-remove-stropts-include.patch
@@ -0,0 +1,15 @@
+Removed erronous inclusion of stropts.h. 
+
+uClibc does not provide support for streaming, and the inclusion of stropts.h
+is not needed anyway.
+
+--- a/pptp_compat.c	2008-05-13 23:33:55.000000000 -0700
++++ b/pptp_compat.c	2010-10-06 12:11:39.000000000 -0700
+@@ -7,7 +7,6 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-#include <stropts.h>
+ #include <stdlib.h>
+ #include <strings.h>
+ #include "pptp_compat.h"
diff --git a/package/pptp-linux/pptp-linux-1.7.2-001-susv3-legacy.patch b/package/pptp-linux/pptp-linux-1.7.2-001-susv3-legacy.patch
new file mode 100644
index 0000000..f41b63f
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-1.7.2-001-susv3-legacy.patch
@@ -0,0 +1,24 @@
+diff -rdup pptp-linux-1.7.0/pptp_callmgr.c pptp-linux-1.7.0.orig/pptp_callmgr.c
+--- pptp-linux-1.7.0/pptp_callmgr.c	2005-07-28 03:15:11.000000000 +0200
++++ pptp-linux-1.7.0.orig/pptp_callmgr.c	2007-08-24 09:20:39.000000000 +0200
+@@ -314,7 +314,7 @@ int open_inetsock(struct in_addr inetadd
+         return s;
+     }
+     if (localbind.s_addr != INADDR_NONE) {
+-        bzero(&src, sizeof(src));
++        memset(&src, 0, sizeof(src));
+         src.sin_family = AF_INET;
+         src.sin_addr   = localbind;
+         if (bind(s, (struct sockaddr *) &src, sizeof(src)) != 0) {
+diff -rdup pptp-linux-1.7.0/pptp_gre.c pptp-linux-1.7.0.orig/pptp_gre.c
+--- pptp-linux-1.7.0/pptp_gre.c	2005-07-28 03:15:11.000000000 +0200
++++ pptp-linux-1.7.0.orig/pptp_gre.c	2007-08-24 09:20:56.000000000 +0200
+@@ -81,7 +81,7 @@ int pptp_gre_bind(struct in_addr inetadd
+     int s = socket(AF_INET, SOCK_RAW, PPTP_PROTO);
+     if (s < 0) { warn("socket: %s", strerror(errno)); return -1; }
+     if (localbind.s_addr != INADDR_NONE) {
+-        bzero(&loc_addr, sizeof(loc_addr));
++        memset(&loc_addr, 0, sizeof(loc_addr));
+         loc_addr.sin_family = AF_INET;
+         loc_addr.sin_addr   = localbind;
+         if (bind(s, (struct sockaddr *) &loc_addr, sizeof(loc_addr)) != 0) {
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 8de0832..fd7d118 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -3,76 +3,36 @@
 # pptp-linux
 #
 #############################################################
-PPTP_LINUX_VERSION:=1.7.0
-PPTP_LINUX_SOURCE:=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
-#PPTP_LINUX_PATCH:=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
-PPTP_LINUX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/pptp-linux
-PPTP_LINUX_DIR:=$(BUILD_DIR)/pptp-linux-$(PPTP_LINUX_VERSION).orig
-PPTP_LINUX_CAT:=$(ZCAT)
-PPTP_LINUX_BINARY:=pptp
-PPTP_LINUX_TARGET_BINARY:=usr/sbin/pptp
+PPTP_LINUX_VERSION = 1.7.2
+PPTP_LINUX_SOURCE = pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
+#PPTP_LINUX_PATCH = pptp-linux_$(PPTP_LINUX_VERSION)-6.diff.gz
+PPTP_LINUX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/p/pptp-linux
 
-$(DL_DIR)/$(PPTP_LINUX_SOURCE):
-	$(call DOWNLOAD,$(PPTP_LINUX_SITE),$(PPTP_LINUX_SOURCE))
-
-ifneq ($(PPTP_LINUX_PATCH),)
-PPTP_LINUX_PATCH_FILE:=$(DL_DIR)/$(PPTP_LINUX_PATCH)
-$(PPTP_LINUX_PATCH_FILE):
-	$(call DOWNLOAD,$(PPTP_LINUX_SITE),$(PPTP_LINUX_PATCH))
-endif
-
-$(PPTP_LINUX_DIR)/.unpacked: $(DL_DIR)/$(PPTP_LINUX_SOURCE) $(PPTP_LINUX_PATCH_FILE)
-	$(PPTP_LINUX_CAT) $(DL_DIR)/$(PPTP_LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(PPTP_LINUX_PATCH),)
-	(cd $(PPTP_LINUX_DIR) && $(PPTP_LINUX_CAT) $(DL_DIR)/$(PPTP_LINUX_PATCH) | patch -p1)
-	if [ -d $(PPTP_LINUX_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(PPTP_LINUX_DIR) $(PPTP_LINUX_DIR)/debian/patches \*.patch; \
+define PPTP_LINUX_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.diff; \
 	fi
+endef
 endif
-	toolchain/patch-kernel.sh $(PPTP_LINUX_DIR) package/pptp-linux/ pptp-linux\*.patch
-	touch $@
-
-$(PPTP_LINUX_DIR)/.configured: $(PPTP_LINUX_DIR)/.unpacked
-	(cd $(PPTP_LINUX_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
 
-$(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY): $(PPTP_LINUX_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIMIZE="$(TARGET_CFLAGS)" \
-		-C $(PPTP_LINUX_DIR)
+PPTP_LINUX_POST_PATCH_HOOKS = PPTP_LINUX_DEBIAN_PATCHES
 
-$(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY): $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY)
-	cp -dpf $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY) $@
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	mkdir -p $(TARGET_DIR)/usr/share/man/man8
-	$(INSTALL) -m 644 $(PPTP_LINUX_DIR)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
-endif
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+define PPTP_LINUX_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIMIZE="$(TARGET_CFLAGS)" -C $(@D)
+endef
 
-pptp-linux: $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY)
+define PPTP_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/pptp $(TARGET_DIR)/usr/sbin/pptp
+	$(INSTALL) -D -m 644 $(@D)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
+endef
 
-pptp-linux-source: $(DL_DIR)/$(PPTP_LINUX_SOURCE) $(PPTP_LINUX_PATCH_FILE)
+define PPTP_LINUX_UNINSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
 
-pptp-linux-clean:
-	-$(MAKE) -C $(PPTP_LINUX_DIR) distclean
-	rm -f $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY) \
-		$(TARGET_DIR)/usr/share/man/man8/pptp.8*
+define PPTP_LINUX_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-pptp-linux-dirclean:
-	rm -rf $(PPTP_LINUX_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PPTP_LINUX),y)
-TARGETS+=pptp-linux
-endif
+$(eval $(call GENTARGETS,package,pptp-linux))
-- 
1.7.3.1
