From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 23:30:11 +0100
Subject: [Buildroot] [git commit] cryptodev-linux: add build fix patch for
	4.3+ kernels
Message-ID: <20151119230022.8330B81F86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90d6fe5ae093438514ddee8bd68ca2b08a336eac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch status: sent upstream
https://mail.gna.org/public/cryptodev-linux-devel/2015-11/msg00003.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Fix-compilation-against-linux-4.3.patch   |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch b/package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch
new file mode 100644
index 0000000..e8e8423
--- /dev/null
+++ b/package/cryptodev-linux/0002-Fix-compilation-against-linux-4.3.patch
@@ -0,0 +1,50 @@
+From e8acc16d455876855ac3e13efa5f24f1e93a42e0 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 19 Nov 2015 10:41:30 -0300
+Subject: [PATCH] Fix compilation against linux 4.3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Linux Crypto API changed to using aead_request_set_ad()
+instead of aead_request_set_assoc().
+
+Based on Horia Geant??'s patch from
+https://mail.gna.org/public/cryptodev-linux-devel/2015-11/msg00002.html
+
+However we need to version-guard the change for older versions of the
+kernel to avoid the build from breaking for them.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ cryptlib.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/cryptlib.h b/cryptlib.h
+index a0a8a63..f0c2736 100644
+--- a/cryptlib.h
++++ b/cryptlib.h
+@@ -1,6 +1,8 @@
+ #ifndef CRYPTLIB_H
+ # define CRYPTLIB_H
+ 
++#include <linux/version.h>
++
+ struct cipher_data {
+ 	int init; /* 0 uninitialized */
+ 	int blocksize;
+@@ -40,7 +42,11 @@ static inline void cryptodev_cipher_auth(struct cipher_data *cdata,
+ 					 struct scatterlist *sg1, size_t len)
+ {
+ 	/* for some reason we _have_ to call that even for zero length sgs */
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0))
+ 	aead_request_set_assoc(cdata->async.arequest, len ? sg1 : NULL, len);
++#else
++	aead_request_set_ad(cdata->async.arequest, len);
++#endif
+ }
+ 
+ static inline void cryptodev_cipher_set_tag_size(struct cipher_data *cdata, int size)
+-- 
+2.4.10
+
