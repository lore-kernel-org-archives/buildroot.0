From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:32 +0100
Subject: [Buildroot] [PATCH v5 15/19] infra-libtool: relink binaries on
	install
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-16-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, libtool was not configured for cross-compilation. It did works,
because Buildroot patched $libdir in .la files to include directories from
sysroot. However, this was done after package installation. Thus, a package was
not able to use its own (not yet patched) .la files. Because of that, libtool
was not able to relink binaries during installation. So, Buildroot disabled
relink on installation. Consequently, binaries that depends on internal
libraries contains their build path in their RPATH:

  $ readelf -d target/bin/mount | grep RPATH
  0x0000000f (RPATH)  Library rpath: [/home/buildbot/output/build/util-linux-2.27.1/.libs]

This particularity was incompatible with creation of reproducible binaries.

However, with previous changes, libtool is now correctly configured and
binaries can be relinked on install. So we can re-enable this feature.

Note Yocto have a patch that remove extra paths during compilation and make
relink unnecessary:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fixinstall.patch

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/libtool/buildroot-libtool-v1.5.patch   | 9 ---------
 support/libtool/buildroot-libtool-v2.2.patch   | 9 ---------
 support/libtool/buildroot-libtool-v2.4.4.patch | 9 ---------
 support/libtool/buildroot-libtool-v2.4.patch   | 9 ---------
 4 files changed, 36 deletions(-)

diff --git a/support/libtool/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
index 51d049f..0429c58 100644
--- a/support/libtool/buildroot-libtool-v1.5.patch
+++ b/support/libtool/buildroot-libtool-v1.5.patch
@@ -34,15 +34,6 @@
  	if test -n "$link_static_flag"; then
  	  compile_command="$compile_command $link_static_flag"
  	  finalize_command="$finalize_command $link_static_flag"
-@@ -2272,7 +2279,7 @@
- 	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
- 	  if test "$installed" = no; then
- 	    notinst_deplibs="$notinst_deplibs $lib"
--	    need_relink=yes
-+	    need_relink=no
- 	  fi
- 	  # This is a shared library
- 
 @@ -2412,7 +2419,7 @@
  		if test -n "$inst_prefix_dir"; then
  		  case "$libdir" in
diff --git a/support/libtool/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
index be4e5e3..b2058b4 100644
--- a/support/libtool/buildroot-libtool-v2.2.patch
+++ b/support/libtool/buildroot-libtool-v2.2.patch
@@ -67,15 +67,6 @@
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -5891,7 +5890,7 @@
- 	  *)
- 	    if test "$installed" = no; then
- 	      notinst_deplibs="$notinst_deplibs $lib"
--	      need_relink=yes
-+	      need_relink=no
- 	    fi
- 	    ;;
- 	  esac
 @@ -6094,7 +6093,7 @@
  		if test -n "$inst_prefix_dir"; then
  		  case $libdir in
diff --git a/support/libtool/buildroot-libtool-v2.4.4.patch b/support/libtool/buildroot-libtool-v2.4.4.patch
index 1458b5e..8e25d3d 100644
--- a/support/libtool/buildroot-libtool-v2.4.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.4.patch
@@ -73,15 +73,6 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -8112,7 +8112,7 @@
- 	  *)
- 	    if test no = "$installed"; then
- 	      func_append notinst_deplibs " $lib"
--	      need_relink=yes
-+	      need_relink=no
- 	    fi
- 	    ;;
- 	  esac
 @@ -8854,7 +8854,7 @@
  	      if test -n "$inst_prefix_dir"; then
  		case $libdir in
diff --git a/support/libtool/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
index c2edd99..c475ec9 100644
--- a/support/libtool/buildroot-libtool-v2.4.patch
+++ b/support/libtool/buildroot-libtool-v2.4.patch
@@ -67,15 +67,6 @@
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -6697,7 +6696,7 @@
- 	  *)
- 	    if test "$installed" = no; then
- 	      func_append notinst_deplibs " $lib"
--	      need_relink=yes
-+	      need_relink=no
- 	    fi
- 	    ;;
- 	  esac
 @@ -8854,7 +8854,7 @@
  	      if test -n "$inst_prefix_dir"; then
  		case $libdir in
-- 
1.9.1
