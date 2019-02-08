From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  8 Feb 2019 12:46:59 -0600
Subject: [Buildroot] [PATCH] package/libopenssl: m68x use SMALL_FOOTPRINT
 mode
Message-ID: <1549651619-2551-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OPENSSL_SMALL_FOOTPRINT mode selects alternate paths in the sha512 and
blake2 algorithms which resolves a assembler issue like the following.

/tmp/ccfnLhKQ.s: Assembler messages:
/tmp/ccfnLhKQ.s:11167: Error: value -32790 out of range
make[2]: *** [crypto/blake2/blake2b.o] Error 1

This issue was found after the OpenSSL1.1.x bump.

Fixes
http://autobuild.buildroot.net/results/533e817695cde321b725145112cfd83c092d9d75

Upstream ticket
https://github.com/openssl/openssl/issues/8190

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libopenssl/libopenssl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 0bfc74e..a845f1d 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -16,9 +16,11 @@ LIBOPENSSL_TARGET_ARCH = generic32
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
 
-# relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
+# relocation truncated to fit: R_68K_GOT16O
 LIBOPENSSL_CFLAGS += -mxgot
+# resolves an assembler "out of range error" with blake2 and sha512 algorithms
+LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
 endif
 
 ifeq ($(BR2_USE_MMU),)
-- 
1.9.1
