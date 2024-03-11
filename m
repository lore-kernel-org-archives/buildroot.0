Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3931AC5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 19:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC2CF400A4;
	Mon, 11 Mar 2024 19:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1GB2eSk49EQ; Mon, 11 Mar 2024 19:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0026140151
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0026140151;
	Mon, 11 Mar 2024 19:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 819231BF86B
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF438137A
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrQvEdUwZu8n for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 19:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97F8981377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F8981377
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97F8981377
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 19:35:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d29111272eso77126311fa.0
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 12:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710185754; x=1710790554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fefju0Sg/0nCT61BTIGS2GFuktirSFvhEhGpKxt+lQw=;
 b=Dgnoq7rZl9V9Q2Rrh2zzakAW3qimiluVoqWW3ltWiYdNhyiGTiuo1b0iOdOSgiBMah
 PWipGKm1WIJg2O8Uat0eRsBBKYnRrun4oKJ/nleh4ToYDXv5YBE1/04+ZN6Nj0jzYBtB
 ssoCyG98lQejOMYsYqTOedsjnZ7vVEpPphRYC+YxmaVHmiH9zyBmSlNIFusLUkOKI3dc
 v46V1wruK9ZUQNrUW9FYdMQTziPlHqhlReOK5acproMXyfWoVa3gt869jKTOTe8QU+/l
 Up7LUmi49lJe4ojBXlITdtV48k9tkZUlt1E9QiItT4R6lTPjBxBm3TavEmnYu9AaFXZI
 b/Og==
X-Gm-Message-State: AOJu0Yy9tpeWIpGRhwXgNBkWVJoV961ughEIsqgMgS4dpUB7nQBfoOB8
 e8KSKqmvZLy4N+5q7jIoZCsDnmCD2PqCKMiHT5+YM8c/QJ/HplK2kauGlGwN0M8=
X-Google-Smtp-Source: AGHT+IHzpr9/4ylRwctGmOacrjkjMCB0Ubl6ldOkaVYk27Me7MPJXOlqzBKIAYc8GswNB+vWf8zsXA==
X-Received: by 2002:a2e:a612:0:b0:2d4:2af0:82da with SMTP id
 v18-20020a2ea612000000b002d42af082damr3890436ljp.6.1710185753626; 
 Mon, 11 Mar 2024 12:35:53 -0700 (PDT)
Received: from localhost.localdomain (broadband-46-242-13-235.ip.moscow.rt.ru.
 [46.242.13.235]) by smtp.googlemail.com with ESMTPSA id
 b40-20020a05651c0b2800b002d25eb9e940sm1266490ljr.90.2024.03.11.12.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 12:35:53 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 22:35:26 +0300
Message-Id: <20240311193526.32797-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710185754; x=1710790554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fefju0Sg/0nCT61BTIGS2GFuktirSFvhEhGpKxt+lQw=;
 b=UrLyKidI7fLuNrPDDMHT4JF7O68FntpR7Ys7CiEZw8y2ld7VgvP6Km9rYsK9QezKx6
 hb/3tQ6bcpDxdc8a6W7JBJuuRp4V1kC7NXItFMVjRgwCHcn9FvHiMvHIQrGfYOnZxM2T
 aCuyCIQ9WkipUheW7xIko0+8S+gAy2nZfdhKW3MCpvrqlsfnY0RycPLEb2Kgqs3i+mfC
 WLOluwxERL+BpznmO1nmaR6LqTqeSYlqVbwbHEg37zGrDH2Z7V4D1Jl1N+6/7cvN6NkQ
 59YvXnMZb2eZJmz5xk+QtygkX62NAzXtFOn2eGu8/jT92HhzK4vxEgJbG2rl/zNNZBof
 R0Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UrLyKidI
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: add CRDA package
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Central Regulatory Domain Agent is used by the Linux kernel cf80211
wireless subsystem. Currently this package is not enabled and kernel
complains with the following message on every boot:
"""
platform regulatory.0: Direct firmware load for regulatory.db failed
with error -2
cfg80211: failed to load regulatory.db
"""
Add CRDA package to fix the issue.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 configs/pc_x86_64_efi_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 6032544d2d..2c076a1b78 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -62,3 +62,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_CRDA=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index afb652f3fc..e17aec9f35 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -63,3 +63,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_CRDA=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
