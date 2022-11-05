Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DEEC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDA442A3F;
	Mon, 20 Feb 2023 21:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDA442A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-msQ_bD8UR7; Mon, 20 Feb 2023 21:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC5F42A43;
	Mon, 20 Feb 2023 21:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC5F42A43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19E111BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA02861048
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA02861048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hcqF44Ko-EH for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 568FB61067
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568FB61067
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 531E4828C8; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:35:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 958c166837a484e2a9515342c49e93dca734d726
X-Git-Newrev: ca6f38a340bf7eaac76aafcdf7dd78f5c61b0ba6
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.531E4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libuhttpd: fix build
 with wolfssl >= 5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca6f38a340bf7eaac76aafcdf7dd78f5c61b0ba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with wolfssl raised since bump to
version 5.2.0 in commit 14e0c4de719a0d63192cc5de66a608f75297f37d and
https://github.com/wolfSSL/wolfssl/commit/33cb8231481d5beb46b57511c2630aba36028256:

/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c: In function 'handle_wolfssl_asn_error':
/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:339:10: error: 'ASN_NTRU_KEY_E' undeclared (first use in this function); did you mean 'ASN_ECC_KEY_E'?
  339 |     case ASN_NTRU_KEY_E:
      |          ^~~~~~~~~~~~~~
      |          ASN_ECC_KEY_E

Fixes:
 - http://autobuild.buildroot.org/results/3261b0035c8aadd1b62538b53e03af1cd8a7b312

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-add-compatibility-for-wolfssl-5-0.patch   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch b/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
new file mode 100644
index 0000000000..7da7199e7e
--- /dev/null
+++ b/package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch
@@ -0,0 +1,30 @@
+From 73aa4ef762b2de67bc8c7c260bd36b34fdb91e63 Mon Sep 17 00:00:00 2001
+From: "Sergey V. Lobanov" <sergey@lobanov.in>
+Date: Mon, 3 Jan 2022 19:36:52 +0300
+Subject: [PATCH] add compatibility for wolfssl >= 5.0
+
+NTRU support has been removed in wolfssl 5.0 so it is required to
+mask NTRU specific code if wolfssl >= 5.0
+
+Signed-off-by: Sergey V. Lobanov <sergey at lobanov.in>
+[Retrieved from:
+https://github.com/zhaojh329/ssl/commit/73aa4ef762b2de67bc8c7c260bd36b34fdb91e63]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ openssl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/ssl/openssl.c b/src/ssl/openssl.c
+index 5a49267..278bab5 100644
+--- a/src/ssl/openssl.c
++++ b/src/ssl/openssl.c
+@@ -336,7 +336,9 @@ static bool handle_wolfssl_asn_error(void *ssl, int r,
+     case ASN_SIG_HASH_E:
+     case ASN_SIG_KEY_E:
+     case ASN_DH_KEY_E:
++#if LIBWOLFSSL_VERSION_HEX < 0x05000000
+     case ASN_NTRU_KEY_E:
++#endif
+     case ASN_CRIT_EXT_E:
+     case ASN_ALT_NAME_E:
+     case ASN_NO_PEM_HEADER:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
