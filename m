Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C02FC43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 05:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC746404F9;
	Fri,  8 Jul 2022 05:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC746404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_f9VC7QNbZF; Fri,  8 Jul 2022 05:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E208B402E0;
	Fri,  8 Jul 2022 05:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E208B402E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7751BF44C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7663A8465F
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7663A8465F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X03qVeWw4rnG for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 05:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1F68465B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E1F68465B
 for <buildroot@busybox.net>; Fri,  8 Jul 2022 05:49:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h17so15914836wrx.0
 for <buildroot@busybox.net>; Thu, 07 Jul 2022 22:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQ4qrqQDIoeqtjknNIgnvnM98Xh1ZJ0p1UPom+4/NJU=;
 b=tCPapmXSQYUmKyZWf8OCL4TnBUfdgUzy3fHvvoJEZYAeWMTX1LMRjJfhyccc/N6cBN
 ee/O0SuSt91ysuXPLLpb8OYl95rkEryefrHWpcNU6iyplXKtPYaFN+7sj+7631XQF39S
 T3Oby2Al/HxAuG019+r/75ptNCtd8SXgnwBms+wECGSyH/TwW6XyxWo4kWpLOib6ICfZ
 Gel8QetOzmZjHK+dFnQLCYPrgFeRx8JPC7oZOZ9EzozKZv5Al8b76SCcJRWXjyZZmBpk
 gyEACQu/MakT7ntRtbZmBEJ0sQtujgks1oq3FR68UDud9Rtsa/lzQdBCe2/TCvqwd+WP
 4GIA==
X-Gm-Message-State: AJIora+pzFFVt4ekzWKwQlwbWZLrzxHMk+yd9ijctUxK9xN3qsoc1obx
 IZxOLMKmK89hu48Vdm9gsYvyrH7zigs=
X-Google-Smtp-Source: AGRyM1tdREyHow3u47uNnth2YzwS19zZsQJ3rANOKIlnKSPbhu7tuaDiOe/6Pm0pdtBTePI6xiJADg==
X-Received: by 2002:a5d:5d89:0:b0:21d:407a:d8d3 with SMTP id
 ci9-20020a5d5d89000000b0021d407ad8d3mr1451433wrb.369.1657259388237; 
 Thu, 07 Jul 2022 22:49:48 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r129-20020a1c4487000000b003a0499df21asm981911wma.25.2022.07.07.22.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 22:49:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Jul 2022 07:48:58 +0200
Message-Id: <20220708054858.2613054-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQ4qrqQDIoeqtjknNIgnvnM98Xh1ZJ0p1UPom+4/NJU=;
 b=QhExh/qpgEiX0bnBlwKEcvUHKcAj6plFlhcy41aTe6659FoCim5uIDIs3FYXX23lNt
 YtJ57BmbmEnN8mjdfFWseCeZygkrKfndtw217rnkmz2PvtIvvXAivGVh10AG2dxFz64C
 d5uGcZWEglnYC7IGuLPRnUeilcxRq/BDP0cD4XAFkXb3h/5+BG3GhcKndr7Ekr6FSgBz
 kLSM4denuTcTem1MHZFrjjSav6cQGnebf08f8/YzFvEi+S8wwxe/6e3K/UiaSIi0ao0+
 yIf35fbPy2z1GkC27/xxAFlLZ19tmOlSTydr3dm51KE1qTnKS4a3IfvKxfE6Gw0g9ov5
 OUvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QhExh/qp
Subject: [Buildroot] [PATCH] package/4th: bump to version 3.64.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/4th/4th.hash | 2 +-
 package/4th/4th.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.hash b/package/4th/4th.hash
index ae08a6bf5..8a3126347 100644
--- a/package/4th/4th.hash
+++ b/package/4th/4th.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0905e92316c151224858fcfff21c143c85efa4f9f1b2ade3c64cfd988e0a6a8  4th-3.64.0-unix.tar.gz
+sha256  f96ea74cdb2aadfdc3bebf8d6d2cf7b8976b5d56c1237387479bffaecede9fe3  4th-3.64.1-unix.tar.gz
 sha256  8c6111b645a02219579ea66e84aa8e78a0ed4f4dd80857ffb91bcda5528717d4  COPYING
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index d031c0e4b..276423b25 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-4TH_VERSION = 3.64.0
+4TH_VERSION = 3.64.1
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
