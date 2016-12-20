From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:34 +0100
Subject: [Buildroot] [PATCH v5 17/19] infra-libtool: no longer disable
	install directory sanity check
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-18-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During install, libtool check if $libdir is a subdirectory of $DESTDIR. Until
now $DESTDIR was $(TARGET_DIR) and $libdir was $(STAGING_DIR)/usr/lib.
Consequently, this test failed. Since $libdir is now /usr/lib, there is not more
reason to skipped that test.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/libtool/buildroot-libtool-v1.5.patch   | 18 ------------------
 support/libtool/buildroot-libtool-v2.2.patch   | 26 ++++++--------------------
 support/libtool/buildroot-libtool-v2.4.4.patch | 25 +++++--------------------
 support/libtool/buildroot-libtool-v2.4.patch   | 24 +++++-------------------
 4 files changed, 16 insertions(+), 77 deletions(-)

diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
index 0429c58..3d78831 100644
--- a/support/libtool/buildroot-libtool-v1.5.patch
+++ b/support/libtool/buildroot-libtool-v1.5.patch
@@ -52,21 +52,3 @@
  		    ;;
  		esac
  	      fi
-@@ -5487,10 +5494,13 @@
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
diff --git a/support/libtool/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
index b2058b4..6d9bac7 100644
--- a/support/libtool/buildroot-libtool-v2.2.patch
+++ b/support/libtool/buildroot-libtool-v2.2.patch
@@ -11,21 +11,7 @@
  #	else
  #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -2239,8 +2239,11 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  test "$inst_prefix_dir" = "$destdir" && \
--	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  #
-+	  # test "$inst_prefix_dir" = "$destdir" && \
-+	  #   func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
-@@ -4429,7 +4432,8 @@
+@@ -4429,7 +4429,8 @@
  	;;
        -all-static | -static | -static-libtool-libs)
  	case $arg in
@@ -35,7 +21,7 @@
  	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
  	    func_warning "complete static linking is impossible in this configuration"
  	  fi
-@@ -4438,12 +4442,6 @@
+@@ -4438,12 +4439,6 @@
  	  fi
  	  prefer_static_libs=yes
  	  ;;
@@ -48,7 +34,7 @@
  	-static-libtool-libs)
  	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
  	    dlopen_self=$dlopen_self_static
-@@ -4726,7 +4724,8 @@
+@@ -4726,7 +4721,8 @@
        prevarg="$arg"
  
        case $arg in
@@ -58,7 +44,7 @@
  	if test -n "$link_static_flag"; then
  	  # See comment for -static flag below, for more details.
  	  func_append compile_command " $link_static_flag"
-@@ -4995,7 +4994,7 @@
+@@ -4995,7 +4991,7 @@
  	continue
  	;;
  
@@ -67,7 +53,7 @@
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -6094,7 +6093,7 @@
+@@ -6094,7 +6090,7 @@
  		if test -n "$inst_prefix_dir"; then
  		  case $libdir in
  		    [\\/]*)
@@ -76,7 +62,7 @@
  		      ;;
  		  esac
  		fi
-@@ -6167,7 +6166,7 @@
+@@ -6167,7 +6163,7 @@
  	      if test -n "$inst_prefix_dir"; then
  		case $libdir in
  		  [\\/]*)
diff --git a/support/libtool/buildroot-libtool-v2.4.4.patch b/support/libtool/buildroot-libtool-v2.4.4.patch
index 8e25d3d..2400aa3 100644
--- a/support/libtool/buildroot-libtool-v2.4.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.4.patch
@@ -16,22 +16,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  #	else
  #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -4277,8 +4277,12 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  test "$inst_prefix_dir" = "$destdir" && \
--	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
-+
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  #
-+	  #test "$inst_prefix_dir" = "$destdir" && \
-+	  #  func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
-@@ -6550,7 +6554,8 @@
+@@ -6550,7 +6550,8 @@
  	;;
        -all-static | -static | -static-libtool-libs)
  	case $arg in
@@ -41,7 +26,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
  	    func_warning "complete static linking is impossible in this configuration"
  	  fi
-@@ -6559,12 +6564,6 @@
+@@ -6559,12 +6560,6 @@
  	  fi
  	  prefer_static_libs=yes
  	  ;;
@@ -54,7 +39,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  	-static-libtool-libs)
  	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
  	    dlopen_self=$dlopen_self_static
-@@ -6858,7 +6857,8 @@
+@@ -6858,7 +6853,8 @@
        prevarg=$arg
  
        case $arg in
@@ -64,7 +49,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  	if test -n "$link_static_flag"; then
  	  # See comment for -static flag below, for more details.
  	  func_append compile_command " $link_static_flag"
-@@ -7149,7 +7149,7 @@
+@@ -7149,7 +7145,7 @@
  	continue
  	;;
  
@@ -73,7 +58,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -8854,7 +8854,7 @@
+@@ -8854,7 +8850,7 @@
  	      if test -n "$inst_prefix_dir"; then
  		case $libdir in
  		  [\\/]*)
diff --git a/support/libtool/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
index c475ec9..7165bea 100644
--- a/support/libtool/buildroot-libtool-v2.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.patch
@@ -11,21 +11,7 @@
  #	else
  #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -2963,8 +2963,11 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  test "$inst_prefix_dir" = "$destdir" && \
--	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  #
-+	  # test "$inst_prefix_dir" = "$destdir" && \
-+	  #   func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
-@@ -5176,7 +5179,8 @@
+@@ -5176,7 +5176,8 @@
  	;;
        -all-static | -static | -static-libtool-libs)
  	case $arg in
@@ -35,7 +21,7 @@
  	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
  	    func_warning "complete static linking is impossible in this configuration"
  	  fi
-@@ -5185,12 +5189,6 @@
+@@ -5185,12 +5186,6 @@
  	  fi
  	  prefer_static_libs=yes
  	  ;;
@@ -48,7 +34,7 @@
  	-static-libtool-libs)
  	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
  	    dlopen_self=$dlopen_self_static
-@@ -5473,7 +5471,8 @@
+@@ -5473,7 +5468,8 @@
        prevarg="$arg"
  
        case $arg in
@@ -58,7 +44,7 @@
  	if test -n "$link_static_flag"; then
  	  # See comment for -static flag below, for more details.
  	  func_append compile_command " $link_static_flag"
-@@ -5754,7 +5753,7 @@
+@@ -5754,7 +5750,7 @@
  	continue
  	;;
  
@@ -67,7 +53,7 @@
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -8854,7 +8854,7 @@
+@@ -8854,7 +8851,7 @@
  	      if test -n "$inst_prefix_dir"; then
  		case $libdir in
  		  [\\/]*)
-- 
1.9.1
