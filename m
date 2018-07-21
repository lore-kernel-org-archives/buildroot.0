From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 14:03:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump to 1.7.1
Message-ID: <20180721120349.21308-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-14055 & CVE-2018-14056.

Changelog: https://wiki.znc.in/ChangeLog/1.7.1

Removed 0001-Fix-build-without-SSL-support.patch, applied upstream:
https://github.com/znc/znc/commit/e567f4cb73a1637141f7e4fc3b0ef44e79568048

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Fix-build-without-SSL-support.patch  | 37 -------------------
 package/znc/znc.hash                          |  2 +-
 package/znc/znc.mk                            |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/znc/0001-Fix-build-without-SSL-support.patch

diff --git a/package/znc/0001-Fix-build-without-SSL-support.patch b/package/znc/0001-Fix-build-without-SSL-support.patch
deleted file mode 100644
index 23b78ed4be..0000000000
--- a/package/znc/0001-Fix-build-without-SSL-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a263157165c411552d73a211ac9c7647285abdc5 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 10 Jun 2018 22:01:47 +0300
-Subject: [PATCH] Fix build without SSL support
-
-The <memory> headers is needed for unique_ptr even when SSL is not
-enabled. This fixes the following build failure:
-
-src/Utils.cpp: In static member function 'static bool CUtils::CheckCIDR(const CString&, const CString&)':
-src/Utils.cpp:674:5: error: 'unique_ptr' is not a member of 'std'
-     std::unique_ptr<addrinfo, decltype(deleter)> aiHost(aiHostC, deleter);
-     ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/znc/znc/pull/1554
-
- src/Utils.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Utils.cpp b/src/Utils.cpp
-index 9c3b2549b791..cced5683d78a 100644
---- a/src/Utils.cpp
-+++ b/src/Utils.cpp
-@@ -27,8 +27,8 @@
- #include <znc/Message.h>
- #ifdef HAVE_LIBSSL
- #include <openssl/ssl.h>
--#include <memory>
- #endif /* HAVE_LIBSSL */
-+#include <memory>
- #include <unistd.h>
- #include <time.h>
- 
--- 
-2.17.1
-
diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index ee24816d0a..7a14595907 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c07e31439ac6b948a577bd61a9d5f61a6d191d387423779b937aa1404051b96f  znc-1.7.0.tar.gz
+sha256 44cfea7158ea05dc2547c7c6bc22371e66c869def90351de0ab90a9c200d39c4  znc-1.7.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 2a04c66377..5235fd9196 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.7.0
+ZNC_VERSION = 1.7.1
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.18.0
