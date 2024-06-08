Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4927CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0255C615CE;
	Sat,  8 Jun 2024 14:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_9Td5yFQn1e; Sat,  8 Jun 2024 14:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1163D615E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1163D615E2;
	Sat,  8 Jun 2024 14:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08BFE1BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D73BB607DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8bASrLhcLbf for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06330607B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06330607B8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 003C481D3C; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 16:01:03 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cc7bffeb59ce539977ec150e7abdd654c42f9d88
X-Git-Newrev: 14c80da353fa6c623a77321526d92666ded47b8e
X-Patchwork-Hint: ignore
Message-Id: <20240608140143.003C481D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/cryptodev-linux:
 fix build with kernel >= 6.7
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
Content-Type: multipart/mixed; boundary="===============7898088367606721589=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7898088367606721589==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=14c80da353fa6c623a77321526d92666ded47b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure with kernel >= 6.7:

/home/buildroot/autobuild/instance-0/output-1/build/cryptodev-linux-1.13/./cryptlib.c: In function ‘cryptodev_hash_init’:
/home/buildroot/autobuild/instance-0/output-1/build/cryptodev-linux-1.13/./cryptlib.c:384:28: error: implicit declaration of function ‘crypto_ahash_alignmask’; did you mean ‘crypto_aead_alignmask’? [-Werror=implicit-function-declaration]
  384 |         hdata->alignmask = crypto_ahash_alignmask(hdata->async.s);
      |                            ^~~~~~~~~~~~~~~~~~~~~~
      |                            crypto_aead_alignmask

Fixes:
 - http://autobuild.buildroot.org/results/466360c7baec2edf42dc6f0ad9a8d757dd471c88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 15ec07403f3abcd42441cde7186a451de8a458dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Fix-build-for-Linux-6-7-rc1.patch         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/cryptodev-linux/0003-Fix-build-for-Linux-6-7-rc1.patch b/package/cryptodev-linux/0003-Fix-build-for-Linux-6-7-rc1.patch
new file mode 100644
index 0000000000..4fdccaf6e0
--- /dev/null
+++ b/package/cryptodev-linux/0003-Fix-build-for-Linux-6-7-rc1.patch
@@ -0,0 +1,38 @@
+From 5e7121e45ff283d30097da381fd7e97c4bb61364 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Joan=20Bruguera=20Mic=C3=B3?= <joanbrugueram@gmail.com>
+Date: Sun, 10 Dec 2023 13:57:55 +0000
+Subject: [PATCH] Fix build for Linux 6.7-rc1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Since Linux 6.7-rc1, no ahash algorithms set a nonzero alignmask,
+and therefore `crypto_ahash_alignmask` has been removed.
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0f8660c82b79af595b056f6b9f4f227edeb88574
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c626910f3f1bbce6ad18bc613d895d2a089ed95e
+
+Signed-off-by: Joan Bruguera Micó <joanbrugueram@gmail.com>
+
+Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/5e7121e45ff283d30097da381fd7e97c4bb61364
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ cryptlib.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cryptlib.c b/cryptlib.c
+index 4d739e5..0e59d4c 100644
+--- a/cryptlib.c
++++ b/cryptlib.c
+@@ -381,7 +381,11 @@ int cryptodev_hash_init(struct hash_data *hdata, const char *alg_name,
+ 	}
+ 
+ 	hdata->digestsize = crypto_ahash_digestsize(hdata->async.s);
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 7, 0))
+ 	hdata->alignmask = crypto_ahash_alignmask(hdata->async.s);
++#else
++	hdata->alignmask = 0;
++#endif
+ 
+ 	init_completion(&hdata->async.result.completion);
+ 

--===============7898088367606721589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7898088367606721589==--
