From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Feb 2015 17:24:53 -0300
Subject: [Buildroot] [PATCH] cryptodev-linux: bump to version 1.7
Message-ID: <1424204693-25500-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file.
And drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ce_INIT_COMPLETION_with_reinit_completion.patch | 83 ----------------------
 package/cryptodev-linux/cryptodev-linux.hash       |  2 +
 package/cryptodev-linux/cryptodev-linux.mk         |  2 +-
 3 files changed, 3 insertions(+), 84 deletions(-)
 delete mode 100644 package/cryptodev-linux/0001-Replace_INIT_COMPLETION_with_reinit_completion.patch
 create mode 100644 package/cryptodev-linux/cryptodev-linux.hash

diff --git a/package/cryptodev-linux/0001-Replace_INIT_COMPLETION_with_reinit_completion.patch b/package/cryptodev-linux/0001-Replace_INIT_COMPLETION_with_reinit_completion.patch
deleted file mode 100644
index 3c1b580..0000000
--- a/package/cryptodev-linux/0001-Replace_INIT_COMPLETION_with_reinit_completion.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
-To: <cryptodev-linux-devel@gna.org>
-Subject: [Cryptodev-linux-devel] [PATCH v2] Replace INIT_COMPLETION with
-	reinit_completion.
-
-In the 3.13-rc1 Linux kernel, the INIT_COMPLETION macro has been replaced
-with an inline function, reinit_completion [1][2]. We are currently
-using the 3.13-rc3 Linux kernel, which leads to the following error:
-
-cryptlib.c:279:2: error: implicit declaration of function 'INIT_COMPLETION' [-Werror=implicit-function-declaration]
-  INIT_COMPLETION(cdata->async.result->completion);
-
-[1] https://github.com/torvalds/linux/commit/c32f74ab2872994bc8336ed367313da3139350ca
-[2] https://github.com/torvalds/linux/commit/62026aedaacedbe1ffe94a3599ad4acd8ecdf587
-
-Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
-Reviewed-by: Cristian Stoica <cristian.stoica@freescale.com>
-Tested-by: Cristian Stoica <cristian.stoica@freescale.com>
-Signed-off-by: Horia Geanta <horia.geanta@freescale.com>
----
- cryptlib.c      | 8 ++++----
- cryptodev_int.h | 6 ++++++
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/cryptlib.c b/cryptlib.c
-index e6c91fc..fe25563 100644
---- a/cryptlib.c
-+++ b/cryptlib.c
-@@ -276,7 +276,7 @@ ssize_t cryptodev_cipher_encrypt(struct cipher_data *cdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(cdata->async.result->completion);
-+	reinit_completion(&cdata->async.result->completion);
- 
- 	if (cdata->aead == 0) {
- 		ablkcipher_request_set_crypt(cdata->async.request,
-@@ -299,7 +299,7 @@ ssize_t cryptodev_cipher_decrypt(struct cipher_data *cdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(cdata->async.result->completion);
-+	reinit_completion(&cdata->async.result->completion);
- 	if (cdata->aead == 0) {
- 		ablkcipher_request_set_crypt(cdata->async.request,
- 			(struct scatterlist *)src, dst,
-@@ -410,7 +410,7 @@ ssize_t cryptodev_hash_update(struct hash_data *hdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(hdata->async.result->completion);
-+	reinit_completion(&hdata->async.result->completion);
- 	ahash_request_set_crypt(hdata->async.request, sg, NULL, len);
- 
- 	ret = crypto_ahash_update(hdata->async.request);
-@@ -422,7 +422,7 @@ int cryptodev_hash_final(struct hash_data *hdata, void* output)
- {
- 	int ret;
- 
--	INIT_COMPLETION(hdata->async.result->completion);
-+	reinit_completion(&hdata->async.result->completion);
- 	ahash_request_set_crypt(hdata->async.request, NULL, output, 0);
- 
- 	ret = crypto_ahash_final(hdata->async.request);
-diff --git a/cryptodev_int.h b/cryptodev_int.h
-index eb2aabf..3834ef1 100644
---- a/cryptodev_int.h
-+++ b/cryptodev_int.h
-@@ -2,6 +2,12 @@
- #ifndef CRYPTODEV_INT_H
- # define CRYPTODEV_INT_H
- 
-+#include <linux/version.h>
-+
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
-+#  define reinit_completion(x) INIT_COMPLETION(*(x))
-+#endif
-+
- #include <linux/init.h>
- #include <linux/sched.h>
- #include <linux/fs.h>
--- 
-1.8.3.1
diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
new file mode 100644
index 0000000..d5e0bae
--- /dev/null
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking php signature
+sha256	41880533b53de4d7b3f054e230f576988dafb8eed7bef5ebcf6422bb2e3a3b25	cryptodev-linux-1.7.tar.gz
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 03e3126..6f41930 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.6
+CRYPTODEV_LINUX_VERSION = 1.7
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
 CRYPTODEV_LINUX_DEPENDENCIES = linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
-- 
2.0.5
