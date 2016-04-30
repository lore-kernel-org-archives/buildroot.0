From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:05 +0200
Subject: [Buildroot] [PATCH 09/34] reproducibility/libglib2: allow removing
	codegen
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glib2 installs compiled python bytecode in /usr/share/glib-2.0/codegen,
likely for the gdbus-codegen program.

This bytecode is not compiled with the buildroot host python, which
causes a first source of non reproducibility, fix that by using
buildroot host python.

But this is not sufficient, compiling the python bytecode with the
same interpreter in different environments yields different binaries,
so, since buildroot users are unlikely to need the qdbus-codegen
program on target, add an option to remove it. The option is disabled
by default.
---
 package/libglib2/Config.in   | 10 ++++++++++
 package/libglib2/libglib2.mk | 18 ++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 7cbfea5..8a39805 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -13,6 +13,16 @@ config BR2_PACKAGE_LIBGLIB2
 
 	  http://www.gtk.org/
 
+if BR2_PACKAGE_LIBGLIB2
+
+config BR2_PACKAGE_LIBGLIB2_CODEGEN
+	bool "install Glib D-Bus code and documentation generator"
+	default y
+	help
+	  Install Glib D-Bus code and documentation generator.
+
+endif
+
 comment "libglib2 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8cf055d..7feba90 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -99,9 +99,9 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-systemtap \
 	--disable-xattr
 
-LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
+LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext host-python
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkgconf host-libffi host-zlib host-gettext
+HOST_LIBGLIB2_DEPENDENCIES = host-pkgconf host-libffi host-zlib host-gettext host-python
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
@@ -137,6 +137,20 @@ ifneq ($(BR2_PACKAGE_GDB),y)
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2_CODEGEN),)
+define LIBGLIB2_REMOVE_CODEGEN
+	rm $(TARGET_DIR)/usr/bin/gdbus-codegen
+	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/codegen
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
+endef
+
+LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_CODEGEN
+endif
+
+LIBGLIB2_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python
+
+HOST_LIBGLIB2_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.7.4
