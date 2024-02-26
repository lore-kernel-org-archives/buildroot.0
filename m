Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4B9C5478C
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BE760B6F;
	Mon, 26 Feb 2024 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PK6uY1sNy4lV; Mon, 26 Feb 2024 20:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18B6060B6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18B6060B6B;
	Mon, 26 Feb 2024 20:55:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FFC1BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5090F407AF
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Esx_EBydELRs for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68578405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68578405F4
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68578405F4
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:57 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-36517cfd690so9513775ab.2
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980896; x=1709585696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIlOd7kIvi/wWcowprvOlHWijZ6GPWtstH7SBlJBo5E=;
 b=pxLv7H9WHFiwQktabnMr9JKOA5FxNOYMl3yj2cCvlFeXuWmONKQ0p4G6mjz3E7u1nZ
 cgjC6QL9WrgW8R/wlfgSAzycwT6haiVsP2bPVMOwzHSF8QuGehD4X4BBvs6R8weTqlaw
 eGcfXzxDkX1S8ynphG5GZOXLburx+vitf/1nZIk3QNBY8V0oy0yvm+guVmwK2uL/9zmY
 J08RF4qWqXqhIfkXOg2v3aNT50ySZMoSFZaupTcn5Z7uPEHKMF6RlvcBg1CON7P3gicD
 ikadI07z8S0nB4jSK3QvswDrFXzYmyS0koD8PN+b6u+huqVIZUuXxffyXFrqABjNWhb7
 rJYg==
X-Gm-Message-State: AOJu0YwmumzzlO411yvQx92agWLfI+RZZlRU8r4ZW1t4Nkl3z6ye2Ss8
 Jgv+9rdmPU2nZF9hcaACGKO9NSBVbdQebxZwUrJEQEISzoehKvfy6kZUD2WMkI60MyzAKjfvzgw
 Z
X-Google-Smtp-Source: AGHT+IFiHLTMgQMmVT3t6HPCoPTEbwKipC7+QEssril3es+FEMUOcyilKps2UvXdVCWLXGkr9hmJGw==
X-Received: by 2002:a05:6e02:1aa2:b0:365:a4bf:7a42 with SMTP id
 l2-20020a056e021aa200b00365a4bf7a42mr2031708ilv.6.1708980895992; 
 Mon, 26 Feb 2024 12:54:55 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:55 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:43 -0700
Message-ID: <20240226205446.842600-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980896; x=1709585696;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIlOd7kIvi/wWcowprvOlHWijZ6GPWtstH7SBlJBo5E=;
 b=KU5+PJtNCXVclqb1amCAW2k0+S1y6Qf2Y0n1JTjrtF1E9yGY0j4YRtoU8Wxru9XXWc
 VQygrKduVKfWA9/8dSqiq6RLZ9Jny+e3VdzZuxulXtZBUYa+nrdklwvAKXO52SyIN2sI
 n7Cxy1ad6IkfK6pEVDIMlk/N2fHGDWPpVz87U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KU5+PJtN
Subject: [Buildroot] [PATCH 7/9] package/semodule-utils: bump version to 3.6
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
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index ac3357d3fa..5e7d698f3b 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  c9a550a737051ebaf2c102f665c7ec2f85e7232870980aa0067998459b414283  semodule-utils-3.5.tar.gz
+sha256  eedb88f2b2124e538f2d614be063c0d9ac3eacc0c51a4da44500ca1ed1ba16f4  semodule-utils-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 9a0f084128..b58f7535f1 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.5
+SEMODULE_UTILS_VERSION = 3.6
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
