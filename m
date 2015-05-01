From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:22:39 +0200
Subject: [Buildroot] [git commit] sane-backends: bump to version 1.0.24
Message-ID: <20150501142306.3BDF77FDDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee74dcd9eec27891300dbed6f3652f2b18e4d5fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump sane-backends to a "modern" 1.0.24 version.
Tweak the patches to avoid autoreconf (it doesn't seem to be happy for
me in gentoo).
Disable cups support (checks are wrong and it's no longer required).
Disable systemd support (checks are wrong and we never accounted for
this).

Should fix wine failure (i was unable to build sane-backends before):
http://autobuild.buildroot.net/results/d01/d01a3c7786df8cfd962a27f39283851db45c6165/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-remove-unsafe-headers-path.patch          |   24 +++++++
 package/sane-backends/0002-v4l.patch               |   66 --------------------
 .../0003-remove-cups-and-systemd-support.patch     |   56 +++++++++++++++++
 .../0003-remove-unsafe-headers-path.patch          |   28 --------
 package/sane-backends/sane-backends.hash           |    2 +
 package/sane-backends/sane-backends.mk             |    6 +-
 6 files changed, 84 insertions(+), 98 deletions(-)

diff --git a/package/sane-backends/0002-remove-unsafe-headers-path.patch b/package/sane-backends/0002-remove-unsafe-headers-path.patch
new file mode 100644
index 0000000..6217b0a
--- /dev/null
+++ b/package/sane-backends/0002-remove-unsafe-headers-path.patch
@@ -0,0 +1,24 @@
+From 3c03e4b81c9de73e57a56029f7f8cda8bec24e91 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 10 Jan 2015 15:48:21 +0100
+Subject: [PATCH] configure.in: remove unsafe headers path
+
+Forcing /usr/local/include headers path in CFLAGS is unsafe for
+cross-compilation.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+[Gustavo: update to just patch configure and avoid an autoreconf]
+---
+
+diff -Nura sane-backends-1.0.24.orig/configure sane-backends-1.0.24/configure
+--- sane-backends-1.0.24.orig/configure	2015-05-01 09:51:19.479785064 -0300
++++ sane-backends-1.0.24/configure	2015-05-01 09:51:48.411767378 -0300
+@@ -5192,8 +5192,6 @@
+ fi
+ 
+ 
+-INCLUDES="${INCLUDES} -I/usr/local/include"
+-
+ 
+ if test "${ac_cv_c_compiler_gnu}" = "yes"; then
+   NORMAL_CFLAGS="\
diff --git a/package/sane-backends/0002-v4l.patch b/package/sane-backends/0002-v4l.patch
deleted file mode 100644
index e9bdd20..0000000
--- a/package/sane-backends/0002-v4l.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From Fedora git: http://pkgs.fedoraproject.org/gitweb/?p=sane-backends.git;a=blob;f=sane-backends-1.0.22-v4l.patch;hb=4c4b8135b896ef9f00b926ce5f435ae5c9b156d5
-
-From 26c69b228b29f612faf4b0cc85db969ee7cc4ea6 Mon Sep 17 00:00:00 2001
-From: Nils Philippsen <nils@redhat.com>
-Date: Mon, 14 Mar 2011 13:35:05 +0100
-Subject: [PATCH] patch: v4l
-
-Squashed commit of the following:
-
-commit 23381932c76846191b42a48e505b37cd74711265
-Author: Julien BLACHE <jb@jblache.org>
-Date:   Wed Feb 16 19:37:43 2011 +0100
-
-    Fix v4l build with libv4l 0.8.3+
-
-    (cherry picked from commit c5ca46c2d1be78c651afb843cc834cf2b5b24953)
-
-    Conflicts:
-
-    	ChangeLog
-
-    Signed-off-by: Nils Philippsen <nils@redhat.com>
----
- backend/v4l.c |    3 +--
- backend/v4l.h |    3 ++-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/backend/v4l.c b/backend/v4l.c
-index 6510ef0..38595ed 100644
---- a/backend/v4l.c
-+++ b/backend/v4l.c
-@@ -84,9 +84,8 @@
- #include "../include/sane/sanei_config.h"
- #define V4L_CONFIG_FILE "v4l.conf"
- 
--#include "v4l.h"
--
- #include <libv4l1.h>
-+#include "v4l.h"
- 
- static const SANE_Device **devlist = NULL;
- static int num_devices;
-diff --git a/backend/v4l.h b/backend/v4l.h
-index 588b96e..6aee586 100644
---- a/backend/v4l.h
-+++ b/backend/v4l.h
-@@ -29,6 +29,7 @@
- #ifndef v4l_h
- #define v4l_h
- 
-+#ifndef __LINUX_VIDEODEV_H
- /* Kernel interface */
- /* Only the stuff we need. For more features, more defines are needed */
- 
-@@ -165,7 +166,7 @@ struct video_channel
- 
- 
- /* end of kernel interface */
--
-+#endif /* !__LINUX_VIDEODEV_H */
- 
- #include <../include/sane/sane.h>
- 
--- 
-1.7.4
-
diff --git a/package/sane-backends/0003-remove-cups-and-systemd-support.patch b/package/sane-backends/0003-remove-cups-and-systemd-support.patch
new file mode 100644
index 0000000..e9a637e
--- /dev/null
+++ b/package/sane-backends/0003-remove-cups-and-systemd-support.patch
@@ -0,0 +1,56 @@
+These tests use absolute directories and host leakage is granted
+when cups and systemd are around. In fact there's no way these could work
+in any predictable manner.
+
+CUPS support was in fact disabled upstream since it's not required
+in commit efb04936b8ad3bf313c289a522ae5832e22c1b7e
+
+And for systemd we never handled it properly anyway.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura sane-backends-1.0.24.orig/configure sane-backends-1.0.24/configure
+--- sane-backends-1.0.24.orig/configure	2015-05-01 09:51:19.479785064 -0300
++++ sane-backends-1.0.24/configure	2015-05-01 10:08:49.834447226 -0300
+@@ -9649,33 +9649,6 @@
+ 
+ fi
+ 
+-$as_echo "checking for cups"
+-if test -e /usr/include/cups/cups.h ; then
+-
+-$as_echo "#define HAVE_CUPS 1" >>confdefs.h
+-
+-	with_cups="yes"
+-	LIBS="-lcups  $LIBS"
+-else
+-	$as_echo "cups.h not found, you may want to install a cups development package"
+-	$as_echo "in order to autodetect network scanners in kodakaio."
+-	with_cups="no"
+-fi
+-
+-$as_echo_n "Checking for systemd..."
+-if test -e /usr/include/systemd/sd-daemon.h ; then
+-
+-$as_echo "#define HAVE_SYSTEMD 1" >>confdefs.h
+-
+-    with_systemd="yes"
+-    SYSTEMD_LIBS=" -lsystemd-daemon"
+-
+-    $as_echo "yes"
+-else
+-    with_systemd="no"
+-    $as_echo "no"
+-fi
+-
+ 
+ # Check whether --enable-libusb_1_0 was given.
+ if test "${enable_libusb_1_0+set}" = set; then :
+@@ -21180,7 +21153,6 @@
+ echo "IPv6 support:  `eval eval echo ${ipv6}`"
+ echo "Avahi support: `eval eval echo ${enable_avahi}`"
+ echo "SNMP support:  `eval eval echo ${with_snmp}`"
+-echo "CUPS support:  `eval eval echo ${with_cups}`"
+ echo "-> The following backends will be built:"
+ for backend in ${BACKENDS} ; do
+   echo $ECHO_N "${backend} "
diff --git a/package/sane-backends/0003-remove-unsafe-headers-path.patch b/package/sane-backends/0003-remove-unsafe-headers-path.patch
deleted file mode 100644
index 29b8d04..0000000
--- a/package/sane-backends/0003-remove-unsafe-headers-path.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3c03e4b81c9de73e57a56029f7f8cda8bec24e91 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 10 Jan 2015 15:48:21 +0100
-Subject: [PATCH] configure.in: remove unsafe headers path
-
-Forcing /usr/local/include headers path in CFLAGS is unsafe for
-cross-compilation.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- configure.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index a8fc950..93a4b77 100644
---- a/configure.in
-+++ b/configure.in
-@@ -82,7 +82,6 @@ AM_CONDITIONAL(CROSS_COMPILING, test x$cross_compiling = xyes)
- dnl ***********************************************************************
- dnl set compiler/linker flags
- dnl ***********************************************************************
--INCLUDES="${INCLUDES} -I/usr/local/include"
- AC_SUBST(INCLUDES)
- SANE_SET_CFLAGS([$is_release])
- SANE_SET_LDFLAGS
--- 
-1.9.3
-
diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
new file mode 100644
index 0000000..44aea50
--- /dev/null
+++ b/package/sane-backends/sane-backends.hash
@@ -0,0 +1,2 @@
+# From https://alioth.debian.org/frs/download.php/file/3956/sane-backends-1.0.24.tar.gz.md5
+md5	1ca68e536cd7c1852322822f5f6ac3a4	sane-backends-1.0.24.tar.gz
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index bde8e6a..4b29dda 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-SANE_BACKENDS_VERSION = 1.0.22
-SANE_BACKENDS_SITE = http://sources.buildroot.net
+SANE_BACKENDS_VERSION = 1.0.24
+SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/3958
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
 SANE_BACKENDS_INSTALL_STAGING = YES
-# 0003-remove-unsafe-headers-path.patch patch configure.in
-SANE_BACKENDS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
