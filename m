From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  5 Nov 2018 23:04:25 +0100
Subject: [Buildroot] [PATCH v1 1/2] ell: new package
Message-ID: <20181105220426.17194-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                             |  1 +
 ...-standard-sigset_t-fixes-musl-compil.patch | 57 +++++++++++++++++++
 package/ell/Config.in                         | 13 +++++
 package/ell/ell.hash                          |  5 ++
 package/ell/ell.mk                            | 27 +++++++++
 5 files changed, 103 insertions(+)
 create mode 100644 package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
 create mode 100644 package/ell/Config.in
 create mode 100644 package/ell/ell.hash
 create mode 100644 package/ell/ell.mk

diff --git a/package/Config.in b/package/Config.in
index 712e360402..b60e7700ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1608,6 +1608,7 @@ menu "Other"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
+	source "package/ell/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch b/package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
new file mode 100644
index 0000000000..a1d252b42a
--- /dev/null
+++ b/package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
@@ -0,0 +1,57 @@
+From abff9db9a6e86e00613a420dd6a0ba3bc81e2b72 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 2 Nov 2018 12:58:57 +0100
+Subject: [PATCH] ell/signal.h: use standard sigset_t, fixes musl compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use standard sigset_t (instead __sigset_t):
+
+- fixes musl compile
+- fies mismatch between header and implementation file
+
+Fixes:
+
+  In file included from ell/main.c:35:0:
+  ell/signal.h:39:40: error: unknown type name ?__sigset_t?
+   struct l_signal *l_signal_create(const __sigset_t *mask,
+                                          ^~~~~~~~~~
+  In file included from ell/signal.c:35:0:
+  ell/signal.h:39:40: error: unknown type name ?__sigset_t?
+   struct l_signal *l_signal_create(const __sigset_t *mask,
+                                          ^~~~~~~~~~
+  ell/signal.c:153:29: error: conflicting types for ?l_signal_create?
+   LIB_EXPORT struct l_signal *l_signal_create(const sigset_t *mask,
+                               ^~~~~~~~~~~~~~~
+  In file included from ell/signal.c:35:0:
+  ell/signal.h:39:18: note: previous declaration of ?l_signal_create? was here
+   struct l_signal *l_signal_create(const __sigset_t *mask,
+                    ^~~~~~~~~~~~~~~
+
+Reverts upstream commit [1], superseeded in the next version by [2].
+
+[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=7af8e3ba0ed522897f5a87e6c8f2980f82ff5012
+[2] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=4a386a10d88ff52097a974167ab889b3fc2add70
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ ell/signal.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ell/signal.h b/ell/signal.h
+index 0d4fdc8..98cf0fa 100644
+--- a/ell/signal.h
++++ b/ell/signal.h
+@@ -36,7 +36,7 @@ typedef void (*l_signal_notify_cb_t) (struct l_signal *signal,
+ 					uint32_t signo, void *user_data);
+ typedef void (*l_signal_destroy_cb_t) (void *user_data);
+ 
+-struct l_signal *l_signal_create(const __sigset_t *mask,
++struct l_signal *l_signal_create(const sigset_t *mask,
+ 			l_signal_notify_cb_t callback,
+ 			void *user_data, l_signal_destroy_cb_t destroy);
+ void l_signal_remove(struct l_signal *signal);
+-- 
+2.19.1
+
diff --git a/package/ell/Config.in b/package/ell/Config.in
new file mode 100644
index 0000000000..8809dc6042
--- /dev/null
+++ b/package/ell/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ELL
+	bool "ell"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	help
+	  Embedded Linux library (ell)
+
+	  https://01.org/ell
+
+comment "ell needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
new file mode 100644
index 0000000000..c6b23baec8
--- /dev/null
+++ b/package/ell/ell.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 8e629347d49d30418e215ccf80f05eb6ff617f752396f93287ed723169aec006 ell-0.13.tar.gz
+
+# License files
+sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
new file mode 100644
index 0000000000..8ea95a6d77
--- /dev/null
+++ b/package/ell/ell.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# ell
+#
+################################################################################
+
+ELL_VERSION = 0.13
+ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
+ELL_SITE_METHOD = git
+ELL_LICENSE = LGPL-2.1+
+ELL_LICENSE_FILES = COPYING
+ELL_INSTALL_STAGING = YES
+# sources from git, no configure script provided
+ELL_AUTORECONF = YES
+
+# autoreconf requires an existing build-aux directory
+define ELL_MKDIR_BUILD_AUX
+	mkdir -p $(@D)/build-aux
+endef
+ELL_POST_PATCH_HOOKS += ELL_MKDIR_BUILD_AUX
+
+ELL_DEPENDENCIES = host-pkgconf
+
+# disable ell/glib main loop example
+ELL_CONF_OPTS = --disable-glib
+
+$(eval $(autotools-package))
-- 
2.19.1
