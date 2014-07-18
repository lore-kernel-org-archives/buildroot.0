From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 18 Jul 2014 15:02:00 +0200
Subject: [Buildroot] [Patch v2 1/2] systemd: bump to version 214
In-Reply-To: <1405688521-13818-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1405688521-13818-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1405688521-13818-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to version 214.

Changes:

- add new users: systemd-bus-proxy, systemd-network and systemd-resolve.
- remove gtk-doc patch, as it is no longer needed.
- remove attr dependency (extended attributes functions are provided by
  glibc).
- enable nss-myhostname, so local hostname changes are properly handled.
- add hook to install symlink to resolv.conf when using
  systemd-networkd.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...ystemd-03-fix-am-path-libgcrypt-no-found.patch} |    0
 package/systemd/systemd-03-fix-no-gtk-doc.patch    |   23 --------------------
 package/systemd/systemd.mk                         |   23 +++++++++-----------
 3 files changed, 10 insertions(+), 36 deletions(-)
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
index f7fbf79..2564d78 100644
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
@@ -44,7 +44,6 @@ SYSTEMD_CONF_OPT += \
 	--enable-split-usr \
 	--enable-introspection=no \
 	--disable-efi \
-	--disable-myhostname \
 	--disable-tcpwrap \
 	--disable-tests \
 	--disable-dbus \
@@ -67,13 +66,6 @@ else
 SYSTEMD_CONF_OPT += --disable-acl
 endif
 
-ifeq ($(BR2_PACKAGE_ATTR),y)
-SYSTEMD_CONF_OPT += --enable-attr
-SYSTEMD_DEPENDENCIES += attr
-else
-SYSTEMD_CONF_OPT += --disable-attr
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SYSTEMD_CONF_OPT += --enable-gudev
 SYSTEMD_DEPENDENCIES += libglib2
@@ -103,6 +95,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPT += --enable-networkd
+define SYSTEMD_INSTALL_RESOLVCONF_HOOK
+	ln -sf ../run/systemd/resolve/resolv.conf \
+		$(TARGET_DIR)/etc/resolv.conf
+endef
 else
 SYSTEMD_CONF_OPT += --disable-networkd
 define SYSTEMD_INSTALL_SERVICE_NETWORK
@@ -116,9 +112,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPT += --enable-timesyncd
-define SYSTEMD_USER_TIMESYNC
-	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
-endef
 else
 SYSTEMD_CONF_OPT += --disable-timesyncd
 endif
@@ -154,12 +147,16 @@ endef
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
+	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
 
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
-	$(SYSTEMD_USER_TIMESYNC)
+	systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
+	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
+	systemd-network -1 systemd-network -1 * - - - Network Manager
 endef
 
 define SYSTEMD_INSTALL_SERVICE_TTY
-- 
1.7.10.4
