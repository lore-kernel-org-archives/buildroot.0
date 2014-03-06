From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  7 Mar 2014 00:18:20 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: disable documentation
Message-ID: <1394147900-16917-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --disable-docs option in the configure script.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: Remove useless "else" in Makefile.am (Arnout)
    Fix test "$wantdocs" = "yes"
    Add Documentation install status (yes/no)
    upstream status: patch sent

v2: Add an option in configure script
    instead of patching the Makefile (Arnout)
    upstream status: it's not sent yet
---
 .../imagemagick-02-Add-disable-docs-option.patch   | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/imagemagick/imagemagick-02-Add-disable-docs-option.patch

diff --git a/package/imagemagick/imagemagick-02-Add-disable-docs-option.patch b/package/imagemagick/imagemagick-02-Add-disable-docs-option.patch
new file mode 100644
index 0000000..397f328
--- /dev/null
+++ b/package/imagemagick/imagemagick-02-Add-disable-docs-option.patch
@@ -0,0 +1,86 @@
+From 9cebb8b6f17d7f08313a47bf0d11b4561591eff4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 2 Mar 2014 21:09:37 +0100
+Subject: [PATCH 1/1] configure: Add --disable-docs option
+
+The manual and html data are unconditionally installed on target.
+Some users may only want the executable.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.am  | 11 +++++++++--
+ configure.ac | 10 ++++++++++
+ 2 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c74a870..0741336 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -156,19 +156,22 @@ pkgconfig_DATA = \
+ %- at MAGICK_MAJOR_VERSION@. at MAGICK_ABI_SUFFIX@.pc: %.pc
+ 	cp -f $^ $@
+ 
++# Architecture independent data files installed in the package's data directory
++docdir = $(DOCUMENTATION_PATH)
++
+ # Manual pages to install
++if INSTALL_DOC
+ man_MANS = \
+ 	$(MAGICK_MANS) \
+ 	$(WAND_MANS) \
+ 	$(MAGICKPP_MANS) \
+ 	$(UTILITIES_MANS)
+ 
+-# Architecture independent data files installed in the package's data directory
+-docdir = $(DOCUMENTATION_PATH)
+ doc_DATA = \
+ 	LICENSE \
+ 	ChangeLog \
+ 	NEWS.txt
++endif
+ 
+ if MAINTAINER_MODE
+ MAINTAINER_TARGETS = \
+@@ -236,7 +239,11 @@ pkgdocdir = $(DOCUMENTATION_PATH)
+ DOCDIRSDOXYGEN = www/api/MagickCore www/api/MagickWand
+ DOCDIRSMANUAL = images images/patterns www www/api www/source www/Magick++
+ DOCDIRS= $(DOCDIRSMANUAL) $(DOCDIRSDOXYGEN)
++
++if INSTALL_DOC
+ HTML_INSTALL_DATA_TARGETS = install-data-html
++endif
++
+ install-data-html:
+ 	$(mkinstalldirs) $(DESTDIR)$(pkgdocdir)
+ 	$(INSTALL_DATA) $(srcdir)/index.html $(DESTDIR)$(pkgdocdir)
+diff --git a/configure.ac b/configure.ac
+index 2b7f138..c0dc4f2 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -3173,6 +3173,14 @@ esac
+ AC_DEFINE_UNQUOTED(DOCUMENTATION_PATH,"$DEFINE_DOCUMENTATION_PATH",[Directory where ImageMagick documents live.])
+ AC_SUBST(DOCUMENTATION_PATH)
+ 
++#
++# Enable/Disable documentation
++AC_ARG_ENABLE([docs],
++  [AS_HELP_STRING([--disable-docs],
++    [disable building of documentation])],
++  wantdocs=$enableval, wantdocs=yes)
++AM_CONDITIONAL([INSTALL_DOC], [test "$wantdocs" = "yes"])
++
+ # Subdirectory to place architecture-dependent configuration files
+ CONFIGURE_RELATIVE_PATH="${PACKAGE_NAME}-${MAGICK_MAJOR_VERSION}"
+ AC_DEFINE_UNQUOTED(CONFIGURE_RELATIVE_PATH,"$CONFIGURE_RELATIVE_PATH",[Subdirectory of lib where architecture-dependent configuration files live.])
+@@ -4070,6 +4078,8 @@ Quantum depth     --with-quantum-depth=$with_quantum_depth	$with_quantum_depth
+ High Dynamic Range Imagery
+                   --enable-hdri=$enable_hdri		$enable_hdri
+ 
++Install documentation:		$wantdocs
++
+ Delegate Configuration:
+ BZLIB             --with-bzlib=$with_bzlib		$have_bzlib
+ Autotrace         --with-autotrace=$with_autotrace		$have_autotrace
+-- 
+1.8.5.3
+
-- 
1.8.5.3
