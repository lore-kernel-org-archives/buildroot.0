From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  1 Dec 2020 23:37:59 +0100
Subject: [Buildroot] [PATCH/next v1 2/2] package/iwd: bump version to 1.10
In-Reply-To: <20201201223759.11147-1-ps.report@gmx.net>
References: <20201201223759.11147-1-ps.report@gmx.net>
Message-ID: <20201201223759.11147-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove 0001-src-ap.c-fix-build-with-uclibc.patch
  (upstream committed, see [1])

- drop dynamic library dependency as no longer enforced by ell
  and no longer needed since commit [2]

Changelog (since 1.9):
  - Add support for DHCP v6 configuration.
  - Add support for DHCP server operation with AP mode.
  - Add support for IP allocation during the 4-Way Handshake.
  - Add support for P2P Group-owner handling.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=0a6de7932a61ec82aca4f78f71dab7247c897860
[2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=bbcfde8743c4dd58379d2017b7f0fabe8d65fffa

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-src-ap.c-fix-build-with-uclibc.patch | 36 -------------------
 package/iwd/Config.in                         |  7 ++--
 package/iwd/iwd.hash                          |  2 +-
 package/iwd/iwd.mk                            |  2 +-
 4 files changed, 5 insertions(+), 42 deletions(-)
 delete mode 100644 package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch

diff --git a/package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch
deleted file mode 100644
index 97f8c5a8e7..0000000000
--- a/package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 377df79e83e2127a087e1aa5ba6173e195e50933 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 10 Sep 2020 07:47:14 +0200
-Subject: [PATCH] src/ap.c: fix build with uclibc
-
-explicit_bzero is used in src/ap.c since commit
-d55e00b31d7bccdbb2ea1cdeb0a749df77a51e47 but src/missing.h is not
-included, as a result build with uclibc fails on:
-
-/srv/storage/autobuild/run/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/ap.o: in function `ap_probe_req_cb':
-ap.c:(.text+0x23d8): undefined reference to `explicit_bzero'
-
-Fixes:
- - http://autobuild.buildroot.org/results/c7a0096a269bfc52bd8e23d453d36d5bfb61441d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream: https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=0a6de7932a61ec82aca4f78f71dab7247c897860]
----
- src/ap.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ap.c b/src/ap.c
-index c972cfcb..ac705c31 100644
---- a/src/ap.c
-+++ b/src/ap.c
-@@ -31,6 +31,7 @@
- 
- #include "linux/nl80211.h"
- 
-+#include "src/missing.h"
- #include "src/iwd.h"
- #include "src/module.h"
- #include "src/scan.h"
--- 
-2.28.0
-
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index 4e85fb4fd7..59d4422305 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_IWD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
-	depends on !BR2_STATIC_LIBS # ell
 	depends on BR2_USE_WCHAR # ell
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
@@ -14,8 +13,8 @@ config BR2_PACKAGE_IWD
 
 	  https://iwd.wiki.kernel.org/
 
-comment "iwd needs a toolchain w/ threads, dynamic library, wchar, headers >= 4.12"
+comment "iwd needs a toolchain w/ threads, wchar, headers >= 4.12"
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 16e01ed473..77a84f156e 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e4178a105021ef1b7b7c23cbc6f8e45cbab3bb0830da588b406ff4a281e9f948  iwd-1.9.tar.gz
+sha256  4f0007fb7594fe59baed71fb72c8390c472ff11c38b75d1f673375d4129ba5e2  iwd-1.10.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 58d332dc07..b1841b5476 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.9
+IWD_VERSION = 1.10
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.29.2
