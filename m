From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Oct 2019 23:46:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix static build on
 x86_64
Message-ID: <20191015214644.31476-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use no-asm when building statically on x86_64, see
https://github.com/openssl/openssl/issues/9839

Fixes:
 - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenssl/libopenssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 4a430bcb4d..ff9b52a002 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -56,6 +56,10 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 # Use "gcc" minimalistic target to disable DSO
 LIBOPENSSL_TARGET_ARCH = gcc
+# See https://github.com/openssl/openssl/issues/9839
+ifeq ($(ARCH),x86_64)
+LIBOPENSSL_TARGET_ARCH += no-asm
+endif
 else
 # Some architectures are optimized in OpenSSL
 # Doesn't work for thumb-only (Cortex-M?)
-- 
2.23.0
