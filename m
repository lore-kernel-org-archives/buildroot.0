From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:44 +0100
Subject: [Buildroot] [PATCH 04/15] elfutils: make it possible to only
	install the libraries
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <261dc8522b7cf032cd18f5432fce1ffc50d6b635.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add and use a --{enable,disable}-progs configuration option to
selectively enable or disable the elfutils programs. Generally, on an
embedded system, the libraries are more useful than the programs, and
being able to not build the programs will make it easier to build the
elfutils libraries on uClibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in                       |   13 ++++++
 package/elfutils/elfutils-01-disable-progs.patch |   47 ++++++++++++++++++++++
 package/elfutils/elfutils.mk                     |    6 +++
 3 files changed, 66 insertions(+)
 create mode 100644 package/elfutils/elfutils-01-disable-progs.patch

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 836ce4c..87744b5 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -12,4 +12,17 @@ config BR2_PACKAGE_ELFUTILS
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
 
+	  Note that this option only installs the libraries, and not
+	  the programs.
+
 	  https://fedorahosted.org/elfutils
+
+if BR2_PACKAGE_ELFUTILS
+
+config BR2_PACKAGE_ELFUTILS_PROGS
+	bool "Install programs"
+	help
+	  This option tells elfutils to not only install the libelf
+	  libraries, but also the elfutils programs.
+
+endif
diff --git a/package/elfutils/elfutils-01-disable-progs.patch b/package/elfutils/elfutils-01-disable-progs.patch
new file mode 100644
index 0000000..462de89
--- /dev/null
+++ b/package/elfutils/elfutils-01-disable-progs.patch
@@ -0,0 +1,47 @@
+Add a --{enable,disable}-progs configure option
+
+Add a --{enable,disable}-progs configuration option to elfutils. This
+allows to selectively disable the compilation of the elfutils programs
+(in which case only the libraries are built and installed). This is
+useful because the programs are often not needed, and also because
+building the programs against uClibc causes several issues (lack of
+obstack_printf() in uClibc for example).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -22,9 +22,13 @@
+ 
+ pkginclude_HEADERS = version.h
+ 
++if ENABLE_PROGS
++PROGS_SUBDIR = src
++endif
++
+ # Add doc back when we have some real content.
+ SUBDIRS = config m4 lib libelf libebl libdwfl libdw libcpu libasm backends \
+-	  src po tests
++	  $(PROGS_SUBDIR) po tests
+ 
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+ 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -263,6 +263,12 @@
+ AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
+ AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
+ 
++AC_ARG_ENABLE([progs],
++	AS_HELP_STRING([--enable-progs], [enable progs]),
++	enable_progs=$enableval,
++	enable_progs=yes)
++AM_CONDITIONAL(ENABLE_PROGS, test "$enable_progs" = yes)
++
+ dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
+ dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
+ save_LIBS="$LIBS"
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 2750060..f8a4e85 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -46,4 +46,10 @@ else
  ELFUTILS_CONF_OPT += --without-lzma
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
+ ELFUTILS_CONF_OPT += --enable-progs
+else
+ ELFUTILS_CONF_OPT += --disable-progs
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
