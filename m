From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 22:16:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/mc: do not install mc.lib twice
In-Reply-To: <20200420201644.1954370-1-fontaine.fabrice@gmail.com>
References: <20200420201644.1954370-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420201644.1954370-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1fded9bacffdc57fea9cb151ed889f48ceb5ff8d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Makefile-am-install-mc-lib-only-once.patch | 60 +++++++++++++++++++
 package/mc/mc.mk                              |  2 +
 2 files changed, 62 insertions(+)
 create mode 100644 package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch

diff --git a/package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch b/package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch
new file mode 100644
index 0000000000..be9bf7a402
--- /dev/null
+++ b/package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch
@@ -0,0 +1,60 @@
+From afb09f7cd7024484845ade25e15b8b93d6cf2d2c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Tue, 3 Mar 2020 09:26:12 +0000
+Subject: [PATCH] Ticket #4070: misc/Makefile.am: install mc.lib only once.
+
+Before the change mc.lib was installed twice due to being
+in two _DATA variables:
+
+dist_pkgdata_DATA = \
+        mc.lib
+
+pkgdata_DATA = \
+        $(dist_pkgdata_DATA) \
+        $(PKGDATA_OUT)
+
+This causes occasional install failures when two parallel
+`/usr/bin/install` calls race in installing the file:
+
+$ make -j20 DESTDIR=/var/tmp/portage/app-misc/mc-4.8.24/image install
+...
+ /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
+    -c -m 644 mc.lib '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
+ /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
+    -c -m 644 mc.lib mc.charsets '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
+...
+ /usr/bin/install: cannot create regular file
+   '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc/mc.lib': File exists
+
+After the change mc.lib is present only in dist_pkgdata_DATA.
+
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/MidnightCommander/mc/commit/afb09f7cd7024484845ade25e15b8b93d6cf2d2c]
+---
+ misc/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/misc/Makefile.am b/misc/Makefile.am
+index 8ed1826136..24f4a0e1ad 100644
+--- a/misc/Makefile.am
++++ b/misc/Makefile.am
+@@ -17,7 +17,6 @@ dist_pkgdata_DATA = \
+ 	mc.lib
+ 
+ pkgdata_DATA = \
+-	$(dist_pkgdata_DATA) \
+ 	$(PKGDATA_OUT)
+ 
+ SCRIPTS_IN = \
+@@ -54,7 +53,6 @@ EXTRA_DIST = \
+ 	$(LIBFILES_SCRIPT) \
+ 	$(SCRIPTS_IN) \
+ 	$(noinst_DATA) \
+-	$(dist_pkgdata_DATA) \
+ 	$(PKGDATA_IN)
+ 
+ install-data-hook:
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 4e76b618d8..b689e50e73 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -11,6 +11,8 @@ MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+# We're patching misc/Makefile.am
+MC_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse
-- 
2.25.1
