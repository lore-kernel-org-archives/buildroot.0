Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6077DC02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131ED60C07;
	Tue,  4 Feb 2025 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxpg8yotZrmM; Tue,  4 Feb 2025 16:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B8260BCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B8260BCE;
	Tue,  4 Feb 2025 16:36:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E4BE12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D492E405E7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUPdnrnOuske for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFB3A409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB3A409F2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFB3A409F2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3862a921123so3963871f8f.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686985; x=1739291785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DryMk+zW7bknBFMIGXcaVGZwSvlx43fW8m6KGUQchPY=;
 b=gJjkm2mMM5XTO86XawTgeXA6ksTL1JWTaSEYG1C6NLtvs//q1jRF7/A9c8crW/ldRc
 T6Zif6huF+NjQP6LYluUZOm+7G9sHFgRDPO+6VzfKTQ/vPULGIr3sJCV8T3y3o+dUHzF
 yIofE5BnL/tHMtAG1LmfHvrXCqq0PIOW2UIL8gmvGpdaZjvmoMwyWhSEaKirYLc8UADZ
 GxZ2SYXiec2tmkZFis/K/mCGJ5OUwDQEhZmEhfnQ51JGP7es86elrOjDbMKOGls/bm2W
 +z1q/3iz9gOw0c8RlqFGSS21nFl3JWMgVETrlAZTFyylFhMfH5WaSALwb6K2nArL+qGr
 Sizg==
X-Gm-Message-State: AOJu0YxJCxpfJOD+DBnggz//B/I4+QSgjRJ4int0eqktCxKTJIpGNdY+
 y4tASWWggXAHDQrqsy6J8Xvr0uopps37/xBnX3KXTPpVXAb9yl7CO3rE1XEvgw1F76mlxtz168M
 ILr4=
X-Gm-Gg: ASbGncu38WFIrSwOQeQL1neo3l2WpRUoxE0fWgsbzO8R59Y0WJt7VJBFVKA5LbqpxAn
 W04T0sOX1z3YrIPamqZpnHwv9nHAV3zZLjlpCCyvb+5d6n4s3wgGq0n7pTD5d/xGvf8lFlhSHA5
 tDMoGqSBHsP2OI9BdsFXQrPzVl7pWA8DKogfJYdE678h7Lzn4a0ix3glZn/rUZbHtxNECFg030Z
 2uK/c2+jcIC1DfBDld0mNTrLwmHarYqRDFx9927vWz9UiABXs6luVzst5EVIUHNlcy0dt3Hmpya
 nKWjdA0ClDErbgmdkM+uoYh6amDFLr9ybLGOKOsOTzFneUp2QRO0gdE=
X-Google-Smtp-Source: AGHT+IGxspa8tz4PiOj+wWq4zkHrG2jAI3v49cniU0t1JzzAOWsF2uMm6x4o8dmZXc1ENKHFO5SPnA==
X-Received: by 2002:a05:6000:178e:b0:385:e1e8:40db with SMTP id
 ffacd0b85a97d-38c5195f9f4mr21701119f8f.24.1738686985033; 
 Tue, 04 Feb 2025 08:36:25 -0800 (PST)
Received: from P-NTS-Evian.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf560sm16032693f8f.89.2025.02.04.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 08:36:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Niklas Cassel <cassel@kernel.org>,
	Romain Naour <romain.naour@smile.fr>
Date: Tue,  4 Feb 2025 17:36:17 +0100
Message-ID: <20250204163622.192932-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204163622.192932-1-romain.naour@smile.fr>
References: <20250204163622.192932-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738686985; x=1739291785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DryMk+zW7bknBFMIGXcaVGZwSvlx43fW8m6KGUQchPY=;
 b=f/IYhWgtl7swawTE0QzsWXv/Rzks8ynvA+yPrObPKiLz6I17I9X5wq3Dg+kbWfOWqH
 FCPmetMbfPcFksrZ8dps9eG8wDq164KGOrSnR7ZYJkQD3VEfDq5Ogf8EfBxZaoRzWEo4
 cT/tq3eE7bCSIb9pqkm4ysQ8Co65EC4vHu5Lo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=f/IYhWgt
Subject: [Buildroot] [PATCH v5 2/6] configs/rock5b: build and install rock5b
 device tree overlays
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

From: Niklas Cassel <cassel@kernel.org>

Build and install all in-tree rock5b device tree overlays.

The device tree overlays will be available in /boot, such that it is
possible for u-boot to apply one (or many) of them before booting Linux.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: https://lore.kernel.org/buildroot/20241213083430.4121422-2-niklas.cassel@wdc.com/
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 47a7acc083..3fef4a9d99 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+BR2_LINUX_KERNEL_INTREE_DTSO_NAMES="rockchip/rk3588-rock-5b-pcie-srns rockchip/rk3588-rock-5b-pcie-ep"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
