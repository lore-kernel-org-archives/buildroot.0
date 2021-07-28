Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD62DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:34:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 484B460240
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 484B460240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2711360875;
	Tue,  3 Aug 2021 22:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVNslvHj7cR1; Tue,  3 Aug 2021 22:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91FC7606EE;
	Tue,  3 Aug 2021 22:34:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69B051BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 900E54035F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRTWS4I0_ITc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D927640592
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2F12787C2D; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:19:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aedf2c83d0830af879314db8422d49be345f057d
X-Git-Newrev: 59edd9927cc648e5fe2c247e0ec6d5d83fe99434
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.2F12787C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/open62541: fix build
 with nios2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=59edd9927cc648e5fe2c247e0ec6d5d83fe99434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with nios2 raised since bump to version
1.2.2 in commit	b436b82411305839abc76bb438fe92661a067526:

/home/buildroot/autobuild/instance-1/output-1/build/open62541-v1.2.2/src/ua_types_encoding_binary.c: In function 'unpack754':
/home/buildroot/autobuild/instance-1/output-1/build/open62541-v1.2.2/src/ua_types_encoding_binary.c:322:12: error: conversion to 'long double' from 'long long int' may alter its value [-Werror=conversion]
     result /= (1LL<<significandbits);
            ^~

Fixes:
 - http://autobuild.buildroot.org/results/c0a33dbada549c480bc741c1c8177b788ff053db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-Explicit-cast-to-avoid-compiler-warning.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch b/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
new file mode 100644
index 0000000000..dea325c17f
--- /dev/null
+++ b/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
@@ -0,0 +1,25 @@
+From 0c53fd776af9631c915c8722e1d68ce9a69fa3f6 Mon Sep 17 00:00:00 2001
+From: Andreas Walter <andreas.walter@waltronix.de>
+Date: Fri, 26 Feb 2021 11:49:25 +0100
+Subject: [PATCH] fix(core): Explicit cast to avoid compiler warning (#4203)
+
+[Retrieved from:
+https://github.com/open62541/open62541/commit/0c53fd776af9631c915c8722e1d68ce9a69fa3f6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/ua_types_encoding_binary.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ua_types_encoding_binary.c b/src/ua_types_encoding_binary.c
+index 0fe88eb98e0..abbd23735d3 100644
+--- a/src/ua_types_encoding_binary.c
++++ b/src/ua_types_encoding_binary.c
+@@ -319,7 +319,7 @@ static long double
+ unpack754(uint64_t i, unsigned bits, unsigned expbits) {
+     unsigned significandbits = bits - expbits - 1;
+     long double result = (long double)(i&(uint64_t)((1LL<<significandbits)-1));
+-    result /= (1LL<<significandbits);
++    result /= (long double)(1LL<<significandbits);
+     result += 1.0f;
+     unsigned bias = (unsigned)(1<<(expbits-1)) - 1;
+     long long shift = (long long)((i>>significandbits) & (uint64_t)((1LL<<expbits)-1)) - bias;
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
