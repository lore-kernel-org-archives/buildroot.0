Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18489C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF08812DA;
	Wed,  7 Feb 2024 09:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xo-RA-aFpLOT; Wed,  7 Feb 2024 09:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E643F812DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E643F812DB;
	Wed,  7 Feb 2024 09:25:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE701BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05285812C0
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SFAOCwUu_xr for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7B27812A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7B27812A5
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7B27812A5
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:24:53 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51149561a39so393324e87.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297891; x=1707902691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njwkuUc/bifu6IckamKlRhjgILbBLG7pTk598FszQnI=;
 b=PbLuyz4WzY3xWR7MGAMKbg5xYpN9aPWmAJtscwu2nz42xPyQ5XXJmUn645Rvn+ZmNs
 ypZ+5XyuRX1NAVOX69SIAcmyqEfHXi6Tng/mgZNPPkruZ+rBQchZYf/CUwOo4noys8in
 Oad2awPjyjlAyOGqflTsO0VQU5E5mYlN4+IxWw+esUk2uEBQMvZCZlPlUhJTp0SQmjip
 rCbLGl2IUkafbn9kVSiEbnmxQhT07LqeON3Fdc3VjwbpNGi1fi1JDxzMkkij4kTeTS0E
 W2XqpUzYYtBODOAKVypQWK6EdzFsbmc9Og+uJAobkbCbIrnSU4bqM+Grkyx59NUVwoOV
 8O1g==
X-Gm-Message-State: AOJu0Yw02y86Ex0Q/sIFgPG2W/+zmYHcTyEhjqtZ9AEbi8kLEdIpijzv
 EO3bAlVDBNaowZi8xpMbCHsTjfDpzPaPSbm+EkYg0MPuDE/k4k912dp1cpDjiGEVw3hyfNhLWHx
 z3xI=
X-Google-Smtp-Source: AGHT+IGC1z1LFJVAR79jrtVEjxvqo8fB7BCujToO42J/VI9B1c9vXkpWFLfXfFtA46yPZIbRIYwyww==
X-Received: by 2002:a05:6512:480c:b0:511:6512:9d3e with SMTP id
 eo12-20020a056512480c00b0051165129d3emr970480lfb.33.1707297891224; 
 Wed, 07 Feb 2024 01:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWdtaWrTsnV91U36ljzGLSwDhCYXWxgBFwaBrbKbZRiI4/htgzfA2aqIFY5lQRcDZ1y0At8bTaGTUDcetaknSPz+i5t0CmiWvlOX2XF3RpltM+drk460qjWEoj+MAyn/DXb9c/LXJFm
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040fddaf9ff4sm4656822wms.40.2024.02.07.01.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:24:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 10:24:45 +0100
Message-ID: <20240207092447.2094160-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707297891; x=1707902691;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=njwkuUc/bifu6IckamKlRhjgILbBLG7pTk598FszQnI=;
 b=atyg10ALqdk2X/mxAlxzGN4h+jXoxVHEOtW20y8D5KTanHk+l9XFI2ifyW8fPh2kFJ
 F5Ayh3jT3lzyBErHT1MHmYRhZt63YN24e3MOzpCHopKNzGcekjJ1lMJkggHut4fR1/1r
 JjHTQVjYmFjuqBtLZIIhMGirbDF/esDFY75vI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=atyg10AL
Subject: [Buildroot] [PATCH v3 1/3] package/davinci-bootcount: update GitHub
 URL
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch updates the GitHub URL, which has recently changed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

 package/davinci-bootcount/Config.in            | 2 +-
 package/davinci-bootcount/davinci-bootcount.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
index e34adde570af..0201530f9166 100644
--- a/package/davinci-bootcount/Config.in
+++ b/package/davinci-bootcount/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 	  SCRATCH2 register. This tool allows to read and write this
 	  register from userspace.
 
-	  https://github.com/VoltServer/uboot-davinci-bootcount
+	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
index 695d39688ac6..884bf420f396 100644
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DAVINCI_BOOTCOUNT_VERSION = 2.0.0
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
+DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
 DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
 DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
