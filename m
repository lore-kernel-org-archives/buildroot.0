Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82F5C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8435260E8F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8435260E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AAB82EA4;
	Thu, 22 Jul 2021 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4SRSQflHYij; Thu, 22 Jul 2021 21:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD8382FEA;
	Thu, 22 Jul 2021 21:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3FE1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D94C401C7
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QxK4uksFLmi for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:08:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C374840179
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 21:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A53BD18287E; Thu, 22 Jul 2021 23:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1626988127; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=20zeyZjZWE26mWua4uIsds1+WvgteWn0h0oQTvOlkOo=;
 b=vbxDd3W1kZiDswYrQUt2v30aoobRWgZSMdZ8+ugLsUnHKwd1fr5MKdUO66uE1kMiVYsxmc
 PYSv/aiqqS4jFNR50956411ld/s2CfW1FR7v33x/+CGg4q0//dBZEJ2ShjsgSHHbjPpY0A
 iAno2lFFDtItQxBIm51iBwWIwO61qwM=
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 23:07:02 +0200
Message-Id: <20210722210704.29948-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/bluez5_utils: fix build with musl
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
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

add missing include limits.h for MAX_PATH in mesh-cfgtest.c.

Patch submitted upstream:
https://lore.kernel.org/linux-bluetooth/20210722204923.29735-1-bluez@heine.tech

Fixes:
http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...-tools-mesh-cfgtest-include-limits.h.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch

diff --git a/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
new file mode 100644
index 0000000000..fdb9b15763
--- /dev/null
+++ b/package/bluez5_utils/0001-tools-mesh-cfgtest-include-limits.h.patch
@@ -0,0 +1,27 @@
+From 15c81618946c10fd98df6333821f036d8cfeb5c4 Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <bluez@heine.tech>
+Date: Thu, 22 Jul 2021 21:36:13 +0200
+Subject: [PATCH BlueZ] tools/mesh-cfgtest: include limits.h
+
+mesh-cfgtest.c uses MAX_PATH so it should include limits.h.
+
+fixes compilation error with musl-based toolchains.
+---
+ tools/mesh-cfgtest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/mesh-cfgtest.c b/tools/mesh-cfgtest.c
+index fa0474faa..116ab7f16 100644
+--- a/tools/mesh-cfgtest.c
++++ b/tools/mesh-cfgtest.c
+@@ -21,6 +21,7 @@
+ #include <ftw.h>
+ #include <getopt.h>
+ #include <libgen.h>
++#include <limits.h>
+ #include <signal.h>
+ #include <stdio.h>
+ #include <time.h>
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
