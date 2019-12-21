From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 21 Dec 2019 12:35:45 -0300
Subject: [Buildroot] [PATCH] package/snort: bump to version 2.9.15
Message-ID: <20191221153545.7732-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adds a patch that fixes a build error when cross-compiling
on a Fedora host machine.

Fixes:
http://autobuild.buildroot.net/results/47a367c2c5cbf13079b0e60ad7ebe3dbd05756d4
http://autobuild.buildroot.net/results/837e43b085ac30fb8545c67352403ceb7de59976
http://autobuild.buildroot.net/results/a69df3959b45620f811c18744aa661caa479aef4
many more...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...en-building-on-a-Fedora-host-machine.patch | 51 +++++++++++++++++++
 package/snort/snort.hash                      |  2 +-
 package/snort/snort.mk                        |  2 +-
 3 files changed, 53 insertions(+), 2 deletions(-)
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
diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 69b3210c0210..898840dadc5a 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 2472989da3aace000d1ea5931ece68f8e5cc0c511e272d65182113a2481e822d  snort-2.9.14.1.tar.gz
+sha256 bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba  snort-2.9.15.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index bfb6f9f91b9d..024c94162bff 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.14.1
+SNORT_VERSION = 2.9.15
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.17.1
