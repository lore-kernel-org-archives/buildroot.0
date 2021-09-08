Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD62C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 535DF61158
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 535DF61158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2752406E5;
	Wed,  8 Sep 2021 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMtp9jr5v3sv; Wed,  8 Sep 2021 21:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 510BC406CD;
	Wed,  8 Sep 2021 21:40:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 837EC1BF427
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B79613E4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FI90ufRQuchu for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 21:40:40 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A2F605CF
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 21:40:39 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id O5CHmR3TKKBZzO5CHmXHtc; Wed, 08 Sep 2021 23:33:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631136813; bh=2JW/slcWbEhQRyGJ81ldMwBv+hTupk9fNCqtSJVlrzw=;
 h=From:To:Subject:Date:MIME-Version;
 b=lDYGSrwQXLC5Xwfzfb+SZPP/x9RJkKJ4a286prAQzfTDWSQvX+2UfDoAz98wlzPZb
 08vc0QXfaKRBNWO+AhVu4F2C+3ajMsPSQoSjZGEADejQG83BRHRrArh2yPfBnpzwGX
 z9yeNjN7FSPjn3XKI9ItTFQAXd5cOLQ2gfM1OxbGpPFnTBPZflNW+yB/ll7TAEd1pa
 eME0OdLndth/5h5OSSk2EffJDPA/CQQvvLCmmuvTj4c5H7uFxY3GPhFJAdT+ucmW4B
 pDIjM605TmumBD4xpSmEBNIi9AFN3nQaesPLvMm9a95NkSYIaiCJSlCeYT9zrC3DCX
 vA+k77YnvvQKw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 23:33:32 +0200
Message-Id: <20210908213332.1564474-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBZJb+G/5dIrKG7iSTZ1WIZU39XfJFAH1ZFcHy5zjpG33YT9FzMDnOmNX9fwagojQHTrO9i9/p3vHU7wFFkC+aqHiA8KbCkxC/i7VZCpW9dhIV91Vuqi
 g/Tv3r6+myBIa66Az/j7M/GQerHYEtmuHegWHwTyqAQWstch9FzijUBKaT/zub4tC7P5B1p0NSnFt0BuTjcaDqjsveZB/762nkRiOK6QpccIzTbj7kEa6Zva
 E38tHn2vLHm0bmJ86wYkvMdkZREW5v7VGat4B5vXdc6WRY/Tx8qp08MyaXyqDontlSDfGBKOmhxC04pul70fT2DR7BCp4Um4XyTB8MiZMxxlB9SWmhXv4PGI
 /VG6OUsTRwU7UWsRMYYuiWetyvGaoTg3x6A19RKSFKggkt3WWew=
Subject: [Buildroot] [PATCH] toolchain: reorder gcc bugs by number
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Reorder gcc bugs by number

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d6381f64a0..99f0c16c6f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -189,13 +189,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
 	default y if BR2_sh4
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
-# ICE: on SH4: unaligned opcodes detected in executable segment.
-# This bug still exists in gcc = 11.1.0
-config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
-	bool
-	default y if BR2_sh4
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
 # This bug still exists in gcc = 11.1.0
@@ -210,6 +203,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
+# ICE: on SH4: unaligned opcodes detected in executable segment.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
