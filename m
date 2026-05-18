Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8630DCD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C6F80F5E;
	Mon, 18 May 2026 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGGQBQN91HHv; Mon, 18 May 2026 21:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A92E80F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779140680;
	bh=mA1SBiAK/ACRD/HNWJs8IPKKEiGFQx5a59mUYP6ry0Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fngXOkVt7G2afbkTYhvkcI7gCZi9W1iW2xgy2h4gEiL2sbbqtyVT/xZOKvLmV2Mg6
	 dpOq4YwRcwwExnfzpga0ibtpf7XcEyvhinHB8P6vHyUMQ9JoFtO81E7LA1hdh52TIK
	 Si6ZxZN08echsGBmlwmcgV6U7NSzlfJjiVCPxBv0yv5X9ztAruI96CvNAnlFkE9t4m
	 in7BY67owo1DtsrI4F6w8e8H1bTQFMtrp4KDjClKkw+4u2b9uMIhQRrzFToaUD3ZkQ
	 cDoOZ4/gVrxcxES8fi+6zXuEHTKAxLZlUVg0ChSClXV/pIjSVufC4AR0ddJXmiygM1
	 XpW3gFQSdkFpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A92E80F4B;
	Mon, 18 May 2026 21:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF349282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0E5940242
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDn8vkyTMoUX for <buildroot@buildroot.org>;
 Mon, 18 May 2026 21:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D97864024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97864024C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D97864024C
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so4934f8f.1
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779140676; x=1779745476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E25rmdvrNrImK1GypsgcLBywIV4MjoBfy5Jw0RDX6IA=;
 b=bGLQT6JckkJ4/z74CXCTNFmuHPI8xrRgsZVN9wnkLLpb58O4b7nRISfWJEDEub/AbT
 OQCE6ubxKld67N85zsPJHh2O5uSkcYjHhNdep+djcIurfSKT1KMBvuzV6MEPbBhKl31l
 Z0qJGbwIGn43OZ7vm4yGVmBZmHYllSs1XtKxcjLOYYSZXD15NdfNjehkR5aQZadPkcWR
 XsIyMj2kB9TIEvnzgQQp2Qk9Mf1C/rfxg+H4ED9sfMJLo6U3pTsHaTGb4yXGiSNliZ1t
 q7Z5YY3fW7AGmjZb2+zJmB90QyV3YcLr5XNe4s8/8p2sU/Uj4OG5h89ta/jr/oZtkiH3
 p2FA==
X-Gm-Message-State: AOJu0YyrnA8HqbetW5p6GZwFhobTmG4z0j7h0YH10eEjv5oeaAsYMfJy
 YTGr539CRkGN6F3GXzqS9wKTkIQzK6IgaiYZybOTacOBsjUV95JnKk+VQ6TL+w==
X-Gm-Gg: Acq92OH9TV0nUW9sQ7WHwzhGG4HrjZlpCdTFYqa+fITI7+4yk7HyyUJhWjZtsCp8iWI
 j3TsvplMYel6wfkoNkssxMurCWGbv8HQvMzqK7nHtyjddSD6cLXD2GpUZgJ68NnxiMGlKl0TqHC
 00V4JVdgxlm8ZbafMpHXDAeX1Ci3rjCtL7VmaKulmV/Ur69NICOPt9+h7m4A4aI36z+FQ9YJLjT
 ws/GF3C0E0rwL6sVor3eIIwXaRPqgaaW5GkGBICxxXQARkbM5O4IFtzBg5bhUgEbL4K4UALtFqo
 hLc4XND/pyvQ7mQTNBVRzv/xAje0X/x+Y6Vjo3VWYio0x2U+sxrIJJJWE0Kwj8F0MilkBJHykaU
 Hs4wpuwRbGUjEluSv0AufLKx/J6xeiyND712hcOYxHjHjRFkCUDCLeEif9lVNhcsWN8TyfsW0UX
 r0OjkUssDKjCxtEQgaqypWUL/FoP8=
X-Received: by 2002:a5d:64c6:0:b0:43d:71b:204b with SMTP id
 ffacd0b85a97d-45e5c5a518cmr25616254f8f.39.1779140675759; 
 Mon, 18 May 2026 14:44:35 -0700 (PDT)
Received: from localhost ([78.208.112.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm39862853f8f.12.2026.05.18.14.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 14:44:35 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 18 May 2026 23:43:59 +0200
Message-ID: <20260518214400.1320545-2-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518214400.1320545-1-mattianarducci1@gmail.com>
References: <20260518214400.1320545-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779140676; x=1779745476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E25rmdvrNrImK1GypsgcLBywIV4MjoBfy5Jw0RDX6IA=;
 b=GURxsldl1XIXNqojRtPC8bJHTlr9KT4oFlT2xwrnojTCHs48rry/wlqZH1TppLvQZ6
 Ovlusl4gY/Hj4Hu6MLSNV+jPjJG5D4bBnfr578FDqsHsiUf5aajf8Pqa6mdgZI7yfcoE
 KGdMSAkU9yApmi3vFM7aHF9OyfH0VajuE9YWaN2xwHtiF1ZPSVXkCPl+CB9MaPvrvRyl
 8HnnLHMg0dwUVwL5xU3NPgvJ42t3DTFYQHqlNFDcU/UkstbZwPe3hTlHDCNHRfulVpzZ
 Dj/Mg6HpPFJoBMaZmYTq5U1PI3D1nFEo+CaRU0VfxN1vn9NDDidu06y96vukyFSml6nP
 Pv3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GURxsldl
Subject: [Buildroot] [PATCH 2/3] configs/pine64: switch to external toolchain
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

Switch to an external glibc stable Bootlin toolchain following the
recommendation from
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 configs/pine64_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index e19b7b5012..a2e19b1a4b 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
