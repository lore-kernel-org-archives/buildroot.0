From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Jul 2014 11:19:45 -0300
Subject: [Buildroot] [PATCH 1/2] support/libtool: improve version 1.5 static
	patching
Message-ID: <1406816386-6840-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alter the libtool 1.5.x support patch to accomodate for wildly different
versions of ltmain.sh
Just make it alter incoming args from -static to -all-static which seems
to apply to all the different variants out there since argument parsing
is unlikely to change much.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/libtool/buildroot-libtool-v1.5.patch | 64 ++++++++++------------------
 1 file changed, 22 insertions(+), 42 deletions(-)

diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
index 73a61b0..cdd9c5a 100644
--- a/support/libtool/buildroot-libtool-v1.5.patch
+++ b/support/libtool/buildroot-libtool-v1.5.patch
@@ -1,6 +1,6 @@
---- a/ltmain.sh	2008-02-01 17:39:51.000000000 +0100
-+++ b/ltmain.sh	2014-07-30 22:36:00.544715335 +0200
-@@ -297,8 +297,9 @@
+--- a/ltmain.sh	2014-07-31 10:43:01.634568799 -0300
++++ b/ltmain.sh	2014-07-31 10:44:14.032018999 -0300
+@@ -226,8 +226,9 @@
  	# line option must be used.
  	if test -z "$tagname"; then
  	  $echo "$modename: unable to infer tagged configuration"
@@ -12,30 +12,19 @@
  #        else
  #          $echo "$modename: using $tagname tagged configuration"
  	fi
-@@ -1178,7 +1179,8 @@
-       case $arg in
-       -all-static | -static | -static-libtool-libs)
- 	case $arg in
--	-all-static)
-+	# Make -static behave like -all-static
-+	-all-static | -static)
- 	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
- 	    $echo "$modename: warning: complete static linking is impossible in this configuration" 1>&2
- 	  fi
-@@ -1187,12 +1189,6 @@
- 	  fi
- 	  prefer_static_libs=yes
- 	  ;;
--	-static)
--	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
--	    dlopen_self=$dlopen_self_static
--	  fi
--	  prefer_static_libs=built
--	  ;;
- 	-static-libtool-libs)
- 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
- 	    dlopen_self=$dlopen_self_static
-@@ -1482,7 +1478,8 @@
+@@ -247,6 +248,11 @@
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
+@@ -1238,7 +1244,8 @@
        prevarg="$arg"
  
        case $arg in
@@ -45,16 +34,7 @@
  	if test -n "$link_static_flag"; then
  	  compile_command="$compile_command $link_static_flag"
  	  finalize_command="$finalize_command $link_static_flag"
-@@ -1765,7 +1762,7 @@
- 	continue
- 	;;
- 
--      -static | -static-libtool-libs)
-+      -static-libtool-libs)
- 	# The effects of -static are defined in a previous loop.
- 	# We used to do the same as -all-static on platforms that
- 	# didn't have a PIC flag, but the assumption that the effects
-@@ -2462,8 +2459,14 @@
+@@ -2146,8 +2153,14 @@
  	    absdir="$abs_ladir"
  	    libdir="$abs_ladir"
  	  else
@@ -69,10 +49,10 @@
 +	    #dir="$libdir"
 +	    #absdir="$libdir"
  	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
  	else
-@@ -2602,7 +2605,7 @@
- 	   { test "$use_static_libs" = no || test -z "$old_library"; }; then
+ 	  dir="$ladir/$objdir"
+@@ -2272,7 +2285,7 @@
+ 	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
  	  if test "$installed" = no; then
  	    notinst_deplibs="$notinst_deplibs $lib"
 -	    need_relink=yes
@@ -80,7 +60,7 @@
  	  fi
  	  # This is a shared library
  
-@@ -5687,6 +5690,10 @@
+@@ -5169,6 +5182,10 @@
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
  	    for deplib in $dependency_libs; do
@@ -91,7 +71,7 @@
  	      case $deplib in
  	      *.la)
  		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -6008,10 +6015,13 @@
+@@ -5487,10 +5504,13 @@
  	  # At present, this check doesn't affect windows .dll's that
  	  # are installed into $libdir/../bin (currently, that works fine)
  	  # but it's something to keep an eye on.
-- 
1.8.5.5
