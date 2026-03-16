Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1327F013CA
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D76E60FE7;
	Mon, 16 Mar 2026 08:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRrjQAQh2_eg; Mon, 16 Mar 2026 08:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D102F60F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773649538;
	bh=ud14PZo726U4vN2lGp+07h2IUXhNvNzZ6kFwCCUVdAE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z40NnHiQ0JO99BYdk0hwZ+zFqC25KvMKlkJ0ogcv8v3w9fW/KEVxC+19maGxWpOhT
	 TtNZSyyMTB+AvpcsuLKq3FcWBUwjBfzQztiB/xIQsDo931rPucdz+8wf5JUZLnGrQC
	 2aut48ItKbLziFgXVh2tQaOCCkW6Q+bQtFCGzJSf34fXZNVipdHSK/wCuMNrVAI5pW
	 NBMwzuvP8Hdjfsg601yOjDGn2Jybv2qSomsytKnTMUcTrslORrBuqT4U+o3wtJEc5e
	 1G25JvEzhvSjKtgulccmgQheerhoykbdvO3n+GD132lvYar+1/ViWPSGxb5DpyyyV1
	 cdyQEsHzqqkpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D102F60F96;
	Mon, 16 Mar 2026 08:25:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD171B4
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93D5340807
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSfpnz8Mss6N for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84B4C407F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B4C407F7
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84B4C407F7
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43b45bb7548so289797f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773649533; x=1774254333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HYVZR+pUahdcZrtFF6I5mg7RbY4mMvYQtYg1rbiSxjc=;
 b=gCvKl0ghT70S5Fj/HLM5imBNS+1u8lBf/+603h/f2k1CeW9wSmQ3LyjOtY+RPxkBLM
 P0QZ5EURUWms5UxxG89at3d7h3iMWLbSF2VzkFse9LcB2HvsVlGGJRCW+zFYE1DYQAMQ
 PzDuf+yt8uSPlkdCRxNsYYhxaq4Zo9pYVTNgYu2AGmNBdf1c9l+/XbSOZgeQzjliZgk0
 y4/Sm7JkWAL7HWHBR5SVomH3lKo3CuHLbaz8Z9dgeEmiQkkV39I+eSECNPw4I7buxtLs
 eEeKbrkxzMmlnsyFqhdpDeEkIDStraeuOJg6GbyYQmauKF1X9XGZa/ZOJc4INkRbJisW
 kV+Q==
X-Gm-Message-State: AOJu0YzwMaXpazf56eL3q+GEmPTygUfDxRLsPY9F2NPONpYOfdkm1pIm
 Ow0Vgq05IXP8wvIr+fAp6pf7yUl1xKE915Uvg9KkksCTtDM1uDMPtODOdgEWDM+sV2FVNMrR9TT
 1/XIV
X-Gm-Gg: ATEYQzyXYuW3vFxPvAaWttuSYPiU+3Bx3hkTKBHnRZI7STRykhQ/womCI5CsvnE6X3O
 LOEX3YtvUZ0p7FZVt/irF2BaahWW15N9BliGmXp6OfMFMvsWlA6qjSavcNLsJ8SFpebRvxcj/IZ
 5zToGi/BgTMg0IXsmW38ENV9Xdts1XfLTf08wdtan7pemrfamHMlxz+tRbovNLwNOzfO3fwuQa4
 yIbjyKH/JKZ2sJRbTLNUzStFM8iWrV+86ICcYBvnqSA+Ovef0TEHIDehBiPEFLjjlEpPXrQQZMh
 9nRUV9yoBzFz/O5s+ctuTjyYYpkR9EO//Xnq1q+4NJ7cieqUXqQfEAKFgPhDIq707Cq9YJDDKUa
 GqnBknsmat7O3ies9DTYaNr5FE019r8JCnbyMFlz3qvzEb1RYExuP64HYGjeWDRIxYuVSAvdp3L
 ri57Nt9bIEu0+fp2Hl9qD648WNRm1xXBgycZn7erahpyeH1V5oy26pHvkigy/x5q2IgtlWPmwU8
 cvrLoqCwjbWNj/uuMMhFQ==
X-Received: by 2002:a05:6000:250d:b0:439:b440:b8a2 with SMTP id
 ffacd0b85a97d-43a04daf226mr21567617f8f.28.1773649533104; 
 Mon, 16 Mar 2026 01:25:33 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a72cdsm43151174f8f.9.2026.03.16.01.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon, 16 Mar 2026 09:24:54 +0100
Message-ID: <20260316082455.1392636-5-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
References: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773649533; x=1774254333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYVZR+pUahdcZrtFF6I5mg7RbY4mMvYQtYg1rbiSxjc=;
 b=Yd9xvnOsMW2tGSF+pil4vNkJOsB9FmtTUKqMb7ctgKne2YWRxFwrHbJZm+6fhgMXaL
 blQk5gzfvs86lnMOqvKSaLbkADQkt13739W5rIep8TwGI0zoqFafUiOHQys7JaMepBc1
 DnuIniqFim5Eibr1NYKIOZQnmK15Be4zefFxQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Yd9xvnOs
Subject: [Buildroot] [PATCH v3 5/6] linux: Add Rust support
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a menu option to enable Rust-for-Linux from Buildroot. When
BR2_LINUX_KERNEL_RUST_SUPPORT=y, select the required host tools and pass
them to the kernel build:

  - Dependencies: host-rustc, host-rust-bindgen
  - Make vars: RUSTC, BINDGEN, RUST_LIB_SRC, LIBCLANG_PATH, RUSTFMT
  - Kconfig fixup: force CONFIG_RUST=y, since all prerequisites are now
    provided by the above variables/paths

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 linux/Config.in |  7 ++++++-
 linux/linux.mk  | 12 ++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 29360e1083..b7844e3dff 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -569,7 +569,12 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
 	  such as "python3: not found".
 
 config BR2_LINUX_KERNEL_RUST_SUPPORT
-	bool
+	bool "Enable Rust support in the kernel"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_HOST_RUST_BINDGEN
+	help
+	  Rust kernel support needs an architecture supported by rustc
 
 # Linux extensions
 source "linux/Config.ext.in"
diff --git a/linux/linux.mk b/linux/linux.mk
index 816e6d8cf4..1890a83879 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -183,6 +183,16 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C TZ='UTC' date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
+LINUX_DEPENDENCIES += host-rustc host-rust-bindgen
+LINUX_MAKE_FLAGS += \
+	RUSTC=$(HOST_DIR)/bin/rustc \
+	BINDGEN=$(HOST_DIR)/bin/bindgen \
+	RUST_LIB_SRC=$(HOST_DIR)/src/rust/library \
+	LIBCLANG_PATH=$(HOST_DIR)/lib \
+	RUSTFMT=$(HOST_DIR)/bin/rustfmt
+endif
+
 # gcc-8 started warning about function aliases that have a
 # non-matching prototype.  This seems rather useful in general, but it
 # causes tons of warnings in the Linux kernel, where we rely on
@@ -482,6 +492,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
+	$(if $(BR2_LINUX_KERNEL_RUST_SUPPORT),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_RUST))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
