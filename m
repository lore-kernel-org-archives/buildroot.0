From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:38:47 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/madplay: add
	custom libtool patch
Message-ID: <20170601144624.637C38296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bc38c800d776060be2140dfc811146c8d56de8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

madplay use a libtool script in version 1.5.2 but the libtool patch
"buildroot-libtool-v1.5.patch.patch" doesn't apply.

From [1]:
"It's libtool dropping -static. That's because madplay has a
weird version of libtool, on which our libtool patch doesn't apply so
we have MADPLAY_LIBTOOL_PATCH = NO. Therefore, the hack we have that
makes libtool -static behave like -all-static isn't applied, causing
this build failure."

Fixes:
http://autobuild.buildroot.net/results/60def1b15ea61d3cb5f50e9de3f354dd2e17d270

[1] http://lists.busybox.net/pipermail/buildroot/2017-May/192959.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2fcb07fbe3c2a861cd6c988d6d13d11be22a3683)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-buildroot-libtool-v1.5.patch.patch        | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/package/madplay/0002-buildroot-libtool-v1.5.patch.patch b/package/madplay/0002-buildroot-libtool-v1.5.patch.patch
new file mode 100644
index 0000000..2be3363
--- /dev/null
+++ b/package/madplay/0002-buildroot-libtool-v1.5.patch.patch
@@ -0,0 +1,109 @@
+From ce661985c098635965573aac8fc983a72f60d396 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 30 May 2017 16:42:34 +0200
+Subject: [PATCH] buildroot-libtool-v1.5.patch
+
+Apply buildroot-libtool-v1.5.patch rebased on libtool 1.5.2 used
+in madplay and fixing all conflicts.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ltmain.sh | 40 ++++++++++++++++++++++++++++++----------
+ 1 file changed, 30 insertions(+), 10 deletions(-)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 4b9f940..0b71220 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -164,6 +164,11 @@ do
+   arg="$1"
+   shift
+ 
++  # Make -static behave as -all-static
++  case $arg in
++  -static) arg="-all-static" ;;
++  esac
++
+   case $arg in
+   -*=*) optarg=`$echo "X$arg" | $Xsed -e 's/[-_a-zA-Z0-9]*=//'` ;;
+   *) optarg= ;;
+@@ -549,8 +554,9 @@ if test -z "$show_help"; then
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  $echo "$modename: unable to infer tagged configuration"
+-	  $echo "$modename: specify a tag with \`--tag'" 1>&2
+-	  exit 1
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
++#	  exit 1
+ #        else
+ #          $echo "$modename: using $tagname tagged configuration"
+ 	fi
+@@ -1228,7 +1234,8 @@ EOF
+       prevarg="$arg"
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  compile_command="$compile_command $link_static_flag"
+ 	  finalize_command="$finalize_command $link_static_flag"
+@@ -2135,8 +2142,14 @@ EOF
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
+-	    dir="$libdir"
+-	    absdir="$libdir"
++            # Adding 'libdir' from the .la file to our library search paths
++            # breaks crosscompilation horribly.  We cheat here and don't add
++            # it, instead adding the path where we found the .la.  -CL
++	    dir="$abs_ladir"
++	    absdir="$abs_ladir"
++	    libdir="$abs_ladir"
++	    #dir="$libdir"
++	    #absdir="$libdir"
+ 	  fi
+ 	else
+ 	  dir="$ladir/$objdir"
+@@ -2261,7 +2274,7 @@ EOF
+ 	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
+ 	  if test "$installed" = no; then
+ 	    notinst_deplibs="$notinst_deplibs $lib"
+-	    need_relink=yes
++	    need_relink=no
+ 	  fi
+ 	  # This is a shared library
+ 	
+@@ -5146,6 +5159,10 @@ fi\
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+@@ -5464,10 +5481,13 @@ relink_command=\"$relink_command\""
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  if test "$inst_prefix_dir" = "$destdir"; then
+-	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
+-	    exit 1
+-	  fi
++	  #
++	  # This breaks install into our staging area.  -PB
++	  # 
++	  # if test "$inst_prefix_dir" = "$destdir"; then
++	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
++	  #   exit 1
++	  # fi
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+-- 
+2.9.4
+
