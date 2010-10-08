From: Martin Banky <martin.banky@gmail.com>
Date: Fri,  8 Oct 2010 01:43:02 -0700
Subject: [Buildroot] [PATCH 3/9] proftpd: convert to autotargets and bump to
	1.3.3b
In-Reply-To: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286527389-29983-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, added web site to Config.in

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/proftpd/Config.in                          |    1 +
 ....3.1-fix-kernel-header-capability-version.patch |   12 ---
 ...3.3b-fix-kernel-header-capability-version.patch |   12 +++
 package/proftpd/proftpd.mk                         |   83 +++++---------------
 4 files changed, 34 insertions(+), 74 deletions(-)
 delete mode 100644 package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch
 create mode 100644 package/proftpd/proftpd-1.3.3b-fix-kernel-header-capability-version.patch

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index d495643..abdedc9 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -3,3 +3,4 @@ config BR2_PACKAGE_PROFTPD
 	help
 	  ProFTPD, a highly configurable FTP server.
 
+	  http://www.proftpd.org/
diff --git a/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch b/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch
deleted file mode 100644
index 2899c7f..0000000
--- a/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/lib/libcap/libcap.h	2008-04-24 19:46:29.475883739 +0200
-+++ b/lib/libcap/libcap.h	2008-04-24 19:48:31.116088563 +0200
-@@ -52,7 +52,8 @@
-  */
- 
- #if !defined(_LINUX_CAPABILITY_VERSION) || \
--            (_LINUX_CAPABILITY_VERSION != 0x19980330)
-+           ((_LINUX_CAPABILITY_VERSION != 0x19980330) && \
-+            (_LINUX_CAPABILITY_VERSION != 0x20071026))
- 
- # error "Kernel <linux/capability.h> does not match library"
- # error "file "libcap.h" --> fix and recompile libcap"
diff --git a/package/proftpd/proftpd-1.3.3b-fix-kernel-header-capability-version.patch b/package/proftpd/proftpd-1.3.3b-fix-kernel-header-capability-version.patch
new file mode 100644
index 0000000..4401c9a
--- /dev/null
+++ b/package/proftpd/proftpd-1.3.3b-fix-kernel-header-capability-version.patch
@@ -0,0 +1,12 @@
+--- a/lib/libcap/libcap.h	2008-08-22 19:49:48.000000000 -0700
++++ b/lib/libcap/libcap.h	2010-10-06 15:31:11.000000000 -0700
+@@ -65,7 +65,8 @@ struct _cap_struct {
+  */
+ 
+ #if !defined(_LINUX_CAPABILITY_VERSION_1) || \
+-            (_LINUX_CAPABILITY_VERSION_1 != 0x19980330)
++            ((_LINUX_CAPABILITY_VERSION_1 != 0x19980330) && \
++            (_LINUX_CAPABILITY_VERSION_1 != 0x20071026))
+ 
+ # error "Kernel <linux/capability.h> does not match library"
+ # error "file "libcap.h" --> fix and recompile libcap"
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 11ef1ef..191f611 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -3,83 +3,42 @@
 # proftpd
 #
 #############################################################
-PROFTPD_VERSION:=1.3.1
-PROFTPD_SOURCE:=proftpd-$(PROFTPD_VERSION).tar.bz2
-PROFTPD_SITE:=ftp://ftp.proftpd.org/distrib/source/
-PROFTPD_DIR:=$(BUILD_DIR)/proftpd-$(PROFTPD_VERSION)
-PROFTPD_CAT:=$(BZCAT)
-PROFTPD_BINARY:=proftpd
-PROFTPD_TARGET_BINARY:=usr/sbin/proftpd
+PROFTPD_VERSION = 1.3.3b
+PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
+PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
 
-ifeq ($(BR2_INET_IPV6),y)
-ENABLE_IPV6:=--enable-ipv6
-endif
+PROFTPD_CONF_ENV = ac_cv_func_setpgrp_void=yes \
+		ac_cv_func_setgrent_void=yes
 
-$(DL_DIR)/$(PROFTPD_SOURCE):
-	 $(call DOWNLOAD,$(PROFTPD_SITE),$(PROFTPD_SOURCE))
-
-proftpd-source: $(DL_DIR)/$(PROFTPD_SOURCE)
-
-$(PROFTPD_DIR)/.unpacked: $(DL_DIR)/$(PROFTPD_SOURCE)
-	$(PROFTPD_CAT) $(DL_DIR)/$(PROFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(PROFTPD_DIR)
-	toolchain/patch-kernel.sh $(PROFTPD_DIR) package/proftpd/ proftpd-$(PROFTPD_VERSION)\*.patch;
-	touch $@
-
-$(PROFTPD_DIR)/.configured: $(PROFTPD_DIR)/.unpacked
-	(cd $(PROFTPD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_setpgrp_void=yes \
-		ac_cv_func_setgrent_void=yes \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var/run \
+PROFTPD_CONF_OPT = --localstatedir=/var/run \
 		--disable-static \
 		--disable-curses \
 		--disable-ncurses \
 		--disable-facl \
 		--disable-dso \
 		--enable-shadow \
-		$(DISABLE_LARGEFILE) \
-		$(ENABLE_IPV6) \
-		--with-gnu-ld \
-	)
-	touch $@
+		--with-gnu-ld
 
-$(PROFTPD_DIR)/$(PROFTPD_BINARY): $(PROFTPD_DIR)/.configured
-	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" \
-		-C $(PROFTPD_DIR)/lib/libcap _makenames
-	$(MAKE1) -C $(PROFTPD_DIR)
+define PROFTPD_MAKENAMES
+	$(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C $(@D)/lib/libcap _makenames
+endef
 
-$(TARGET_DIR)/$(PROFTPD_TARGET_BINARY): $(PROFTPD_DIR)/$(PROFTPD_BINARY)
-	cp -dpf $(PROFTPD_DIR)/$(PROFTPD_BINARY) \
-		$(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
+PROFTPD_POST_CONFIGURE_HOOKS = PROFTPD_MAKENAMES
+
+PROFTPD_MAKE=$(MAKE1)
+
+define PROFTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	@if [ ! -f $(TARGET_DIR)/etc/proftpd.conf ]; then \
-		$(INSTALL) -m 0644 -D $(PROFTPD_DIR)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
+		$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
 	fi
 	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
+endef
 
-proftpd: $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
-
-proftpd-clean:
+define PROFTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/etc/init.d/S50proftpd
 	rm -f $(TARGET_DIR)/etc/proftpd.conf
-	-$(MAKE) -C $(PROFTPD_DIR) clean
+endef
 
-proftpd-dirclean:
-	rm -rf $(PROFTPD_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PROFTPD),y)
-TARGETS+=proftpd
-endif
+$(eval $(call AUTOTARGETS,package,proftpd))
-- 
1.7.3.1
