From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 22:29:03 +0100
Subject: [Buildroot] [git commit] openssl: fix runtime failure on some
	powerpc variants
Message-ID: <20121210212912.A86BF9A188@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85736773fa06118b3a5a754f5f5bd4190298aecf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenSSL's assembly optimizations por PowerPC seem to be broken for at
least 4xx cores.
Thanks go to Jan Schunke for reporting and testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
