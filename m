From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jul 2016 23:26:11 +0200
Subject: [Buildroot] [PATCH] package/elementary: fix parallel install issue
Message-ID: <1469481971-27392-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is some *.eo.h files listed in includesub_HEADERS list but
these files are already installed from elm_eolian_files list.

Use AUTORECONF and GETTEXTIZE to regenerate the configure script.

Fixes:
http://autobuild.buildroot.net/results/7e9/7e9caffe442dcf40ee41da56fd3f55ffedf3a291

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
I have to check if this patch is upstreamable since elementary has been
merged with efl tree.
---
 ...emove-.eo.h-files-from-includesub_HEADERS.patch | 44 ++++++++++++++++++++++
 package/elementary/elementary.mk                   |  4 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch

diff --git a/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch b/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
new file mode 100644
index 0000000..c869196
--- /dev/null
+++ b/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
@@ -0,0 +1,44 @@
+From bd44646ebb4868825760c98f14e34159bd79bd34 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 25 Jul 2016 22:52:41 +0200
+Subject: [PATCH] lib: remove *.eo.h files from includesub_HEADERS
+
+Otherwise *.eo.h files will be installed twice, so it can
+break the build on very fast machines.
+
+/usr/bin/install -c -m 644 elm_sys_notify.eo.h
+/usr/bin/install -c -m 644 elm_sys_notify.eo.h
+usr/bin/install: cannot create regular file 'elm_sys_notify.eo.h': File exists
+
+Fixes:
+http://autobuild.buildroot.net/results/7e9/7e9caffe442dcf40ee41da56fd3f55ffedf3a291
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/lib/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
+index 40fb597..9df9424 100644
+--- a/src/lib/Makefile.am
++++ b/src/lib/Makefile.am
+@@ -351,8 +351,6 @@ elm_systray_eo.h \
+ elm_systray_common.h \
+ elm_systray_watcher.h \
+ elm_sys_notify.h \
+-elm_sys_notify.eo.h \
+-elm_sys_notify_dbus.eo.h \
+ elm_table.h \
+ elm_table_eo.h \
+ elm_table_legacy.h \
+@@ -381,7 +379,6 @@ elm_win_common.h \
+ elm_win_eo.h \
+ elm_win_legacy.h \
+ elm_win_standard.h \
+-elm_win_standard.eo.h \
+ elm_helper.h
+ includesubdir = $(includedir)/elementary- at VMAJ@/
+ 
+-- 
+2.5.5
+
diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 01fc6e4..e686647 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -10,6 +10,10 @@ ELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 ELEMENTARY_LICENSE = LGPLv2.1
 ELEMENTARY_LICENSE_FILES = COPYING
 
+# 0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
+ELEMENTARY_AUTORECONF = YES
+ELEMENTARY_GETTEXTIZE = YES
+
 ELEMENTARY_INSTALL_STAGING = YES
 
 ELEMENTARY_DEPENDENCIES = host-pkgconf host-efl host-elementary efl
-- 
2.5.5
