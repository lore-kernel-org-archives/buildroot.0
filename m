Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E85C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 13:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F03560AC4;
	Mon, 13 Mar 2023 13:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F03560AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyZwwY-xu39T; Mon, 13 Mar 2023 13:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4FE460B24;
	Mon, 13 Mar 2023 13:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4FE460B24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 295921BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 13:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0FAD403C2
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 13:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0FAD403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAAF_UugTV1C for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 13:34:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E424016C
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73E424016C
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 13:34:29 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 117585C32B2;
 Mon, 13 Mar 2023 14:34:26 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 14:34:18 +0100
Message-Id: <189b4d81990997b87dec82c4865a3d25e35573b0.1678714004.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1678714466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=yQApfFPAat83U4IOLOCC92wlGnn8gp1PCcxgQ8VceKc=;
 b=LAScR3xAEfzFNioRMnQrp3gqrFC9M86ySd1Wh5NqBFLfXR21JW+y9l+pQh3q30LM3swy7L
 xwQEwLT3kQLN8iXKaBkGN/XfKdAbRErL5/mTOIXd1i314R9M8dpYLDNuE+sOyj3k/D/zdF
 nmgGD3pTGQhraILu3dzG7Z22YqVyewI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=LAScR3xA
Subject: [Buildroot] [PATCH] package/gptfdisk: fix another runtime failure
 with popt 1.19
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following runtime failure raised since bump of popt to version
1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:

Segmentation fault (core dumped)

Fixes:
 - No autobuilder failure

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 ...ence-when-duplicating-string-argumen.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch

diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
new file mode 100644
index 0000000000..8541fd2772
--- /dev/null
+++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
@@ -0,0 +1,41 @@
+From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
+Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1678702777.git.stefan@agner.ch>
+From: Damian Kurek <starfire24680@gmail.com>
+Date: Thu, 7 Jul 2022 03:39:16 +0000
+Subject: [PATCH] Fix NULL dereference when duplicating string argument
+
+poptGetArg can return NULL if there are no additional arguments, which
+makes strdup dereference NULL on strlen
+---
+ gptcl.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gptcl.cc b/gptcl.cc
+index 0d578eb..ab95239 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+ 
+    // Assume first non-option argument is the device filename....
+-   device = strdup((char*) poptGetArg(poptCon));
+-   poptResetContext(poptCon);
++   device = (char*) poptGetArg(poptCon);
+ 
+    if (device != NULL) {
++      device = strdup(device);
++      poptResetContext(poptCon);
+       JustLooking(); // reset as necessary
+       BeQuiet(); // Tell called functions to be less verbose & interactive
+       if (LoadPartitions((string) device)) {
+@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+          cerr << "Error encountered; not saving changes.\n";
+          retval = 4;
+       } // if
++      free(device);
+    } // if (device != NULL)
+    poptFreeContext(poptCon);
+    return retval;
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
