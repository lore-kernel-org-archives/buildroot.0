Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417CDC761A6
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 13:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1727A4097C;
	Wed, 29 Mar 2023 13:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1727A4097C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0g0blrYzh6X; Wed, 29 Mar 2023 13:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4C7410B8;
	Wed, 29 Mar 2023 13:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4C7410B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 195341BF5A1
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 13:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E71E2402F2
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 13:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71E2402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdv5jPtEkBqB for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 13:02:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D848401C2
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D848401C2
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 13:02:47 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id AA6DF5C3E21;
 Wed, 29 Mar 2023 15:02:44 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org,
	thomas.petazzoni@bootlin.com
Date: Wed, 29 Mar 2023 15:02:35 +0200
Message-Id: <2120646ed4f19a45b5fab83a212413f79be91448.1680094918.git.stefan@agner.ch>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1680094964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=+NZE7TJhvl1MMLTFELrR/1BQFqRlIFralDCqG7kz7MQ=;
 b=bP+eh5ltS1RNsOKW4HZ5cG+Pa1WlHIyIhME7aPdGuDnRWlfRFbeTShJE+SWApMR4I9bfm0
 SnFlWUTdR4TMSGzzKkE10RKqWiudw8HtilP7RleZkR1Cl/PrNn6HIQBIQyDcJ50agFWFg+
 ygPNJJBth4Q3LFGZuiq256QivFO0k+8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=bP+eh5lt
Subject: [Buildroot] [PATCH v2] package/gptfdisk: fix another runtime
 failure with popt 1.19
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

Fix the issue by backporting a fix found in upstream git repository [0].

[0] https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9/

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 ...ence-when-duplicating-string-argumen.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch

diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
new file mode 100644
index 0000000000..1642343d06
--- /dev/null
+++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
@@ -0,0 +1,43 @@
+From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
+Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1680094621.git.stefan@agner.ch>
+From: Damian Kurek <starfire24680@gmail.com>
+Date: Thu, 7 Jul 2022 03:39:16 +0000
+Subject: [PATCH] Fix NULL dereference when duplicating string argument
+
+poptGetArg can return NULL if there are no additional arguments, which
+makes strdup dereference NULL on strlen
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
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
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
