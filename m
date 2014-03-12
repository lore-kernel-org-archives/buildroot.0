From: Denis Bodor <lefinnois@lefinnois.net>
Date: Wed, 12 Mar 2014 11:04:17 +0100
Subject: [Buildroot] [PATCH 1/1] libstrophe: new package
Message-ID: <1394618657-12162-1-git-send-email-lefinnois@lefinnois.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
---
 package/Config.in                                     |  1 +
 package/libstrophe/Config.in                          | 11 +++++++++++
 .../libstrophe-01-make-autoreconfable.patch           | 13 +++++++++++++
 package/libstrophe/libstrophe.mk                      | 19 +++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/libstrophe/Config.in
 create mode 100644 package/libstrophe/libstrophe-01-make-autoreconfable.patch
 create mode 100644 package/libstrophe/libstrophe.mk

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..a53f4ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -723,6 +723,7 @@ source "package/librsync/Config.in"
 source "package/libsocketcan/Config.in"
 source "package/libshairplay/Config.in"
 source "package/libsoup/Config.in"
+source "package/libstrophe/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
new file mode 100644
index 0000000..ac02a66
--- /dev/null
+++ b/package/libstrophe/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSTROPHE
+	bool "libstrophe"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_EXPAT
+	help
+	  libstrophe is a lightweight XMPP client library written in C.
+	  It has minimal dependencies and is configurable for various
+	  environments. It runs well on both Linux, Unix, and Windows
+	  based platforms.
+
+	  https://github.com/strophe/libstrophe
diff --git a/package/libstrophe/libstrophe-01-make-autoreconfable.patch b/package/libstrophe/libstrophe-01-make-autoreconfable.patch
new file mode 100644
index 0000000..98da3f4
--- /dev/null
+++ b/package/libstrophe/libstrophe-01-make-autoreconfable.patch
@@ -0,0 +1,13 @@
+Make the package autoreconfigurable
+
+Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
+
+diff -ur libstrophe.orig/Makefile.am libstrophe/Makefile.am
+--- libstrophe.orig/Makefile.am	2014-03-02 18:58:36.219753865 +0100
++++ libstrophe/Makefile.am	2014-03-02 18:58:02.739752477 +0100
+@@ -1,4 +1,4 @@
+-AUTOMAKE_OPTIONS = subdir-objects
++AUTOMAKE_OPTIONS = subdir-objects foreign
+ 
+ CFLAGS = -g -Wall
+ 
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
new file mode 100644
index 0000000..2a12a1d
--- /dev/null
+++ b/package/libstrophe/libstrophe.mk
@@ -0,0 +1,19 @@
+################################################################################
+# 
+# libstrophe
+#
+################################################################################
+
+LIBSTROPHE_VERSION = d408eaf2bbfe5ff5c56eab01463c278f9891c08e
+LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
+LIBSTROPHE_DEPENDENCIES = expat openssl host-pkgconf
+LIBSTROPHE_AUTORECONF = YES
+LIBSTROPHE_LICENSE = MIT GPLv3
+LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
+LIBSTROPHE_INSTALL_STAGING = YES
+LIBSTROPHE_INSTALL_TARGET = NO
+
+# This package only consists of header and static lib that need 
+# to be copied over to the sysroot for compile time use
+
+$(eval $(autotools-package))
-- 
1.9.0
