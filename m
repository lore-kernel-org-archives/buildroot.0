From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 13:45:21 +0100
Subject: [Buildroot] [PATCH] package/wolfssl: security bump to version 3.5.17
Message-ID: <20190116124521.17109-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:

This release of wolfSSL includes a fix for 1 security vulnerability.

Medium level fix for potential cache attack with a variant of
Bleichenbacher?s attack.  Earlier versions of wolfSSL leaked PKCS #1 v1.5
padding information during private key decryption that could lead to a
potential padding oracle attack.  It is recommended that users update to the
latest version of wolfSSL if they have RSA cipher suites enabled and have
the potential for malicious software to be ran on the same system that is
performing RSA operations.  Users that have only ECC cipher suites enabled
and are not performing RSA PKCS #1 v1.5 Decryption operations are not
vulnerable.  Also users with TLS 1.3 only connections are not vulnerable to
this attack.  Thanks to Eyal Ronen (Weizmann Institute), Robert Gillham
(University of Adelaide), Daniel Genkin (University of Michigan), Adi Shamir
(Weizmann Institute), David Wong (NCC Group), and Yuval Yarom (University of
Adelaide and Data61) for the report.

The paper for further reading on the attack details can be found at
http://cat.eyalro.net/cat.pdf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-with-the-creation-of-dummy-fips.h-header.patch | 33 ----------------------
 package/wolfssl/wolfssl.hash                       |  2 +-
 package/wolfssl/wolfssl.mk                         |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch

diff --git a/package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch b/package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch
deleted file mode 100644
index 0e9dec751d..0000000000
--- a/package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a7fe5e35025227e348eaef5a15fd55f591d77206 Mon Sep 17 00:00:00 2001
-From: John Safranek <john@wolfssl.com>
-Date: Tue, 6 Mar 2018 13:15:35 -0800
-Subject: [PATCH] Fix issue with the creation of dummy fips.h header.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- wolfssl/wolfcrypt/include.am | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/wolfssl/wolfcrypt/include.am b/wolfssl/wolfcrypt/include.am
-index c81bdd13..6e84ed9d 100644
---- a/wolfssl/wolfcrypt/include.am
-+++ b/wolfssl/wolfcrypt/include.am
-@@ -20,7 +20,6 @@ nobase_include_HEADERS+= \
-                          wolfssl/wolfcrypt/fe_operations.h \
-                          wolfssl/wolfcrypt/ge_operations.h \
-                          wolfssl/wolfcrypt/error-crypt.h \
--                         wolfssl/wolfcrypt/fips.h \
-                          wolfssl/wolfcrypt/fips_test.h \
-                          wolfssl/wolfcrypt/hash.h \
-                          wolfssl/wolfcrypt/hc128.h \
-@@ -99,3 +98,7 @@ if BUILD_SELFTEST
- nobase_include_HEADERS+= wolfssl/wolfcrypt/selftest.h
- endif
- 
-+if BUILD_FIPS_V2
-+nobase_include_HEADERS+= wolfssl/wolfcrypt/fips.h
-+endif
-+
--- 
-2.11.0
-
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 2fdaa5762b..1ff9fc61d8 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 4e15f494604e41725499f8b708798f8ddc2fcaa8f39b4369bcd000b3cab482d8  v3.15.5-stable.tar.gz
+sha256 70e4fbeb91284a269b25a84fc526755c670475aee4034a6f237b1f754d108af3  v3.15.7-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index aefcea33d0..42198cb817 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 3.15.5
+WOLFSSL_VERSION = 3.15.7
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
 WOLFSSL_INSTALL_STAGING = YES
-- 
2.11.0
