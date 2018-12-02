From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] ell: bump version to 0.14
Message-ID: <20181202071555.710668A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=755385f8636b4c8f52347cc70b8774eec0887807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove superseeded patch 0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
- add patch for missing l_genl_family_set_unicast_handler symbol export

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-add-missing-l_genl_family_set_unicast_ha.patch | 30 ++++++++++++
 ...h-use-standard-sigset_t-fixes-musl-compil.patch | 57 ----------------------
 package/ell/ell.hash                               |  2 +-
 package/ell/ell.mk                                 |  2 +-
 4 files changed, 32 insertions(+), 59 deletions(-)

diff --git a/package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch b/package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
new file mode 100644
index 0000000000..e521a93f7a
--- /dev/null
+++ b/package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
@@ -0,0 +1,30 @@
+From e68d797ffdfe768c1e4a356add5bb12c43f40a72 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 9 Nov 2018 23:28:39 +0100
+Subject: [PATCH] ell/ell.sym: add missing l_genl_family_set_unicast_handler
+
+Fixes iwd compile failure:
+
+  src/netdev.o: In function `netdev_set_nl80211':
+  netdev.c:(.text+0x6f04): undefined reference to `l_genl_family_set_unicast_handler'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ ell/ell.sym | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ell/ell.sym b/ell/ell.sym
+index 614bc93..cdd2c21 100644
+--- a/ell/ell.sym
++++ b/ell/ell.sym
+@@ -257,6 +257,7 @@ global:
+ 	l_genl_family_new;
+ 	l_genl_family_ref;
+ 	l_genl_family_unref;
++	l_genl_family_set_unicast_handler;
+ 	l_genl_family_set_watches;
+ 	l_genl_family_get_version;
+ 	l_genl_family_get_genl;
+-- 
+2.19.1
+
diff --git a/package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch b/package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
deleted file mode 100644
index a1d252b42a..0000000000
--- a/package/ell/0001-ell-signal.h-use-standard-sigset_t-fixes-musl-compil.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From abff9db9a6e86e00613a420dd6a0ba3bc81e2b72 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 2 Nov 2018 12:58:57 +0100
-Subject: [PATCH] ell/signal.h: use standard sigset_t, fixes musl compile
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use standard sigset_t (instead __sigset_t):
-
-- fixes musl compile
-- fies mismatch between header and implementation file
-
-Fixes:
-
-  In file included from ell/main.c:35:0:
-  ell/signal.h:39:40: error: unknown type name ???__sigset_t???
-   struct l_signal *l_signal_create(const __sigset_t *mask,
-                                          ^~~~~~~~~~
-  In file included from ell/signal.c:35:0:
-  ell/signal.h:39:40: error: unknown type name ???__sigset_t???
-   struct l_signal *l_signal_create(const __sigset_t *mask,
-                                          ^~~~~~~~~~
-  ell/signal.c:153:29: error: conflicting types for ???l_signal_create???
-   LIB_EXPORT struct l_signal *l_signal_create(const sigset_t *mask,
-                               ^~~~~~~~~~~~~~~
-  In file included from ell/signal.c:35:0:
-  ell/signal.h:39:18: note: previous declaration of ???l_signal_create??? was here
-   struct l_signal *l_signal_create(const __sigset_t *mask,
-                    ^~~~~~~~~~~~~~~
-
-Reverts upstream commit [1], superseeded in the next version by [2].
-
-[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=7af8e3ba0ed522897f5a87e6c8f2980f82ff5012
-[2] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=4a386a10d88ff52097a974167ab889b3fc2add70
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- ell/signal.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ell/signal.h b/ell/signal.h
-index 0d4fdc8..98cf0fa 100644
---- a/ell/signal.h
-+++ b/ell/signal.h
-@@ -36,7 +36,7 @@ typedef void (*l_signal_notify_cb_t) (struct l_signal *signal,
- 					uint32_t signo, void *user_data);
- typedef void (*l_signal_destroy_cb_t) (void *user_data);
- 
--struct l_signal *l_signal_create(const __sigset_t *mask,
-+struct l_signal *l_signal_create(const sigset_t *mask,
- 			l_signal_notify_cb_t callback,
- 			void *user_data, l_signal_destroy_cb_t destroy);
- void l_signal_remove(struct l_signal *signal);
--- 
-2.19.1
-
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index c6b23baec8..84827437ec 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 8e629347d49d30418e215ccf80f05eb6ff617f752396f93287ed723169aec006 ell-0.13.tar.gz
+sha256 1791d2e18f0089af0d58a3d2f76a2846c2d9fa59eb2848124a713ce380561b0e ell-0.14.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 8ea95a6d77..56d53be868 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.13
+ELL_VERSION = 0.14
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
