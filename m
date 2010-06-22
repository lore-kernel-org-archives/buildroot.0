From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:21:02 +0200
Subject: [Buildroot] [PATCH 08/20] diffutils : convert to autotools
	infrastructure
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <85124403020d70e3000fc50763ef283c7356de53.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: cmchao <cmchao@gmail.com>

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/diffutils/diffutils.mk |   63 ++-------------------------------------
 1 files changed, 4 insertions(+), 59 deletions(-)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index fd5e5a3..c0b3830 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -6,26 +6,10 @@
 DIFFUTILS_VERSION=2.8.1
 DIFFUTILS_SOURCE:=diffutils-$(DIFFUTILS_VERSION).tar.gz
 DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/diffutils
-DIFFUTILS_CAT:=$(ZCAT)
-DIFFUTILS_DIR:=$(BUILD_DIR)/diffutils-$(DIFFUTILS_VERSION)
-DIFFUTILS_BINARY:=src/diff
-DIFFUTILS_TARGET_BINARY:=usr/bin/diff
 
-$(DL_DIR)/$(DIFFUTILS_SOURCE):
-	 $(call DOWNLOAD,$(DIFFUTILS_SITE),$(DIFFUTILS_SOURCE))
+DIFFUTILS_INSTALL_STAGING = YES
 
-diffutils-source: $(DL_DIR)/$(DIFFUTILS_SOURCE)
-
-$(DIFFUTILS_DIR)/.unpacked: $(DL_DIR)/$(DIFFUTILS_SOURCE)
-	$(DIFFUTILS_CAT) $(DL_DIR)/$(DIFFUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(DIFFUTILS_DIR)/config
-	touch $@
-
-$(DIFFUTILS_DIR)/.configured: $(DIFFUTILS_DIR)/.unpacked
-	(cd $(DIFFUTILS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_strtod=yes \
+DIFFUTILS_CONF_ENV = ac_cv_func_strtod=yes
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
 		ac_cv_func_closedir_void=no \
@@ -71,45 +55,6 @@ $(DIFFUTILS_DIR)/.configured: $(DIFFUTILS_DIR)/.unpacked
 		gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(DIFFUTILS_DIR)/$(DIFFUTILS_BINARY): $(DIFFUTILS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR)
-
-$(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY): $(DIFFUTILS_DIR)/$(DIFFUTILS_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) \
-		$(if $(BR2_STRIP_none),install,install-strip)
-ifneq ($(BR2_ENABLE_LOCALE),y)
-	rm -rf $(TARGET_DIR)/usr/share/locale
-endif
-
-diffutils: $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY)
-
-diff-utils-unpacked: $(DIFFUTILS_DIR)/.unpacked
+		ac_use_included_regex=no
 
-diffutils-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) uninstall
-	-$(MAKE) -C $(DIFFUTILS_DIR) clean
-
-diffutils-dirclean:
-	rm -rf $(DIFFUTILS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DIFFUTILS),y)
-TARGETS+=diffutils
-endif
+$(eval $(call AUTOTARGETS,package,diffutils))
-- 
1.7.0.4
