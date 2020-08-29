From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 09:56:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 4.5.0
Message-ID: <20200829075621.984037-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wolfSSL version 4.5.0 contains 6 vulnerability fixes: 2 fixes for TLS 1.3,
2 side channel attack mitigations, 1 fix for a potential private key leak
in a specific use case, 1 fix for DTLS including those 3 CVEs:

- Fix CVE-2020-12457: An issue was discovered in wolfSSL before 4.5.0.
  It mishandles the change_cipher_spec (CCS) message processing logic
  for TLS 1.3. If an attacker sends ChangeCipherSpec messages in a
  crafted way involving more than one in a row, the server becomes stuck
  in the ProcessReply() loop, i.e., a denial of service.
- Fix CVE-2020-15309: An issue was discovered in wolfSSL before 4.5.0,
  when single precision is not employed. Local attackers can conduct a
  cache-timing attack against public key operations. These attackers may
  already have obtained sensitive information if the affected system has
  been used for private key operations (e.g., signing with a private
  key).
- Fix CVE-2020-24585: An issue was discovered in the DTLS handshake
  implementation in wolfSSL before 4.5.0. Clear DTLS application_data
  messages in epoch 0 do not produce an out-of-order error. Instead,
  these messages are returned to the application.

Also update hash of LICENSING as well as WOLF_LICENSE due to later
verbage update with
https://github.com/wolfSSL/wolfssl/commit/970391319beb023680eccd0e447e76834dbb4808

https://www.wolfssl.com/docs/security-vulnerabilities/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 4 ++--
 package/wolfssl/wolfssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 4a1aeebe7d..0ee55276dc 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  7f854804c8ae0ca49cc77809e38e9a3b5a8c91ba7855ea928e6d6651b0d35f18  wolfssl-4.4.0-stable.tar.gz
+sha256  7de62300ce14daa0051bfefc7c4d6302f96cabc768b6ae49eda77523b118250c  wolfssl-4.5.0-stable.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  74adaaef40b96c71378b6daa3feb8ccd4a1bfd9b76debf3f3f29cf3a0e86c9a0  LICENSING
+sha256  b23c1da1f85d699d3288d73c952b4cd02760d23dc1ddc1b221cbb8be82387189  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index e3062c39b5..5400b35fa5 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.4.0-stable
+WOLFSSL_VERSION = 4.5.0-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
-WOLFSSL_LICENSE = GPL-2.0
+WOLFSSL_LICENSE = GPL-2.0+
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
 
 WOLFSSL_DEPENDENCIES = host-pkgconf
-- 
2.28.0
