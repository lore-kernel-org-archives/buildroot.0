Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E61CFB43F
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8592B606C7;
	Sat,  5 Oct 2024 20:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpMDJF8LY_oq; Sat,  5 Oct 2024 20:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05DD4606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DD4606E3;
	Sat,  5 Oct 2024 20:56:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8DA91BF5A5
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAA9980A99
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vw1w7tZyQV95 for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 20:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C527C809EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C527C809EC
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C527C809EC
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 20:56:32 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-4a3c8b8cf78so1246148137.0
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 13:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728161791; x=1728766591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90dqPtGEirHShaIfpKHGM6873IOsYohAupr/0IecyuY=;
 b=GRROC7umZh/LFFAUoomcqnucasVDmblsJZHwcT4EhlPFdT+fb5bQsWPRwUmk8oAmNk
 oXaaxSmByA6D1ts1H1ztxFKMO/aXcBa3nuwqqjWb1T7xF2cd7jOXNyG7/igpgTniRjvM
 JzvaVYaElkECI7zcyLCdKEPs2NrMp8EsbiH8Jr2aTfn9H89d3iTSQISDt15O4tJmhg1e
 SeQgH+ESLsEnMTdxK5y2qM09PgEHPybFWY8cg832IsHgeR/M50lp4wyaVf4ewB0ClrVR
 FXYwrgAdSLWoNDIj0e75LeUKuktOhQfKY6exy7VNvYVqqvHPdfFo3Hnfq4Umn/cS+CLS
 IdpQ==
X-Gm-Message-State: AOJu0Yzku3u2jQ8yJo6c2OaVRXnKvtZt30NUon4hpdUwwkJUBnCD4p8w
 3YFmC7XkZ5IJ2JdIAHh3TyEjaM+kwapjIkUolylGUHwF9FO4AYil+HsrbQ9X
X-Google-Smtp-Source: AGHT+IFxFNbT8VFYYvWSC6lKyMKvDUSbZOLfFbPmP0U4x/10RfWqm8a8vZQtZ7kSeNIt7PIwTgHS6A==
X-Received: by 2002:a05:6102:4189:b0:4a3:cab7:18bc with SMTP id
 ada2fe7eead31-4a40579d34amr5279672137.16.1728161790644; 
 Sat, 05 Oct 2024 13:56:30 -0700 (PDT)
Received: from gilles-Precision-3571.lan
 ([2605:59c0:14b7:4a10:cd3b:1b9b:5d1e:f72d])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a412eafcd5sm483500137.33.2024.10.05.13.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 13:56:29 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 16:56:06 -0400
Message-ID: <20241005205607.222164-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005205607.222164-1-gilles.talis@gmail.com>
References: <20241005205607.222164-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728161791; x=1728766591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90dqPtGEirHShaIfpKHGM6873IOsYohAupr/0IecyuY=;
 b=c4PvvhnYYKoV3Q5EU9K+Pg2DdOppe6z7t8Czr1xSi5BIybVL2bpfZoUC5jHbPIVndI
 KqyIv4XhTZNDNHbcgx0VYCXBVPh41mGHf58R0mnLqoTZ1odrmfMrjc+S5YLCrL+w+zpB
 zl0iTzV1+S2VFJcWP7kTgEvTc0/qd9e8888c+kJYlYTcj9NBS9YImZ9JKkTgdrB+fbbO
 q2PkGjWA3KK+RSNBrsrOOfeIvQp6wXC+W28wVGHBPp06Qgt9jqgb6lEEFNSQ5Dl1JnTg
 bOIarpph8o/ogeSM49eJR7KmZgl/IMd+90nvxeJiPkHZdn9QQ9zOoeBvFMxVtF4N6dFV
 6K6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c4PvvhnY
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.4.1
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

Change log:
https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 41c8498bec..35b116685f 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  141afc12b34a14bb691a939b4b122db0d51bd38feda7f41696822bacea7710c7  tesseract-ocr-5.3.4.tar.gz
+sha256  c4bc2a81c12a472f445b7c2fb4705a08bd643ef467f51ec84f0e148bd368051b  tesseract-ocr-5.4.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 0bc90f4871..b2cefcf2a0 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.3.4
+TESSERACT_OCR_VERSION = 5.4.1
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
