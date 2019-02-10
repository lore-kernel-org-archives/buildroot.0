From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 18:27:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/brcm-patchram-plus: bump to version
 95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042
Message-ID: <20190210172739.30412-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Use COPYING as license file as COPYING has been fixed by:
  https://github.com/AsteroidOS/brcm-patchram-plus/commit/95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042

This bump will also fix build failure of brcm-patchram-plus-legal-info
due to the fact that src/main.c was used as the license file but also
patched by 0001-src-main.c-fix-build-on-SPARC.patch

Fixes:
 - http://autobuild.buildroot.org/results/a13abf28094e182060712727d0aa72d3644f0283

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-src-main.c-fix-build-on-SPARC.patch       | 64 ----------------------
 package/brcm-patchram-plus/brcm-patchram-plus.hash |  4 +-
 package/brcm-patchram-plus/brcm-patchram-plus.mk   |  4 +-
 3 files changed, 4 insertions(+), 68 deletions(-)
 delete mode 100644 package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch

diff --git a/package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch b/package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch
deleted file mode 100644
index 5567284cdf..0000000000
--- a/package/brcm-patchram-plus/0001-src-main.c-fix-build-on-SPARC.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8ff9d421372a7cb780fbafd8b1d556ee549bf109 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 8 Feb 2019 23:21:04 +0100
-Subject: [PATCH] src/main.c: fix build on SPARC
-
-On SPARC, the definitions of B2500000, B3000000, B3500000 and B4000000
-are not necessarily available, so use those values only if defined in
-the kernel headers.
-
-It fixes SPARC build failures such as:
-main.c:382:13: error: 'B2500000' undeclared here (not in a function)
-  { 2500000, B2500000 },
-             ^~~~~~~~
-main.c:383:13: error: 'B3000000' undeclared here (not in a function)
-  { 3000000, B3000000 },
-             ^~~~~~~~
-main.c:385:13: error: 'B3500000' undeclared here (not in a function)
-  { 3500000, B3500000 },
-             ^~~~~~~~
-main.c:386:13: error: 'B4000000' undeclared here (not in a function)
-  { 4000000, B4000000 }
-
-Fixes:
- - http://autobuild.buildroot.org/results/f7012c08c935c3a6ccae50b84170190af5cd5cba
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/AsteroidOS/brcm-patchram-plus/pull/1]
----
- src/main.c | 18 +++++++++++++-----
- 1 file changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/src/main.c b/src/main.c
-index 040cfe1..17c5191 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -378,12 +378,20 @@ tBaudRates baud_rates[] = {
- 	{ 1000000, B1000000 },
- 	{ 1152000, B1152000 },
- 	{ 1500000, B1500000 },
--	{ 2000000, B2000000 },
--	{ 2500000, B2500000 },
--	{ 3000000, B3000000 },
-+	{ 2000000, B2000000 }
-+#ifdef B2500000
-+	,{ 2500000, B2500000 }
-+#endif
-+#ifdef B3000000
-+	,{ 3000000, B3000000 }
-+#endif
- #ifndef __CYGWIN__
--	{ 3500000, B3500000 },
--	{ 4000000, B4000000 }
-+#ifdef B3500000
-+	,{ 3500000, B3500000 }
-+#endif
-+#ifdef B4000000
-+	,{ 4000000, B4000000 }
-+#endif
- #endif
- };
- 
--- 
-2.14.1
-
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
index 0da680cd85..f6910e714b 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.hash
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz
-sha256  2ba6b830c7d2186f6d5e4470ce5ffe73d97faf69b0d967f2455b725809dfca7b  src/main.c
+sha256  febad69fbc9185b4c6a31188cf381fd280b88d93cb7f5a40dfdbab9c599c29a7  brcm-patchram-plus-95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042.tar.gz
+sha256  26324f5c563b7e338c2876c8abe90c3681c1e9a6163fc59b494c94ad6493eda4  COPYING
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
index 511ec991bc..329571d9a9 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.mk
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-BRCM_PATCHRAM_PLUS_VERSION = 94fb127e614b19a9a95561b8c1a0716e2e1e6293
+BRCM_PATCHRAM_PLUS_VERSION = 95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042
 BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
 BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
-BRCM_PATCHRAM_PLUS_LICENSE_FILES = src/main.c
+BRCM_PATCHRAM_PLUS_LICENSE_FILES = COPYING
 BRCM_PATCHRAM_PLUS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.14.1
