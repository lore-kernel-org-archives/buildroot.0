From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 13:13:08 +0100
Subject: [Buildroot] [git commit] libstrophe: new package
Message-ID: <20140329121357.E304E9C413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1acff22d5e34a91ed6e2f87312962160612fbd3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: allow compilation with either expat or libxml2, reword the
license description to indicate that it's MIT *or* GPLv3. ]

Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/libstrophe/Config.in                       |   11 +++++++
 .../libstrophe-01-make-autoreconfable.patch        |   13 +++++++++
 package/libstrophe/libstrophe.mk                   |   29 ++++++++++++++++++++
 4 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2fee0ef..394f0a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ source "package/librsync/Config.in"
 source "package/libsocketcan/Config.in"
 source "package/libshairplay/Config.in"
 source "package/libsoup/Config.in"
+source "package/libstrophe/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
new file mode 100644
index 0000000..d4e6a7d
--- /dev/null
+++ b/package/libstrophe/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSTROPHE
+	bool "libstrophe"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
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
index 0000000..1bd55c7
--- /dev/null
+++ b/package/libstrophe/libstrophe.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libstrophe
+#
+################################################################################
+
+LIBSTROPHE_VERSION = d408eaf2bbfe5ff5c56eab01463c278f9891c08e
+LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
+LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
+LIBSTROPHE_AUTORECONF = YES
+LIBSTROPHE_LICENSE = MIT or GPLv3
+LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
+
+# This package does not build a dynamic library, so there is nothing
+# to be installed to the target.
+LIBSTROPHE_INSTALL_STAGING = YES
+LIBSTROPHE_INSTALL_TARGET = NO
+
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+# Passing --without-libxml2 doesn't work, due to how AC_ARG_WITH is
+# used in configure.ac. As long as --with-libxml2 is *not* passed, the
+# configure script assumes expat should be used.
+LIBSTROPHE_DEPENDENCIES += expat
+else
+LIBSTROPHE_CONF_OPT += --with-libxml2
+LIBSTROPHE_DEPENDENCIES += libxml2
+endif
+
+$(eval $(autotools-package))
