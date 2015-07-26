From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:35 +0200
Subject: [Buildroot] [RFC 25/37] package/enlightenment: bump to version
	0.19.7
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-26-git-send-email-romain.naour@openwide.fr>
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
 package/enlightenment/Config.in          | 36 +++++++++++---------------------
 package/enlightenment/enlightenment.hash |  2 ++
 package/enlightenment/enlightenment.mk   | 22 +++++++------------
 3 files changed, 22 insertions(+), 38 deletions(-)
 create mode 100644 package/enlightenment/enlightenment.hash

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 1af42c7..4db11a8 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,32 +1,20 @@
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
+	depends on BR2_TOOLCHAIN_USES_GLIBC # efl
+	depends on BR2_USE_MMU # efl
 	help
 	  Enlightenment, also known simply as E, is a stacking window
 	  manager for the X Window System which can be used alone or
@@ -36,7 +24,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs a toolchain w/ wchar, C++, threads"
+comment "enlightenment needs udev /dev management and a (e)glibc toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
new file mode 100644
index 0000000..2c8e2ec
--- /dev/null
+++ b/package/enlightenment/enlightenment.hash
@@ -0,0 +1,2 @@
+# From https://phab.enlightenment.org/phame/live/3/post/e19_7_release/
+sha256	5737d7abfd536a665dcd927a0fc8d65fd566b206f9994fd0c997677d0871a320 enlightenment-0.19.7.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ddebe06..d589571 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,24 +4,18 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.17.6
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
+ENLIGHTENMENT_VERSION = 0.19.7
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
