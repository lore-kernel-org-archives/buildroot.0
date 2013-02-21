From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:31 +0100
Subject: [Buildroot] [PATCH 01/13] libenca: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <9e6a6ffdeccd0105acb1491396ad28a8775cf322.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extremely Naive Charset Analyser.

This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |    1 +
 package/libenca/Config.in                          |    6 ++++
 package/libenca/libenca-1.9-dont-build-tools.patch |   33 ++++++++++++++++++++
 package/libenca/libenca-1.9-fix-clean.patch        |   22 +++++++++++++
 package/libenca/libenca-1.9-fix-prefix.patch       |   19 +++++++++++
 package/libenca/libenca.mk                         |   26 +++++++++++++++
 6 files changed, 107 insertions(+)
 create mode 100644 package/libenca/Config.in
 create mode 100644 package/libenca/libenca-1.9-dont-build-tools.patch
 create mode 100644 package/libenca/libenca-1.9-fix-clean.patch
 create mode 100644 package/libenca/libenca-1.9-fix-prefix.patch
 create mode 100644 package/libenca/libenca.mk

diff --git a/package/Config.in b/package/Config.in
index 3d7866a..e56c13f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -569,6 +569,7 @@ source "package/liblog4c-localtime/Config.in"
 endmenu
 
 menu "Text and terminal handling"
+source "package/libenca/Config.in"
 source "package/enchant/Config.in"
 source "package/libfribidi/Config.in"
 source "package/icu/Config.in"
diff --git a/package/libenca/Config.in b/package/libenca/Config.in
new file mode 100644
index 0000000..5e951ed
--- /dev/null
+++ b/package/libenca/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBENCA
+	bool "libenca"
+	help
+	  Extremely Naive Charset Analyser
+
+	  http://cihar.com/software/enca/
diff --git a/package/libenca/libenca-1.9-dont-build-tools.patch b/package/libenca/libenca-1.9-dont-build-tools.patch
new file mode 100644
index 0000000..16c3747
--- /dev/null
+++ b/package/libenca/libenca-1.9-dont-build-tools.patch
@@ -0,0 +1,33 @@
+diff -ruN libenca-1.9.orig/Makefile.in libenca-1.9/Makefile.in
+--- libenca-1.9.orig/Makefile.in	2011-07-23 20:02:58.304328321 -0400
++++ libenca-1.9/Makefile.in	2011-07-23 20:03:34.246328297 -0400
+@@ -78,7 +78,7 @@
+ DATA = $(pkgconfig_DATA)
+ ETAGS = etags
+ CTAGS = ctags
+-DIST_SUBDIRS = tools script lib src devel-docs test data
++DIST_SUBDIRS = script lib src devel-docs test data
+ DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
+ distdir = $(PACKAGE)-$(VERSION)
+ top_distdir = $(distdir)
+@@ -207,10 +207,10 @@
+ sharedstatedir = @sharedstatedir@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+- at MAINTAINER_MODE_FALSE@SUBDIRS = tools script lib src devel-docs test
++ at MAINTAINER_MODE_FALSE@SUBDIRS = script lib src devel-docs test
+ 
+ # @(#) $Id: Makefile.am,v 1.35 2005/11/24 10:21:32 yeti Exp $
+- at MAINTAINER_MODE_TRUE@SUBDIRS = tools data script lib src devel-docs test
++ at MAINTAINER_MODE_TRUE@SUBDIRS = data script lib src devel-docs test
+ man_MANS = man/enca.1
+ DISTCHECK_CONFIGURE_FLAGS = --enable-maintainer-mode
+ M4TESTS = \
+@@ -223,7 +223,6 @@
+   m4/long-text.l2 \
+   m4/recode-bugs.m4 \
+   m4/scanf.m4 \
+-  m4/tools.m4 \
+   m4/typevar.m4
+ 
+ EXTRA_DIST = \
diff --git a/package/libenca/libenca-1.9-fix-clean.patch b/package/libenca/libenca-1.9-fix-clean.patch
new file mode 100644
index 0000000..9c6f097
--- /dev/null
+++ b/package/libenca/libenca-1.9-fix-clean.patch
@@ -0,0 +1,22 @@
+--- libenca-1.9.orig/src/Makefile.in	2011-07-23 20:19:28.744327998 -0400
++++ libenca-1.9/src/Makefile.in	2011-07-23 20:22:47.894327936 -0400
+@@ -694,7 +694,7 @@
+ 	cd $(DESTDIR)$(bindir); \
+ 	inst1=`echo enca | sed '$(transform)'`; \
+ 	inst2=`echo enconv | sed '$(transform)'`; \
+-	$(LN_S) $$inst1$(EXEEXT) $$inst2$(EXEEXT)
++	ln -sf $$inst1$(EXEEXT) $$inst2$(EXEEXT)
+ 
+ uninstall-hook:
+ 	inst=`echo enconv | sed '$(transform)'`; \
+--- libenca-1.9.orig/Makefile.in	2011-07-23 20:19:28.746327999 -0400
++++ libenca-1.9/Makefile.in	2011-07-23 20:36:48.742327668 -0400
+@@ -768,7 +768,7 @@
+ 	cd $(DESTDIR)$(man1dir); \
+ 	inst1=`echo enca | sed '$(transform)'`.1; \
+ 	inst2=`echo enconv | sed '$(transform)'`.1; \
+-	$(LN_S) $$inst1 $$inst2
++	$(LN_S)f $$inst1 $$inst2
+ 
+ uninstall-hook:
+ 	inst=`echo enconv | sed '$(transform)'`.1; \
diff --git a/package/libenca/libenca-1.9-fix-prefix.patch b/package/libenca/libenca-1.9-fix-prefix.patch
new file mode 100644
index 0000000..d268b5d
--- /dev/null
+++ b/package/libenca/libenca-1.9-fix-prefix.patch
@@ -0,0 +1,19 @@
+--- libenca-1.9.orig/configure
++++ libenca-1.9/configure
+
+@@ -20808,15 +20808,6 @@ _ACEOF
+ fi
+ 
+ 
+-if test "$prefix" = "NONE"; then
+-  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+-fi
+-
+-
+ case "$target" in
+ NONE) yeti_libm_target="$host" ;;
+ *) yeti_libm_target="$target" ;;
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
new file mode 100644
index 0000000..e9dba18
--- /dev/null
+++ b/package/libenca/libenca.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# libenca
+#
+#############################################################
+
+LIBENCA_VERSION = 1.9
+LIBENCA_SITE = http://dl.cihar.com/enca
+LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.bz2
+LIBENCA_INSTALL_STAGING = YES
+LIBENCA_LICENSE = GPLv2
+LIBENCA_LICENSE_FILES = COPYING
+
+LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes
+LIBENCA_CONF_ENV += ac_cv_file__dev_urandom=yes
+LIBENCA_CONF_ENV += ac_cv_file__dev_arandom=no
+LIBENCA_CONF_ENV += ac_cv_file__dev_srandom=no
+LIBENCA_CONF_ENV += yeti_cv_func_scanf_modif_size_t=yes
+
+define LIBENCA_MAKE_HOST_TOOL
+cd $(@D)/tools && $(HOSTCC) -o make_hash make_hash.c
+endef
+
+LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
+
+$(eval $(autotools-package))
-- 
1.7.10.4
