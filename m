From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Apr 2018 21:18:51 +0200
Subject: [Buildroot] [PATCH] wolfssl: bump version to 3.14.0
Message-ID: <20180404191851.17493-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream post-3.14.0 patch to fix build issue related to missing fips.h
header.

For more details, see:
https://github.com/wolfSSL/wolfssl/issues/1415

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-with-the-creation-of-dummy-fips.h-header.patch | 33 ++++++++++++++++++++++
 package/wolfssl/wolfssl.hash                       |  2 +-
 package/wolfssl/wolfssl.mk                         |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch

diff --git a/package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch b/package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch
new file mode 100644
index 0000000000..0e9dec751d
--- /dev/null
+++ b/package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch
@@ -0,0 +1,33 @@
+From a7fe5e35025227e348eaef5a15fd55f591d77206 Mon Sep 17 00:00:00 2001
+From: John Safranek <john@wolfssl.com>
+Date: Tue, 6 Mar 2018 13:15:35 -0800
+Subject: [PATCH] Fix issue with the creation of dummy fips.h header.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ wolfssl/wolfcrypt/include.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/wolfssl/wolfcrypt/include.am b/wolfssl/wolfcrypt/include.am
+index c81bdd13..6e84ed9d 100644
+--- a/wolfssl/wolfcrypt/include.am
++++ b/wolfssl/wolfcrypt/include.am
+@@ -20,7 +20,6 @@ nobase_include_HEADERS+= \
+                          wolfssl/wolfcrypt/fe_operations.h \
+                          wolfssl/wolfcrypt/ge_operations.h \
+                          wolfssl/wolfcrypt/error-crypt.h \
+-                         wolfssl/wolfcrypt/fips.h \
+                          wolfssl/wolfcrypt/fips_test.h \
+                          wolfssl/wolfcrypt/hash.h \
+                          wolfssl/wolfcrypt/hc128.h \
+@@ -99,3 +98,7 @@ if BUILD_SELFTEST
+ nobase_include_HEADERS+= wolfssl/wolfcrypt/selftest.h
+ endif
+ 
++if BUILD_FIPS_V2
++nobase_include_HEADERS+= wolfssl/wolfcrypt/fips.h
++endif
++
+-- 
+2.11.0
+
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 204f2f0957..76c7db25a8 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 3bafeb0cb7eaff80002ba3f7cbb70023757bcc35fc4d82181945b143f1f927c6  v3.13.0-stable.tar.gz
+sha256 4ab543c869a65a77dc5d0bc934b9d4852aa3d5834bd2f707a74a936602bd3687  v3.14.0-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 84073f338e..ec83d7d1dd 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 3.13.0
+WOLFSSL_VERSION = 3.14.0
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
 
-- 
2.11.0
