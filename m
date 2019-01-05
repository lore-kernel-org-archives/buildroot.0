From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat,  5 Jan 2019 22:00:45 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gettext: Turn into virtual
 package
In-Reply-To: <20190105200046.31512-1-vadim4j@gmail.com>
References: <20190105200046.31512-1-vadim4j@gmail.com>
Message-ID: <20190105200046.31512-3-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-work gettext to be a virtual package which may allow to use
different gettext's providers, and rename the original one into
gettext-gnu package.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 .../0001-error_print_progname.patch                |   0
 .../0002-Update-after-gnulib-changed.patch         |   0
 .../gettext.hash => gettext-gnu/gettext-gnu.hash}  |   0
 package/gettext-gnu/gettext-gnu.mk                 | 103 +++++++++++++++++++++
 package/gettext/Config.in                          |  26 +++++-
 package/gettext/gettext.mk                         |  96 +------------------
 6 files changed, 126 insertions(+), 99 deletions(-)
 rename package/{gettext => gettext-gnu}/0001-error_print_progname.patch (100%)
 rename package/{gettext => gettext-gnu}/0002-Update-after-gnulib-changed.patch (100%)
 rename package/{gettext/gettext.hash => gettext-gnu/gettext-gnu.hash} (100%)
 create mode 100644 package/gettext-gnu/gettext-gnu.mk

diff --git a/package/gettext/0001-error_print_progname.patch b/package/gettext-gnu/0001-error_print_progname.patch
similarity index 100%
rename from package/gettext/0001-error_print_progname.patch
rename to package/gettext-gnu/0001-error_print_progname.patch
diff --git a/package/gettext/0002-Update-after-gnulib-changed.patch b/package/gettext-gnu/0002-Update-after-gnulib-changed.patch
similarity index 100%
rename from package/gettext/0002-Update-after-gnulib-changed.patch
rename to package/gettext-gnu/0002-Update-after-gnulib-changed.patch
diff --git a/package/gettext/gettext.hash b/package/gettext-gnu/gettext-gnu.hash
similarity index 100%
rename from package/gettext/gettext.hash
rename to package/gettext-gnu/gettext-gnu.hash
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
new file mode 100644
index 0000000000..61adf72738
--- /dev/null
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -0,0 +1,103 @@
+################################################################################
+#
+# gettext-gnu
+#
+################################################################################
+
+GETTEXT_GNU_VERSION = 0.19.8.1
+GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
+GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
+GETTEXT_GNU_INSTALL_STAGING = YES
+GETTEXT_GNU_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
+GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
+# 0002-Update-after-gnulib-changed.patch
+GETTEXT_GNU_AUTORECONF = YES
+GETTEXT_GNU_PROVIDES = gettext
+GETTEXT_GNU_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+# Avoid using the bundled subset of libxml2
+HOST_GETTEXT_GNU_DEPENDENCIES = host-libxml2
+
+GETTEXT_GNU_CONF_OPTS += \
+	--disable-libasprintf \
+	--disable-acl \
+	--disable-openmp \
+	--disable-rpath \
+	--disable-java \
+	--disable-native-java \
+	--disable-csharp \
+	--disable-relocatable \
+	--without-emacs
+
+HOST_GETTEXT_GNU_CONF_OPTS = \
+	--disable-libasprintf \
+	--disable-acl \
+	--disable-openmp \
+	--disable-rpath \
+	--disable-java \
+	--disable-native-java \
+	--disable-csharp \
+	--disable-relocatable \
+	--without-emacs
+
+# Force the build of libintl, even if the C library provides a stub
+# gettext implementation
+ifeq ($(BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL),y)
+GETTEXT_GNU_CONF_OPTS += --with-included-gettext
+else
+GETTEXT_GNU_CONF_OPTS += --without-included-gettext
+endif
+
+# For the target version, we only need the runtime, and for the host
+# version, we only need the tools.
+GETTEXT_GNU_SUBDIR = gettext-runtime
+HOST_GETTEXT_GNU_SUBDIR = gettext-tools
+
+# Disable the build of documentation and examples of gettext-tools,
+# and the build of documentation and tests of gettext-runtime.
+define HOST_GETTEXT_GNU_DISABLE_UNNEEDED
+	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/examples$$//' $(@D)/gettext-tools/Makefile.in
+	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests$$//' $(@D)/gettext-runtime/Makefile.in
+endef
+
+GETTEXT_GNU_POST_PATCH_HOOKS += HOST_GETTEXT_GNU_DISABLE_UNNEEDED
+HOST_GETTEXT_GNU_POST_PATCH_HOOKS += HOST_GETTEXT_GNU_DISABLE_UNNEEDED
+
+define GETTEXT_GNU_REMOVE_UNNEEDED
+	$(RM) -rf $(TARGET_DIR)/usr/share/gettext/ABOUT-NLS
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/gettext
+endef
+
+GETTEXT_GNU_POST_INSTALL_TARGET_HOOKS += GETTEXT_GNU_REMOVE_UNNEEDED
+
+# Force build with NLS support, otherwise libintl is not built
+# This is needed because some packages (eg. libglib2) requires
+# locales, but do not properly depend on BR2_ENABLE_LOCALE, and
+# instead select BR2_PACKAGE_GETTEXT_GNU. Those packages need to be
+# fixed before we can remove the following 3 lines... :-(
+ifeq ($(BR2_ENABLE_LOCALE),)
+GETTEXT_GNU_CONF_OPTS += --enable-nls
+endif
+
+# Disable interactive confirmation in host gettextize for package fixups
+define HOST_GETTEXT_GNU_GETTEXTIZE_CONFIRMATION
+	$(SED) '/read dummy/d' $(HOST_DIR)/bin/gettextize
+endef
+HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_GETTEXTIZE_CONFIRMATION
+
+# autoreconf expects gettextize to install ABOUT-NLS, but it only gets
+# installed by gettext-runtime which we don't build/install for the
+# host, so do it manually
+define HOST_GETTEXT_GNU_ADD_ABOUT_NLS
+	$(INSTALL) -m 0644 $(@D)/$(HOST_GETTEXT_GNU_SUBDIR)/ABOUT-NLS \
+		$(HOST_DIR)/share/gettext/ABOUT-NLS
+endef
+
+HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_ADD_ABOUT_NLS
+
+ifeq ($(BR2_PACKAGE_GETTEXT_GNU),y)
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index e55663b1d7..9546468571 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,5 +1,12 @@
-config BR2_PACKAGE_GETTEXT
+menuconfig BR2_PACKAGE_GETTEXT
 	bool "gettext"
+	select BR2_PACKAGE_HAS_GETTEXT
+
+if BR2_PACKAGE_GETTEXT
+
+config BR2_PACKAGE_GETTEXT_GNU
+	bool "gettext-gnu"
+	default y
 	depends on BR2_USE_WCHAR
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
@@ -12,14 +19,23 @@ config BR2_PACKAGE_GETTEXT
 
 	  http://www.gnu.org/software/gettext/
 
-if BR2_PACKAGE_GETTEXT
+comment "gettext-gnu needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
 	default y if BR2_SYSTEM_ENABLE_NLS
 	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
 
-endif
+config BR2_PACKAGE_PROVIDES_GETTEXT
+	string
+	default "gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
 
-comment "gettext needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+config BR2_PACKAGE_HAS_GETTEXT
+	bool
+
+config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
+	string
+	default "host-gettext-gnu"
+
+endif
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index ec9588f8ad..a86e26f69e 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,97 +4,5 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.8.1
-GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
-GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
-GETTEXT_INSTALL_STAGING = YES
-GETTEXT_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
-GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
-# 0002-Update-after-gnulib-changed.patch
-GETTEXT_AUTORECONF = YES
-GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-
-# Avoid using the bundled subset of libxml2
-HOST_GETTEXT_DEPENDENCIES = host-libxml2
-
-GETTEXT_CONF_OPTS += \
-	--disable-libasprintf \
-	--disable-acl \
-	--disable-openmp \
-	--disable-rpath \
-	--disable-java \
-	--disable-native-java \
-	--disable-csharp \
-	--disable-relocatable \
-	--without-emacs
-
-HOST_GETTEXT_CONF_OPTS = \
-	--disable-libasprintf \
-	--disable-acl \
-	--disable-openmp \
-	--disable-rpath \
-	--disable-java \
-	--disable-native-java \
-	--disable-csharp \
-	--disable-relocatable \
-	--without-emacs
-
-# Force the build of libintl, even if the C library provides a stub
-# gettext implementation
-ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-GETTEXT_CONF_OPTS += --with-included-gettext
-else
-GETTEXT_CONF_OPTS += --without-included-gettext
-endif
-
-# For the target version, we only need the runtime, and for the host
-# version, we only need the tools.
-GETTEXT_SUBDIR = gettext-runtime
-HOST_GETTEXT_SUBDIR = gettext-tools
-
-# Disable the build of documentation and examples of gettext-tools,
-# and the build of documentation and tests of gettext-runtime.
-define HOST_GETTEXT_DISABLE_UNNEEDED
-	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/examples$$//' $(@D)/gettext-tools/Makefile.in
-	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests$$//' $(@D)/gettext-runtime/Makefile.in
-endef
-
-GETTEXT_POST_PATCH_HOOKS += HOST_GETTEXT_DISABLE_UNNEEDED
-HOST_GETTEXT_POST_PATCH_HOOKS += HOST_GETTEXT_DISABLE_UNNEEDED
-
-define GETTEXT_REMOVE_UNNEEDED
-	$(RM) -rf $(TARGET_DIR)/usr/share/gettext/ABOUT-NLS
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/gettext
-endef
-
-GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_UNNEEDED
-
-# Force build with NLS support, otherwise libintl is not built
-# This is needed because some packages (eg. libglib2) requires
-# locales, but do not properly depend on BR2_ENABLE_LOCALE, and
-# instead select BR2_PACKAGE_GETTEXT. Those packages need to be
-# fixed before we can remove the following 3 lines... :-(
-ifeq ($(BR2_ENABLE_LOCALE),)
-GETTEXT_CONF_OPTS += --enable-nls
-endif
-
-# Disable interactive confirmation in host gettextize for package fixups
-define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
-	$(SED) '/read dummy/d' $(HOST_DIR)/bin/gettextize
-endef
-HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
-
-# autoreconf expects gettextize to install ABOUT-NLS, but it only gets
-# installed by gettext-runtime which we don't build/install for the
-# host, so do it manually
-define HOST_GETTEXT_ADD_ABOUT_NLS
-	$(INSTALL) -m 0644 $(@D)/$(HOST_GETTEXT_SUBDIR)/ABOUT-NLS \
-		$(HOST_DIR)/share/gettext/ABOUT-NLS
-endef
-
-HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_ADD_ABOUT_NLS
-
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(virtual-package))
+$(eval $(host-virtual-package))
-- 
2.14.1
