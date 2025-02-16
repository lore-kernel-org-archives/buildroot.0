Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23076C021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E86D860B4B;
	Sun, 16 Feb 2025 15:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBV9-TeliSl6; Sun, 16 Feb 2025 15:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB3B60BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB3B60BF2;
	Sun, 16 Feb 2025 15:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6536EDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59276409EE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTnVcOYZ8EmQ for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFE7540D13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFE7540D13
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFE7540D13
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:10 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-4b68cb2abacso975431137.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720109; x=1740324909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3iNiuHyIvxplvC2BwSjYVAAK7LQJAxm9RgyH8o1jTD8=;
 b=WL2fmcAziXePhVEBVJu0ivf0E+WUXQNFGcaDsCIoW9qjangwW2q8+orsX6RFZ0y38O
 2+ueNzmm6sbFajP11wg596b7jF/WEFmtNJ3EL+ztCIYwwCdB0aEjhJrZNq+AGyQJVihN
 LnKtafC9a9iukWoAnZmQzPfqz5DJ/qOt1pWXF/rSrZxgtsQrLaLaDF3dYuMh80pdlz1F
 ixccYzMS+7DquB2cQIpiLtzeflpUdWfUaSF6Y2QOGfiO1IurzaoZ0Ha+g9qf1dggSEd9
 AEexkS3FdJWq6ChJSa0gtTaORwGQ2n4xDHe2JgrLleVXGY/bKv0FvJyEpgiUJMrMuJcP
 92CQ==
X-Gm-Message-State: AOJu0Yzzso5N2dWigPnqAPXCAWP1f/cwzIM+xKbmK0wBntOQr50lN7f5
 pUADxPZ9bAgI5STffbzQJydwTD7VbEIYoe2sVksnyIZ4ZwkCu0TuPHBMrxI3
X-Gm-Gg: ASbGnctTZBgmOJ7WTyimbh0YpPGTIMmSRfKCn1ClsOA22YHPheimxRqBwPKCP6y1t3s
 TeKqFlXFXUab/+xsi/OoOWADsOrk4xb9xs8QtiW3Moy4WJ7RWYBGZdwyCni8DQDVLs3ULIqKVAL
 b8OGON92TGx4g77IeCWqzY6CNblj8FdUuWbJsoDl7/2lPopu2Ptd70jRwB1ZoNznHZhUL2MhPs0
 9wvufg/HZyFLz4gOxDdkFz8JhaJ9fHLDBZd/5rXj74/qerIYoCx8D+uu7yJMmfWPPWyYCoeXm7Z
 C1MfME2sZVK3ymEyWVei7dnZsIviVgs5s6II
X-Google-Smtp-Source: AGHT+IGE1lpXvzZJrVo5eBi3HPT0XFGGOEJx5KbqSEwjFt1s3BpQ4dSB9/FOXNTztIfOQHAQg0wjCg==
X-Received: by 2002:a05:6102:4b04:b0:4bb:e511:159e with SMTP id
 ada2fe7eead31-4bd3fa913ecmr4129545137.0.1739720109370; 
 Sun, 16 Feb 2025 07:35:09 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:35:08 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:39 -0400
Message-ID: <20250216153441.2706067-5-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720109; x=1740324909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iNiuHyIvxplvC2BwSjYVAAK7LQJAxm9RgyH8o1jTD8=;
 b=hFZIp13fK/H+Q7BDszTPgvJhYSoTA5tTXDouRh+fEffoMxZNBhEivvO0AgwMgiDJUr
 oJTIjm49TkLQrUbU5XAFdBIRqtHdgwdPc9q5h2uNLvw0pBhahc+4CKy0ww8Kqz7fxUh5
 Hnm1ZfEnH5ZdIIDPiIu9nUrgqbF2VQq/FI7tWBG3i5E4FsXA9sym84julGp68ArDXHJ8
 +T+jiAf4Llj7zi2pks4hchm+LeRPoSx1bqnOdFAU1GvauV42OvE4e7A2qEEZxsxa8485
 7X800EtzKs5XCBZ0+zTMzV7u2aQf4aHyNlGRhst1bgl+E+/lrNHGrwRNi7wK6durb4v/
 L09g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hFZIp13f
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.5.0
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

Change log:
https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 35b116685f..b45e892966 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  c4bc2a81c12a472f445b7c2fb4705a08bd643ef467f51ec84f0e148bd368051b  tesseract-ocr-5.4.1.tar.gz
+sha256  f2fb34ca035b6d087a42875a35a7a5c4155fa9979c6132365b1e5a28ebc3fc11  tesseract-ocr-5.5.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index b2cefcf2a0..81a1e8097c 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.4.1
+TESSERACT_OCR_VERSION = 5.5.0
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
