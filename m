From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:49:22 +0200
Subject: [Buildroot] [git commit] wpan-tools: bump to version 0.7
Message-ID: <20170409115341.A7349807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f9d851548633062d9a7103fc2b84366254b55c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-build-with-newer-libnl.patch          | 40 ----------------------
 package/wpan-tools/wpan-tools.hash                 |  4 +--
 package/wpan-tools/wpan-tools.mk                   |  2 +-
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/wpan-tools/0001-fix-build-with-newer-libnl.patch b/package/wpan-tools/0001-fix-build-with-newer-libnl.patch
deleted file mode 100644
index 03e1a03..0000000
--- a/package/wpan-tools/0001-fix-build-with-newer-libnl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 51ab69d76aa708c79aed971ee4083abb8cc07201 Mon Sep 17 00:00:00 2001
-From: Stefan Schmidt <stefan@osg.samsung.com>
-Date: Mon, 9 Nov 2015 19:06:25 +0100
-Subject: [PATCH] build: avoid redefinition errors with libnl >= 3.2.27
-
-From 3.2.17 onwards we have nla for s8, s16, etc defined directly in libnl.
-If we keep including this file anyway we run into redefinition errors. Better
-include use our own only for earlier versions.
-
-Happened to me on Fedora 22 after my last update.
-
-Signed-off-by: Stefan Schmidt <stefan@osg.samsung.com>
-Acked-by: Alexander Aring <alex.aring@gmail.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: upstream
-
- src/nl_extras.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/nl_extras.h b/src/nl_extras.h
-index 9d841aa..c4d1d14 100644
---- a/src/nl_extras.h
-+++ b/src/nl_extras.h
-@@ -1,6 +1,8 @@
- #ifndef __NL_EXTRAS_H
- #define __NL_EXTRAS_H
- 
-+#if LIBNL_VER_MIC <= 26
-+
- #ifndef NLA_S8
- 
- #define NLA_S8	13
-@@ -43,4 +45,6 @@ static inline int32_t nla_get_s32(struct nlattr *nla)
- 
- #endif /* NLA_S64 */
- 
-+#endif /* LIBNL_VER_MIC */
-+
- #endif /* __NL_EXTRAS_H */
diff --git a/package/wpan-tools/wpan-tools.hash b/package/wpan-tools/wpan-tools.hash
index fbcf64c..6a3b6d1 100644
--- a/package/wpan-tools/wpan-tools.hash
+++ b/package/wpan-tools/wpan-tools.hash
@@ -1,4 +1,4 @@
 # From http://wpan.cakelab.org/releases/md5sum
-md5	c6356f7be4de2e9f2084283b9ed7e1ab	wpan-tools-0.5.tar.gz
+md5	06608f69951088844196f79685318aa9	wpan-tools-0.7.tar.gz
 # Calculated based on the hash above
-sha256	f381f24eb1962aa9e21751004560371bb9ad8bd0b735bc493930f50e8c1f3d99	wpan-tools-0.5.tar.gz
+sha256	8b690ff0e71e08bece5ec541223fda7abd2d5552d97d3d25b4967609b58fef00	wpan-tools-0.7.tar.gz
diff --git a/package/wpan-tools/wpan-tools.mk b/package/wpan-tools/wpan-tools.mk
index 012b946..a604dab 100644
--- a/package/wpan-tools/wpan-tools.mk
+++ b/package/wpan-tools/wpan-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPAN_TOOLS_VERSION = 0.5
+WPAN_TOOLS_VERSION = 0.7
 WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
 WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
 WPAN_TOOLS_LICENSE = ISC
