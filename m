From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Jan 2017 09:46:10 -0300
Subject: [Buildroot] [PATCH] libnice: bump to version 0.1.13
Message-ID: <20170106124610.30812-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-configure-failure-when-building-without-.patch | 45 ++++++++++++++++++++++
 package/libnice/libnice.hash                       |  4 +-
 package/libnice/libnice.mk                         |  4 +-
 3 files changed, 50 insertions(+), 3 deletions(-)
 create mode 100644 package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch

diff --git a/package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch b/package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch
new file mode 100644
index 0000000..f6b2eb4
--- /dev/null
+++ b/package/libnice/0001-configure-Fix-configure-failure-when-building-without-.patch
@@ -0,0 +1,45 @@
+From 81a929ac141aae66b6450e8ce93cb357ed404cda Mon Sep 17 00:00:00 2001
+From: Timo Gurr <timo.gurr@gmail.com>
+Date: Mon, 1 Jun 2015 16:10:16 +0200
+Subject: [PATCH] configure: Fix configure failure when building without
+ gstreamer support
+
+Error introduced in 20ea22e0a11a9bdfe4d8125b68083249b694338a, resulting in a
+configure/build error when building without gstreamer:
+
+configure: error: conditional "HAVE_GST_CHECK" was never defined.
+Usually this means the macro was only invoked conditionally.
+
+https://bugs.freedesktop.org/show_bug.cgi?id=90801
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: upstream
+
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6031cec..64a571f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -231,9 +231,6 @@ AS_IF([test "$with_gstreamer" != no], [
+ 		[
+ 		have_gst_check=no
+ 		])
+-
+-	AM_CONDITIONAL(HAVE_GST_CHECK, test "$have_gst_check" = yes)
+-
+ ])
+ 
+ AS_IF([test "$with_gstreamer010" != no], [
+@@ -260,6 +257,7 @@ AC_SUBST(gstplugindir)
+ AC_SUBST(gstplugin010dir)
+ 
+ AM_CONDITIONAL(WITH_GSTREAMER, test "$with_gstreamer" = yes)
++AM_CONDITIONAL(HAVE_GST_CHECK, test "$have_gst_check" = yes)
+ AM_CONDITIONAL(WITH_GSTREAMER010, test "$with_gstreamer010" = yes)
+ 
+ GUPNP_IGD_REQUIRED=0.2.4
+-- 
+2.10.2
+
diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index bb419b9..d08c2d7 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 9da7f09909902d535389d929c3e4d69129528fb18438a6c8565ec812d9904ddf libnice-0.1.8.tar.gz
+# Locally computed after checking pgp signature
+sha256 61112d9f3be933a827c8365f20551563953af6718057928f51f487bfe88419e1 libnice-0.1.13.tar.gz
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 68f5eae..3df596a 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.8
+LIBNICE_VERSION = 0.1.13
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPLv1.1 or LGPLv2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
+# For 0001-configure-Fix-configure-failure-when-building-without-.patch
+LIBNICE_AUTORECONF = YES
 LIBNICE_CONF_OPTS = \
 	--without-gstreamer \
 	--without-gstreamer-0.10 \
-- 
2.10.2
