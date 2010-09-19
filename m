From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:32 -0700
Subject: [Buildroot] [PATCH 10/21] libdeamon: bump to 0.14
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-11-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/libdaemon/libdaemon.mk                     |    3 +-
 .../libdeamon-0.14-buildroot-libtool.patch         |   53 ++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 package/libdaemon/libdeamon-0.14-buildroot-libtool.patch

diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 7a9d5c8..57b2c7e 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBDAEMON_VERSION:=0.13
+LIBDAEMON_VERSION:=0.14
 LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VERSION).tar.gz
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
 LIBDAEMON_AUTORECONF:=no
@@ -12,6 +12,7 @@ LIBDAEMON_INSTALL_STAGING:=YES
 LIBDAEMON_INSTALL_TARGET:=YES
 LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT:=--disable-lynx 
+LIBDAEMON_LIBTOOL_PATCH:=no
 
 LIBDAEMON_DEPENDENCIES:=host-pkg-config
 
diff --git a/package/libdaemon/libdeamon-0.14-buildroot-libtool.patch b/package/libdaemon/libdeamon-0.14-buildroot-libtool.patch
new file mode 100644
index 0000000..5697bf1
--- /dev/null
+++ b/package/libdaemon/libdeamon-0.14-buildroot-libtool.patch
@@ -0,0 +1,53 @@
+--- a/ltmain.sh	2006-03-11 13:49:04.000000000 -0500
++++ b/ltmain.sh	2008-04-30 09:55:28.000000000 -0400
+@@ -2239,8 +2239,11 @@ func_mode_install ()
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  # test "$inst_prefix_dir" = "$destdir" && \
++	  #   func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -5739,8 +5742,14 @@ func_mode_link ()
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
+ 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
+ 	else
+@@ -5891,7 +5900,7 @@ func_mode_link ()
+ 	  *)
+ 	    if test "$installed" = no; then
+ 	      notinst_deplibs="$notinst_deplibs $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -8373,6 +8382,10 @@ func_mode_link ()
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"
-- 
1.7.2.3
