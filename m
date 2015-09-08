From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:20:00 +0200
Subject: [Buildroot] [PACH v2 26/38] package/enlightenment: bump to version
	0.19.9
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-27-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update url, add hash file, use xz archive and switch
select to efl-core.
Add efl reverse dependencies.

Select png and jpeg image loader since enlightenment_start
fail if png and jpeg image loader is not available in elf
libraries.

Also select libelementary

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: bump to 0.19.9
    remove glibc only dependency
---
 package/enlightenment/Config.in          | 37 +++++++++++---------------------
 package/enlightenment/enlightenment.hash |  2 ++
 package/enlightenment/enlightenment.mk   | 22 +++++++------------
 3 files changed, 23 insertions(+), 38 deletions(-)
 create mode 100644 package/enlightenment/enlightenment.hash

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 1af42c7..ce53511 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,32 +1,21 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
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
+	select BR2_PACKAGE_EFL
+	select BR2_PACKAGE_EFL_X
+	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
+	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
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
 	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV # efl -> libudev
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # efl
+	depends on !BR2_STATIC_LIBS # efl
+	depends on BR2_USE_WCHAR # efl
 	help
 	  Enlightenment, also known simply as E, is a stacking window
 	  manager for the X Window System which can be used alone or
@@ -36,7 +25,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs a toolchain w/ wchar, C++, threads"
+comment "enlightenment needs udev /dev management and a toolchain w/ C++, dynamic library, wchar"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
new file mode 100644
index 0000000..5cec889
--- /dev/null
+++ b/package/enlightenment/enlightenment.hash
@@ -0,0 +1,2 @@
+# From https://phab.enlightenment.org/phame/live/3/post/e19_9_release/
+sha256	25337975e7c24767ad389db199b8ff0ff3a4f35e3b10c0a3bdbd2eb702f757aa	enlightenment-0.19.9.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ddebe06..91bc50b 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,24 +4,18 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.17.6
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
+ENLIGHTENMENT_VERSION = 0.19.9
+ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
+ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment/
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
+	host-efl \
+	efl \
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
