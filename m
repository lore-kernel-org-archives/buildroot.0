From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:39 -0700
Subject: [Buildroot] [PATCH 12/21] libogg: bump to 1.2.0
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-12-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                            |    3 +-
 .../libogg/libogg-1.2.0-buildroot-libtool.patch    |   53 ++++++++++++++++++++
 package/multimedia/libogg/libogg.mk                |    3 +-
 3 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 package/multimedia/libogg/libogg-1.2.0-buildroot-libtool.patch

diff --git a/CHANGES b/CHANGES
index e541b7e..81e0834 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,8 @@
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
-	gmp, iptables, kismet, libdeamon, libelf, openvpn, qt, usbutils
+	gmp, iptables, kismet, libdeamon, libelf, libogg, openvpn, qt,
+	usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/multimedia/libogg/libogg-1.2.0-buildroot-libtool.patch b/package/multimedia/libogg/libogg-1.2.0-buildroot-libtool.patch
new file mode 100644
index 0000000..5697bf1
--- /dev/null
+++ b/package/multimedia/libogg/libogg-1.2.0-buildroot-libtool.patch
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
diff --git a/package/multimedia/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
index 02b1976..406de05 100644
--- a/package/multimedia/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -3,12 +3,13 @@
 # libogg
 #
 #############################################################
-LIBOGG_VERSION = 1.1.4
+LIBOGG_VERSION = 1.2.0
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_AUTORECONF = NO
 LIBOGG_INSTALL_STAGING = YES
 LIBOGG_INSTALL_TARGET = YES
+LIBOGG_LIBTOOL_PATCH = no
 
 LIBOGG_DEPENDENCIES = host-pkg-config
 
-- 
1.7.2.3
