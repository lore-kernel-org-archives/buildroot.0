From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Mar 2020 00:21:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix redefinition of
 encrypt
Message-ID: <20200329222150.95147-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bb7dbd5a76c1ecd2a1d205f4a1c391095e653886

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._jitter-disambiguate-call-to-encrypt.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch

diff --git a/package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch b/package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch
new file mode 100644
index 0000000000..99997ce866
--- /dev/null
+++ b/package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch
@@ -0,0 +1,53 @@
+From dab16a5fd4efde8ef569b358e19b1fcbc7d0d938 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 30 Mar 2020 00:10:46 +0200
+Subject: [PATCH] rngd_jitter: disambiguate call to encrypt
+
+Commit 0f184ea7e792427fb20afe81d471b565aee96f0b disambiguate the call to
+encrypt in rngd_rdrand.c but did not update rngd_jitter.c.
+
+This raise the following build failure:
+
+rngd_jitter.c:75:12: error: conflicting types for 'encrypt'
+ static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
+            ^~~~~~~
+In file included from rngd_jitter.c:27:
+/home/dawncrow/buildroot-test/scripts/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:1132:13: note: previous declaration of 'encrypt' was here
+ extern void encrypt (char *__block, int __edflag) __THROW __nonnull ((1));
+             ^~~~~~~
+Makefile:770: recipe for target 'rngd-rngd_jitter.o' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0ca6bf16e3acbc94065b88c4442d6595424b77cb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nhorman/rng-tools/pull/89]
+---
+ rngd_jitter.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index c1b1aca..49a3825 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -72,7 +72,7 @@ unsigned char *aes_buf;
+ char key[AES_BLOCK];
+ static unsigned char iv_buf[CHUNK_SIZE] __attribute__((aligned(128)));
+ 
+-static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
++static int osslencrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
+             unsigned char *iv, unsigned char *ciphertext)
+ {
+         EVP_CIPHER_CTX *ctx;
+@@ -122,7 +122,7 @@ static inline int openssl_mangle(unsigned char *tmp, struct rng *ent_src)
+         unsigned char ciphertext[CHUNK_SIZE * RDRAND_ROUNDS];
+ 
+         /* Encrypt the plaintext */
+-        ciphertext_len = encrypt (tmp, strlen(tmp), key, iv_buf,
++        ciphertext_len = osslencrypt (tmp, strlen(tmp), key, iv_buf,
+                               ciphertext);
+         if (!ciphertext_len)
+                 return -1;
+-- 
+2.25.1
+
-- 
2.25.1
