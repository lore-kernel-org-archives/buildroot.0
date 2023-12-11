Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B918C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 18:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97E26141C;
	Mon, 11 Dec 2023 18:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B97E26141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JD5pAhvoNbdG; Mon, 11 Dec 2023 18:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B96613F0;
	Mon, 11 Dec 2023 18:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B96613F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88CCE1BF2B7
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 613F6821F3
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 18:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 613F6821F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erHtU3UQa9aI for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 18:57:18 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6272682214
 for <buildroot@busybox.net>; Mon, 11 Dec 2023 18:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6272682214
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 39724440869;
 Mon, 11 Dec 2023 20:55:36 +0200 (IST)
To: buildroot@busybox.net
Date: Mon, 11 Dec 2023 20:56:27 +0200
Message-ID: <dc1be561d66161495c91667e02c816e6d48880ac.1702320987.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1702320936;
 bh=knxbxcIzvdquAMSBIPOTraZolpvJTbFmUZn4eLWAUC0=;
 h=From:To:Cc:Subject:Date:From;
 b=u5MeMpcCEzB15pOzZUHwvQnJ3xnXABRbCF9noOkeVwvn/1V7uuTIv2A8+rFcD/EIO
 tXn5DlMwa0gR4gmOahMdRfmsAeqevsGrvPL7zV1KTRinkcmbJIF0FCzZp+ogF++AQ9
 xAQsiNe8KpsNdr7/nsNMCR5XoYv7lsrZXEX8gW/GdkjuhIqbQ+7y30H3oubs4Eq3Vc
 Mg55SvbsnbjAGnBzjc93Mcf+yXomlHuzTi9Nc84rPcRSSA9T6C+zXkewfT78Ck6RQA
 NPpnwR4y12GWk7sHuZuGmHNmuXC0uqux7V5qmSEkLBg2xAXqCXh+ScSefRNGtC7aU4
 ZA/gUk0KqDa9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=u5MeMpcC
Subject: [Buildroot] [PATCH] package/libcurl: fix build with GnuTLS and no
 verbose
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A change of data logging introduced in version 8.5.0 broke the build.
Add a patch to fix that.

Fixes:
http://autobuild.buildroot.net/results/c5b996696333c4ff1392dbb8e6b0edc9c5322ee4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...nutls-fix-build-with-disable-verbose.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch

diff --git a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
new file mode 100644
index 000000000000..cc7f89f9762c
--- /dev/null
+++ b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
@@ -0,0 +1,33 @@
+From 3b1ed6573bbb95831e5acd01ecac95f2cb2b9a60 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 11 Dec 2023 20:45:01 +0200
+Subject: [PATCH] gnutls: fix build with --disable-verbose
+
+infof() parameters must be defined event with --disable-verbose since
+commit dac293cfb702 ("lib: apache style infof and trace
+macros/functions").
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Upstream: https://github.com/curl/curl/pull/12505
+---
+ lib/vtls/gtls.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index f42b6d6691de..411def67f454 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -833,8 +833,10 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
+                                      gnutls_cipher_get(session),
+                                      gnutls_mac_get(session));
+ 
++#ifndef CURL_DISABLE_VERBOSE_STRINGS
+   infof(data, "SSL connection using %s / %s",
+         gnutls_protocol_get_name(version), ptr);
++#endif
+ 
+   /* This function will return the peer's raw certificate (chain) as sent by
+      the peer. These certificates are in raw format (DER encoded for
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
