Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F8ACD98C5
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B102833A0;
	Sat, 13 Jun 2026 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snfsloNUWsbb; Sat, 13 Jun 2026 19:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F29833A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781379899;
	bh=5471Z/U6k/66MzGIMd997YAqHNC8aDxr1XzwHlDE3pE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ieQGPPAOXNNw+aZPiwKfqnOd04lp1IQxqGD6eCxwvbWvg6tT3F+YVsQlGFJ6ZOEVd
	 Fj/l8IJVO8OtRbiSIroYVFFWt5w8Dsp3yTHkGB4pEPHrzEp31IbNF+kdy9YKinQqDg
	 kah9e5C7FEJZrEuaq2qDMcyn177206hM9PRBpieLyJ1x6a5FHvlXiIjqc0DxR9LBQ0
	 eRAw+fUnUBGnHQ5FDPvgccZnrTe+QThb+xi7xIAHKnc6/3q2Qtyj8x9w95Z2dPpmn+
	 94WzVQk8F/P3U5ZtfMTBeSBauikLZZB3DlSyjk3AMTEoL2ZLGC2Mg4Q0wxxf6Q+pe1
	 kmo8rpMrexEZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F29833A3;
	Sat, 13 Jun 2026 19:44:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1080F4
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B62FC833A3
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfaO1fVAoJe2 for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 19:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C1A4833A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C1A4833A0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C1A4833A0
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso17332515e9.3
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 12:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781379894; x=1781984694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1r+CeejdAYi8uoxVVAi01op+s8t7TWJXqn1PRYRvSmM=;
 b=V1e0JNI0FlDCTSblTsTygvolfvcavnAZ6R2iAJgv90cAf9DSWIToQygF9b9jTRTVGz
 gtKJKZJHzZk7iqHl8qqkEp+Dg+EG6UAHPLdTE7q2UkyuIDqIRqHKz9Ju5y71yAD15X32
 wocnvylDyfNC4js3P7geqhcXm0gK3INWlF9S8GSBjtPRWy+Lc94tHRtbQ7LCMc8tZHSy
 6BV+QX7juTl7l0zLNJxNbYnLLY5z8fT7WfLMbcwpQkmx6mUjtAggVuzWL6ADjbLREwN9
 nQtCqcQZoiNQWD60FXwCzjuxafVsehzsGITB0FBjGZMfuDshn+51AnH/qy9H+s4JUaoU
 HR8Q==
X-Gm-Message-State: AOJu0YyDKB5gnlbwSsigEGFwrybEOs8wPZXpb4pRGHS8hQJs4PgTzOmg
 xB76PiXIsFWjKSLRfVgxGT+uJS9sXLmBbDrgb1K2pa4ryr/j6lfgXffmao+OJyMAZaRE350mde1
 GbCP0
X-Gm-Gg: Acq92OH9yoXr7RuMBvYmO8SZ4/PCc3ZbX0SeteNgpKRrkn8amvhNXTM0x2U/Lg0s25V
 yjhLOUe3DktMR+wVesNS82GvBz1nvgbW5iwpECztGECQeCFamBHoXuO7VZfOU1KUrUC6QQ92Cor
 05VyiSEH+Bk1KYNSDpFGxT8JEfrntC3hhyctAjSvb+QLSJ2hwb7o8eIGlflMXu9AAtme5OjV8Pa
 fHN51baXu1mtzC8UJmpuXTSpRuYhMblaMThbFWE0UijWC2GL/1hqRCm9/WscloxgSledlwLoh++
 hGPPw9U1HJBLz5C4COowBmnZ1s3PaoJHlCzVuoO1dzl9yvyOv8Ns/M0wRO/bOLAjuP6HH4Gfvi8
 3Sxfq5cJUVgWuxqctBSTSdjCRwTE0+H9mE2UhnyafdOW09rcCiRjK/C3o6p/ZD+ZwrZ9s6q2yQ1
 79CtzUS9SHbxO3Tfu8Fxvfug7ICPzE2pp/H8kDhXbgsZTdcgfcsV8MM4stEFmPIsyYEmOvUS4eh
 IXQhomf/trOv4UrjdYXzTEraQ==
X-Received: by 2002:a7b:c351:0:b0:492:1e36:8c72 with SMTP id
 5b1f17b1804b1-4921e368c9fmr51293845e9.37.1781379893816; 
 Sat, 13 Jun 2026 12:44:53 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edc23sm103167015e9.2.2026.06.13.12.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 12:44:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Jun 2026 21:44:47 +0200
Message-ID: <20260613194451.220317-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1781379894; x=1781984694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1r+CeejdAYi8uoxVVAi01op+s8t7TWJXqn1PRYRvSmM=;
 b=pbz9Zi943PbZfkAAOtsJHSbS28ioFXlG8/TIap+Z1LNLWQIG4+a5q5vt3+X526l341
 fuQk+nj+AzP7IHfIPhOxdomRPZPYOvLJmm5ubq+J9jwnHYQYB1bQNL/X4L8X8IeGJ4Et
 itkuJIqA28RpJPgK0ujGAOKSTx0LbZlTe+EDY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=pbz9Zi94
Subject: [Buildroot] [PATCH 1/4] configs/ti_am{62ax, 62px, 62x,
 64x}_sk: switch to Bootlin stable toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the ti_am6x configurations to use the Bootlin glibc stable
prebuilt external toolchain, as recommended in the Buildroot meeting
report from ELCE 2024: https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minute used to tests each
defconfig (1h10 -> 52 minutes).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Build tested only but the ti_tda4vm_sk_defconfig already use a
prebuilt external toolchain. The tda4vm and am6x are based on the same
TI K3 familly.
---
 configs/ti_am62ax_sk_defconfig | 4 +++-
 configs/ti_am62px_sk_defconfig | 4 +++-
 configs/ti_am62x_sk_defconfig  | 4 +++-
 configs/ti_am64x_sk_defconfig  | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 0b3ebe6242..da60d93435 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62ax-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
diff --git a/configs/ti_am62px_sk_defconfig b/configs/ti_am62px_sk_defconfig
index e53b41ed5e..876734bf4e 100644
--- a/configs/ti_am62px_sk_defconfig
+++ b/configs/ti_am62px_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62px-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index ac73a2da5c..6af64404c2 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index a9ec5e3d53..f31989e1e7 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
