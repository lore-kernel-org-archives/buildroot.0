From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 00:02:58 +0100
Subject: [Buildroot] [git commit] gob2: remove deprecated target package
Message-ID: <20150125233550.8DD967FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f9d4441159836b1a3ba9b214f318943bbda4b44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated for a year now so remove the target variant.

Also rename patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |    8 ++++++++
 package/Config.in                                  |    1 -
 ...x.patch => 0001-dont-include-from-prefix.patch} |    0
 package/gob2/Config.in                             |   20 --------------------
 package/gob2/gob2.mk                               |    2 --
 5 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9bd2fde..50591af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_GOB2
+	bool "gob2 target package removed"
+	select BR2_LEGACY
+	help
+	  The gob2 target package has been removed, it's been
+	  deprecated for some time now and was essentially useless
+	  without a target toolchain.
+
 config BR2_PACKAGE_DISTCC
 	bool "distcc target package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f04464e..d3d2f39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,7 +246,6 @@ comment "X applications"
 	source "package/feh/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/gmpc/Config.in"
-	source "package/gob2/Config.in"
 	source "package/gqview/Config.in"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
diff --git a/package/gob2/gob2-01-dont-include-from-prefix.patch b/package/gob2/0001-dont-include-from-prefix.patch
similarity index 100%
rename from package/gob2/gob2-01-dont-include-from-prefix.patch
rename to package/gob2/0001-dont-include-from-prefix.patch
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
deleted file mode 100644
index bd9ba1f..0000000
--- a/package/gob2/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_GOB2
-	bool "gob2"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # bison, glib2
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_BISON
-	# development tool, useless on the target
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	help
-	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
-	  the writing of GObjects in C.
-
-	  http://www.jirka.org/gob.html
-
-comment "gob2 needs a toolchain w/ wchar"
-	depends on BR2_USE_MMU
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index e4f1396..04d02e1 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,10 +7,8 @@
 GOB2_VERSION = 2.0.20
 GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.xz
 GOB2_SITE = http://ftp.5z.com/pub/gob
-GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # gob2 for the host
