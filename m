Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAB7D1BDED
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E1660762;
	Mon,  4 Nov 2024 19:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR4kQF8fbUuC; Mon,  4 Nov 2024 19:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAD560767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CAD560767;
	Mon,  4 Nov 2024 19:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 678D7B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56B6580D92
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnRW14B-DcVD for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 19:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C74B80D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C74B80D91
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C74B80D91
 for <buildroot@busybox.net>; Mon,  4 Nov 2024 19:58:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43193678216so40526185e9.0
 for <buildroot@busybox.net>; Mon, 04 Nov 2024 11:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730750318; x=1731355118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zleTUFdQJ0UUJdb5b0Lsi+HAar03Fp+IU22HMT9vrXM=;
 b=pBSw0BwCwbagoyolDe9MQQQShYB9qVJ8Z2fnZSmwUrbEujkLfopMnw29i286OCKTWt
 0zcizq7vL6HMU2fZtcgSeKZxe0JHWm+a+AffAX/wgbAbUgpS4BWIxujAzwt8ofW913nv
 rr2be9F+xDNWmkLoR+Sy2UgkSSKp886ko2PeWrTWRy9cFPZt8iwVA6cgHkIQ3tmuUdgi
 FaToL4+IlGQ8ocXm8uK8hxhI4676zGt9DX82GFnwiNTUg1wgHnm13EqYqhLby3Mx+9OK
 6RaR4tnyTKT0bBxxC0KEukvZZj1z1XCvod2H5OxCr3IqpH0wHMKRv4mijHIEvMHovtQq
 jCmA==
X-Gm-Message-State: AOJu0YwQ05qa57TjhRP+49Rxr/89M/+LxCMBFF0qjLliQyug58fqfL3Y
 QBafk4HejbRu7uThGKM5f0pCShn+ZQXDgDVflQ7LWYJEMxhxIgmMcETsw26hPTh6Xibqti4U/xj
 0ng==
X-Google-Smtp-Source: AGHT+IGIfVo+0vnSr0sxTwEi4a1RkPJ+tFPW6NEuZkSVu91iNr+s2K3Io6rJBOW5lDlZhrCP+8Qe0Q==
X-Received: by 2002:a05:600c:4fcb:b0:426:5269:1a50 with SMTP id
 5b1f17b1804b1-4319ac9c15fmr275380545e9.11.1730750318101; 
 Mon, 04 Nov 2024 11:58:38 -0800 (PST)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd947c03sm192796995e9.28.2024.11.04.11.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 11:58:37 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Nov 2024 20:58:35 +0100
Message-ID: <20241104195835.1057296-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730750318; x=1731355118; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zleTUFdQJ0UUJdb5b0Lsi+HAar03Fp+IU22HMT9vrXM=;
 b=ABF2S6pZyWSCnEdPleLERi7Jsb7Oq2yFwQoSrLBdjnpHz0dCpsFp4cjn6p7vaACkqM
 QJDdNJsLQLyCwOTnJPFWaKJ83aqr7lfhGPFtPVHOBjpzUur2bn3sY4ITnKJg1kw1P/Cl
 FuE4GHZ0H5w6uoyhEn+jLuuQPDAttW95p/y2YvBGnp3yipSsTFlhM7q9WadLuIm+REOD
 BW5jZeocmQBe4e0jtqRfZ4FZdBtv79ND1VyYzifW6ytPBjN6hFHgo3+wOM+OrxgFtaKV
 OdBNsQ48Dt9FOVsUBLEOkD6zH3mCUmmjgmyfxb0HHliCtWwP6qZJ8IGqZCWbtP0OTUhw
 8DeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ABF2S6pZ
Subject: [Buildroot] [PATCH] package/gnupg2: bump to version 2.4.6
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 8bb64c9ed..e16a3f491 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ae0935ead29a2dfa34d6b48d70808652bc3ca73b  gnupg-2.4.5.tar.bz2
-sha256  f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277  gnupg-2.4.5.tar.bz2
+sha1  2d8aa2662c398d60f1f8e0bf46fd163eae703189  gnupg-2.4.6.tar.bz2
+sha256  95acfafda7004924a6f5c901677f15ac1bda2754511d973bb4523e8dd840e17a  gnupg-2.4.6.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d38aaeec1..f1a8e9917 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.5
+GNUPG2_VERSION = 2.4.6
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
