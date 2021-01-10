From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 14:41:50 +0100
Subject: [Buildroot] [git commit] package/rng-tools: bump to version 6.11
Message-ID: <20210110132409.26FF38633C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da83261c9be0484924c845bb033e2ca752556504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/nhorman/rng-tools/releases/tag/V6.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-configure.ac-fix-with-rtlsdr-option.patch | 29 ------------
 ...-rngd_jitter-disambiguate-call-to-encrypt.patch | 53 ----------------------
 package/rng-tools/rng-tools.hash                   |  2 +-
 package/rng-tools/rng-tools.mk                     |  4 +-
 4 files changed, 3 insertions(+), 85 deletions(-)

diff --git a/package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch b/package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch
deleted file mode 100644
index 586a44e21f..0000000000
--- a/package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 45a8c51a20a518ed78c5ea1829a307c045f737be Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 27 Mar 2020 22:19:42 +0100
-Subject: [PATCH] configure.ac: fix --with-rtlsdr option
-
-Add missing ',' to allow the user to explicitly disable or enable rtlsdr
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nhorman/rng-tools/pull/88]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ba796f8..1f55052 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,7 +43,7 @@ AC_ARG_WITH([pkcs11],
- 
- AC_ARG_WITH([rtlsdr],
- 	AS_HELP_STRING([--without-rtlsdr],
--		[Disable rtlsdr support. ])
-+		[Disable rtlsdr support. ]),
- 	[],
- 	[with_rtlsdr=no]
- )
--- 
-2.25.1
-
diff --git a/package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch b/package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch
deleted file mode 100644
index 99997ce866..0000000000
--- a/package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From dab16a5fd4efde8ef569b358e19b1fcbc7d0d938 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 30 Mar 2020 00:10:46 +0200
-Subject: [PATCH] rngd_jitter: disambiguate call to encrypt
-
-Commit 0f184ea7e792427fb20afe81d471b565aee96f0b disambiguate the call to
-encrypt in rngd_rdrand.c but did not update rngd_jitter.c.
-
-This raise the following build failure:
-
-rngd_jitter.c:75:12: error: conflicting types for 'encrypt'
- static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
-            ^~~~~~~
-In file included from rngd_jitter.c:27:
-/home/dawncrow/buildroot-test/scripts/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:1132:13: note: previous declaration of 'encrypt' was here
- extern void encrypt (char *__block, int __edflag) __THROW __nonnull ((1));
-             ^~~~~~~
-Makefile:770: recipe for target 'rngd-rngd_jitter.o' failed
-
-Fixes:
- - http://autobuild.buildroot.org/results/0ca6bf16e3acbc94065b88c4442d6595424b77cb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/nhorman/rng-tools/pull/89]
----
- rngd_jitter.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index c1b1aca..49a3825 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -72,7 +72,7 @@ unsigned char *aes_buf;
- char key[AES_BLOCK];
- static unsigned char iv_buf[CHUNK_SIZE] __attribute__((aligned(128)));
- 
--static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
-+static int osslencrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
-             unsigned char *iv, unsigned char *ciphertext)
- {
-         EVP_CIPHER_CTX *ctx;
-@@ -122,7 +122,7 @@ static inline int openssl_mangle(unsigned char *tmp, struct rng *ent_src)
-         unsigned char ciphertext[CHUNK_SIZE * RDRAND_ROUNDS];
- 
-         /* Encrypt the plaintext */
--        ciphertext_len = encrypt (tmp, strlen(tmp), key, iv_buf,
-+        ciphertext_len = osslencrypt (tmp, strlen(tmp), key, iv_buf,
-                               ciphertext);
-         if (!ciphertext_len)
-                 return -1;
--- 
-2.25.1
-
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 3202a88d67..de1f72617c 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e462821aaa7d6dc24646aa0d2239d97cb8b07b3e60715159a9edcaa9189f8ef  rng-tools-6.10.tar.gz
+sha256  644d8bd4e84cee29debddc7e6db72aff27e628e5a879ce310562edf50f12be41  rng-tools-6.11.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 8a971de5e9..ae20d96362 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.10
-RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
+RNG_TOOLS_VERSION = 6.11
+RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),V$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_DEPENDENCIES = libsysfs host-pkgconf openssl
