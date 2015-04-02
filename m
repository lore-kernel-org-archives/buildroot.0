From: Jan Heylen <heyleke@gmail.com>
Date: Thu,  2 Apr 2015 09:23:42 +0200
Subject: [Buildroot] [PATCH v2] elfutils: Add a --{enable,
	disable}-backends option
Message-ID: <1427959422-21951-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a --{enable,disable}-backends configuration option to elfutils. This
allows to selectively disable the compilation of the libebl backends
shared libraries. This is usefull when some application require linking
against the elfutils libelf, but don't require the backends to be available
on target.

Signed-off-by: Jan Heylen <heyleke@gmail.com>

---
Changes v1 -> v2:
  - properly signed-off marking and description in patch file
  - fixed typo in patch file
---
 package/elfutils/0007-backends-configurable.patch | 56 +++++++++++++++++++++++
 package/elfutils/Config.in                        | 13 ++++++
 package/elfutils/elfutils.mk                      |  6 +++
 3 files changed, 75 insertions(+)
 create mode 100644 package/elfutils/0007-backends-configurable.patch

diff --git a/package/elfutils/0007-backends-configurable.patch b/package/elfutils/0007-backends-configurable.patch
new file mode 100644
index 0000000..e4d0f75
--- /dev/null
+++ b/package/elfutils/0007-backends-configurable.patch
@@ -0,0 +1,56 @@
+Add a --{enable,disable}-backends option
+
+Add a --{enable,disable}-backends configuration option to elfutils. This
+allows to selectively disable the compilation of the libebl backends
+shared libraries. This is usefull when some application require linking
+against the elfutils libelf, but don't require the backends to be available
+at runtime on target.
+
+Based on the disable-progs patch by Thomas Petazzoni/Vicente Olivert Riera.
+
+Signed-off-by: Jan Heylen <heyleke@gmail.com>
+
+Index: elfutils-0.161/Makefile.am
+===================================================================
+--- elfutils-0.161.orig/Makefile.am	2015-04-01 19:56:35.090112704 +0200
++++ elfutils-0.161/Makefile.am	2015-04-01 19:59:19.688605184 +0200
+@@ -22,13 +22,18 @@
+ 
+ pkginclude_HEADERS = version.h
+ 
++# Add doc back when we have some real content.
++SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm
++
++if ENABLE_BACKENDS
++  SUBDIRS += backends
++endif
++
+ if ENABLE_PROGS
+-PROGS_SUBDIR = src
++  SUBDIRS += src
+ endif
+ 
+-# Add doc back when we have some real content.
+-SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
+-	  backends $(PROGS_SUBDIR) tests
++SUBDIRS += tests
+ 
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+ 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
+Index: elfutils-0.161/configure.ac
+===================================================================
+--- elfutils-0.161.orig/configure.ac	2015-04-01 19:56:35.090112704 +0200
++++ elfutils-0.161/configure.ac	2015-04-01 19:56:35.086112308 +0200
+@@ -253,6 +253,12 @@
+ AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
+ AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
+ 
++AC_ARG_ENABLE([backends],
++	AS_HELP_STRING([--enable-backends], [enable backends]),
++	enable_backends=$enableval,
++	enable_backends=yes)
++AM_CONDITIONAL(ENABLE_BACKENDS, test "$enable_backends" = yes)
++
+ AC_CHECK_FUNC([argp_parse])
+ if test "$ac_cv_func_argp_parse" != yes; then
+ 	AC_CHECK_LIB([argp],[argp_parse],ARGP_LIBS=-largp,
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index cb9a658..fc85013 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -30,4 +30,17 @@ config BR2_PACKAGE_ELFUTILS_PROGS
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
 
+config BR2_PACKAGE_ELFUTILS_BACKENDS
+	bool "Build and install backend shared libraries"
+	default y
+	help
+	  This option tells elfutils to not only install the libelf
+	  libraries, but also the libebl backend shared libraries
+	  with architecture specific code to read elf files. If you
+	  intend to use libelf/libebl at-runtime, say 'y' here.
+	  If you only need to link against libelf at-compile-time,
+	  but not really using it, you can leave the architecture
+	  specific backends uninstalled. Loading of the backend library
+	  by libebl will fail in that case.
+
 endif
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 9901bcb..8b2cfd8 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -65,4 +65,10 @@ else
 ELFUTILS_CONF_OPTS += --disable-progs
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS_BACKENDS),y)
+ ELFUTILS_CONF_OPTS += --enable-backends
+else
+ ELFUTILS_CONF_OPTS += --disable-backends
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
