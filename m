From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Oct 2020 20:11:45 +0200
Subject: [Buildroot] [git commit] package/libcroco: drop package
Message-ID: <20201016180019.030A283ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fe9994c893e59b5572fe9d33744ce2322d99333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop libcrococo as it is affected by several security issues such as
CVE-2020-12825 which will never be fixed as this project has been
archived:
https://gitlab.gnome.org/Archive/libcroco/-/issues/8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               |  8 ++++++++
 package/Config.in              |  1 -
 package/libcroco/Config.in     | 20 --------------------
 package/libcroco/libcroco.hash |  5 -----
 package/libcroco/libcroco.mk   | 21 ---------------------
 5 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 53be724634..9d60cfea75 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_LIBCROCO
+	bool "libcroco package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is affected by several
+	  security issues such as CVE-2020-12825 which will never be
+	  fixed as libcroco has been archived.
+
 config BR2_PACKAGE_BELLAGIO
 	bool "bellagio package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 22d4bcf27c..504cfec98e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1864,7 +1864,6 @@ menu "Other"
 	source "package/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
-	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
diff --git a/package/libcroco/Config.in b/package/libcroco/Config.in
deleted file mode 100644
index ad78a147e4..0000000000
--- a/package/libcroco/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_LIBCROCO
-	bool "libcroco"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  Libcroco is a standalone css2 parsing and manipulation
-	  library. The parser provides a low level event driven SAC
-	  like api and a css object model like api.
-
-	  Libcroco provides a CSS2 selection engine and an
-	  experimental xml/css rendering engine.
-
-	  https://github.com/GNOME/libcroco
-
-comment "libcroco needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libcroco/libcroco.hash b/package/libcroco/libcroco.hash
deleted file mode 100644
index b998206422..0000000000
--- a/package/libcroco/libcroco.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.13.sha256sum
-sha256	767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4	libcroco-0.6.13.tar.xz
-
-# Hash for license file:
-sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING.LIB
diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
deleted file mode 100644
index c717c9a212..0000000000
--- a/package/libcroco/libcroco.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# libcroco
-#
-################################################################################
-
-LIBCROCO_VERSION_MAJOR = 0.6
-LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).13
-LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSION_MAJOR)
-LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
-LIBCROCO_INSTALL_STAGING = YES
-LIBCROCO_DEPENDENCIES = host-pkgconf libglib2 libxml2
-HOST_LIBCROCO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2
-LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
-# NEWS states that it's only LGPL
-# Source code says v2.1+ even though COPYING.LIB is v2
-LIBCROCO_LICENSE = LGPL-2.1+
-LIBCROCO_LICENSE_FILES = COPYING.LIB
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
