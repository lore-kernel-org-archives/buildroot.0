From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Dec 2015 10:52:46 -0300
Subject: [Buildroot] [PATCH] cryptodev-linux: bump to version 1.8
Message-ID: <1448977966-15980-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches are upstream so remove them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-fix-compilation-against-linux-3.19.patch  | 37 ----------------
 .../0002-Fix-compilation-against-linux-4.3.patch   | 50 ----------------------
 package/cryptodev-linux/cryptodev-linux.hash       |  2 +-
 package/cryptodev-linux/cryptodev-linux.mk         |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
 delete mode 100644 package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch

diff --git a/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch b/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
deleted file mode 100644
index aebbc9b..0000000
--- a/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5054d20d45571cc85339351fde52f872eeb82206 Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Tue, 10 Feb 2015 04:57:05 +0100
-Subject: [PATCH] fix compilation against linux-3.19
-
-Commit f938612dd97d481b8b5bf960c992ae577f081c17 in linux.git removes
-get_unused_fd() macro. This patch changes the calling code to use it's
-content 'get_unused_fd_flags(0)' instead. Checking for when
-get_unused_fd_flags was introduced shows it's been there since 2.6.23 at
-least, so probably no need to make this change conditional on the target
-kernel version.
-
-Original patch by Ricardo Ribalda Delgado for Open Embedded, reported by
-Oleg Rakhmanov.
-
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- ioctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ioctl.c b/ioctl.c
-index 5a55a76..b23f5fd 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -546,7 +546,7 @@ static int
- clonefd(struct file *filp)
- {
- 	int ret;
--	ret = get_unused_fd();
-+	ret = get_unused_fd_flags(0);
- 	if (ret >= 0) {
- 			get_file(filp);
- 			fd_install(ret, filp);
--- 
-2.0.5
-
diff --git a/package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch b/package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch
deleted file mode 100644
index e8e8423..0000000
--- a/package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From e8acc16d455876855ac3e13efa5f24f1e93a42e0 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 19 Nov 2015 10:41:30 -0300
-Subject: [PATCH] Fix compilation against linux 4.3
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Linux Crypto API changed to using aead_request_set_ad()
-instead of aead_request_set_assoc().
-
-Based on Horia Geant?'s patch from
-https://mail.gna.org/public/cryptodev-linux-devel/2015-11/msg00002.html
-
-However we need to version-guard the change for older versions of the
-kernel to avoid the build from breaking for them.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- cryptlib.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/cryptlib.h b/cryptlib.h
-index a0a8a63..f0c2736 100644
---- a/cryptlib.h
-+++ b/cryptlib.h
-@@ -1,6 +1,8 @@
- #ifndef CRYPTLIB_H
- # define CRYPTLIB_H
- 
-+#include <linux/version.h>
-+
- struct cipher_data {
- 	int init; /* 0 uninitialized */
- 	int blocksize;
-@@ -40,7 +42,11 @@ static inline void cryptodev_cipher_auth(struct cipher_data *cdata,
- 					 struct scatterlist *sg1, size_t len)
- {
- 	/* for some reason we _have_ to call that even for zero length sgs */
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0))
- 	aead_request_set_assoc(cdata->async.arequest, len ? sg1 : NULL, len);
-+#else
-+	aead_request_set_ad(cdata->async.arequest, len);
-+#endif
- }
- 
- static inline void cryptodev_cipher_set_tag_size(struct cipher_data *cdata, int size)
--- 
-2.4.10
-
diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d5e0bae..d7195ac 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking php signature
-sha256	41880533b53de4d7b3f054e230f576988dafb8eed7bef5ebcf6422bb2e3a3b25	cryptodev-linux-1.7.tar.gz
+sha256	67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376	cryptodev-linux-1.8.tar.gz
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 6001c71..c3f5355 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.7
+CRYPTODEV_LINUX_VERSION = 1.8
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
-- 
2.4.10
