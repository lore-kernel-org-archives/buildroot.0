From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Jul 2013 17:38:40 -0300
Subject: [Buildroot] [PATCH] gnutls: fix build failure with cryptodev
Message-ID: <1373488720-411-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some internal gnutls structures changed but it wasn't reflected in the
cryptodev accelerator code thus causing build breakage (the reset hook
was dropped).
Thanks to Ryan Barnett for reporting.

Closes bug #6374

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../gnutls-01-eliminate-reset-from-cryptodev.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/gnutls/gnutls-01-eliminate-reset-from-cryptodev.patch

diff --git a/package/gnutls/gnutls-01-eliminate-reset-from-cryptodev.patch b/package/gnutls/gnutls-01-eliminate-reset-from-cryptodev.patch
new file mode 100644
index 0000000..273d4a8
--- /dev/null
+++ b/package/gnutls/gnutls-01-eliminate-reset-from-cryptodev.patch
@@ -0,0 +1,44 @@
+From b9c31cb757c3f5e1cf8d0dbb2906829b3680423b Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 10 Jul 2013 17:18:34 -0300
+Subject: [PATCH] Eliminate reset from cryptodev hashes and mac
+
+It wasn't done in 73ec74c2 and 6f0ecbf4 for cryptodev causing build
+failures.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/accelerated/cryptodev.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/lib/accelerated/cryptodev.c b/lib/accelerated/cryptodev.c
+index 63b0174..f3d8805 100644
+--- a/lib/accelerated/cryptodev.c
++++ b/lib/accelerated/cryptodev.c
+@@ -49,7 +49,6 @@ struct cryptodev_ctx
+   struct session_op sess;
+   struct crypt_op cryp;
+   uint8_t iv[EALG_MAX_BLOCK_LEN];
+-  int reset;
+ 
+   int cfd;
+ };
+@@ -356,7 +355,6 @@ static const gnutls_crypto_mac_st mac_struct = {
+   .hash = NULL,
+   .output = NULL,
+   .deinit = NULL,
+-  .reset = NULL,
+   .fast = cryptodev_mac_fast
+ };
+ 
+@@ -407,7 +405,6 @@ static const gnutls_crypto_digest_st digest_struct = {
+   .hash = NULL,
+   .output = NULL,
+   .deinit = NULL,
+-  .reset = NULL,
+   .fast = cryptodev_digest_fast
+ };
+ 
+-- 
+1.8.1.5
+
-- 
1.8.1.5
