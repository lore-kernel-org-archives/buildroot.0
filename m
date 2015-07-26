From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:43 +0200
Subject: [Buildroot] [RFC 33/37] package/libecore: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-34-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libecore is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy             |   7 +++
 package/Config.in            |   1 -
 package/libecore/Config.in   |  51 -------------------
 package/libecore/libecore.mk | 114 -------------------------------------------
 4 files changed, 7 insertions(+), 166 deletions(-)
 delete mode 100644 package/libecore/Config.in
 delete mode 100644 package/libecore/libecore.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 785db24..b3c718a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBECORE
+	bool "libecore package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libecore package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bd940bd..51444de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,7 +242,6 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
-	source "package/libecore/Config.in"
 	source "package/libeet/Config.in"
 	source "package/libeina/Config.in"
 	source "package/libelementary/Config.in"
diff --git a/package/libecore/Config.in b/package/libecore/Config.in
deleted file mode 100644
index e8f31f0..0000000
--- a/package/libecore/Config.in
+++ /dev/null
@@ -1,51 +0,0 @@
-config BR2_PACKAGE_LIBECORE
-	bool "libecore"
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	select BR2_PACKAGE_LIBEINA
-	help
-	  Ecore is the event/X abstraction layer that makes doing
-	  selections, Xdnd, general X stuff, event loops, timeouts and
-	  idle handlers fast, optimized, and convenient.
-
-	  http://trac.enlightenment.org/e/wiki/Ecore
-
-if BR2_PACKAGE_LIBECORE
-
-config BR2_PACKAGE_LIBECORE_DIRECTFB
-	bool "libecore DirectFB support"
-	depends on BR2_PACKAGE_DIRECTFB
-	default y
-
-config BR2_PACKAGE_LIBECORE_FB
-	bool "libecore framebuffer support"
-
-config BR2_PACKAGE_LIBECORE_SDL
-	bool "libecore SDL support"
-	select BR2_PACKAGE_SDL
-
-config BR2_PACKAGE_LIBECORE_X
-	bool "libecore X support"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-
-config BR2_PACKAGE_LIBECORE_X_XCB
-	bool "libecore XCB support"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XCB_UTIL
-
-config BR2_PACKAGE_LIBECORE_EVAS
-	bool "libecore Evas support"
-	select BR2_PACKAGE_LIBEVAS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-
-comment "evas support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-endif # BR2_PACKAGE_LIBECORE
-
-comment "libecore needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/libecore/libecore.mk b/package/libecore/libecore.mk
deleted file mode 100644
index b5016dc..0000000
--- a/package/libecore/libecore.mk
+++ /dev/null
@@ -1,114 +0,0 @@
-################################################################################
-#
-# libecore
-#
-################################################################################
-
-LIBECORE_VERSION = 1.7.10
-LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
-LIBECORE_SITE = http://download.enlightenment.org/releases
-LIBECORE_LICENSE = BSD-2c
-LIBECORE_LICENSE_FILES = COPYING
-
-LIBECORE_INSTALL_STAGING = YES
-
-LIBECORE_DEPENDENCIES = host-pkgconf libeina
-
-HOST_LIBECORE_DEPENDENCIES = host-pkgconf host-libeina host-libevas
-HOST_LIBECORE_CONF_OPTS += 		\
-	--enable-ecore-evas 		\
-	--disable-simple-x11 		\
-	--disable-ecore-directfb 	\
-	--disable-ecore-x 		\
-	--disable-ecore-x-xcb 		\
-	--disable-ecore-imf-xim
-
-# default options
-LIBECORE_CONF_OPTS = --disable-simple-x11
-
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-LIBECORE_DEPENDENCIES += tslib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBECORE_DEPENDENCIES += libglib2
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBECORE_DEPENDENCIES += openssl
-LIBECORE_CONF_OPTS += --enable-openssl
-else
-LIBECORE_CONF_OPTS += --disable-openssl
-endif
-
-ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBECORE_DEPENDENCIES += gnutls libgcrypt
-LIBECORE_CONF_OPTS += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
-else
-LIBECORE_CONF_OPTS += --disable-gnutls
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LIBECORE_DEPENDENCIES += libcurl
-endif
-
-# libecore
-ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
-LIBECORE_CONF_OPTS += --enable-ecore-directfb
-LIBECORE_DEPENDENCIES += directfb
-else
-LIBECORE_CONF_OPTS += --disable-ecore-directfb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
-LIBECORE_CONF_OPTS += --enable-ecore-fb
-else
-LIBECORE_CONF_OPTS += --disable-ecore-fb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
-LIBECORE_CONF_OPTS += --enable-ecore-sdl
-LIBECORE_DEPENDENCIES += sdl
-else
-LIBECORE_CONF_OPTS += --disable-ecore-sdl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
-LIBECORE_CONF_OPTS += --enable-ecore-x \
-	--with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
-else
-LIBECORE_CONF_OPTS += --disable-ecore-x --disable-ecore-imf-xim
-endif
-
-ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
-LIBECORE_CONF_OPTS += --enable-ecore-x-xcb
-LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util pixman
-
-# src/util/makekeys is executed at build time to generate
-# ecore_xcb_keysym_table.h, so it should get compiled for the host.
-# The ecore makefile unfortunately doesn't know about cross
-# compilation so this doesn't work.  Long term, we should probably
-# teach it about CC_FOR_BUILD, but for now simply build makekeys by
-# hand in advance
-define LIBECORE_BUILD_MAKEKEYS_FOR_HOST
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/src/util makekeys.o makekeys
-endef
-
-LIBECORE_POST_EXTRACT_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
-else
-LIBECORE_CONF_OPTS += --disable-ecore-x-xcb
-endif
-
-# libecore-evas
-ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
-LIBECORE_CONF_OPTS += --enable-ecore-evas
-LIBECORE_DEPENDENCIES += libevas
-else
-LIBECORE_CONF_OPTS += --disable-ecore-evas
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
