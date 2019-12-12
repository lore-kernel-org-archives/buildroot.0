From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 12 Dec 2019 10:33:25 +0100
Subject: [Buildroot] [PATCH] modem-manager: bump to version 1.12.2
Message-ID: <20191212093325.2178579-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also include a patch that solves build issues detected in 1.12.0, e.g.:
http://lists.busybox.net/pipermail/buildroot/2019-December/268817.html
http://autobuild.buildroot.net/results/5ac390b2a813cadb4cb180d61bb05f6fe4407155/build-end.log

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---

Hey!

This version bump to 1.12.2 also includes a patch required to build correctly when using strict library link ordering. Adding this patch requires triggering autoreconf. The patch is already included in the upstream MM repo, so the next 1.12.4 release will also include it (whenever that is, not scheduled yet).

Cheers!

---
 ...ix-order-of-linked-libs-in-test-apps.patch | 40 +++++++++++++++++++
 package/modem-manager/modem-manager.hash      |  2 +-
 package/modem-manager/modem-manager.mk        |  5 ++-
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 package/modem-manager/0001-build-fix-order-of-linked-libs-in-test-apps.patch

diff --git a/package/modem-manager/0001-build-fix-order-of-linked-libs-in-test-apps.patch b/package/modem-manager/0001-build-fix-order-of-linked-libs-in-test-apps.patch
new file mode 100644
index 0000000000..d58960ce57
--- /dev/null
+++ b/package/modem-manager/0001-build-fix-order-of-linked-libs-in-test-apps.patch
@@ -0,0 +1,40 @@
+From 52cfd6788e4d12f3c2ea302e66bcc80c5efd80ee Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Wed, 11 Dec 2019 16:09:25 +0100
+Subject: [PATCH] build: fix order of linked libs in test apps
+
+Solving build issues with truly strict linkers, as in:
+http://lists.busybox.net/pipermail/buildroot/2019-December/268817.html
+
+Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
+---
+ test/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index ba737bc5..20e2a068 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -87,8 +87,8 @@ mmsmspdu_CPPFLAGS = \
+
+ mmsmspdu_LDADD = \
+ 	$(MM_LIBS) \
+-	$(top_builddir)/src/libhelpers.la \
+ 	$(top_builddir)/libmm-glib/libmm-glib.la \
++	$(top_builddir)/src/libhelpers.la \
+ 	$(NULL)
+
+ ################################################################################
+@@ -112,8 +112,8 @@ mmsmsmonitor_CPPFLAGS = \
+
+ mmsmsmonitor_LDADD = \
+ 	$(MM_LIBS) \
+-	$(top_builddir)/src/libhelpers.la \
+ 	$(top_builddir)/libmm-glib/libmm-glib.la \
++	$(top_builddir)/src/libhelpers.la \
+ 	$(NULL)
+
+ ################################################################################
+--
+2.24.0
+
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index b1fef98fe2..a3925bb4a2 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3daca86164145fffb589939433f596c13fa077c9a187c0d5820fdd5b4e4a6424  ModemManager-1.12.0.tar.xz
+sha256  4f76d2bdd0ed6780837cdde886eaf535f9770f9daa1ff92e63658d06aa5d25ea  ModemManager-1.12.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index b5aa7914f6..8aa9f36766 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-MODEM_MANAGER_VERSION = 1.12.0
+MODEM_MANAGER_VERSION = 1.12.2
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
@@ -13,6 +13,9 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings

+# 0001-build-fix-order-of-linked-libs-in-test-apps.patch
+MODEM_MANAGER_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
 MODEM_MANAGER_CONF_OPTS += --with-qmi
--
2.24.0
