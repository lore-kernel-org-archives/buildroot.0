From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 22:34:45 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libssh2: security
 bump to latest git
Message-ID: <20190327214546.4C42188102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb4c55b0b5152248d0c61a6037c15b7971ad831e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Bump the version to latest git to fix the following security issues:

CVE-2019-3855
 Possible integer overflow in transport read allows out-of-bounds write
 URL: https://www.libssh2.org/CVE-2019-3855.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3855.patch

CVE-2019-3856
 Possible integer overflow in keyboard interactive handling allows
 out-of-bounds write
 URL: https://www.libssh2.org/CVE-2019-3856.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3856.patch

CVE-2019-3857
 Possible integer overflow leading to zero-byte allocation and out-of-bounds
 write
 URL: https://www.libssh2.org/CVE-2019-3857.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3857.patch

CVE-2019-3858
 Possible zero-byte allocation leading to an out-of-bounds read
 URL: https://www.libssh2.org/CVE-2019-3858.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3858.patch

CVE-2019-3859
 Out-of-bounds reads with specially crafted payloads due to unchecked use of
 `_libssh2_packet_require` and `_libssh2_packet_requirev`
 URL: https://www.libssh2.org/CVE-2019-3859.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3859.patch

CVE-2019-3860
 Out-of-bounds reads with specially crafted SFTP packets
 URL: https://www.libssh2.org/CVE-2019-3860.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3860.patch

CVE-2019-3861
 Out-of-bounds reads with specially crafted SSH packets
 URL: https://www.libssh2.org/CVE-2019-3861.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3861.patch

CVE-2019-3862
 Out-of-bounds memory comparison
 URL: https://www.libssh2.org/CVE-2019-3862.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3862.patch

CVE-2019-3863
 Integer overflow in user authenicate keyboard interactive allows
 out-of-bounds writes
 URL: https://www.libssh2.org/CVE-2019-3863.html
 Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3863.txt

Drop 0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch as that
is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f4f7dd9557cf139f6014ada77e947152d5a82fb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-dereferencing-ambiguity-potentially-caus.patch | 51 ----------------------
 package/libssh2/libssh2.hash                       |  2 +-
 package/libssh2/libssh2.mk                         |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch b/package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch
deleted file mode 100644
index 44eed2bac4..0000000000
--- a/package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 28fe5e4de437f8fce6e428b7db9bc8640cda4c61 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Thu, 13 Sep 2018 09:51:35 +0200
-Subject: [PATCH] openssl: fix dereferencing ambiguity potentially causing
- build failure
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When dereferencing from *aes_ctr_cipher, being a pointer itself,
-ambiguity can occur with compiler and build can fail reporting:
-openssl.c:574:20: error: ???*aes_ctr_cipher??? is a pointer; did you mean to use ???->????
-     *aes_ctr_cipher->nid = type;
-
-Sorround every *aes_ctr_cipher-> occurence with paranthesis like this
-(*aes_ctr_cipher)->
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Upstream: https://github.com/libssh2/libssh2/commit/b5b6673c2823a18753a14571a6c01bde33fa3a8b
----
- src/openssl.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/openssl.c b/src/openssl.c
-index 678d5de..c26aaec 100644
---- a/src/openssl.c
-+++ b/src/openssl.c
-@@ -571,13 +571,13 @@ make_ctr_evp (size_t keylen, EVP_CIPHER **aes_ctr_cipher, int type)
-         EVP_CIPHER_meth_set_cleanup(*aes_ctr_cipher, aes_ctr_cleanup);
-     }
- #else
--    *aes_ctr_cipher->nid = type;
--    *aes_ctr_cipher->block_size = 16;
--    *aes_ctr_cipher->key_len = keylen;
--    *aes_ctr_cipher->iv_len = 16;
--    *aes_ctr_cipher->init = aes_ctr_init;
--    *aes_ctr_cipher->do_cipher = aes_ctr_do_cipher;
--    *aes_ctr_cipher->cleanup = aes_ctr_cleanup;
-+    (*aes_ctr_cipher)->nid = type;
-+    (*aes_ctr_cipher)->block_size = 16;
-+    (*aes_ctr_cipher)->key_len = keylen;
-+    (*aes_ctr_cipher)->iv_len = 16;
-+    (*aes_ctr_cipher)->init = aes_ctr_init;
-+    (*aes_ctr_cipher)->do_cipher = aes_ctr_do_cipher;
-+    (*aes_ctr_cipher)->cleanup = aes_ctr_cleanup;
- #endif
- 
-     return *aes_ctr_cipher;
--- 
-2.17.1
-
diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index d57c8d7062..c4732a2c07 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ec2b32b44ae5f8fe094f663f63953fb31314de838eb36e8c47e5a89137b5a1bc  libssh2-8b870ad771cbd9cd29edbb3dbb0878e950f868ab.tar.gz
+sha256 468e7a81a8121c06cb099eef2e17106b0b8c2e1d890b1c0e34e1951f182babb1  libssh2-1b3cbaff518f32e5b70650d4b7b52361b1410d37.tar.gz
 sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 0e13701b29..e3d0957942 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 8b870ad771cbd9cd29edbb3dbb0878e950f868ab
+LIBSSH2_VERSION = 1b3cbaff518f32e5b70650d4b7b52361b1410d37
 LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
