From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 27 Mar 2010 16:11:25 +0100
Subject: [Buildroot] [PATCH] libgcrypt: bump to 1.4.5
In-Reply-To: <20100327092241.572378c0@surf>
References: <20100327092241.572378c0@surf>
Message-ID: <1269702685-21666-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Also autotools.in conversion and change source location from gd.tuwien.ac.at to ftp.gnupg.org

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 .../libgcrypt-00-ac_cv_sys_symbol_underscore.patch |   27 ++++---
 package/libgcrypt/libgcrypt-01-reconfigure.patch   |   28 +++++--
 package/libgcrypt/libgcrypt.mk                     |   85 ++-----------------
 3 files changed, 43 insertions(+), 97 deletions(-)

diff --git a/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch b/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
index fe71360..95db0fb 100644
--- a/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
+++ b/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
@@ -1,24 +1,27 @@
-diff -u libgcrypt-1.2.4.oorig/acinclude.m4 libgcrypt-1.2.4/acinclude.m4
---- libgcrypt-1.2.4.oorig/acinclude.m4	2005-07-29 15:45:48.000000000 +0200
-+++ libgcrypt-1.2.4/acinclude.m4	2007-09-19 13:33:19.000000000 +0200
-@@ -99,12 +99,14 @@
+diff --git a/acinclude.m4 b/acinclude.m4
+index a7bc0fa..1a5bffc 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -76,13 +76,14 @@ case "${host}" in
      i386-emx-os2 | i[3456]86-pc-os2*emx | i386-pc-msdosdjgpp)
          ac_cv_sys_symbol_underscore=yes
          ;;
 -    *)
 -      if test "$cross_compiling" = yes; then
--         ac_cv_sys_symbol_underscore=yes
+-        if test "x$ac_cv_sys_symbol_underscore" = x ; then
+-           ac_cv_sys_symbol_underscore=yes
+-        fi
 -      else
 -         tmp_do_check="yes"
--      fi
 +    *) if test -z "$ac_cv_sys_symbol_underscore"; then
-+         if test "$cross_compiling" = yes && 
-+         then
-+           ac_cv_sys_symbol_underscore=yes
++         if test "$cross_compiling" = yes; then
++           if test "x$ac_cv_sys_symbol_underscore" = x ; then
++              ac_cv_sys_symbol_underscore=yes
++           fi
 +         else
-+           tmp_do_check="yes"
++            tmp_do_check="yes"
 +         fi
-+        fi
+       fi
         ;;
  esac
- if test "$tmp_do_check" = "yes"; then
+ 
diff --git a/package/libgcrypt/libgcrypt-01-reconfigure.patch b/package/libgcrypt/libgcrypt-01-reconfigure.patch
index 963ae8b..87d29a2 100644
--- a/package/libgcrypt/libgcrypt-01-reconfigure.patch
+++ b/package/libgcrypt/libgcrypt-01-reconfigure.patch
@@ -1,17 +1,27 @@
---- libgcrypt-1.2.4.oorig/configure	2007-09-19 13:40:48.000000000 +0200
-+++ libgcrypt-1.2.4/configure	2007-09-19 13:41:44.000000000 +0200
-@@ -27370,12 +27370,13 @@
+diff --git a/configure b/configure
+index 70a6d50..8f55d95 100755
+--- a/configure
++++ b/configure
+@@ -22306,14 +22306,15 @@ case "${host}" in
      i386-emx-os2 | i345686-pc-os2*emx | i386-pc-msdosdjgpp)
          ac_cv_sys_symbol_underscore=yes
          ;;
 -    *)
+-      if test "$cross_compiling" = yes; then
+-        if test "x$ac_cv_sys_symbol_underscore" = x ; then
+-           ac_cv_sys_symbol_underscore=yes
 +    *)if test -z "$ac_cv_sys_symbol_underscore";then
-       if test "$cross_compiling" = yes; then
-          ac_cv_sys_symbol_underscore=yes
-       else
-          tmp_do_check="yes"
-       fi
-+      fi
++        if test "$cross_compiling" = yes; then
++            if test "x$ac_cv_sys_symbol_underscore" = x ; then
++                ac_cv_sys_symbol_underscore=yes
++            fi
++        else
++            tmp_do_check="yes"
++        fi
+         fi
+-      else
+-         tmp_do_check="yes"
+-      fi
         ;;
  esac
  if test "$tmp_do_check" = "yes"; then
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 89856c1..69b0ed0 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -3,82 +3,15 @@
 # libgcrypt
 #
 #############################################################
-LIBGCRYPT_VERSION:=1.2.4
+LIBGCRYPT_VERSION:=1.4.5
 LIBGCRYPT_SOURCE:=libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
-LIBGCRYPT_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
-LIBGCRYPT_DIR:=$(BUILD_DIR)/libgcrypt-$(LIBGCRYPT_VERSION)
-LIBGCRYPT_LIBRARY:=src/libgcrypt.la
-LIBGCRYPT_DESTDIR:=usr/lib
-LIBGCRYPT_TARGET_LIBRARY=$(LIBGCRYPT_DESTDIR)/libgcrypt.so
+LIBGCRYPT_SITE:=ftp://ftp.gnupg.org/gcrypt/libgcrypt
+LIBGCRYPT_INSTALL_STAGING = YES
+LIBGCRYPT_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(LIBGCRYPT_SOURCE):
-	$(call DOWNLOAD,$(LIBGCRYPT_SITE),$(LIBGCRYPT_SOURCE))
+LIBGCRYPT_CONF_ENV = \
+	ac_cv_sys_symbol_underscore=no
+LIBGCRYPT_CONF_OPT = \
+	--disable-optimization
 
-$(LIBGCRYPT_DIR)/.source: $(DL_DIR)/$(LIBGCRYPT_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(LIBGCRYPT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBGCRYPT_DIR) package/libgcrypt/ libgcrypt\*.patch
-	$(CONFIG_UPDATE) $(LIBGCRYPT_DIR)
-	# This is incorrectly hardwired to yes for cross-compiles with no
-	# sane way to pass pre-existing knowledge so fix it with the chainsaw..
-	$(SED) '/GNUPG_SYS_SYMBOL_UNDERSCORE/d' $(LIBGCRYPT_DIR)/configure
-	touch $@
-
-$(LIBGCRYPT_DIR)/.configured: $(LIBGCRYPT_DIR)/.source
-	(cd $(LIBGCRYPT_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_sys_symbol_underscore=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/$(LIBGCRYPT_DESTDIR) \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--disable-optimization \
-	)
-	touch $@
-
-$(LIBGCRYPT_DIR)/$(LIBGCRYPT_LIBRARY): $(LIBGCRYPT_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBGCRYPT_DIR)
-
-$(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(LIBGCRYPT_DIR)/$(LIBGCRYPT_LIBRARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) -C $(LIBGCRYPT_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgcrypt.la
-	touch -c $@
-
-$(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
-	cp -dpf $<* $(TARGET_DIR)/$(LIBGCRYPT_DESTDIR)
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(STAGING_DIR)/usr/share/info
-endif
-
-libgcrypt: libgpg-error $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
-
-libgcrypt-source: $(DL_DIR)/$(LIBGCRYPT_SOURCE)
-
-libgcrypt-clean:
-	rm -f $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)*
-	-$(MAKE) -C $(LIBGCRYPT_DIR) clean
-	rm -rf $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)\*
-
-libgcrypt-dirclean:
-	rm -rf $(LIBGCRYPT_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-TARGETS+=libgcrypt
-endif
+$(eval $(call AUTOTARGETS,package,libgcrypt))
-- 
1.7.0.2
