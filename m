Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367DCD65C6A
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 10:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD9360A51;
	Thu, 14 Nov 2024 10:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muRPrh0FL-H4; Thu, 14 Nov 2024 10:27:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB3960A5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB3960A5C;
	Thu, 14 Nov 2024 10:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F30D1972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD79140169
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3YeJ9tJ8UZh for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 10:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF98F400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF98F400C5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF98F400C5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:27:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so4377985e9.2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 02:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731580028; x=1732184828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TcVXvWWXkAXKukyE4kgmERSKdRFVt8F1q7gtX/fkq4=;
 b=vf5/LUnHtBmQK5r73SbBdWkDgJvbxhHrDo93PL5mrFBSSSQ3zgJD/H+iyTXKQoRjjE
 tbEzTRNl4dU5D8ZTD1NnAOIvWZ/0WWZCQ9I//cCFP+eap863faDQJ80SFvXIx1MDjNHz
 4QHDtUveTtr4O5nqrHTzQmEeQrtHJ47mrbJ9OX/2q8Bn0GciFo+D6qE4AOpXLZD/JZnC
 dnbw+SDWaZy5BP5Kr4OgmwJ787G+T8N2Ug0/0rbB0rQ5dkB6GFyYCgAR4WAsFQG0IQ8v
 2hnPovu8+aBuy7oppCTAjm3hzgqKajPp4IiJxmexcO6UniDlsEW2lH96q+Yv0OYvg/E1
 OVow==
X-Gm-Message-State: AOJu0Yw8jswj3vIlUlOmjRlO19q8FESdqWWYSh17u+DG4mqYoDQLJw4M
 MaPBkm6VR/PuAnuFY1zXzA036BHd+rd32rRAgl6LMzMeFdl+ireGdNFrlS+3
X-Google-Smtp-Source: AGHT+IGIAjpTFAj46p4pdZizsI2nG+St1aj/g6kjt2+WvSqHfWfmz1LOIgwIlsPr9gR2LwM2yHQBOQ==
X-Received: by 2002:a5d:5f46:0:b0:382:d79:842c with SMTP id
 ffacd0b85a97d-38218502c87mr1125298f8f.13.1731580028380; 
 Thu, 14 Nov 2024 02:27:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae154c3sm1066946f8f.67.2024.11.14.02.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 02:27:08 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 14 Nov 2024 11:26:01 +0000
Message-ID: <20241114112601.530656-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731580028; x=1732184828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8TcVXvWWXkAXKukyE4kgmERSKdRFVt8F1q7gtX/fkq4=;
 b=MecBFuP76s1qhVxEFtyVZwKf7/Gf6SxiXG7O4ZeBu5pFaGGIm3J6U9H0qqn2v0E3rC
 nlrghhjsYq4bgLq2tlva2K6bewMZMaii4hTGW34vsav0wi9eviIrQhwEPJn/8r2X6/CK
 Ow2++KQuh4LVJvula9KWPHFZHo9u2DfxFtKvXiVCEB0cpKrXhdn2x9SlLtmL2DD6ZxGv
 zycximE+1A9z04KgKDEmzGcjH2AF6gP0LTqgx2uIxhO1Uqcl6kHj1snsFZaERh+z2mH3
 5Eb9kwPZM0geoPE3VBrsSGm2SVA4Y+Ifh2yThZt2vBqF2rgH5HYTb9gP0qvXWUI1LSpJ
 DnTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MecBFuP7
Subject: [Buildroot] [PATCH 1/1] package/nvidia-persistenced: bump to
 version 560.35.03
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

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/nvidia-persistenced/nvidia-persistenced.hash | 2 +-
 package/nvidia-persistenced/nvidia-persistenced.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
index 06c71b35f5..dc918f1a95 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.hash
+++ b/package/nvidia-persistenced/nvidia-persistenced.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b84fb8eb86127a725d0134a2c64a64e7844e125dece137e7fe8adf8a33cbe817  nvidia-persistenced-515.48.07.tar.gz
+sha256  e4b85c7ada85010212c45b84582f0af4aaed795335dcc7c0ceea9f274a8b7eb0  nvidia-persistenced-560.35.03.tar.gz
 sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
index 662d4d4349..225c26fd3b 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.mk
+++ b/package/nvidia-persistenced/nvidia-persistenced.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_PERSISTENCED_VERSION = 515.48.07
+NVIDIA_PERSISTENCED_VERSION = 560.35.03
 NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
 NVIDIA_PERSISTENCED_LICENSE = MIT
 NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
