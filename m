From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 22:33:43 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libssh2: fix build
 failure due to pointer dereferencing ambiguity
Message-ID: <20190327214546.3F89988102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8009294178b01d1e7f3db20034afc66e8e1e5b27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When dereferencing from *aes_ctr_cipher, being a pointer itself,
ambiguity can occur with compiler and build can fail reporting:
openssl.c:574:20: error: ???*aes_ctr_cipher??? is a pointer; did you mean to use ???->????
     *aes_ctr_cipher->nid = type;

Add a patch to sorround every *aes_ctr_cipher-> occurence with
paranthesis like this (*aes_ctr_cipher)->

Fixes:
http://autobuild.buildroot.net/results/97c/97c43dd2122f55f3166683aa1b29ce1ca54bcb9c/
http://autobuild.buildroot.net/results/4b7/4b728d275f1399e3cb72d40482076ee54b35852a/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a7da55eb3d5236e3559f5492fa2c03bfb95084f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-dereferencing-ambiguity-potentially-caus.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch b/package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch
new file mode 100644
index 0000000000..44eed2bac4
--- /dev/null
+++ b/package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch
@@ -0,0 +1,51 @@
+From 28fe5e4de437f8fce6e428b7db9bc8640cda4c61 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Thu, 13 Sep 2018 09:51:35 +0200
+Subject: [PATCH] openssl: fix dereferencing ambiguity potentially causing
+ build failure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When dereferencing from *aes_ctr_cipher, being a pointer itself,
+ambiguity can occur with compiler and build can fail reporting:
+openssl.c:574:20: error: ???*aes_ctr_cipher??? is a pointer; did you mean to use ???->????
+     *aes_ctr_cipher->nid = type;
+
+Sorround every *aes_ctr_cipher-> occurence with paranthesis like this
+(*aes_ctr_cipher)->
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Upstream: https://github.com/libssh2/libssh2/commit/b5b6673c2823a18753a14571a6c01bde33fa3a8b
+---
+ src/openssl.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/openssl.c b/src/openssl.c
+index 678d5de..c26aaec 100644
+--- a/src/openssl.c
++++ b/src/openssl.c
+@@ -571,13 +571,13 @@ make_ctr_evp (size_t keylen, EVP_CIPHER **aes_ctr_cipher, int type)
+         EVP_CIPHER_meth_set_cleanup(*aes_ctr_cipher, aes_ctr_cleanup);
+     }
+ #else
+-    *aes_ctr_cipher->nid = type;
+-    *aes_ctr_cipher->block_size = 16;
+-    *aes_ctr_cipher->key_len = keylen;
+-    *aes_ctr_cipher->iv_len = 16;
+-    *aes_ctr_cipher->init = aes_ctr_init;
+-    *aes_ctr_cipher->do_cipher = aes_ctr_do_cipher;
+-    *aes_ctr_cipher->cleanup = aes_ctr_cleanup;
++    (*aes_ctr_cipher)->nid = type;
++    (*aes_ctr_cipher)->block_size = 16;
++    (*aes_ctr_cipher)->key_len = keylen;
++    (*aes_ctr_cipher)->iv_len = 16;
++    (*aes_ctr_cipher)->init = aes_ctr_init;
++    (*aes_ctr_cipher)->do_cipher = aes_ctr_do_cipher;
++    (*aes_ctr_cipher)->cleanup = aes_ctr_cleanup;
+ #endif
+ 
+     return *aes_ctr_cipher;
+-- 
+2.17.1
+
