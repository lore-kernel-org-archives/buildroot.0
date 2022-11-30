Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93D3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F23740BB5;
	Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F23740BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPnSh_pWpjER; Wed, 30 Nov 2022 07:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD9540BAD;
	Wed, 30 Nov 2022 07:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BD9540BAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDD9C1BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6838813CE
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6838813CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOuVK_AejItw for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF19813B2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BF19813B2
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x17so25716162wrn.6
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eIdqrVgspKzzAd+wSQjA6VLMPw1gKO6MFC3ZMrzu0+0=;
 b=ZA9pu7eIDrl+cjIx9GqyzDgqj9OGNMfZ2ssAzvxI68sfGZFcM33biQ39j5A3L07OKr
 ULWy1Z6pJbfOexkkErdj0FoVpfKc4NmY+JBaOXksre3z6PZ/FN3mKe5ruQMmEqf91axO
 kXU/5tcYwbv3XKa7Qz4jtfdnRDf7WlNdImaEwBdgKKCHSDsOujrDejvgRQqB0zdvrUwt
 GF1idRLC4fDAhz58voSumOfqrn+In0bIA6VVx+cDvgrchKoIPZLGUWPIBf7OwxLiQy6L
 1n75gY6jlCLGr+PhEE0FZPaItjHTBkohgHIBiLimzxjmqr17O8omvItlS/sLtOluHXnk
 rfLg==
X-Gm-Message-State: ANoB5plAPqrN71MOZhQ+ZbFYG3cPCyug5owgzpCO54VBv9wJ6RjeclVN
 FbqFtiHar06MoI75dZzyuTWuvIXY/pZ5DA==
X-Google-Smtp-Source: AA0mqf6CTWHOjgmO6cat3uJJjZdrPWrPYPYKcRaZHinRYeTVyi+Dg7X3rUvdGgVre9nQ6Z4sNlPfVQ==
X-Received: by 2002:a5d:620d:0:b0:241:d0de:1025 with SMTP id
 y13-20020a5d620d000000b00241d0de1025mr29582774wru.226.1669794903543; 
 Tue, 29 Nov 2022 23:55:03 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:03 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:46 +0100
Message-Id: <20221130075452.2507453-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eIdqrVgspKzzAd+wSQjA6VLMPw1gKO6MFC3ZMrzu0+0=;
 b=dts8shlnacsWpReLRGm8Vb9Q4Q3EVyRL35tBMKWSGGR9QtQDCFuP6BZN7zeUkX5gxJ
 xRaT0ufvelgI6Ln5e/Of2DbTa6WMZofYU8Bf/tbEYTRncGoiVJO0uHnHO4MiHj+HcVU4
 a2Fu0YK+INBZShjL09uny1OjhfVHQYKY4cGau91iWX6tbXIAq8WMJU7FR5Kvr/QKTH+C
 jNB3lxBEjPdPs8tdeYKzvzh2UayLFvZnluT0yXnVnT8KhH/pP/TJYld3OgsxmqTKMi2l
 BMr7cC6OTq+qVP++GYGPNetQa1r1d9GYWzz+7VCVCUHCenAD0ckdjyKUV3hNGTNnoejO
 RO4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=dts8shln
Subject: [Buildroot] [PATCH 1/7] boot/optee-os: bump to version 3.19.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE OS package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 5244700bc2..8bcce22306 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.18.0"
+	bool "3.19.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.18.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.19.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 38f68bec5d..a87f21a9bf 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.18.0/optee-os-3.18.0.tar.gz
-sha256  bdd309697745ec4406951652094b50d9adb06c3612f01bd8a3d72682ec8e03e8  optee-os-3.18.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.19.0/optee-os-3.19.0.tar.gz
+sha256  5e0c03bbc4d106f262a6bd33333c002c3380205ae6b82334aa7b644721ff7868  optee-os-3.19.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
