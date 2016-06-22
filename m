From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 22 Jun 2016 23:27:43 +0200
Subject: [Buildroot] [PATCH v3 2/5] package/efl: bump to 1.17.2
In-Reply-To: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466630866-28779-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the comment about Lua support which doesn't build with Lua 5.1+.
Update the untested configuration warning option.

Disable efl build for host/target gcc older than 4.7 (oldest tested version).
http://lists.busybox.net/pipermail/buildroot/2016-June/163606.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: update to 1.17.2
v2: Remove Ector patch since it's not fixing the build issue reported by
    ThomasP.
    Add a dependency on gcc >= 4.7.
---
 package/efl/Config.in |  7 +++++--
 package/efl/efl.hash  |  4 ++--
 package/efl/efl.mk    | 11 +++--------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4e37850..7014e66 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # g++ issue with 4.4.5, tested with g++ 4.7.2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
@@ -13,7 +15,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	# https://phab.enlightenment.org/T2728
-	select BR2_PACKAGE_LUAJIT # Lua support broken with 5.2+
+	select BR2_PACKAGE_LUAJIT # Lua support broken
 	select BR2_PACKAGE_UTIL_LINUX
 	# libblkid is part of required tools, see EFL's README.
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -182,8 +184,9 @@ config BR2_PACKAGE_EFL_WEBP
 
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
+comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_HOST_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 6673bb5..2ddc005 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.15.3.tar.xz.sha256
-sha256	3bac40e6294288034bd7f8902088bf1169cf376f6fd25b7a49854ab561630642	efl-1.15.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.17.2.tar.xz.sha256
+sha256	9aa93ff0ab4bdf95d5cf9606bd7efece611691ca22eb6fc3484fe6e7a92bf8b6	efl-1.17.2.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 916999d..fd06246 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.15.3
+EFL_VERSION = 1.17.2
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
@@ -22,11 +22,6 @@ EFL_INSTALL_STAGING = YES
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 	jpeg luajit udev util-linux zlib
 
-# Regenerate the autotools:
-#  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
-EFL_AUTORECONF = YES
-EFL_GETTEXTIZE = YES
-
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-lua-old: build elua for the target.
@@ -47,7 +42,7 @@ EFL_CONF_OPTS = \
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
-EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
@@ -273,6 +268,6 @@ HOST_EFL_CONF_OPTS += \
 	--with-glib=yes \
 	--with-opengl=none \
 	--with-x11=none \
-	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 
 $(eval $(host-autotools-package))
-- 
2.5.5
