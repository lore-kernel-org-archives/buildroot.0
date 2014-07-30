From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:27:19 +0200
Subject: [Buildroot] [git commit] support/libtool: make -static behave like
	-all-static
Message-ID: <20140730213552.1193B9D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97703978ac870ce2b14ad144f8e082de82aa2c64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After switching TARGET_LDFLAGS from --static to -static, one issue
appears: from the point of view of libtool, -static only means to link
statically against the 'uninstalled libtool libraries' (i.e the
libraries that libtool has built in the current package), but
otherwise links dynamically with the other libraries. To really get a
completely static build, you need to pass -all-static to
libtool. Unfortunately, -all-static is only a valid option for
libtool, not as a general LDFLAGS, so we cannot to TARGET_LDFLAGS =
-all-static without breaking virtually all packages.

As pointed out 10 years ago on the libtool mailing list, the current
naming of the options is very confusing and the source of issues, and
there was a proposal to change -static to have the behavior of
-all-static, and instead introduce a separate -lt-static to have the
current behavior of -static. But that never got merged, because it was
breaking the current behavior. See:

  http://lists.gnu.org/archive/html/libtool/2004-11/msg00017.html

However, in Buildroot, when we pass -static, we really mean it, and we
want a completely static build. Therefore, this patch adapts our
ltmain.sh patches so that they alter the behavior of -static to make
it work like -all-static. The changes are small and quite easy to
understand, and have been tested to work fine with a small selection
of packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/libtool/buildroot-libtool-v1.5.patch |   56 ++++++++++++++++++++++---
 support/libtool/buildroot-libtool-v2.2.patch |   56 ++++++++++++++++++++++---
 support/libtool/buildroot-libtool-v2.4.patch |   54 ++++++++++++++++++++++---
 3 files changed, 146 insertions(+), 20 deletions(-)

diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
index 57a7c58..73a61b0 100644
--- a/support/libtool/buildroot-libtool-v1.5.patch
+++ b/support/libtool/buildroot-libtool-v1.5.patch
@@ -1,6 +1,6 @@
---- a/ltmain.sh	2006-03-11 13:49:04.000000000 -0500
-+++ b/ltmain.sh	2008-04-30 09:55:28.000000000 -0400
-@@ -273,8 +273,9 @@ func_infer_tag ()
+--- a/ltmain.sh	2008-02-01 17:39:51.000000000 +0100
++++ b/ltmain.sh	2014-07-30 22:36:00.544715335 +0200
+@@ -297,8 +297,9 @@
  	# line option must be used.
  	if test -z "$tagname"; then
  	  $echo "$modename: unable to infer tagged configuration"
@@ -12,7 +12,49 @@
  #        else
  #          $echo "$modename: using $tagname tagged configuration"
  	fi
-@@ -2407,8 +2408,14 @@ EOF
+@@ -1178,7 +1179,8 @@
+       case $arg in
+       -all-static | -static | -static-libtool-libs)
+ 	case $arg in
+-	-all-static)
++	# Make -static behave like -all-static
++	-all-static | -static)
+ 	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
+ 	    $echo "$modename: warning: complete static linking is impossible in this configuration" 1>&2
+ 	  fi
+@@ -1187,12 +1189,6 @@
+ 	  fi
+ 	  prefer_static_libs=yes
+ 	  ;;
+-	-static)
+-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+-	    dlopen_self=$dlopen_self_static
+-	  fi
+-	  prefer_static_libs=built
+-	  ;;
+ 	-static-libtool-libs)
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+@@ -1482,7 +1478,8 @@
+       prevarg="$arg"
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  compile_command="$compile_command $link_static_flag"
+ 	  finalize_command="$finalize_command $link_static_flag"
+@@ -1765,7 +1762,7 @@
+ 	continue
+ 	;;
+ 
+-      -static | -static-libtool-libs)
++      -static-libtool-libs)
+ 	# The effects of -static are defined in a previous loop.
+ 	# We used to do the same as -all-static on platforms that
+ 	# didn't have a PIC flag, but the assumption that the effects
+@@ -2462,8 +2459,14 @@
  	    absdir="$abs_ladir"
  	    libdir="$abs_ladir"
  	  else
@@ -29,7 +71,7 @@
  	  fi
  	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
  	else
-@@ -2545,7 +2552,7 @@ EOF
+@@ -2602,7 +2605,7 @@
  	   { test "$use_static_libs" = no || test -z "$old_library"; }; then
  	  if test "$installed" = no; then
  	    notinst_deplibs="$notinst_deplibs $lib"
@@ -38,7 +80,7 @@
  	  fi
  	  # This is a shared library
  
-@@ -5606,6 +5623,10 @@ fi\
+@@ -5687,6 +5690,10 @@
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
  	    for deplib in $dependency_libs; do
@@ -49,7 +91,7 @@
  	      case $deplib in
  	      *.la)
  		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5927,10 +5948,13 @@ relink_command=\"$relink_command\""
+@@ -6008,10 +6015,13 @@
  	  # At present, this check doesn't affect windows .dll's that
  	  # are installed into $libdir/../bin (currently, that works fine)
  	  # but it's something to keep an eye on.
diff --git a/support/libtool/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
index 0df00ae..8bb7826 100644
--- a/support/libtool/buildroot-libtool-v2.2.patch
+++ b/support/libtool/buildroot-libtool-v2.2.patch
@@ -1,6 +1,6 @@
---- a/ltmain.sh	2009-11-16 06:23:18.000000000 -0700
-+++ b/ltmain.sh	2010-09-18 20:25:06.000000000 -0700
-@@ -1048,8 +1048,8 @@ func_infer_tag ()
+--- a/ltmain.sh	2010-06-09 15:08:53.000000000 +0200
++++ b/ltmain.sh	2014-07-30 22:33:41.176710372 +0200
+@@ -1214,8 +1214,8 @@
  	# was found and let the user know that the "--tag" command
  	# line option must be used.
  	if test -z "$tagname"; then
@@ -11,7 +11,7 @@
  #	else
  #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -2018,8 +2018,11 @@ func_mode_install ()
+@@ -2239,8 +2239,11 @@
  	  # At present, this check doesn't affect windows .dll's that
  	  # are installed into $libdir/../bin (currently, that works fine)
  	  # but it's something to keep an eye on.
@@ -25,7 +25,49 @@
  
  	  if test -n "$inst_prefix_dir"; then
  	    # Stick the inst_prefix_dir data into the link command.
-@@ -5412,8 +5415,14 @@ func_mode_link ()
+@@ -4429,7 +4432,8 @@
+ 	;;
+       -all-static | -static | -static-libtool-libs)
+ 	case $arg in
+-	-all-static)
++	# Make -static behave like -all-static
++	-all-static | -static)
+ 	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
+ 	    func_warning "complete static linking is impossible in this configuration"
+ 	  fi
+@@ -4438,12 +4442,6 @@
+ 	  fi
+ 	  prefer_static_libs=yes
+ 	  ;;
+-	-static)
+-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+-	    dlopen_self=$dlopen_self_static
+-	  fi
+-	  prefer_static_libs=built
+-	  ;;
+ 	-static-libtool-libs)
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+@@ -4726,7 +4724,8 @@
+       prevarg="$arg"
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  # See comment for -static flag below, for more details.
+ 	  func_append compile_command " $link_static_flag"
+@@ -4995,7 +4994,7 @@
+ 	continue
+ 	;;
+ 
+-      -static | -static-libtool-libs)
++      -static-libtool-libs)
+ 	# The effects of -static are defined in a previous loop.
+ 	# We used to do the same as -all-static on platforms that
+ 	# didn't have a PIC flag, but the assumption that the effects
+@@ -5739,8 +5738,14 @@
  	    absdir="$abs_ladir"
  	    libdir="$abs_ladir"
  	  else
@@ -42,7 +84,7 @@
  	  fi
  	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
  	else
-@@ -5564,7 +5573,7 @@ func_mode_link ()
+@@ -5891,7 +5896,7 @@
  	  *)
  	    if test "$installed" = no; then
  	      notinst_deplibs="$notinst_deplibs $lib"
@@ -51,7 +93,7 @@
  	    fi
  	    ;;
  	  esac
-@@ -8052,6 +8061,10 @@ EOF
+@@ -8373,6 +8378,10 @@
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
  	    for deplib in $dependency_libs; do
diff --git a/support/libtool/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
index d82d610..f610b1b 100644
--- a/support/libtool/buildroot-libtool-v2.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.patch
@@ -1,6 +1,6 @@
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -1416,8 +1416,8 @@
+--- a/ltmain.sh	2014-07-30 22:21:24.664684143 +0200
++++ b/ltmain.sh	2014-07-30 22:23:02.440687625 +0200
+@@ -1417,8 +1417,8 @@
  	# was found and let the user know that the "--tag" command
  	# line option must be used.
  	if test -z "$tagname"; then
@@ -11,7 +11,7 @@
  #	else
  #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -2962,8 +2962,11 @@
+@@ -2963,8 +2963,11 @@
  	  # At present, this check doesn't affect windows .dll's that
  	  # are installed into $libdir/../bin (currently, that works fine)
  	  # but it's something to keep an eye on.
@@ -25,7 +25,49 @@
  
  	  if test -n "$inst_prefix_dir"; then
  	    # Stick the inst_prefix_dir data into the link command.
-@@ -6683,7 +6686,7 @@
+@@ -5176,7 +5179,8 @@
+ 	;;
+       -all-static | -static | -static-libtool-libs)
+ 	case $arg in
+-	-all-static)
++	# Make -static behave like -all-static
++	-all-static | -static)
+ 	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
+ 	    func_warning "complete static linking is impossible in this configuration"
+ 	  fi
+@@ -5185,12 +5189,6 @@
+ 	  fi
+ 	  prefer_static_libs=yes
+ 	  ;;
+-	-static)
+-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+-	    dlopen_self=$dlopen_self_static
+-	  fi
+-	  prefer_static_libs=built
+-	  ;;
+ 	-static-libtool-libs)
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+@@ -5473,7 +5471,8 @@
+       prevarg="$arg"
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  # See comment for -static flag below, for more details.
+ 	  func_append compile_command " $link_static_flag"
+@@ -5754,7 +5753,7 @@
+ 	continue
+ 	;;
+ 
+-      -static | -static-libtool-libs)
++      -static-libtool-libs)
+ 	# The effects of -static are defined in a previous loop.
+ 	# We used to do the same as -all-static on platforms that
+ 	# didn't have a PIC flag, but the assumption that the effects
+@@ -6697,7 +6696,7 @@
  	  *)
  	    if test "$installed" = no; then
  	      func_append notinst_deplibs " $lib"
@@ -34,7 +76,7 @@
  	    fi
  	    ;;
  	  esac
-@@ -9257,6 +9260,10 @@
+@@ -9275,6 +9274,10 @@
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
  	    for deplib in $dependency_libs; do
