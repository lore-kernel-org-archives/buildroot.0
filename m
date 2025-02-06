Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE5DC02196
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 08:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B174183B78;
	Thu,  6 Feb 2025 08:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdvj9xBkXYPY; Thu,  6 Feb 2025 08:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E9283B8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E9283B8E;
	Thu,  6 Feb 2025 08:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D7BC12F
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 08:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1883261294
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 08:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSzuJV4Flxqn for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 08:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0754261222
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0754261222
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0754261222
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 08:24:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso3047465e9.1
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 00:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738830245; x=1739435045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Rj1u/Clyia4DeZv8hlCtjjNHBZYLxECs9zhAqx88m0=;
 b=vYh0jmKH8mp1iokscwrgFNXwx6K+8CenhcjnTfyXqW7aWnBzQ5ZElNT6bkBUZ/fli3
 OUkKKmWfIBKhwLfkVCr56ca0ZogAtp+hCy8jkDV+5bg+2kzjmHgD+LI1sMjCT0kTKDPH
 0fhzskyoRvYAqiC6wUy6mLtl6plF1bOhXNiA2FurA3JOUGjLjslirOUGDglhXidP0JZf
 6RkjKL+73qvw7HvX9WiZMHX84jS1lC095e4Wn3C8dUiTR18sOVUKsfkl+3Fe8E4syjLO
 WABlieErOqQptdtBhNaHlEH0IxIhCv6Pnd7URsySGx4MkJCj5RF1h1h5L3ghgRi3xjlj
 cA8Q==
X-Gm-Message-State: AOJu0Yxsmet7PHTdmxKuR2+FKzOinwKj+6pQwah/QSLZWnj9CT88kJx8
 GylSbggG0yjmQWcaW599PBfUPLwxSrqWmOFKBk7gH9BqUoVW+ly7ejZRykmCnR2wfcrZGwZsBz7
 n/qk=
X-Gm-Gg: ASbGncv92w/JLD+o4n9M9TO9EpKAHUqP60JgH7od3j4U5eZKnM67qjA9OTkLtD91u+0
 dM38MtvPVpBy69c/mRESSCyvz1pLEyrfFOtdiuKju4RXluj0nlFpzcGGkTyu4KfkwdBcCviErbz
 7iEVUKFXeuinEiYbljLezkKo1cAhSLnIkWiQ+K6TTjRxCxk6dMgmqIVnUvLDr8sylE2/gMI8ztO
 DxHMt1V2TTTBvtDq8HmlsziaryKgB2ksHBy+EES2tTmy9G/rP3LczpY5OO58yLLTtIB3+IElKTv
 Ap61mUgDljZtUcjTLEFjunrdn8jTNpmdU2HZwPnJiREXsH9xgGw=
X-Google-Smtp-Source: AGHT+IFtiJPKjvKzifmiuCv/YTZYSUu19b6Ygfg6RA/pHX3YZeeMkI85SqpIeXayIFN2TnwsWCTfAg==
X-Received: by 2002:a05:600c:3b11:b0:436:76bf:51cc with SMTP id
 5b1f17b1804b1-43912d3f063mr14323825e9.12.1738830245298; 
 Thu, 06 Feb 2025 00:24:05 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:8161:e142:44be:4a47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd368acsm1095436f8f.35.2025.02.06.00.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 00:24:04 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu,  6 Feb 2025 09:23:52 +0100
Message-Id: <20250206082352.12137-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738830245; x=1739435045;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Rj1u/Clyia4DeZv8hlCtjjNHBZYLxECs9zhAqx88m0=;
 b=e2bcGBKg3+BvPAuamYOdRbZ7+BRf3Gnww0rSeA6vL03qsKJoWCEGIrwnzeK+4sUtaW
 En+KL7h9xN76BdmJd0gLcmdPY0dRHn7wyM9ouCBfR3HHd0yGPrUz3vxPGUMGFRSXK+fP
 +sBCQwp5UrX5aaYGVzMdIJw5P95B2d0T/NAK4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=e2bcGBKg
Subject: [Buildroot] [PATCH 1/1] package/cutekeyboard: bump version to 1.3.0
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/cutekeyboard/cutekeyboard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index a7b3ba7a1d..13925c100e 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7
+CUTEKEYBOARD_VERSION = 2eea6765feeda6fc0582ca745b0c6c3b0a7b2afa
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
