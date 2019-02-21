From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:14:40 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/madplay: needs
 autoreconf
Message-ID: <20190221161923.23EB1860B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a56499bcffd5eb25186f8b1276ab2669ce94d0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

madplay uses a very old configure script.

When the toolchain lacks C++ and the build machine lacks /lib/cpp, this
old configure script fails because it can't find a C++ preprocessor that
is valid:

    checking for arm-buildroot-linux-uclibcgnueabi-g++... no
    checking whether we are using the GNU C++ compiler... no
    checking whether no accepts -g... no
    checking dependency style of no... none
    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check
    See `config.log' for more details.

This is yet another case that was tentatively fixed by bd39d11d2e
(core/infra: fix build on toolchain without C++), further amended by
4cd1ab15886 (core: alternate solution to disable C++).

However, this only works on libtool scripts that are recent enough, and
thus we need to autoreconf to get it.

We also need to patch configure.ac so that it does not fail on the
missing, GNU-specific files: NEWS, AUTHORS, and Changelog.

Finally, remove also patch on ltmain.sh and MADPLAY_LIBTOOL_PATCH=NO as
autoreconf will create an up to date ltmain.sh

Fixes:
 - http://autobuild.buildroot.org/results/fc927de0e9a42095789fb0a631d5facf14076f6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c05cc5de868cc5af27afdb1451e30fcd1ecb2856)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-buildroot-libtool-v1.5.patch.patch        | 109 ---------------------
 .../0002-configure-ac-automake-foreign.patch       |  16 +++
 package/madplay/madplay.mk                         |   5 +-
 3 files changed, 20 insertions(+), 110 deletions(-)

diff --git a/package/madplay/0002-buildroot-libtool-v1.5.patch.patch b/package/madplay/0002-buildroot-libtool-v1.5.patch.patch
deleted file mode 100644
index 2be336384b..0000000000
--- a/package/madplay/0002-buildroot-libtool-v1.5.patch.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From ce661985c098635965573aac8fc983a72f60d396 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 30 May 2017 16:42:34 +0200
-Subject: [PATCH] buildroot-libtool-v1.5.patch
-
-Apply buildroot-libtool-v1.5.patch rebased on libtool 1.5.2 used
-in madplay and fixing all conflicts.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ltmain.sh | 40 ++++++++++++++++++++++++++++++----------
- 1 file changed, 30 insertions(+), 10 deletions(-)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 4b9f940..0b71220 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -164,6 +164,11 @@ do
-   arg="$1"
-   shift
- 
-+  # Make -static behave as -all-static
-+  case $arg in
-+  -static) arg="-all-static" ;;
-+  esac
-+
-   case $arg in
-   -*=*) optarg=`$echo "X$arg" | $Xsed -e 's/[-_a-zA-Z0-9]*=//'` ;;
-   *) optarg= ;;
-@@ -549,8 +554,9 @@ if test -z "$show_help"; then
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit 1
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit 1
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -1228,7 +1234,8 @@ EOF
-       prevarg="$arg"
- 
-       case $arg in
--      -all-static)
-+      # Make -static behave like -all-static
-+      -all-static | -static)
- 	if test -n "$link_static_flag"; then
- 	  compile_command="$compile_command $link_static_flag"
- 	  finalize_command="$finalize_command $link_static_flag"
-@@ -2135,8 +2142,14 @@ EOF
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
- 	else
- 	  dir="$ladir/$objdir"
-@@ -2261,7 +2274,7 @@ EOF
- 	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
- 	  if test "$installed" = no; then
- 	    notinst_deplibs="$notinst_deplibs $lib"
--	    need_relink=yes
-+	    need_relink=no
- 	  fi
- 	  # This is a shared library
- 	
-@@ -5146,6 +5159,10 @@ fi\
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
-@@ -5464,10 +5481,13 @@ relink_command=\"$relink_command\""
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit 1
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit 1
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
--- 
-2.9.4
-
diff --git a/package/madplay/0002-configure-ac-automake-foreign.patch b/package/madplay/0002-configure-ac-automake-foreign.patch
new file mode 100644
index 0000000000..38d1630987
--- /dev/null
+++ b/package/madplay/0002-configure-ac-automake-foreign.patch
@@ -0,0 +1,16 @@
+configure.ac: don't require GNU-specific files when running automake
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -durN madplay-0.15.2b-orig/configure.ac madplay-0.15.2b/configure.ac
+--- madplay-0.15.2b-orig/configure.ac	2019-02-14 21:34:01.507212449 +0100
++++ madplay-0.15.2b/configure.ac	2019-02-14 21:34:23.439336353 +0100
+@@ -26,7 +26,7 @@
+ 
+ AC_CONFIG_SRCDIR([madplay.c])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER([config.h])
+ 
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index e72e2f8180..dd54e2e78f 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -8,9 +8,12 @@ MADPLAY_VERSION = 0.15.2b
 MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
 MADPLAY_LICENSE = GPL-2.0+
 MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
-MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
 
+# Force autoreconf to be able to use a more recent libtool script, that
+# is able to properly behave in the face of a missing C++ compiler.
+MADPLAY_AUTORECONF = YES
+
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
