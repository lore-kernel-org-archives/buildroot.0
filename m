From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 19 Jun 2020 20:36:29 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.8
In-Reply-To: <20200619183629.2811-1-ps.report@gmx.net>
References: <20200619183629.2811-1-ps.report@gmx.net>
Message-ID: <20200619183629.2811-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed 0001-frame-xchg.c-fix-build-with-glibc-2.24.patch
  (upstream applied [1])

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=c352714e61809fc486470cc9a4ad3e3e84811b80

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ame-xchg.c-fix-build-with-glibc-2.24.patch | 46 -------------------
 package/iwd/iwd.hash                          |  2 +-
 package/iwd/iwd.mk                            |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/iwd/0001-frame-xchg.c-fix-build-with-glibc-2.24.patch

diff --git a/package/iwd/0001-frame-xchg.c-fix-build-with-glibc-2.24.patch b/package/iwd/0001-frame-xchg.c-fix-build-with-glibc-2.24.patch
deleted file mode 100644
index cd0bae4835..0000000000
--- a/package/iwd/0001-frame-xchg.c-fix-build-with-glibc-2.24.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 44cd3719eb94c8d5776b37c73993eea0617902f7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 11 Apr 2020 23:21:42 +0200
-Subject: [PATCH] frame-xchg.c: fix build with glibc < 2.24
-
-SOL_NETLINK is used since commit
-87a198111af1ea67053895f7435fb99e3cdd2159 resulting in the following
-build failure with glibc < 2.24:
-
-src/frame-xchg.c: In function 'frame_watch_group_io_read':
-src/frame-xchg.c:328:27: error: 'SOL_NETLINK' undeclared (first use in this function)
-   if (cmsg->cmsg_level != SOL_NETLINK)
-                           ^
-
-This failure is due to glibc that doesn't support SOL_NETLINK before
-version 2.24 and
-https://github.com/bminor/glibc/commit/f9b437d5efce93800b51ad2a437c8b1c9616bf80
-
-Fixes:
- - http://autobuild.buildroot.org/results/3485088b84111c271bbcfaf025aa4103c6452072
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://lists.01.org/hyperkitty/list/iwd at lists.01.org/thread/ZRN25CA5I7PGUTFIRJLLXN7VHWGDAZDN]
----
- src/frame-xchg.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/frame-xchg.c b/src/frame-xchg.c
-index 50351615..4c950fd3 100644
---- a/src/frame-xchg.c
-+++ b/src/frame-xchg.c
-@@ -42,6 +42,10 @@
- #include "src/netdev.h"
- #include "src/frame-xchg.h"
- 
-+#ifndef SOL_NETLINK
-+#define SOL_NETLINK 270
-+#endif
-+
- struct watch_group {
- 	/*
- 	 * Group IDs, except 0, are per wdev for user's convenience.
--- 
-2.25.1
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 9c6b9c3ea4..10c9dde983 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1707397235c972a2760c5e8865360759ac1feb6c06ac954799dff765feb240ca  iwd-1.7.tar.gz
+sha256  14b39fc8b2bf170e75cc3d0c08b666dbcfeaee73384485cb6eaf463da8963aa4  iwd-1.8.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 853638e8ca..bba787c07f 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.7
+IWD_VERSION = 1.8
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.27.0
