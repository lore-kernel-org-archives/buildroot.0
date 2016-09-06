From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:42:59 +0200
Subject: [Buildroot] [git commit] package/elementary: remove package
Message-ID: <20160906195112.12DF380583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c22b7580237a0b9106fad18770a464c353a954a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elementary package is not used anymore, remove it.
Add a legacy entry.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: move the legacy entry at the right place.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 -
 ...emove-.eo.h-files-from-includesub_HEADERS.patch | 45 --------------------
 package/elementary/Config.in                       | 15 -------
 package/elementary/elementary.hash                 |  2 -
 package/elementary/elementary.mk                   | 48 ----------------------
 6 files changed, 7 insertions(+), 111 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 59e3f84..c76aeb1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_ELEMENTARY
+	bool "elementary package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  With EFL 1.18, elementary is now provided by the efl package.
+
 config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	bool "Linux kernel local directory option removed"
 	help
diff --git a/package/Config.in b/package/Config.in
index 6a770a3..2acc739 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,7 +241,6 @@ comment "Graphic libraries"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
 	source "package/efl/Config.in"
-	source "package/elementary/Config.in"
 	source "package/fbdump/Config.in"
 	source "package/fbgrab/Config.in"
 	source "package/fbset/Config.in"
diff --git a/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch b/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
deleted file mode 100644
index 75a36a2..0000000
--- a/package/elementary/0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2f6a65718a0992d0624836ce4b1416a7420782d2 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 25 Jul 2016 22:52:41 +0200
-Subject: [PATCH] lib: remove *.eo.h files from includesub_HEADERS
-
-Otherwise *.eo.h files will be installed twice, so it can break a
-parallel install on fast machines, whereby two make jobs may run
-concurrently, trying to install the same files.
-
-/usr/bin/install -c -m 644 elm_sys_notify.eo.h
-/usr/bin/install -c -m 644 elm_sys_notify.eo.h
-usr/bin/install: cannot create regular file 'elm_sys_notify.eo.h': File exists
-
-Fixes:
-http://autobuild.buildroot.net/results/7e9/7e9caffe442dcf40ee41da56fd3f55ffedf3a291
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/lib/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
-index 40fb597..9df9424 100644
---- a/src/lib/Makefile.am
-+++ b/src/lib/Makefile.am
-@@ -351,8 +351,6 @@ elm_systray_eo.h \
- elm_systray_common.h \
- elm_systray_watcher.h \
- elm_sys_notify.h \
--elm_sys_notify.eo.h \
--elm_sys_notify_dbus.eo.h \
- elm_table.h \
- elm_table_eo.h \
- elm_table_legacy.h \
-@@ -381,7 +379,6 @@ elm_win_common.h \
- elm_win_eo.h \
- elm_win_legacy.h \
- elm_win_standard.h \
--elm_win_standard.eo.h \
- elm_helper.h
- includesubdir = $(includedir)/elementary- at VMAJ@/
- 
--- 
-2.5.5
-
diff --git a/package/elementary/Config.in b/package/elementary/Config.in
deleted file mode 100644
index f356784..0000000
--- a/package/elementary/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_ELEMENTARY
-	bool "elementary"
-	depends on BR2_PACKAGE_EFL
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elm_store.c
-	depends on !BR2_STATIC_LIBS
-	help
-	  Elementary is a widget toolkit and EFL wrapper and convenience
-	  library to make it easy to build applications and tools with UIs
-	  with less code.
-
-	  https://enlightenment.org
-
-comment "elementary needs a toolchain w/ threads, dynamic library"
-	depends on BR2_PACKAGE_EFL
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/elementary/elementary.hash b/package/elementary/elementary.hash
deleted file mode 100644
index f173752..0000000
--- a/package/elementary/elementary.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.17.1.tar.xz.sha256
-sha256	85e116a453a8ac23da878670534c6292832756d2f3a33603278486f309963d91	elementary-1.17.1.tar.xz
diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
deleted file mode 100644
index e686647..0000000
--- a/package/elementary/elementary.mk
+++ /dev/null
@@ -1,48 +0,0 @@
-################################################################################
-#
-# elementary
-#
-################################################################################
-
-ELEMENTARY_VERSION = 1.17.1
-ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.xz
-ELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
-ELEMENTARY_LICENSE = LGPLv2.1
-ELEMENTARY_LICENSE_FILES = COPYING
-
-# 0001-lib-remove-.eo.h-files-from-includesub_HEADERS.patch
-ELEMENTARY_AUTORECONF = YES
-ELEMENTARY_GETTEXTIZE = YES
-
-ELEMENTARY_INSTALL_STAGING = YES
-
-ELEMENTARY_DEPENDENCIES = host-pkgconf host-efl host-elementary efl
-
-ELEMENTARY_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
-	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
-	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
-	--with-elementary-codegen=$(HOST_DIR)/usr/bin/elementary_codegen \
-	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
-	--with-doxygen=no \
-	--disable-elementary-test
-
-# We need a host package in order to provide elm_prefs_cc and
-# elementary_codegen.
-HOST_ELEMENTARY_DEPENDENCIES = host-pkgconf host-efl
-HOST_ELEMENTARY_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
-	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
-	--with-doxygen=no \
-	--disable-elementary-test
-
-# Use Eolian C++ parser only if enabled in the efl stack.
-ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
-ELEMENTARY_CONF_OPTS += --with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
-HOST_ELEMENTARY_CONF_OPTS += --with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
