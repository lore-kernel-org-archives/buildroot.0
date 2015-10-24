From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:01:12 +0200
Subject: [Buildroot] [PATCH v5 32/36] package/efl/libecore: remove package
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-33-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libecore is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v5: remove libecore directory
v4: update Config.in to use libefl
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy                 |   7 +++
 package/efl/Config.in            |   1 -
 package/efl/libecore/Config.in   |  46 ----------------
 package/efl/libecore/libecore.mk | 114 ---------------------------------------
 4 files changed, 7 insertions(+), 161 deletions(-)
 delete mode 100644 package/efl/libecore/Config.in
 delete mode 100644 package/efl/libecore/libecore.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index bba5086..6c72a54 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_LIBECORE
+	bool "libecore package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libecore package has been removed with the efl bump to 1.15.
+
 config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3092c8f..7bd73dc 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -15,7 +15,6 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
-source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libefl/Config.in"
 source "package/efl/libevas/Config.in"
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
deleted file mode 100644
index a9408dc..0000000
--- a/package/efl/libecore/Config.in
+++ /dev/null
@@ -1,46 +0,0 @@
-config BR2_PACKAGE_LIBECORE
-	bool "libecore"
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
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
deleted file mode 100644
index b5016dc..0000000
--- a/package/efl/libecore/libecore.mk
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
