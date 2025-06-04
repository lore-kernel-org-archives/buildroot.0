Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B43EC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 13:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF80F83BDA;
	Wed,  4 Jun 2025 13:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97FV4VJV8JDR; Wed,  4 Jun 2025 13:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00AA783C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00AA783C5F;
	Wed,  4 Jun 2025 13:24:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD9ADA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71C8F41D6B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mC2O6crWb0-q for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 13:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=konstantin.menyaev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B79E440F78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B79E440F78
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B79E440F78
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:24:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso8638076e87.3
 for <buildroot@buildroot.org>; Wed, 04 Jun 2025 06:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749043491; x=1749648291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUKMFQJ2Ccq6i1qcZQnnnbZsBxT6olMnWd+q0F68Zo8=;
 b=j30Zsn7POB+muNjCnIv9+tAiPLkBuW8PQXDjqfPaZV87oIg9VNPkqV+CMGgAapMYEk
 Ky1OCUzBnd9I2G35xL6FW5pP1b+jNnTLGS6CvDIQb6REfCmIVpRTRoIp8X6Nfi2slncx
 liUDBY9lsis4fdLmv6J/jWlWT8zREICOl0USU9layJKm73le48VidBJ8PZH8RyJyZTNC
 RJA2Yut0uO3CAtn6plXQGieoKOAIRUyOIFyaBzkb/80l1nwpCch38wh6b6XIBQddhtFr
 6VNQKP9jXk7tPo5XnDFHdZl2Qt/qc0J7JEdlWwpYw8q3P7mNY+xag+J31g7pKK2r0BkP
 eRng==
X-Gm-Message-State: AOJu0YyK5S0gImOBVhWQJS/HMxRSh9fUWFU3H97GFPGznWjPBlZfEXTd
 gqZeInb4zUmpJPB2OmSR0HwvJPzVTO5oSYJ6zOk1WnTfyBVnuoW8NveHVBSudaJs
X-Gm-Gg: ASbGncv9JgTL2/0vVDvao6eHpZgCN8uzwjBDvXKe9Yu6FcoHHBqpdcl7s8+WXg1eASs
 h4LzKaxtTOoxuSq3utOyCbIVAvTw/4ey56LL/4w4ddWsUNhioIo2dXulvnSte/QGaY2ADamVz4B
 +SqFC6cgFyuEch+y0Ilh85q5r9Dl8a3vL/WBwtcNERZokV1g/QtYVAn0LpxV/arUP4DC6KYp+se
 yIEcpcGzFGr/prZtlAqWFnkqdc1i9HaG+Mpem5/j/P1q6S++wsRI47Op5uGaYrRxelZ993YhBaf
 0prlXRTCOfGireGjWIOUmiJy+5YC2jKAikGXr+0ud4scuDr5KvKIP2Ti9agqvmznb0J1z8W/d3d
 GvWN5ML+Tta83cjT3P8kUuyphePGCJ7C6zA==
X-Google-Smtp-Source: AGHT+IFQYnb9bfGn5AqJ8vmJfVp1R4yQQBTqXiv6B20nLc2wb5DOkB42CbHRlY+5ySuhysD4+sMg8w==
X-Received: by 2002:a05:6512:2605:b0:553:2f8c:e618 with SMTP id
 2adb3069b0e04-55356ae0164mr738210e87.7.1749043490849; 
 Wed, 04 Jun 2025 06:24:50 -0700 (PDT)
Received: from localhost.localdomain (46-138-23-227.dynamic.spd-mgts.ru.
 [46.138.23.227]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm2359917e87.240.2025.06.04.06.24.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 06:24:50 -0700 (PDT)
From: konstantin.menyaev@gmail.com
To: buildroot@buildroot.org
Date: Wed,  4 Jun 2025 16:24:49 +0300
Message-ID: <20250604132449.1385328-1-konstantin.menyaev@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749043491; x=1749648291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=cUKMFQJ2Ccq6i1qcZQnnnbZsBxT6olMnWd+q0F68Zo8=;
 b=hpBhCd6GFVmh3wZACeTeTjuDqDlUI5Po1H2sY8YrbhsnR7BYzhrDRr+DflW9KTY3Vb
 UUbtsSK/RJ2LyzErAQ2vtXswdqQcHqguL/KZsEEWiGmrecYPqCbaU5W9xP8EnOncb+tn
 YWMs5Mc6an1IHNlW7tGW3C5nldCwyTxpQheFbxsk3sCSKMQZG61Kz2HNXcPAU4nd5m0t
 RXZOMscywBE5TbURF2xUhqdkoySxLYGbfC+ZhjvJ7CIal4/ymQo9djSV/ptQT7x0SNwT
 xLKpdrVho6+WRJwaYrBWVFV7ty3Ov17jXI34g8MQIWPLLcb1raIp8qnZdZhxYL6BMNo8
 Z5Ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hpBhCd6G
Subject: [Buildroot] [PATCH 1/1] package/mtd: build package with fPIC
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

From: Konstantin Menyaev <KAMenyaev@salutedevices.com>

mtd-utils provides static libmtd && libubi libraries,
which can be used as shared library dependency,
what leads to error:

relocation R_ARM_THM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Konstantin Menyaev <KAMenyaev@salutedevices.com>
---
 package/mtd/mtd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40..1be627c0fb 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -13,6 +13,7 @@ MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
 
+MTD_CFLAGS = $(TARGET_CFLAGS) -fPIC
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
@@ -34,7 +35,7 @@ else
 MTD_CONF_OPTS += --without-zlib
 endif
 
-MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
+MTD_CONF_ENV += CFLAGS="$(MTD_CFLAGS)" LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_CONF_OPTS += --with-jffs
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
