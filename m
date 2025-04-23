Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD98C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 08:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 063B740E5F;
	Wed, 23 Apr 2025 08:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fltky0SX_FuQ; Wed, 23 Apr 2025 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BE540E52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BE540E52;
	Wed, 23 Apr 2025 08:25:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A4019F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E310682BFD
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsOe5JbYHOrK for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 08:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0512F82D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0512F82D17
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0512F82D17
 for <buildroot@busybox.net>; Wed, 23 Apr 2025 08:25:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so4838165e9.1
 for <buildroot@busybox.net>; Wed, 23 Apr 2025 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745396713; x=1746001513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pS0qBu40En68TIpVf2AXyEiZc0or8L3UitNr8Ibx+0s=;
 b=uujFm4Or8sZJb+4gyucUnmd5QbvM2tzDlDmBzgLMsE224WurGXuIaVx0m2JWJEetkE
 8TP5QzKfe4YS+ZByge4pvNJ1rCBPRUOwfn8bOsSYMAqfE7uZHxvwdPkq0BgvA4mLTUHF
 2DbHDVOdDpDbL1HjuzDvhaVzj8G4L7z8sk6/g5eUxdDLBQzCUD5vrToqa4Ax7go18dRc
 ymc8PYM78LA/CsC7WvjKQjlZcSq55kXJjZCZV/pDsnPf93rTGMAe3aFK8fApQU+ZhXA/
 q133aBZPGr7jVVKnt79rlORVa+Q8/BChyjKR8bw54STdNP2EJKeeIW45xbi6e0S/U4An
 N0cg==
X-Gm-Message-State: AOJu0YyvT9nbqkOS0oOIcnLk1g1XFEatMy8PX2oX4U6tVb2qwkIQtO9a
 k+dImuQoPd8W4oGg4p1aBH6mApuNb6PQPvLr7JeoBScf4jEHD5zDjvR/PwbcmtfhvKj8Kt7jK+D
 8xA==
X-Gm-Gg: ASbGnctxCI8vlkXyqm0JVnHHFWkA62T+i9l3DHIJNZa2HzcbbolFJScA5F7yqM1rp78
 FuxV1Jd8Yt6GpBfV60xLdlzVN+xdwYamiJtfBG1m68kxSqDgIIL0FxtnTfApetaBmQnKVZ+PWom
 JfoX3ioRWdWxG+1yoG5+jCto09jF6NN+dbO9Pva0ff8T/1iu9DyxA4HZZfi6KAE+GDi1zYPcnHg
 7F3M+DYJvjjflI8u6NkZPGzhrn7F1tS4p2DIb5i3beoPDIJsz/WXJyqRPkca6sQVseOfpzLigs6
 Mf3WYIij7+AJDLkQw9q/17wfHxt68AlBMwTJCz2ghCjeBq6HSBfP+OkR2Jtfh5ABIcjFbTOVfyv
 i6Q==
X-Google-Smtp-Source: AGHT+IGARVLGYFUt8e6eBZO9CYv1OBxJoLwTk1thhsQ/3cUb3eIPJNnCb++Ytgh0FNkJwiemFQFCww==
X-Received: by 2002:a05:600c:4e0a:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-44091f1facdmr15191115e9.12.1745396713377; 
 Wed, 23 Apr 2025 01:25:13 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d16b67sm17152015e9.5.2025.04.23.01.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 01:25:13 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 23 Apr 2025 10:25:04 +0200
Message-ID: <20250423082506.1879122-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1745396713; x=1746001513; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pS0qBu40En68TIpVf2AXyEiZc0or8L3UitNr8Ibx+0s=;
 b=oPt4wqaCTd/YKL7TPfd0b2UKu2R7Sw+ojXJ6htEYZeefiyhzLrCE8TvL5A15rUs9xq
 UQgJ9MsE/F3xaf0F912WIyXLv70HmQFGa7buo+pSGi7FBv0L/s2jtWRrHeYtJcQ3wLFN
 NBuOYiEIJFdwRn/2DsWSa5Ds4/X8n26KfHxIv2i+oF9glvPdyjPxWDPC76iq+hlHoW5V
 0jnwGKiV4ys6oDnN7Qme5d4DWQArovmuIvsCxdKfSL7UF1CMYdavxMQjORYq6D4rU2zY
 cSdueGpDUefBiQQLszxGkJycNBsH/E6ynnEwl5O/eNOWGkov5AdDArdU62xDaXY9mECi
 Tcrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=oPt4wqaC
Subject: [Buildroot] [PATCH 1/2] configs/olimex_a20_olinuxino_lime*: switch
 to Bootlin glibc stable toolchain
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 +++-
 configs/olimex_a20_olinuxino_lime_defconfig  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index fde347384..0d54e6ca9 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 9275b5fbf..05d311ad4 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
