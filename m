Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C72CD4F5B
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 08:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E09840500;
	Thu,  5 Sep 2024 08:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cleohkqc4C6; Thu,  5 Sep 2024 08:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A27540628
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A27540628;
	Thu,  5 Sep 2024 08:57:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3052A1BF476
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ACC24016B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0wLYzFxqF9y for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0BEA401D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0BEA401D2
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0BEA401D2
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 08:57:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2f3f8ff9209so439681fa.2
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 01:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725526637; x=1726131437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DshhfFKiT+F45N62KUFOtpauEUSguyHcnZsw82JG+Ok=;
 b=c9rjpoQyMr6NR7UW/Ntu4iYD5Q1OZRzZasvDMvXeZ8AlfE2RJ/yQR2CP6NwDRpyJmn
 IoKfXOxnooe8sYD43AGTVbPCiK9e8L3qhQ6SVgjZbM86rg5ByUBsKyJ4Dhf8s6q4prr0
 /bXHPgsAvIhBV6fI7P6DXQIp7d+Lz0364WLgNNyQDgywnDeA0h+K2oV+SPPgd7MSyVeK
 NL3CmZcBTA2e9JIm2tJYMrtdAxNMqAl23jO7dv4zBf8pdxgGLV0p5A1I6D3y7cTJXiR+
 nQqHoSt91TtAOR1TxCbeVB515B/qCwWJdHiOguRtDKjCsVl5dNtgSfsg8UV0Rehi0YIx
 ZARw==
X-Gm-Message-State: AOJu0YytxL8xdWCVWDZ6E9Z3GGxCSROuuw8rmSMLxCXsa4DVVmPZ++nb
 lf8RAcftonlrzIpyK1ISyvNSMeZ4B17gizbt1f6pUEmlv9A6dv7KWqA8yWWiT/0aa0XMfBq3S4V
 5O/JOTeAz
X-Google-Smtp-Source: AGHT+IEk7ucaALOOAHufEYb09NIH+4N3Ark0HHuGKT88MJUcYxNyUtGsZdz/ZHabY7FOfP2xBBTlmA==
X-Received: by 2002:a05:651c:b28:b0:2ee:e196:1486 with SMTP id
 38308e7fff4ca-2f61e08ba57mr76306771fa.4.1725526636788; 
 Thu, 05 Sep 2024 01:57:16 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-432d-2b48-7707-30d7.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:432d:2b48:7707:30d7])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc699e68sm941429a12.62.2024.09.05.01.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 01:57:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 10:57:13 +0200
Message-ID: <20240905085713.383116-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
References: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725526637; x=1726131437;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DshhfFKiT+F45N62KUFOtpauEUSguyHcnZsw82JG+Ok=;
 b=itbw67VvFQoWxH/4wmjisEDa0Uc0VcAEzaFnYIHzQ9keBsoAFD1ZeQl7R1uHdh6VnX
 b6UOrhIrKwp+ryFmeoIh1VGx9d0ySnkAngzghobeBL9DvWmp0mdExq3m50197QauZ3Gi
 sA22o3xkfx1Rh/jX8or8bvHUMhBDJ/xKtJx6Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=itbw67Vv
Subject: [Buildroot] [PATCH 4/4] package/flutter-packages: bump version to
 71e827e7df6833e6942873361f189adcb041d7f1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 1fbe601396..b51eefbe80 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  388ec45142ddfab711aa82958c82657b8c2238deb6c131cec94a5a993ba4c760  flutter-packages-8af79fbca12699248e96b50b4705da74396cd6a3.tar.gz
+sha256  9de635d61d9efc0fd42762c1814086ead28ea6a372a6f8a99ee97060a3323fb3  flutter-packages-71e827e7df6833e6942873361f189adcb041d7f1.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 1a1913043b..407dd31a0f 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 8af79fbca12699248e96b50b4705da74396cd6a3
+FLUTTER_PACKAGES_VERSION = 71e827e7df6833e6942873361f189adcb041d7f1
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
