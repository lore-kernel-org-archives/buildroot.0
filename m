From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:18 +0200
Subject: [Buildroot] [PATCH v4 02/35] package/libevas-generic-loaders: move
	to package directory
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As for expedite package, there is no advantage for efl related
packages to share the same version number anymore
(except for efl and libelementary).

Also, we usually do not have a sub-directory for a family of related
packages which doen't share the same version number, so move
libevas-generic-loaders to package directory.
Libevas-generic-loaders appear now in "Libraries" -> "Graphics" in
the Kconfig menu.

Since libevas-generic-loaders now select the efl package, propagate
the reverse dependencies on mmu and wchar.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: improve the commit log (ThomasP)
    move libevas-generic-loaders to "Libraries" -> "Graphics" (ThomasP)
    fix package comment dependency on BR2_USE_MMU
---
 package/Config.in                                             |  1 +
 package/efl/Config.in                                         |  1 -
 package/{efl => }/libevas-generic-loaders/Config.in           | 11 ++++++++---
 .../libevas-generic-loaders/libevas-generic-loaders.mk        |  0
 4 files changed, 9 insertions(+), 4 deletions(-)
 rename package/{efl => }/libevas-generic-loaders/Config.in (71%)
 rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 0897eb8..8f4b520 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -818,6 +818,7 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libevas-generic-loaders/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
 	source "package/libfreeimage/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index cb91660..7ce5a36 100644
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
similarity index 71%
rename from package/efl/libevas-generic-loaders/Config.in
rename to package/libevas-generic-loaders/Config.in
index 3f7581f..456bf66 100644
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
@@ -15,15 +17,18 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
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
+	depends on BR2_USE_MMU
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
similarity index 100%
rename from package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
rename to package/libevas-generic-loaders/libevas-generic-loaders.mk
-- 
2.4.3
