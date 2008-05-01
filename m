From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  1 May 2008 12:03:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/pixman
Message-ID: <20080501190348.AA19C3C684@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-01 12:03:48 -0700 (Thu, 01 May 2008)
New Revision: 21912

Log:
remove libdir-la.patch, handled by Makefile.autotools.in

Removed:
   trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-libdir-la.patch


Changeset:
Deleted: trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-libdir-la.patch
===================================================================
--- trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-libdir-la.patch	2008-05-01 19:01:10 UTC (rev 21911)
+++ trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-libdir-la.patch	2008-05-01 19:03:48 UTC (rev 21912)
@@ -1,77 +0,0 @@
---- libdaemon/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
-+++ libdaemon/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
-@@ -231,8 +231,9 @@
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
-@@ -2279,8 +2280,14 @@
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
- 	  if test ! -f "$ladir/$objdir/$linklib" && test -f "$abs_ladir/$linklib"; then
-@@ -2754,6 +2761,16 @@
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
-@@ -5141,6 +5158,10 @@
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
-@@ -5459,10 +5480,13 @@
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
