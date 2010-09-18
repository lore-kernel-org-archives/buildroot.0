From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:47 +0200
Subject: [Buildroot] [PATCH 5/7] expat: comply with new libtool policy
In-Reply-To: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284832789-22631-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <lionel.landwerlin@pace.com>

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
---
 ...pat-2.0.1-Do-not-include-packaged-libtool.patch |   25 +++++++
 package/expat/expat-libdir-la.patch                |   77 --------------------
 package/expat/expat.mk                             |    2 -
 3 files changed, 25 insertions(+), 79 deletions(-)
 create mode 100644 package/expat/expat-2.0.1-Do-not-include-packaged-libtool.patch
 delete mode 100644 package/expat/expat-libdir-la.patch

diff --git a/package/expat/expat-2.0.1-Do-not-include-packaged-libtool.patch b/package/expat/expat-2.0.1-Do-not-include-packaged-libtool.patch
new file mode 100644
index 0000000..5165e84
--- /dev/null
+++ b/package/expat/expat-2.0.1-Do-not-include-packaged-libtool.patch
@@ -0,0 +1,25 @@
+From cbe99fa8d8bd9f1b6dd85c3423c91daea2c6b4be Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 11:30:42 +0200
+Subject: [PATCH] Do not include packaged libtool.m4 file
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ configure.in |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 24bcb40..1c3f31b 100755
+--- a/configure.in
++++ b/configure.in
+@@ -50,7 +50,6 @@ LIBAGE=5
+ 
+ AC_CONFIG_HEADER(expat_config.h)
+ 
+-sinclude(conftools/libtool.m4)
+ sinclude(conftools/ac_c_bigendian_cross.m4)
+ 
+ AC_LIBTOOL_WIN32_DLL
+-- 
+1.6.0.6
+
diff --git a/package/expat/expat-libdir-la.patch b/package/expat/expat-libdir-la.patch
deleted file mode 100644
index 1c8930e..0000000
--- a/package/expat/expat-libdir-la.patch
+++ /dev/null
@@ -1,77 +0,0 @@
---- expat-2.0.0/conftools/ltmain.sh.orig	2007-01-13 14:39:51.000000000 -0700
-+++ expat-2.0.0/conftools/ltmain.sh	2007-01-13 14:39:56.000000000 -0700
-@@ -273,8 +273,9 @@
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
-@@ -2404,8 +2405,14 @@
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
-@@ -2886,6 +2893,16 @@
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
-@@ -5598,6 +5615,10 @@
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
-@@ -5919,10 +5940,13 @@
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
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index ae725fd..b18ffec 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -7,8 +7,6 @@
 EXPAT_VERSION = 2.0.1
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
 EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
-EXPAT_AUTORECONF = NO
-EXPAT_LIBTOOL_PATCH = NO
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_TARGET = YES
 # no install-strip / install-exec
-- 
1.7.1
