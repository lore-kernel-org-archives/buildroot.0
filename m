From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Jun 2014 21:35:37 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
Message-ID: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to version 214.

Changes:

- add new users: systemd-bus-proxy, systemd-network and systemd-resolve.
- remove gtk-doc patch, as it is no longer needed.
- force kmod path when configuring.
- remove attr build dependency.

Besides:

- /var/lock no longer needs to be a symlink to /run, as systemd, via
  tmpfiles.d, will automatically create a symlink to /run/lock at
  runtime.
- when using systemd-networkd, /etc/resolv.conf should now be a symlink
  to /run/systemd/resolve/resolv.conf.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...ystemd-03-fix-am-path-libgcrypt-no-found.patch} |  0
 package/systemd/systemd-03-fix-no-gtk-doc.patch    | 23 ----------------------
 package/systemd/systemd.mk                         | 11 +++++++++--
 3 files changed, 9 insertions(+), 25 deletions(-)
 rename package/systemd/{systemd-04-fix-am-path-libgcrypt-no-found.patch => systemd-03-fix-am-path-libgcrypt-no-found.patch} (100%)
 delete mode 100644 package/systemd/systemd-03-fix-no-gtk-doc.patch

diff --git a/package/systemd/systemd-04-fix-am-path-libgcrypt-no-found.patch b/package/systemd/systemd-03-fix-am-path-libgcrypt-no-found.patch
similarity index 100%
rename from package/systemd/systemd-04-fix-am-path-libgcrypt-no-found.patch
rename to package/systemd/systemd-03-fix-am-path-libgcrypt-no-found.patch
diff --git a/package/systemd/systemd-03-fix-no-gtk-doc.patch b/package/systemd/systemd-03-fix-no-gtk-doc.patch
deleted file mode 100644
index dc236a7..0000000
--- a/package/systemd/systemd-03-fix-no-gtk-doc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix deactivation of gtk-doc
-
-The tarball contains the Makefile for building documentation with gtk-doc,
-Unfortunately the AM_CONDITIONAL variable is not the correct one, which
-results in an error when running autoreconf.
-
-This patch fixes this issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
-Index: systemd-213/docs/gtk-doc.make
-===================================================================
---- systemd-213.orig/docs/gtk-doc.make	2014-02-14 09:27:47.000000000 +0100
-+++ systemd-213/docs/gtk-doc.make	2014-06-04 15:20:11.976845074 +0200
-@@ -267,7 +267,7 @@
- #
- # Require gtk-doc when making dist
- #
--if HAVE_GTK_DOC
-+if ENABLE_GTK_DOC
- dist-check-gtkdoc: docs
- else
- dist-check-gtkdoc:
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 95e7214..947bc92 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 213
+SYSTEMD_VERSION = 214
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
@@ -50,6 +50,9 @@ SYSTEMD_CONF_OPT += \
 	--disable-dbus \
 	--without-python
 
+SYSTEMD_CONF_ENV = \
+	ac_cv_path_KMOD=/usr/bin/kmod
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
 SYSTEMD_CONF_OPT += --enable-compat-libs
 else
@@ -65,7 +68,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
 SYSTEMD_CONF_OPT += --enable-attr
-SYSTEMD_DEPENDENCIES += attr
 else
 SYSTEMD_CONF_OPT += --disable-attr
 endif
@@ -99,6 +101,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPT += --enable-networkd
+define SYSTEMD_USER_TIMESYNC
+	systemd-network -1 systemd-network -1 * - - - Network Manager
+endef
 else
 SYSTEMD_CONF_OPT += --disable-networkd
 define SYSTEMD_INSTALL_SERVICE_NETWORK
@@ -155,6 +160,8 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
+	systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
 	$(SYSTEMD_USER_TIMESYNC)
 endef
 
-- 
1.9.3
