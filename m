From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:30:54 +0100
Subject: [Buildroot] [git commit branch/next] cryptodev-linux: bump to
	version 1.7
Message-ID: <20150219203102.958237FC62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=283555586f5f7c17cd816888b1138cadd246448d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hash file and build fix patch (upstream) for kernels >=3.19.
Drop old patches that were upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ce_INIT_COMPLETION_with_reinit_completion.patch |   83 --------------------
 .../0001-fix-compilation-against-linux-3.19.patch  |   37 +++++++++
 package/cryptodev-linux/cryptodev-linux.hash       |    2 +
 package/cryptodev-linux/cryptodev-linux.mk         |    2 +-
 4 files changed, 40 insertions(+), 84 deletions(-)

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
diff --git a/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch b/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
new file mode 100644
index 0000000..aebbc9b
--- /dev/null
+++ b/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
@@ -0,0 +1,37 @@
+From 5054d20d45571cc85339351fde52f872eeb82206 Mon Sep 17 00:00:00 2001
+From: Phil Sutter <phil@nwl.cc>
+Date: Tue, 10 Feb 2015 04:57:05 +0100
+Subject: [PATCH] fix compilation against linux-3.19
+
+Commit f938612dd97d481b8b5bf960c992ae577f081c17 in linux.git removes
+get_unused_fd() macro. This patch changes the calling code to use it's
+content 'get_unused_fd_flags(0)' instead. Checking for when
+get_unused_fd_flags was introduced shows it's been there since 2.6.23 at
+least, so probably no need to make this change conditional on the target
+kernel version.
+
+Original patch by Ricardo Ribalda Delgado for Open Embedded, reported by
+Oleg Rakhmanov.
+
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ ioctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 5a55a76..b23f5fd 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -546,7 +546,7 @@ static int
+ clonefd(struct file *filp)
+ {
+ 	int ret;
+-	ret = get_unused_fd();
++	ret = get_unused_fd_flags(0);
+ 	if (ret >= 0) {
+ 			get_file(filp);
+ 			fd_install(ret, filp);
+-- 
+2.0.5
+
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
