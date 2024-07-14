Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B5CC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 18:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24CD560730;
	Sun, 14 Jul 2024 18:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nCFXkEbHcvN; Sun, 14 Jul 2024 18:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6929606C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6929606C4;
	Sun, 14 Jul 2024 18:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC85D1BF421
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 18:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F188115F
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 18:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6Y8ts9wlmoC for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 18:10:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B07F98115B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B07F98115B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B07F98115B
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 18:10:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3678f36f154so2090774f8f.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 11:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720980653; x=1721585453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x46iP51I7F8Tebw7DiFuhBBkJclawxaHntawY/sbcJU=;
 b=pMbtVoOsWQ/KTnNkKmSS4P1yJ5sqqev+Svkt2LCjH2cEP9vhgALrxyCBt3LYHLwtcK
 y4v2rV5IxlcO/L4G6jmBhVrsGAbYF3MynGiGQULPXQ5heM6T+51Eo2y5wf1poYqxzxJr
 73JHx0UN5fu7TP82XePORpCT5bK78GYdjIQYELfvtWbLDUP878qPzlWRsD6V8MmW38qZ
 W/CkSfDMtuIOuaUTs58V2ZaH83urN5/0j1u7PPhwU1QR3+ZS9GFLFbYlxRkn4y2uqL5r
 r0VtckSvquDiyhClm6KAmGoT5l4h37EzXkvwwl3GT1MBiiQXs1ljDTY0rbfdyxwf4ye4
 ujVA==
X-Gm-Message-State: AOJu0Yz09cZiUYBsxGBfE8nyDtd9VRlcJiMWWENLkpgULe8UucqDtgll
 xZoFNraunNXVOkKg1dlSFdJxonj4zmNbFRYnPKVzNMqYtdGZA6h0NqjjRQ==
X-Google-Smtp-Source: AGHT+IEbfm7mgBEvtoDXuzhcL56rKhckYpr24o2agXHae3Xt36TRN/5Djq3a9zS5qIPZnTnUyJHq5A==
X-Received: by 2002:adf:e80b:0:b0:363:341:1cf2 with SMTP id
 ffacd0b85a97d-367cea7355emr10706570f8f.22.1720980653391; 
 Sun, 14 Jul 2024 11:10:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3e1csm4373290f8f.2.2024.07.14.11.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 11:10:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 20:10:48 +0200
Message-ID: <20240714181048.9272-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720980653; x=1721585453; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x46iP51I7F8Tebw7DiFuhBBkJclawxaHntawY/sbcJU=;
 b=ga4GCTKAMZtAECbB4lgrUh79EsqCcQhvZlWHfi+hmqJ83stDthiLvJsj2oyP8lu7yj
 YHbRvTf7RffUks3MlTERBRRUoFYU3wVKmVBMOqixmb3zzxCrEGp45cAfQjT8LgNsH+ue
 DbWQFCXTWVs7fRocz0wRKAg+riqbgMKl6E0ekgEs8sw4ItYuAmNkOYVfB4gZtdaf1AP4
 ZddvkEEqiu0aNlKRBtMgVyjshsDRx9CwUFDGZqAiv+crUHtCowQmsaB2VwxZgwPc2Cvl
 70+0I2t/Ggd9989Jh7/0ZseBjiRLY7kxsysENKqkW/OO0o0o2ii3LU/kDkGHGeCOxj6G
 Il0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ga4GCTKA
Subject: [Buildroot] [PATCH 1/1] package/chicken: add CHICKEN_CPE_ID_VENDOR
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:call-cc:chicken is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/6F55B09D-8D4B-4F1C-889C-9B65048AB632

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/chicken/chicken.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 9f296a1ce3..2667f7823d 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -8,6 +8,7 @@ CHICKEN_VERSION = 5.3.0
 CHICKEN_SITE = https://code.call-cc.org/releases/$(CHICKEN_VERSION)
 CHICKEN_LICENSE = BSD-3-Clause
 CHICKEN_LICENSE_FILES = LICENSE
+CHICKEN_CPE_ID_VENDOR = call-cc
 CHICKEN_INSTALL_STAGING = YES
 
 # If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
