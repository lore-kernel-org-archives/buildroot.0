Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D70DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EA861008;
	Tue,  3 May 2022 20:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UovRS3D0lwOt; Tue,  3 May 2022 20:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649B960BDB;
	Tue,  3 May 2022 20:32:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25C571BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 974E840528
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZVw1ywR9ReE for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4FCF40B37
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 92EBB854F2; Tue,  3 May 2022 20:20:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:23:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8b1ac2d11a0c04df58220893e532937985413bc
X-Git-Newrev: c4077fc834cb9e7aa1b9442c43b03a0f23067961
X-Patchwork-Hint: ignore
Message-Id: <20220503202054.92EBB854F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aircrack-ng: fix build with
 libressl >= 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4077fc834cb9e7aa1b9442c43b03a0f23067961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

lib/crypto/crypto.c: In function 'calc_mic':
lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
  203 |  HMAC_CTX ctx = {0};
      |  ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...pto-crypto.c-fx-build-with-libressl-3.5.0.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..da1549df5b
--- /dev/null
+++ b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
@@ -0,0 +1,35 @@
+From cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 3 May 2022 01:34:41 +0200
+Subject: [PATCH] lib/crypto/crypto.c: fx build with libressl >= 3.5.0 (#2310)
+
+Fix the following build failure with libressl >= 3.5.0:
+
+lib/crypto/crypto.c: In function 'calc_mic':
+lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
+  203 |  HMAC_CTX ctx = {0};
+      |  ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/aircrack-ng/aircrack-ng/commit/cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d]
+---
+ lib/crypto/crypto.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypto/crypto.c b/lib/crypto/crypto.c
+index df2c1bf41..52bc5e5ac 100644
+--- a/lib/crypto/crypto.c
++++ b/lib/crypto/crypto.c
+@@ -196,7 +196,7 @@ void calc_mic(struct AP_info * ap,
+ 	int i;
+ 	unsigned char pke[100];
+ #if defined(USE_GCRYPT) || OPENSSL_VERSION_NUMBER < 0x10100000L                \
+-	|| defined(LIBRESSL_VERSION_NUMBER)
++	|| (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #define HMAC_USE_NO_PTR
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
