From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jun 2014 10:16:18 -0300
Subject: [Buildroot] [PATCH] parted: fix nommu build
Message-ID: <1404134178-5667-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to accept uclinux in the tuple, and also disable dynamic libs
for static scenarios. Fixes:
http://autobuild.buildroot.net/results/d9a/d9a9baf0c1bfdb7f7d03ebed084a80ef3001c86d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ed-002-configure.ac-uclinux-is-also-linux.patch | 33 ++++++++++++++++++++++
 package/parted/parted.mk                           |  6 ++++
 2 files changed, 39 insertions(+)
 create mode 100644 package/parted/parted-002-configure.ac-uclinux-is-also-linux.patch

diff --git a/package/parted/parted-002-configure.ac-uclinux-is-also-linux.patch b/package/parted/parted-002-configure.ac-uclinux-is-also-linux.patch
new file mode 100644
index 0000000..b2119bc
--- /dev/null
+++ b/package/parted/parted-002-configure.ac-uclinux-is-also-linux.patch
@@ -0,0 +1,33 @@
+From b3958317c5ee2940e7024bec2e7f288b5a6a26c3 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 30 Jun 2014 10:09:04 -0300
+Subject: [PATCH] configure.ac: uclinux is also linux
+
+uclinux is used in the tuple for some noMMU linux builds like Blackfin
+FLAT output, so accept it as linux too.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 436d0e2..50ad478 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,10 +58,10 @@ AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
+ 
+ AC_CANONICAL_HOST
+ case "$host_os" in
+-	linux*) OS=linux ;;
++	linux*|uclinux*) OS=linux ;;
+ 	gnu*)	OS=gnu ;;
+ 	beos*)	OS=beos ;;
+-	*)	AC_MSG_ERROR([Unknown or unsupported OS "$host_os".  Only "linux", "gnu" and "beos" are supported in this version of GNU Parted.]) ;;
++	*)	AC_MSG_ERROR([Unknown or unsupported OS "$host_os".  Only "linux", "uclinux", "gnu" and "beos" are supported in this version of GNU Parted.]) ;;
+ esac
+ AC_SUBST([OS])
+ 
+-- 
+1.8.5.5
+
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 15e37a8..fd82684 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -9,6 +9,8 @@ PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = util-linux
 PARTED_INSTALL_STAGING = YES
+# For uclinux patch
+PARTED_AUTORECONF = YES
 PARTED_LICENSE = GPLv3+
 PARTED_LICENSE_FILES = COPYING
 
@@ -26,6 +28,10 @@ else
 PARTED_CONF_OPT += --disable-device-mapper
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PARTED_CONF_OPT += --disable-dynamic-loading
+endif
+
 HOST_PARTED_DEPENDENCIES = host-util-linux
 HOST_PARTED_CONF_OPT += \
 	--without-readline \
-- 
1.8.5.5
