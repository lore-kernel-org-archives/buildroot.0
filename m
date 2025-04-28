Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B30C36005
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 10:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6700860BA6;
	Mon, 28 Apr 2025 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXeraNxb0CpK; Mon, 28 Apr 2025 10:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C9E607BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C9E607BC;
	Mon, 28 Apr 2025 10:35:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2189B194
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 10:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07B1F40F3E
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 10:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2A6ntq1_2FVi for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 10:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09C56400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09C56400FE
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09C56400FE
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 10:35:11 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso7456556a12.2
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 03:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745836509; x=1746441309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hvzQl6jp/kUfsHFqtIcdPdY49sRl7W6R6qvzb5/xgMU=;
 b=qbJsMx6kgHSZqjmIE9nRs35zEymTMQC7XnjKRjv2ve+33screI80ERy020B77sa8VI
 pFopmX44Ar8MpOfzPDFLWe8InfC4dMyQIhIrXOKRoA5Km8xnr5R0m5jj/DCXh5TRBQZH
 g0ypimSBCbqT0PinlQkufNzJEmDthUtPTZ6epko/aqpV3/pHjS+Rh7DT90PsC2d94Vx1
 VpHjj0rFuDFZbDPmE8RRrLRzW6ilw+ZQp8WwGT9L/l4v3PicJ1nwKoAlSM8fJlrzdYCR
 cH9FqY2uAD4YrPVsT1Bj6fbEm/TlPKtR4RcqdiThjU5PtoLzbIN//P0UENs6ivDsVHLf
 JtWg==
X-Gm-Message-State: AOJu0Yw0PZbMIWDsZb5adHSnqZ6OlKHK8txbS5HdDBrxc4r6RwJXmvLM
 TBe1jf7blQUI5jPje9+yvwzMZhlJhhj3JRxam738AH+XsNGKAVugwvZ/wA==
X-Gm-Gg: ASbGnct/vjRtBIdQzhriEDsgARWCJlKqrf8ws5VSSlKe8QiIh4ZIEp2iC4183LbvjKF
 xM1UK+bOMSOsbEyqornPUNKaxIlDutSRGCVl33XVZrMdwfryfKEZYlWn1QTDTY9nTb8RFKpa09H
 JAUtuGYK+622iV6WMYT8UGLVDA4zAqHgFuJGG42pSHB/qpe1LUPX4IiH5uYfnuJBy0eDlWzsr8+
 6S9UttZOLRip3BDtS9CZagScrNMUDH4OvQe4BdSrM5PnbX0zVHQrw7XmoJiuXRf755zOyQWVEOJ
 P5OJgKRH4p3i1xrWiz2F421GnB6WNZgG+uHLvz7YFTKNtU9q+TvFoXlpwtwJUOrClyvU76cwWmd
 Hr39TpHDN5hV8okWad3JKNB46Bg8kLRp9
X-Google-Smtp-Source: AGHT+IFZAKLp5cbV63DfsQNJpIV8C+P8xeAQfInOUm2+dj/ywLWacuZ2CDbeF+aLDjKhK2u1jmbSUg==
X-Received: by 2002:a17:906:4fca:b0:ac7:3323:cfd8 with SMTP id
 a640c23a62f3a-ace710c613emr918334366b.16.1745836509020; 
 Mon, 28 Apr 2025 03:35:09 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e699esm604514866b.39.2025.04.28.03.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 03:35:08 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon, 28 Apr 2025 12:35:06 +0200
Message-Id: <20250428103506.147979-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745836509; x=1746441309; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hvzQl6jp/kUfsHFqtIcdPdY49sRl7W6R6qvzb5/xgMU=;
 b=knDDoBIJkkee2SnKhXcQYi2KkhWmlWp6gcdQRHVGf3BlytZaMNXrRqoqPHVtL1Uiab
 XbppUdk5P86eB0FUSHRqrGhNEGuI8nczXTpH3yLN/gRQrpX7Pg5wVOjYPCbvwWvrtXiT
 byFTI7D3kNlZ2MMkK54gTDyr6hWyQsi8NahpxvxjW0AXiAsDZp6vv6swa73HrynLG5pm
 bxdWcEbvgXlTA0CvQucRDYDIc4f+//H8tWGTZnQ53Eg1pBgYYM3L99G0IIvzB/fxgvXS
 8jvicXlwVqWSVs6HHUz9NY/5yWwC/G3TmboLBNW24LLjFOpqrBEox/JpDBs5NeNNmDg7
 AWCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=knDDoBIJ
Subject: [Buildroot] [PATCH] package/ncftp: bump to version 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Yegor Yefremov <yegorslists@googlemail.com>

Fixes:
https://autobuild.buildroot.org/results/103b86c5473077cd95a245a762059a23f78c1a44/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ncftp/ncftp.hash | 2 +-
 package/ncftp/ncftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index a9414d62f5..029e4c6d43 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f1108e77782376f8aec691f68297a3364a9a7c2d9bb12e326f550ff9770f47a7  ncftp-3.2.9-src.tar.gz
+sha256  7920f884c2adafc82c8e41c46d6f3d22698785c7b3f56f5677a8d5c866396386  ncftp-3.3.0-src.tar.gz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index fa46bc3339..c56fc86848 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.9
+NCFTP_VERSION = 3.3.0
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
