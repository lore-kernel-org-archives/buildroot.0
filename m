From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:40 -0700
Subject: [Buildroot] [PATCH 13/21] libvorbis: bump to 1.3.1
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-13-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                            |    4 +-
 .../libvorbis-1.3.1-buildroot-libtool.patch        |   53 ++++++++++++++++++++
 package/multimedia/libvorbis/libvorbis.mk          |    3 +-
 3 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 package/multimedia/libvorbis/libvorbis-1.3.1-buildroot-libtool.patch

diff --git a/CHANGES b/CHANGES
index 81e0834..3412924 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,8 +9,8 @@
 
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
-	gmp, iptables, kismet, libdeamon, libelf, libogg, openvpn, qt,
-	usbutils
+	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis,
+	openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/multimedia/libvorbis/libvorbis-1.3.1-buildroot-libtool.patch b/package/multimedia/libvorbis/libvorbis-1.3.1-buildroot-libtool.patch
new file mode 100644
index 0000000..5697bf1
--- /dev/null
+++ b/package/multimedia/libvorbis/libvorbis-1.3.1-buildroot-libtool.patch
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
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index 9a060d9..e735b52 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,12 +4,13 @@
 #
 #############################################################
 
-LIBVORBIS_VERSION = 1.2.3
+LIBVORBIS_VERSION = 1.3.1
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
 LIBVORBIS_AUTORECONF = NO
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_INSTALL_TARGET = YES
+LIBVORBIS_LIBTOOL_PATCH = no
 
 LIBVORBIS_CONF_OPT = --disable-oggtest
 
-- 
1.7.2.3
