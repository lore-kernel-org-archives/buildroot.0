From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:17 +0200
Subject: [Buildroot] [07/37] package/libevas-generic-loaders: move to
	package directory
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-8-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                                              |  1 +
 package/efl/Config.in                                          |  1 -
 package/{efl => }/libevas-generic-loaders/Config.in            | 10 +++++++---
 .../libevas-generic-loaders/libevas-generic-loaders.mk         |  0
 4 files changed, 8 insertions(+), 4 deletions(-)
 rename package/{efl => }/libevas-generic-loaders/Config.in (73%)
 rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 4dfafe7..1d87350 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,6 +242,7 @@ endif
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/libelementary/Config.in"
+	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index cf82f8b..659ee10 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -16,7 +16,6 @@ source "package/efl/libeet/Config.in"
 source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
-source "package/efl/libevas-generic-loaders/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
similarity index 73%
rename from package/efl/libevas-generic-loaders/Config.in
rename to package/libevas-generic-loaders/Config.in
index 3f7581f..47e5aa2 100644
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas generic loaders"
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_WCHAR # efl
+	depends on BR2_USE_MMU # efl
 	help
 	  These are additional "generic" loaders for Evas that are
 	  stand-alone executables that evas may run from its generic
@@ -15,15 +17,17 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	bool "SVG loader"
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
-	depends on BR2_USE_WCHAR # librsvg -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	help
 	  This option enables the Evas generic SVG loader
 
-comment "SVG loader needs a toolchain w/ wchar, threads, C++"
+comment "SVG loader needs a toolchain w/ threads, C++"
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 endif
+
+comment "libevas generic loaders needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
similarity index 100%
rename from package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
rename to package/libevas-generic-loaders/libevas-generic-loaders.mk
-- 
2.4.3
