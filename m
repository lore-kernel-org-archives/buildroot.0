From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue,  7 Sep 2010 19:38:18 +0200
Subject: [Buildroot] [PATCH 2/2] updated xfsprogs to 3.1.3 which depends on
	libuuid (either provided by e2fsprogs or util-linux-ng)
In-Reply-To: <1283881098-3955-1-git-send-email-marcus.osdoba@googlemail.com>
References: <1283881098-3955-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <1283881098-3955-2-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcus Osdoba <ossy1980@gmx.net>

development notes:
- make sure not to use lib64 and
  show way how to integrate gettext with BR2 dependencies;
- shared libs patch is not neccessary for usage on target (tested positive with armv5te)
- the libuuid of e2fsprogs runs fine with xfsprogs, too;
  it is possible to run xfsprogs with libuuid from e2fsprogs xor util-linux-ng;

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/util-linux-ng/Config.in        |    3 +
 package/util-linux-ng/util-linux-ng.mk |    7 +-
 package/xfsprogs/Config.in             |    8 ++-
 package/xfsprogs/xfsprogs.mk           |  118 ++++++++------------------------
 4 files changed, 40 insertions(+), 96 deletions(-)

diff --git a/package/util-linux-ng/Config.in b/package/util-linux-ng/Config.in
index d516873..8a56151 100644
--- a/package/util-linux-ng/Config.in
+++ b/package/util-linux-ng/Config.in
@@ -13,6 +13,9 @@ comment "util-linux-ng requires a toolchain with PROGRAM_INVOCATION support"
 comment "util-linux-ng requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
 
+comment "UUID library support already activated outside util-linux-ng"
+	depends on ( BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID && BR2_PACKAGE_E2FSPROGS_LIBUUID )
+
 if BR2_PACKAGE_UTIL_LINUX_NG
 comment "utils selection"
 
diff --git a/package/util-linux-ng/util-linux-ng.mk b/package/util-linux-ng/util-linux-ng.mk
index 4ea2bbe..7cb1b89 100644
--- a/package/util-linux-ng/util-linux-ng.mk
+++ b/package/util-linux-ng/util-linux-ng.mk
@@ -7,7 +7,6 @@ UTIL_LINUX_NG_VERSION=2.17.2
 UTIL_LINUX_NG_MAJORVERSION=2.17
 UTIL_LINUX_NG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL_LINUX_NG_MAJORVERSION)
 UTIL_LINUX_NG_SOURCE=util-linux-ng-$(UTIL_LINUX_NG_VERSION).tar.bz2
-#UTIL_LINUX_NG_INSTALL_STAGING = YES
 UTIL_LINUX_NG_CONF_OPT=--disable-use-tty-group \
                        --enable-shared \
                        --without-libiconv-prefix \
@@ -16,10 +15,12 @@ UTIL_LINUX_NG_CONF_OPT=--disable-use-tty-group \
                        --disable-nls \
                        --disable-schedutils \
                        --disable-doc
-
-UTIL_LINUX_NG_DEPENDENCIES=e2fsprogs
 UTIL_LINUX_NG_LIBTOOL_PATCH = NO
 
+ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
+  UTIL_LINUX_NG_DEPENDENCIES=e2fsprogs
+endif
+
 # make util-linux-ng win over links to busybox binary
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
   UTIL_LINUX_NG_DEPENDENCIES+=busybox
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 12bc69e..7233cf9 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -3,13 +3,15 @@ comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCL
 	depends on BR2_PACKAGE_XFSPROGS
 
 comment "xfsprogs requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
+
+comment "xfsprogs requires at least on UUID library (from e2fsprogs or from util-linux-ng)"
+	depends on !( BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID || BR2_PACKAGE_E2FSPROGS_LIBUUID )
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	depends on ( BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID || BR2_PACKAGE_E2FSPROGS_LIBUUID )
 	help
 	  The XFS file system utilities and libraries
 
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 866e9b2..f2a80dc 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -3,96 +3,34 @@
 # xfsprogs
 #
 #############################################################
-XFSPROGS_VERSION:=3.0.3
-XFSPROGS_SOURCE=xfsprogs-$(XFSPROGS_VERSION).tar.gz
-XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
-XFSPROGS_DIR=$(BUILD_DIR)/xfsprogs-$(XFSPROGS_VERSION)
-XFSPROGS_CAT:=$(ZCAT)
-XFSPROGS_BINARY:=mkfs/mkfs.xfs
-XFSPROGS_TARGET_BINARY:=sbin/mkfs.xfs
-
-XFSPROGS_STRIP:= fsck/fsck.xfs mkfile/xfs_mkfile rtcp/xfs_rtcp
-XFSPROGS_STRIP_LIBDEP:= \
-	copy/xfs_copy db/xfs_db growfs/xfs_growfs io/xfs_io \
-	logprint/xfs_logprint mkfs/fstyp mkfs/mkfs.xfs \
-	repair/xfs_repair quota/xfs_quota
-
-$(DL_DIR)/$(XFSPROGS_SOURCE):
-	 $(call DOWNLOAD,$(XFSPROGS_SITE),$(XFSPROGS_SOURCE))
-
-xfsprogs-source: $(DL_DIR)/$(XFSPROGS_SOURCE)
-
-$(XFSPROGS_DIR)/.unpacked: $(DL_DIR)/$(XFSPROGS_SOURCE)
-	$(XFSPROGS_CAT) $(DL_DIR)/$(XFSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(XFSPROGS_DIR) package/xfsprogs/ xfsprogs\*.patch
-	touch $(XFSPROGS_DIR)/.unpacked
-
-#XFSPROGS_CONFIG_SHARED:=--disable-shared
-XFSPROGS_CONFIG_SHARED:=--enable-shared
-
-$(XFSPROGS_DIR)/.configured: $(XFSPROGS_DIR)/.unpacked
-	(cd $(XFSPROGS_DIR); rm -rf config.cache; \
-		ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CPPFLAGS="-I$(E2FSPROGS_DIR)/lib" \
-		LDFLAGS="-L$(E2FSPROGS_DIR)/lib" \
-		INSTALL_USER=$(shell whoami) \
-		INSTALL_GROUP=$(shell groups | cut -d" " -f1) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--exec-prefix=/ \
-		--enable-gettext=no \
-		$(XFSPROGS_CONFIG_SHARED) \
-	)
-	touch $(XFSPROGS_DIR)/.configured
-
-$(XFSPROGS_DIR)/$(XFSPROGS_BINARY): $(XFSPROGS_DIR)/.configured
-	$(MAKE1) PATH=$(TARGET_PATH) CPPFLAGS="-I$(E2FSPROGS_DIR)/lib" \
-		LDFLAGS="-L$(E2FSPROGS_DIR)/lib" -C $(XFSPROGS_DIR)
-ifeq ($(XFSPROGS_CONFIG_SHARED),--enable-shared)
-	( \
-		cd $(XFSPROGS_DIR); \
-		$(STRIPCMD) $(XFSPROGS_STRIP); \
-		$(STRIPCMD) $(join $(dir $(XFSPROGS_STRIP_LIBDEP)), \
-				$(addprefix .libs/,$(notdir $(XFSPROGS_STRIP_LIBDEP)))) \
-	)
-	$(STRIPCMD) $(XFSPROGS_DIR)/lib*/.libs/lib*.so.*.*
-else
-	( \
-		cd $(XFSPROGS_DIR); \
-		$(STRIPCMD) $(XFSPROGS_STRIP) $(XFSPROGS_STRIP_LIBDEP) \
-	)
-	$(STRIPCMD) $(XFSPROGS_DIR)/lib*/lib*.so.*.*
+XFSPROGS_VERSION = 3.1.3
+XFSPROGS_SOURCE  = xfsprogs-$(XFSPROGS_VERSION).tar.gz
+XFSPROGS_SITE    = ftp://oss.sgi.com/projects/xfs/cmd_tars
+XFSPROGS_LIBTOOL_PATCH = NO
+XFSPROGS_CONF_OPT     = --enable-shared \
+                        --enable-gettext=no \
+                        --enable-lib64=no \
+                        INSTALL_USER=default \
+                        INSTALL_GROUP=default \
+                        ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
+XFSPROGS_INSTALL_STAGING = NO
+XFSPROGS_INSTALL_TARGET = YES
+XFSPROGS_INSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) install
+
+# disable gettext by default, otherwise:  "undefined reference to `libintl_gettext'"
+#ifeq ($(BR2_PACKAGE_GETTEXT),y)
+#  XFSPROGS_DEPENDENCIES += gettext
+#  XFSPROGS_CONF_OPT     += --enable-gettext=yes
+#else
+#  XFSPROGS_CONF_OPT     += --enable-gettext=no
+#endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID),y)
+  XFSPROGS_DEPENDENCIES = util-linux-ng
+endif
+ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
+  XFSPROGS_DEPENDENCIES = e2fsprogs
 endif
-	touch -c $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
-
-$(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
-	$(MAKE1) PATH=$(TARGET_PATH) \
-	    DIST_ROOT=$(TARGET_DIR) \
-	    exec-prefix=/ \
-	    -C $(XFSPROGS_DIR) install
-	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	touch -c $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
-
-xfsprogs: e2fsprogs $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
-
-xfsprogs-clean:
-	rm -f $(TARGET_DIR)/bin/xfs_* $(TARGET_DIR)/sbin/xfs_* $(TARGET_DIR)/sbin/*.xfs
-	rm -f $(TARGET_DIR)/usr/lib/libhandle.so*
-	rm -f $(TARGET_DIR)/usr/lib/libdisk.so* $(TARGET_DIR)/usr/lib/libxfs.so*
-	-$(MAKE1) -C $(XFSPROGS_DIR) clean
 
-xfsprogs-dirclean:
-	rm -rf $(XFSPROGS_DIR)
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_XFSPROGS),y)
-TARGETS+=xfsprogs
-endif
+$(eval $(call AUTOTARGETS,package,xfsprogs))
-- 
1.7.1
