From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:49 +0000 (UTC)
Subject: [Buildroot] svn commit: [25732] trunk/buildroot/package/freetype
Message-ID: <20090318212149.4038A7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:48 +0000 (Wed, 18 Mar 2009)
New Revision: 25732

Log:
freetype: get rid of ancient 2.2.1 version

Removed:
   trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch

Modified:
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2009-03-18 21:21:44 UTC (rev 25731)
+++ trunk/buildroot/package/freetype/Config.in	2009-03-18 21:21:48 UTC (rev 25732)
@@ -4,24 +4,3 @@
 	  a free, high-quality and portable font engine.
 
 	  http://www.freetype.org/
-
-choice
-	prompt "Freetype Version"
-	depends on BR2_PACKAGE_FREETYPE
-	default BR2_FREETYPE_VERSION_2_3_7
-	help
-	  Select the version of Freetype you wish to use.
-
-	config BR2_FREETYPE_VERSION_2_2_1
-		bool "Freetype 2.2.1"
-		depends on BR2_DEPRECATED
-
-	config BR2_FREETYPE_VERSION_2_3_7
-		bool "Freetype 2.3.7"
-
-endchoice
-
-config BR2_FREETYPE_VERSION
-	string
-	default "2.2.1"		if BR2_FREETYPE_VERSION_2_2_1
-	default "2.3.7"		if BR2_FREETYPE_VERSION_2_3_7

Deleted: trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch
===================================================================
--- trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch	2009-03-18 21:21:44 UTC (rev 25731)
+++ trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch	2009-03-18 21:21:48 UTC (rev 25732)
@@ -1,77 +0,0 @@
---- freetype-2.2.1/builds/unix/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
-+++ freetype-2.2.1/builds/unix/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
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

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-18 21:21:44 UTC (rev 25731)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-18 21:21:48 UTC (rev 25732)
@@ -3,8 +3,7 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION = $(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
-#"))
+FREETYPE_VERSION = 2.3.7
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
