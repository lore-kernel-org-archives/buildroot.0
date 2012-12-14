From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 12:02:33 +0100
Subject: [Buildroot] [git commit] gettext: bump to version 0.18.1.1
Message-ID: <20121214110239.B5DC29A1E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=933ebedd200088600809a1149bb1670c58e25c62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/Config.in                          |    3 +
 package/gettext/gettext-disable-tests.patch        |   37 -----
 .../gettext/gettext-uclibc-sched_param-def.patch   |   20 +++
 package/gettext/gettext.mk                         |   12 ++-
 package/gettext/libdir-la.patch                    |  154 --------------------
 5 files changed, 34 insertions(+), 192 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index ee7d8cb..a97b835 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -16,6 +16,9 @@ config BR2_PACKAGE_GETTEXT
 config BR2_PACKAGE_GETTEXT_TOOLS
 	bool "Install gettext tools"
 	depends on BR2_PACKAGE_GETTEXT
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  This option allows to install the complete gettext suite in
 	  the target filesystem. This is typically not useful for
diff --git a/package/gettext/gettext-disable-tests.patch b/package/gettext/gettext-disable-tests.patch
deleted file mode 100644
index eded261..0000000
--- a/package/gettext/gettext-disable-tests.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Disable gettext tests that require threads
-
-gettext fails to build with a toolchain with no threads support just
-because some gettext tests (that aren't used in Buildroot) require
-threads. We therefore disable the build of such tests.
-
-Since the change in Makefile.in is simple, we also make it in this
-patch, which avoids the need to autoreconf the gettext package.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/gettext-tools/Makefile.am
-===================================================================
---- a/gettext-tools/Makefile.am
-+++ b/gettext-tools/Makefile.am
-@@ -20,7 +20,7 @@
- AUTOMAKE_OPTIONS = 1.5 gnu no-dependencies
- ACLOCAL_AMFLAGS = -I m4 -I ../gettext-runtime/m4 -I ../autoconf-lib-link/m4 -I ../m4 -I gnulib-m4 -I libgettextpo/gnulib-m4
- 
--SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 tests examples
-+SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 examples
- 
- EXTRA_DIST = misc/DISCLAIM
- MOSTLYCLEANFILES = core *.stackdump
-Index: b/gettext-tools/Makefile.in
-===================================================================
---- a/gettext-tools/Makefile.in
-+++ b/gettext-tools/Makefile.in
-@@ -484,7 +484,7 @@
- top_srcdir = @top_srcdir@
- AUTOMAKE_OPTIONS = 1.5 gnu no-dependencies
- ACLOCAL_AMFLAGS = -I m4 -I ../gettext-runtime/m4 -I ../autoconf-lib-link/m4 -I ../m4 -I gnulib-m4 -I libgettextpo/gnulib-m4
--SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 tests examples
-+SUBDIRS = doc intl gnulib-lib libgrep libuniname src libgettextpo po projects misc man m4 examples
- 
- # Allow users to use "gnulib-tool --update".
- 
diff --git a/package/gettext/gettext-uclibc-sched_param-def.patch b/package/gettext/gettext-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..4e39278
--- /dev/null
+++ b/package/gettext/gettext-uclibc-sched_param-def.patch
@@ -0,0 +1,20 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+http://bugs.gentoo.org/336484
+http://bugs.gentoo.org/323377
+
+--- gettext/gettext-tools/gnulib-lib/spawn.in.h
++++ gettext/gettext-tools/gnulib-lib/spawn.in.h
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 74f5218..77881d3 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -3,14 +3,18 @@
 # gettext
 #
 #############################################################
-GETTEXT_VERSION = 0.16.1
+
+GETTEXT_VERSION = 0.18.1.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
 
+GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 GETTEXT_CONF_OPT += \
 	--disable-libasprintf \
+	--disable-acl \
 	--disable-openmp \
 	--disable-rpath \
 	--disable-java \
@@ -34,6 +38,12 @@ ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
 define GETTEXT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
 endef
+# Ditch the tools since they're off and pull other dependencies
+define GETTEXT_DISABLE_TOOLS
+	$(SED) 's/runtime gettext-tools/runtime/' $(@D)/Makefile.in
+endef
 endif # GETTEXT_TOOLS = n
 
+GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TOOLS
+
 $(eval $(autotools-package))
diff --git a/package/gettext/libdir-la.patch b/package/gettext/libdir-la.patch
deleted file mode 100644
index d5076c1..0000000
--- a/package/gettext/libdir-la.patch
+++ /dev/null
@@ -1,154 +0,0 @@
---- gettext-0.14.6/autoconf-lib-link/build-aux/ltmain.sh.orig	2007-01-13 14:33:23.000000000 -0700
-+++ gettext-0.14.6/autoconf-lib-link/build-aux/ltmain.sh	2007-01-13 14:35:10.000000000 -0700
-@@ -234,8 +234,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2324,8 +2325,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2800,6 +2807,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
-@@ -5210,6 +5227,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5528,10 +5549,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
---- gettext-0.14.6/build-aux/ltmain.sh.orig	2005-05-20 15:03:38.000000000 -0600
-+++ gettext-0.14.6/build-aux/ltmain.sh	2007-01-13 14:34:27.000000000 -0700
-@@ -234,8 +234,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2324,8 +2325,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2800,6 +2807,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
-@@ -5210,6 +5227,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5528,10 +5549,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
