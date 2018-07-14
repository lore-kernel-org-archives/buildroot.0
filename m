From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Jul 2018 12:55:12 +0200
Subject: [Buildroot] [PATCH 2/3] package/libva-intel-driver: bump version to
 2.2.0
In-Reply-To: <20180714105513.16687-1-bernd.kuhls@t-online.de>
References: <20180714105513.16687-1-bernd.kuhls@t-online.de>
Message-ID: <20180714105513.16687-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved its github repo to github.com/intel/, updated URLs, for
reference see upstream PR 371. Also updated project URL.

Upstream unconditionally added -fstack-protector to CFLAGS:
https://github.com/intel/intel-vaapi-driver/commit/d8c73243cf7680be01bba1017d1e760c0049bffa

This breaks the build when the buildroot config has no support for SSP,
fix this be removing -fstack-protector in the non-SSP case. Please note
that adding -fnostack-protector to CFLAGS via CONF_ENV is not enough
because in some makefiles upstream did not include $(CFLAGS), like in
the aforementioned commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/Config.in               |  2 +-
 package/libva-intel-driver/libva-intel-driver.hash |  6 +++---
 package/libva-intel-driver/libva-intel-driver.mk   | 12 ++++++++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 120f152c96..53c5b366c3 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	help
 	  VA-API back-end driver for Intel graphics chips
 
-	  https://01.org/linuxmedia/vaapi
+	  https://01.org/vaapi
 
 comment "libva intel driver needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index dbe5d67fb4..0509ff8d60 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,5 @@
-# From https://github.com/01org/intel-vaapi-driver/releases
-sha1 a40c6bd89b71b547986bf9f9fa2533bb50cf269e intel-vaapi-driver-2.1.0.tar.bz2
+# From https://github.com/intel/intel-vaapi-driver/releases
+sha1 0934f97ddcaf4e633f59d049226723239b645b33  intel-vaapi-driver-2.2.0.tar.bz2
 # Locally computed
-sha256 ecfaf2ccc4b9af7340e002d2ef807d1e33051d4992f1983f5f4d60e516f86bdf  intel-vaapi-driver-2.1.0.tar.bz2
+sha256 e8a5f54694eb76aad42653b591030b8a53b1513144c09a80defb3d8d8c875c18  intel-vaapi-driver-2.2.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index dd1903024f..cffad28b9a 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,14 +4,22 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.1.0
+LIBVA_INTEL_DRIVER_VERSION = 2.2.0
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
-	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
+	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
+define LIBVA_INTEL_DRIVER_DISABLE_STACK_PROTECTOR
+	$(SED) 's%-fstack-protector%%' $(@D)/src/Makefile
+endef
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+LIBVA_INTEL_DRIVER_POST_CONFIGURE_HOOKS += LIBVA_INTEL_DRIVER_DISABLE_STACK_PROTECTOR
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_INTEL_DRIVER_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-x11
-- 
2.18.0
