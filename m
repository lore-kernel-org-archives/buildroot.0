Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED75C46CCD
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A5D343571;
	Tue, 19 Dec 2023 12:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A5D343571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHqEOaxYyzyz; Tue, 19 Dec 2023 12:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2443F43595;
	Tue, 19 Dec 2023 12:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2443F43595
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D09971BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A834743579
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A834743579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nOkU_lvvnLs for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97FFA4357E
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97FFA4357E
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so4585095a12.0
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988120; x=1703592920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIOhwdlQztlbPPdinmqGrb43slZ1f9QPQP4PlOmeEps=;
 b=X/BJbidHhB9xBrP17iOnjteIngqf5NitjdakMPqW+17qV/wGm6s0TE164L1mIHrWgX
 ieTnoZ3MG48w5eZSHu9vfPvynV8nyVbSr4uwtDi41pGVqRookpfEsYmIGwj+oj1Qb1Ts
 uGFIlLltqtkIgZlmJylEUAXTuMn/Z8yvKfruDk5KHJ+Ad4T0+XxL8NTe/Lmrnr7bzGa2
 93uBjfN6Pglq5UryStQNSDqp0b5pSciF0gcXN+J42a4F6CTyfa2vUGFxvXX8f1Ud0FWU
 ROWTXYoO5GzZPvbIslqquyFy5IDPd57Z/qLAL0HbWc56sobN8bpE1m0wBbe/fnbDwoEt
 NgYg==
X-Gm-Message-State: AOJu0YyHx8gYP3LXkxNUpi3jnl/XTzNMgigvIFVJ9v0vZpoQNOpSmbD9
 zbVE05GB4dviprL1joHfRwGlZ3dKTf9QHEFWmg8=
X-Google-Smtp-Source: AGHT+IFuWlno/T3BNwP/4F7a5T8tWXTKqsqqtiVpJhkG9ICtI5HBzn7fzG1F08uo/5flyRNwv8bZXg==
X-Received: by 2002:a50:c05a:0:b0:553:29b0:7ed7 with SMTP id
 u26-20020a50c05a000000b0055329b07ed7mr890750edd.28.1702988119863; 
 Tue, 19 Dec 2023 04:15:19 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:19 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:08 +0100
Message-Id: <20231219121508.1695768-8-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219121508.1695768-1-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988120; x=1703592920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UIOhwdlQztlbPPdinmqGrb43slZ1f9QPQP4PlOmeEps=;
 b=Fv9QUme3hcUA+xyuSRUh6KXTonjkaUeJkQEgb8lv27QVE48WdaOQTYjR5hk5kf+hxP
 LYxwRLv0E4WeFC34CguyW69oaoFvpN7f41vTbLT799I7CuW9ae6QMk9/fsQXGciluQm1
 nJTEB7sYHrdWRR1obXH/wnziEPuys/iuLHfL+D6XIH5Aauad4FWd/FF5LZcnO5arSX5t
 rcOqIcjzmxtAlzEtPbkopAIcP4wzWMD6JYI3DfnXuF5fgBNVtjjjULjUv2GDeATV+TZO
 8uIooHQDseBJBeu/a6BEWE2HyL0oH1b6A8cJmlpJPUARnPgX8OkD8t0hA8cngaucnFhQ
 iDYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Fv9QUme3
Subject: [Buildroot] [PATCH 7/7] boot/arm-trusted-firmware: bump latest
 version to v2.10
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

Patch 0001-build-tools-avoid-unnecessary-link.patch that was applied to
v2.9 is already in v2.10, so no new patch dir for v2.10 is added

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7ebe616365..025cb0f2d6 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -14,7 +14,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v2.7"
+	bool "v2.10"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_v2_8_VERSION
 	bool "latest lts-v2.8.x"
@@ -48,7 +48,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "lts-v2.8.13"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_v2_8_VERSION
-	default "v2.7"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.10"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index ed16fc1c0f..eafd8e69c4 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
 sha256  e55ae7105c996b60f748b2eb6adeaf5ac8946425e1d4294ecc1c56aebf435274  trusted-firmware-a-lts-v2.8.13.tar.gz
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
