From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Dec 2019 06:17:07 -0300
Subject: [Buildroot] [PATCH] package/snort: fix error when building on a
 Fedora host machine
Message-ID: <20191222091707.31637-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove a logic from configure script that adds unsafe header/library path when
cross-compiling on a Fedora host machine.

Fixes:
http://autobuild.buildroot.net/results/47a367c2c5cbf13079b0e60ad7ebe3dbd05756d4
http://autobuild.buildroot.net/results/837e43b085ac30fb8545c67352403ceb7de59976
http://autobuild.buildroot.net/results/a69df3959b45620f811c18744aa661caa479aef4
many more...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...en-building-on-a-Fedora-host-machine.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch

diff --git a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
new file mode 100644
index 000000000000..afe9672a3c2a
--- /dev/null
+++ b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
@@ -0,0 +1,51 @@
+From eae97632157b73f0ca7c099232617b2777d0fa54 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 21 Dec 2019 12:00:42 -0300
+Subject: [PATCH] Fix error when building on a Fedora host machine.
+
+Remove the code that adds unsafe header/library path when
+cross-compiling on a Fedora host machine.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure.in | 24 ------------------------
+ 1 file changed, 24 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index e6586f399898..fb35d4d7e3e3 100644
+--- a/configure.in
++++ b/configure.in
+@@ -957,30 +957,6 @@ if test "x$enable_dlclose" = "xno"; then
+     AC_DEFINE([DISABLE_DLCLOSE_FOR_VALGRIND_TESTING],[1],[Don't close opened shared objects for valgrind leak testing of dynamic libraries])
+ fi
+ 
+-##################################################
+-# Fedora 28+ does not have inbuilt SunRPC support#
+-# in glibc and is separately availble in tirpc   #
+-# package. Make sure we've got the library and   #
+-# link it                                        #
+-##################################################
+-
+-if test -f /etc/fedora-release ; then
+-    DISTRO_VERSION=$(awk '{ print $3 }' /etc/fedora-release)
+-    if test $DISTRO_VERSION -ge 28 ; then
+-        TIRPC=""
+-        AC_CHECK_LIB(tirpc,bindresvport,, TIRPC="no")
+-        echo "$TIRPC"
+-        if test "x$TIRPC" = "xno"; then
+-            echo
+-            echo " ERROR! tirpc not found, get it by running "
+-            echo " yum install libtirpc-devel "
+-            exit
+-        fi
+-        LIBS="${LIBS} -ltirpc"
+-        extra_incl="-I/usr/include/tirpc"
+-    fi
+-fi
+-
+ Z_LIB=""
+ AC_CHECK_HEADERS(zlib.h,, Z_LIB="no")
+ if test "x$Z_LIB" = "xno"; then
+-- 
+2.17.1
+
-- 
2.17.1
