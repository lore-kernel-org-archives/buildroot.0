From: Chih-Min Chao <cmchao@gmail.com>
Date: Tue, 21 Sep 2010 00:51:23 +0800
Subject: [Buildroot] [PATCH] vim : move to autotool framework
In-Reply-To: <1285001483-18387-1-git-send-email-cmchao@gmail.com>
References: <1285001483-18387-1-git-send-email-cmchao@gmail.com>
Message-ID: <1285001483-18387-2-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/vim/configure.patch         |   34 ------------
 package/vim/vim-7.3-configure.patch |   34 ++++++++++++
 package/vim/vim.mk                  |   99 ++++++++++++-----------------------
 3 files changed, 67 insertions(+), 100 deletions(-)
 delete mode 100644 package/vim/configure.patch
 create mode 100644 package/vim/vim-7.3-configure.patch

diff --git a/package/vim/configure.patch b/package/vim/configure.patch
deleted file mode 100644
index 9c060af..0000000
--- a/package/vim/configure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff --git a/configure b/configure
-index d09ee92..ecbb0a8 100755
---- a/src/auto/configure
-+++ b/src/auto/configure
-@@ -11641,10 +11641,7 @@ _ACEOF
- 
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking uint32_t is 32 bits" >&5
- $as_echo_n "checking uint32_t is 32 bits... " >&6; }
--if test "$cross_compiling" = yes; then :
--  as_fn_error "could not compile program using uint32_t." "$LINENO" 5
--else
--  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- 
- #ifdef HAVE_STDINT_H
-@@ -11660,7 +11657,7 @@ main() {
-   exit(0);
- }
- _ACEOF
--if ac_fn_c_try_run "$LINENO"; then :
-+if ac_fn_c_try_compile "$LINENO"; then :
-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ok" >&5
- $as_echo "ok" >&6; }
- else
-@@ -11668,8 +11665,6 @@ else
- fi
- rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
-   conftest.$ac_objext conftest.beam conftest.$ac_ext
--fi
--
- 
- 
- bcopy_test_prog='
diff --git a/package/vim/vim-7.3-configure.patch b/package/vim/vim-7.3-configure.patch
new file mode 100644
index 0000000..d00161e
--- /dev/null
+++ b/package/vim/vim-7.3-configure.patch
@@ -0,0 +1,34 @@
+diff --git a/configure b/configure
+index d09ee92..ecbb0a8 100755
+--- a/src/auto/configure
++++ b/src/auto/configure
+@@ -11641,10 +11641,7 @@ _ACEOF
+
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking uint32_t is 32 bits" >&5
+ $as_echo_n "checking uint32_t is 32 bits... " >&6; }
+-if test "$cross_compiling" = yes; then :
+-  as_fn_error "could not compile program using uint32_t." "$LINENO" 5
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+
+ #ifdef HAVE_STDINT_H
+@@ -11660,7 +11657,7 @@ main() {
+   exit(0);
+ }
+ _ACEOF
+-if ac_fn_c_try_run "$LINENO"; then :
++if ac_fn_c_try_compile "$LINENO"; then :
+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ok" >&5
+ $as_echo "ok" >&6; }
+ else
+@@ -11668,8 +11665,6 @@ else
+ fi
+ rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+   conftest.$ac_objext conftest.beam conftest.$ac_ext
+-fi
+-
+
+
+ bcopy_test_prog='
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index f539aca..7071d39 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,43 +4,13 @@
 #
 #############################################################
 VIM_VERSION:=7.3
+VIM_SITE:=http://ftp.vim.org/pub/vim/unix
 VIM_SOURCE:=vim-$(VIM_VERSION).tar.bz2
-VIM_SITE:=http://ftp.vim.org/pub/vim
-VIM_SOURCE_SITE:=$(VIM_SITE)/unix
-VIM_PATCH_SITE:=$(VIM_SITE)/patches/$(VIM_VERSION)
-VIM_DIR:=$(BUILD_DIR)/vim73
+VIM_PATCH_SITE:=$(VIM_SITE)/../patches/$(VIM_VERSION)
 VIM_PATCHES:=$(shell sed -e 's:^:$(DL_DIR)/$(VIM_VERSION).:' package/vim/patches)
-VIM_CONFIG_H:=$(VIM_DIR)/src/auto/config.h
-VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk
+VIM_DEPENDENCIES=host-pkg-config ncurses $(VIM_PATCHES)
 
-$(DL_DIR)/$(VIM_SOURCE):
-	$(call DOWNLOAD,$(VIM_SOURCE_SITE),$(VIM_SOURCE))
-
-$(DL_DIR)/$(VIM_VERSION).%:
-	$(call DOWNLOAD,$(VIM_PATCH_SITE),$(notdir $@))
-
-vim-source: $(DL_DIR)/$(VIM_SOURCE) $(VIM_PATCHES)
-
-$(VIM_DIR)/.unpacked: $(DL_DIR)/$(VIM_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(VIM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(VIM_DIR)/.patched: $(VIM_DIR)/.unpacked
-	@for i in $(VIM_PATCHES); do ( \
-		echo "Patching with $$i"; \
-		cd $(VIM_DIR); \
-		patch -p0 < $$i) \
-	done
-	toolchain/patch-kernel.sh $(VIM_DIR) package/vim/ \*.patch
-	touch $@
-
-$(VIM_DIR)/.configured: $(VIM_DIR)/.patched
-	(cd $(VIM_DIR)/src; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		STRIP="$(TARGET_STRIP)" \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+VIM_CONF_ENV= PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		vim_cv_toupper_broken=no \
 		vim_cv_terminfo=yes \
@@ -48,47 +18,44 @@ $(VIM_DIR)/.configured: $(VIM_DIR)/.patched
 		vim_cv_tty_mode=0620 \
 		vim_cv_getcwd_broken=no \
 		vim_cv_stat_ignores_slash=no \
-		vim_cv_memmove_handles_overlap=yes \
-		./configure $(QUIET) --prefix=/usr \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(DISABLE_NLS) \
-		--disable-netbeans \
+		vim_cv_memmove_handles_overlap=yes
+
+VIM_CONF_OPT= --disable-netbeans \
 		--disable-gpm \
 		--disable-gui \
 		--without-x \
-		--with-tlib=ncurses \
-	)
-	touch $@
+		--with-tlib=ncurses
 
-$(VIM_DIR)/.build: $(VIM_DIR)/.configured
-	(cd $(VIM_DIR)/src; \
-		$(MAKE) \
-	)
-	touch $@
+$(DL_DIR)/$(VIM_VERSION).%:
+	$(call DOWNLOAD,$(VIM_PATCH_SITE),$(notdir $@))
 
-$(TARGET_DIR)/usr/bin/vim: $(VIM_DIR)/.build
-	(cd $(VIM_DIR)/src; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) installlinks; \
+define VIM_PATCHES_HOOK
+	@for i in $(VIM_PATCHES); do ( \
+		echo "Patching with $$i"; \
+		cd $(@D); \
+		patch -p0 < $$i) \
+	done
+endef
+VIM_POST_PATCH_HOOKS += VIM_PATCHES_HOOK
+
+
+define VIM_INSTALL_TARGET_CMDS
+	(cd $(@D)/src;\
+	$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+	$(MAKE) DESTDIR=$(TARGET_DIR) installlinks; \
 	)
-ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
-	(cd $(VIM_DIR)/src; \
+endef
+
+define VIM_RUNTIME_INSTALL
+	(cd $(@D)/src;\
 		$(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
 		$(MAKE) DESTDIR=$(TARGET_DIR) installmacros; \
 	)
+endef
+
+ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
+	VIM_POST_INSTALL_TARGET_HOOKS += VIM_RUNTIME_INSTALL
 endif
 
-vim: host-pkg-config ncurses vim-source $(TARGET_DIR)/usr/bin/vim
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VIM),y)
-TARGETS+=vim
-endif
+$(eval $(call AUTOTARGETS,package,vim))
-- 
1.7.0.4
