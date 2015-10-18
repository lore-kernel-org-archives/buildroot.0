From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:39 +0200
Subject: [Buildroot] [PATCH v4 23/35] package/enlightenment: bump to version
	0.19.12
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-24-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly added libefl package wich provide a new version
of efl libraries.
This new version needs libelementary dependency.

Update upstream url, add hash file and use xz archive.

Select png and jpeg image loader since enlightenment_start
fail at runtime if png and jpeg image loader are not
available in elf libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: update Config.in to use libefl
    improve commit log
    keep the dependency on threads
v3: bymp to 0.19.12
    remove trailing slash (Vicente Bergas)
v2: bump to 0.19.9
    remove glibc only dependency
---
 package/enlightenment/Config.in          | 39 ++++++++++++--------------------
 package/enlightenment/enlightenment.hash |  2 ++
 package/enlightenment/enlightenment.mk   | 22 +++++++-----------
 3 files changed, 24 insertions(+), 39 deletions(-)
 create mode 100644 package/enlightenment/enlightenment.hash

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 58f8f39..2ef8990 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,33 +1,22 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
 	select BR2_PACKAGE_EFL
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_X
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBEVAS_JPEG
-	select BR2_PACKAGE_LIBEVAS_PNG
-	select BR2_PACKAGE_LIBEVAS_EET
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEDJE
-	select BR2_PACKAGE_LIBEFREET
-	select BR2_PACKAGE_LIBEDBUS
-	select BR2_PACKAGE_LIBEIO
-	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_LIBEFL_X
+	select BR2_PACKAGE_LIBEFL_JPEG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_LIBEFL_PNG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_LIBELEMENTARY
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
-	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
-	depends on BR2_USE_WCHAR
-	depends on BR2_INSTALL_LIBSTDCPP
-	# libedbus -> dbus
-	# libedbus -> glib2, libevas
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# libedbus -> dbus, efl libraries
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV # libefl -> libudev
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libefl
+	depends on BR2_USE_MMU # libefl
+	depends on !BR2_STATIC_LIBS # libefl
+	depends on BR2_USE_WCHAR # libefl
 	help
 	  Enlightenment, also known simply as E, is a stacking window
 	  manager for the X Window System which can be used alone or
@@ -37,7 +26,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs a toolchain w/ wchar, C++, threads"
+comment "enlightenment needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
new file mode 100644
index 0000000..c9b1284
--- /dev/null
+++ b/package/enlightenment/enlightenment.hash
@@ -0,0 +1,2 @@
+# From https://phab.enlightenment.org/phame/live/3/post/e19_12_release/
+sha256	55f23c337e3092e735ae37ada8f6701adab5ddd13f37ef38c63eec8a536f0b25	enlightenment-0.19.12.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ddebe06..9127099 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,24 +4,18 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.17.6
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
+ENLIGHTENMENT_VERSION = 0.19.12
+ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
+ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
 ENLIGHTENMENT_LICENSE_FILES = COPYING
 
-ENLIGHTENMENT_DEPENDENCIES = 	\
-	host-pkgconf 		\
-	libecore 		\
-	libeet 			\
-	libeina 		\
-	libevas 		\
+ENLIGHTENMENT_DEPENDENCIES = \
+	host-pkgconf \
+	host-libefl \
+	libefl \
+	libelementary \
 	libevas-generic-loaders \
-	libedje 		\
-	libefreet 		\
-	libedbus 		\
-	libeio 			\
-	host-libedje 		\
-	host-libeet		\
 	xcb-util-keysyms
 
 ENLIGHTENMENT_CONF_OPTS = \
-- 
2.4.3
