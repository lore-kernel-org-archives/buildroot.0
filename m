From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 23 Jul 2008 01:46:01 +0200
Subject: [Buildroot] [PATCH 1/2] Vim: don't use "extra" archive
Message-ID: <200807230146.01380.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed vim-extra, it's not necessary, the extra-patches are left out anyway
- corrected typo, so that the Config.in option for selection of the runtime
  files does what it is intended to


diff --git a/package/editors/vim/patches b/package/editors/vim/patches
index 81acab5..856a8db 100644
--- a/package/editors/vim/patches
+++ b/package/editors/vim/patches
@@ -112,7 +112,7 @@
 122
 123
 125
-126
+126ne
 127
 130
 131
diff --git a/package/editors/vim/vim.mk b/package/editors/vim/vim.mk
index 5815b2b..a7d27d3 100644
--- a/package/editors/vim/vim.mk
+++ b/package/editors/vim/vim.mk
@@ -5,30 +5,24 @@
 #############################################################
 VIM_VERSION:=7.1
 VIM_SOURCE:=vim-$(VIM_VERSION).tar.bz2
-VIM_EXTRA:=vim-$(VIM_VERSION)-extra.tar.gz
 VIM_SITE:=ftp://ftp.vim.org/pub/vim
 VIM_SOURCE_SITE:=$(VIM_SITE)/unix
-VIM_EXTRA_SITE:=$(VIM_SITE)/extra
 VIM_PATCH_SITE:=$(VIM_SITE)/patches/7.1
 VIM_DIR:=$(BUILD_DIR)/vim71
-VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -s 's:\([0-9]\{3\}\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
+VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -s 's:\(.\+\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
 VIM_CONFIG_H:=$(VIM_DIR)/src/auto/config.h
 VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk
 
 $(DL_DIR)/$(VIM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(VIM_SOURCE_SITE)/$(VIM_SOURCE)
 
-$(DL_DIR)/$(VIM_EXTRA):
-	$(WGET) -P $(DL_DIR) $(VIM_EXTRA_SITE)/$(VIM_EXTRA)
-
 $(DL_DIR)/vim/%:
 	$(WGET) -P $(DL_DIR)/vim/ $(VIM_PATCH_SITE)/$*
 
-vim-source: $(DL_DIR)/$(VIM_SOURCE) $(DL_DIR)/$(VIM_EXTRA) $(VIM_PATCHES)
+vim-source: $(DL_DIR)/$(VIM_SOURCE) $(VIM_PATCHES)
 
 $(VIM_DIR)/.unpacked: $(DL_DIR)/$(VIM_SOURCE)
 	$(BZCAT) $(DL_DIR)/$(VIM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(ZCAT) $(DL_DIR)/$(VIM_EXTRA) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(VIM_DIR)/.patched: $(VIM_DIR)/.unpacked
@@ -36,7 +30,7 @@ $(VIM_DIR)/.patched: $(VIM_DIR)/.unpacked
 		echo "Patching with $$i"; \
 		cd $(VIM_DIR); \
 		patch -p0 < $$i) \
-    done;
+	done
 	toolchain/patch-kernel.sh $(VIM_DIR) package/editors/vim/ \*.patch
 	touch $@
 
@@ -79,7 +73,7 @@ $(TARGET_DIR)/usr/bin/vim: $(VIM_DIR)/.build
 		make DESTDIR=$(TARGET_DIR) installvimbin; \
 		make DESTDIR=$(TARGET_DIR) installlinks; \
 	)
-ifeq ($(R2_PACKAGE_VIM_RUNTIME),y)
+ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 	(cd $(VIM_DIR)/src; \
 		make DESTDIR=$(TARGET_DIR) installrtbase; \
 		make DESTDIR=$(TARGET_DIR) installmacros; \
