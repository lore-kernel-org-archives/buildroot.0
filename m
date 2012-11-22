From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:57 +0100
Subject: [Buildroot] [PATCH 07/33] fluxbox: fix build against imlib2
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* fix missing dependency
* set imlib2 prefix at configure time
* fix configure script to take account of the imlib2 prefix if any

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/fluxbox/fluxbox-fix-configure.patch | 19 +++++++++++++++++++
 package/fluxbox/fluxbox.mk                  |  7 ++++---
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 package/fluxbox/fluxbox-fix-configure.patch

diff --git a/package/fluxbox/fluxbox-fix-configure.patch b/package/fluxbox/fluxbox-fix-configure.patch
new file mode 100644
index 0000000..a739f08
--- /dev/null
+++ b/package/fluxbox/fluxbox-fix-configure.patch
@@ -0,0 +1,19 @@
+Avoid to call the imlib2-config that may be installed on the host system
+(even when --with-imlib2-prefix or  --with-imlib2-exec-prefix is passed to
+the configure script), which totally screws up the resulting linker flags.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- fluxbox-1.3.2.orig/configure.in	2012-10-21 16:11:59.445749396 +0200
++++ fluxbox-1.3.2/configure.in	2012-10-21 16:35:27.658390856 +0200
+@@ -443,8 +443,8 @@ if test x$enable_imlib2 = "xyes"; then
+       [
+          IMLIB2=true
+          AC_DEFINE(HAVE_IMLIB2, [], [Imlib2 support])
+-         IMLIB2_LIBS=`imlib2-config --libs`
+-         IMLIB2_CFLAGS=`imlib2-config --cflags`
++         IMLIB2_LIBS=`$IMLIB2_CONFIG --libs`
++         IMLIB2_CFLAGS=`$IMLIB2_CONFIG --cflags`
+          LIBS="$LIBS $IMLIB2_LIBS"
+          CXXFLAGS="$CXXFLAGS $IMLIB2_CFLAGS"
+        ], [ AC_MSG_RESULT(no)]
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 15136c9..bb34379 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -7,11 +7,12 @@
 FLUXBOX_VERSION = 1.3.2
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
-
+FLUXBOX_AUTORECONF = YES
 FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		   --x-libraries=$(STAGING_DIR)/usr/lib
+		   --x-libraries=$(STAGING_DIR)/usr/lib \
+		   --with-imlib2-prefix=$(STAGING_DIR)/usr
 
-FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+FLUXBOX_DEPENDENCIES = imlib2 xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 define FLUXBOX_INSTALL_XSESSION_FILE
 	[ -f $(TARGET_DIR)/root/.xsession ] || $(INSTALL) -m 0755 -D \
-- 
1.8.0
