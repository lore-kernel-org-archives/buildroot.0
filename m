From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Dec 2012 09:06:20 -0300
Subject: [Buildroot] [PATCH] openssl: fix runtime failure on some powerpc
	variants
Message-ID: <1354881980-24101-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenSSL's assembly optimizations por PowerPC seem to be broken for at
least 4xx cores.
Thanks go to Jan Schunke for reporting and testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 265a4fb..160df2e 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -38,8 +38,11 @@ endif
 endif
 endif
 ifeq ($(ARCH),powerpc)
+# 4xx cores seem to have trouble with openssl's ASM optimizations
+ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
 	OPENSSL_TARGET_ARCH = ppc
 endif
+endif
 ifeq ($(ARCH),x86_64)
 	OPENSSL_TARGET_ARCH = x86_64
 endif
-- 
1.7.8.6
