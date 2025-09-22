Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052EECAC5AA
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A491341930;
	Mon, 22 Sep 2025 13:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8R0x06PBOVf; Mon, 22 Sep 2025 13:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB3F4190E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB3F4190E;
	Mon, 22 Sep 2025 13:10:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ABD2E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 13:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BE524190E
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 13:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMlr__Uli9Nr for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 13:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AD1640EC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD1640EC3
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AD1640EC3
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 13:10:19 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so602271066b.2
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 06:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758546617; x=1759151417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2CCdOEpFzXqS8dS/QSgwPQAQYPjQLoDTjraElPRh6hM=;
 b=opikKYYbpOa+bdRUbgsfbZsBkczfWWmD0YsdHug6JfS/EKT4rdyDRtpqASv8rkJ3G8
 IYiEUIJQ7hWvFbcFtCorMsQcJwqS7XaqnqcagvuJdozpanmuRqTfC1rg28JEsxDSRpYs
 wTcuuZa/SPeUGTYj37KhecKskDTFEbDmTFgFoRprqtBXSd99Zf6wZBDgExh+XvKVWIC9
 TaxcgXWYP+34emARepOXouGF69/gs94MYX/ni+sQXEaIZGGv9y2ns2mq6M34/v7qAbRG
 AI6OLrwusnXHxM8lhlxPeupj97QXaL6cXFDc12NJGSHLRWeZqaHz04ZdKhTy71Cqo3zM
 HMdQ==
X-Gm-Message-State: AOJu0Yy+6xJd02M7IzvnaW7k0l6meXRvO7a4YC5ERjVG7hSZUSAisft5
 d+haPAyCGP/IkwlAwm0yGdjJx1//oIcs+1psDQkH9NrgsPJN6jf8tzNJti7qeXJ54P1NUZVqv1m
 OgqmM
X-Gm-Gg: ASbGncve2YeM6QFZHsIhbXwCqjAp0JWRz5YgYItdz6Jybh0pTwGRQlXKWAQjnQlf6DX
 F0rGM3BK4jUfrZ8ffDe9kO5NH84jCAc+fJzt5VlIQ4y9SPum/phb2YzhgzBC+dd+UoF+9s566xl
 Rn8oG5lC7gG435c7kSm6xof7z7ESnXPBlULF0Eq90d2PO71BibHx0qjTieAewLOMEDVvZ1652nU
 81+XcBGahW4+xkOq9mRGQ7c4sbUJDxYwM2C6Wt7PHlmvWd4oLy5DNopTqtBmSg+eNObK/dFgvIH
 3Ju24F+X7X3eq1BXyOlJysUrnl99BzJaJs2QSQ1vS3IshZDfOB+isW/1gxsDjloFUkKj413c4x2
 ATpkelO5asf+vdflnzQwh2G5TryhY3hnfFlCKMbe+1IXsSH1xrnnwOCEg03VaEAY=
X-Google-Smtp-Source: AGHT+IG17qRTfEvkUHAi1GLdkXw9NdMI13vRgOI9KsUb+m/ZjrDHgydyg+lta0ZRWAkE9ofv3EA5YA==
X-Received: by 2002:a17:907:7247:b0:b04:54dc:3048 with SMTP id
 a640c23a62f3a-b24ef97bd4fmr1343763866b.21.1758546617178; 
 Mon, 22 Sep 2025 06:10:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([62.18.103.138])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc5f382b0sm1122909966b.2.2025.09.22.06.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 06:10:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 22 Sep 2025 15:10:11 +0200
Message-ID: <20250922131011.752807-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758546617; x=1759151417;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2CCdOEpFzXqS8dS/QSgwPQAQYPjQLoDTjraElPRh6hM=;
 b=c6P3yOIl+AWomzlnop2yvyxthn0tuKv0zW6ZRkI//nR6n9IMTh6hIZU+n4+Ghk+FcC
 9Zgfbqe6KKRK68TkB4U9W+fgLLgkZ1ZmNI/01d1SDKYsPIoUoETdcDyO75n7MLuG72/s
 avKSnLIFdED9m/Jkc25ZnReAypQVPxrp6RzFs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=c6P3yOIl
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.0.3
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 1da8c30d9930..f3c847372e80 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  990ab4ccb7eff1b6d70409e9aa7fa4119877ac5f5d10ba219e98460ab3e4d6eb  armadillo-15.0.2.tar.xz
+sha256  9f55ec10f0a91fb6479ab4ed2b37a52445aee917706a238d170b5220c022fe43  armadillo-15.0.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 2efc33d52b2f..3f9eee407b74 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.0.2
+ARMADILLO_VERSION = 15.0.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
