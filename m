From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:43:40 +0200
Subject: [Buildroot] [git commit] package/elementary: fix parallel install
	issue
Message-ID: <20160727194357.81A3881D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bba82cbfe4caaa01366fc74fb3b6f4c41587a28b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are some *.eo.h files listed in includesub_HEADERS list but
these files are already installed from elm_eolian_files list.

Use AUTORECONF and GETTEXTIZE to regenerate the configure script.

Fixes:
http://autobuild.buildroot.net/results/7e9/7e9caffe442dcf40ee41da56fd3f55ffedf3a291

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...emove-.eo.h-files-from-includesub_HEADERS.patch | 45 ++++++++++++++++++++++
 package/elementary/elementary.mk                   |  4 ++
 2 files changed, 49 insertions(+)

diff --git a/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch b/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
new file mode 100644
index 0000000..75a36a2
--- /dev/null
+++ b/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
@@ -0,0 +1,45 @@
+From 2f6a65718a0992d0624836ce4b1416a7420782d2 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 25 Jul 2016 22:52:41 +0200
+Subject: [PATCH] lib: remove *.eo.h files from includesub_HEADERS
+
+Otherwise *.eo.h files will be installed twice, so it can break a
+parallel install on fast machines, whereby two make jobs may run
+concurrently, trying to install the same files.
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
