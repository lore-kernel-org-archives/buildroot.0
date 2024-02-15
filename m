Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E5C48BEB
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15ABE60FE1;
	Thu, 15 Feb 2024 14:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-jCqCdzNlSX; Thu, 15 Feb 2024 14:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 096C660F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 096C660F9B;
	Thu, 15 Feb 2024 14:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079F01BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E98204040B
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fMzP1fE_bUM for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6D9C403C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D9C403C7
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6D9C403C7
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:39 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-607e707a7f1so2775247b3.2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007078; x=1708611878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6RDnaS047Cg708JkfvBiYHHgv5+YDgxF0nilzRRpMI=;
 b=UzDHYp96v6/8LxfYv2XRws2k2zsDC5gM5F2br+GItftc9rSjJB/5GApADnZcruYk3w
 lcpQ1SURrDyLvj+ii7MFa8vyjVvqMd7EUmZktkEQncjkbmhCpuxkvdp6i3Y7zKzjNdyZ
 LlsjvpYyMd97YpKREFqhhzL3UJOD+5vH/VaSyh07GzLyPjvyW6L+dKmtolFE6wnBSN3X
 SVK+NxDuQ93zCaIzqFiM5P7s4574iLGypBqM8iSQ9VsghRJOtdjDqyWmJTZyUvPCANxM
 m0Vumki17ykAdowCpvATTrLn+O6Bh2YSIEX7eN1PXXeYk2pkoJ1DRCNFuqzK/OfQneUe
 dR2g==
X-Gm-Message-State: AOJu0Yxvk/ABW4IrYHm+byH1n1IfcaO7bUqMbdh5M7OMXeZEGmMg+XUP
 5B2jqTfTKJF1bJV14ITKOAEcwDxYx/K+nKUhCZqfkN01by8vx3C7d3h+cOhJ4Sw=
X-Google-Smtp-Source: AGHT+IEMpZJPxsV3LDkzaMdbgkLoss0/sPPSFPBaS8aqO5FmPiJRai6TWd+oszwwbtPRnvc7DU8Lzw==
X-Received: by 2002:a81:6d43:0:b0:604:dbde:da22 with SMTP id
 i64-20020a816d43000000b00604dbdeda22mr1891958ywc.6.1708007077850; 
 Thu, 15 Feb 2024 06:24:37 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:36 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:12 -0400
Message-Id: <20240215142413.451505-7-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007078; x=1708611878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6RDnaS047Cg708JkfvBiYHHgv5+YDgxF0nilzRRpMI=;
 b=GIkS0pyzs0gU+5rcO/jeWbU/ZmycWqAEcTstguWQGLq8EeOADx0n0Wlwux+/muoX1x
 +HEurfHz2wPASt15asYQQWPXDeaEIvxtxkku814zuvi2XhDXoXkPXWZWKUwy07MEMsQI
 Cxz54jZOVmt0uM01QkyKcP77HYyd/S+6I76Hp6eeZgRwmfc/mn6awG0B+95YM/kVYOPI
 WT7NTsH/Y+JoxWMCrPgQZgk8KRJ/DfKQRUlq6K//a/Pup8SVeKZfRdlt1EjizFpa2xA1
 ULHIJMMUiVHHvw8VVV5VikO1lK7/BMjbMmmkUlOPK0sxZzjDKKZw4roojs1EtqefWm0U
 ekbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GIkS0pyz
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.3.4
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes since version 5.3.3:
https://github.com/tesseract-ocr/tesseract/compare/5.3.3...5.3.4

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 45b9def27f..41c8498bec 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  dc4329f85f41191b2d813b71b528ba6047745813474e583ccce8795ff2ff5681  tesseract-ocr-5.3.3.tar.gz
+sha256  141afc12b34a14bb691a939b4b122db0d51bd38feda7f41696822bacea7710c7  tesseract-ocr-5.3.4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index d65111d468..0bc90f4871 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.3.3
+TESSERACT_OCR_VERSION = 5.3.4
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
