From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Jul 2018 12:55:11 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: bump version to 2.2.0
Message-ID: <20180714105513.16687-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved its github repo to github.com/intel/, updated URLs, for
reference see upstream PR 198. Also updated project URL.

Upstream unconditionally added -fstack-protector to CFLAGS:
https://github.com/intel/libva/commit/b70a92e61c25ebc144f54a0086cf715757330782

This breaks the build when the buildroot config has no support for SSP,
fix this be removing -fstack-protector in the non-SSP case. Please note
that adding -fnostack-protector to CFLAGS via CONF_ENV is not enough
because in some makefiles upstream did not include $(CFLAGS), like in
the aforementioned commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/Config.in  |  2 +-
 package/libva/libva.hash |  6 +++---
 package/libva/libva.mk   | 12 ++++++++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/libva/Config.in b/package/libva/Config.in
index 08eb16b487..e4e351f98a 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBVA
 	  prevailing coding standards today (MPEG-2, MPEG-4 ASP/H.263,
 	  MPEG-4 AVC/H.264, and VC-1/VMW3).
 
-	  https://01.org/linuxmedia/vaapi
+	  https://01.org/vaapi
 
 comment "libva needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index ed707095f0..72347a4f2d 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/01org/libva/releases
-sha1 9ecde2b6c9deda16e895a0b00b8aef3a765acb4c  libva-2.1.0.tar.bz2
+# From https://github.com/intel/libva/releases
+sha1 5b19d2fbf532f14e24c3bedb4074238a1d7f1686  libva-2.2.0.tar.bz2
 # Locally computed
-sha256 f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f  libva-2.1.0.tar.bz2
+sha256 6f6ca04c785544d30d315ef130a6aeb9435b75f934d7fbe0e4e9ba6084ce4ef2  libva-2.2.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 79956a9d8e..2f4ec91ada 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.1.0
+LIBVA_VERSION = 2.2.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
-LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
+LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
@@ -17,6 +17,14 @@ LIBVA_CONF_OPTS = \
 	--enable-drm \
 	--with-drivers-path="/usr/lib/va"
 
+define LIBVA_DISABLE_STACK_PROTECTOR
+	$(SED) 's%-fstack-protector%%' $(@D)/va/Makefile
+endef
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+LIBVA_POST_CONFIGURE_HOOKS += LIBVA_DISABLE_STACK_PROTECTOR
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
-- 
2.18.0
