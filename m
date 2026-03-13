Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E101107BCCD
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 16:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EDC40BD2;
	Fri, 13 Mar 2026 16:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jypZcYAhk_P; Fri, 13 Mar 2026 16:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CF840BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773418755;
	bh=Zgm8ST5d5jsfI1+zKOwOhJJ7ect4mYnzxC4pMf3xad0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AcIaam7E490t5Iogtcx4ouqsRNaKiLkkqBDQ70wowE3sHtOdTs1BnbPG/M0mYTQgB
	 OzP7aRFHQN9KDx8TGJdcZBbFKC1Pt9aww/br58S/vsWGy9j5GHxWIsJEtDsUFv7xB3
	 FIFwKXCJiThvQq29ih5DzF/Kx+U7P9AZfsEO1ysb6UNP3CO6pWLSO1RqvMrht02whU
	 nSXGtwN/b+MYwv5typJSNkhKwVzE8gZLZOohiWJST2VPx8cWDiHIQD32YaES4497FY
	 9E4KssSQstrmQCHDshcjEucollc7vIjI93Otz8HD+OQQbAOueEaa42lGSkLLWbCkbG
	 Zj6jF28bfsDog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CF840BC0;
	Fri, 13 Mar 2026 16:19:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D37F0201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D19A0813F6
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKn6EBxUBrtQ for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0FD6813F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FD6813F3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0FD6813F3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so7923835e9.3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 09:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418748; x=1774023548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MzA4Gda8S9KmlgqtgVXwGCneQyKD3Nf5UN6fnS2NhMo=;
 b=aZQ1ebjFAdrlaBsnkswaJAwUlCSSKqvwzsqM7R7VCi3YrHfv3sX4ale9sbcpjSRysP
 Nvd/VmMf7DMJoi9Pn1eQ8x/nezywoGBTs8EM39peobloCrDUpsMKD/vlMQfAzyCdUG4f
 2gYXq7Q8dL3jnX0iLK+lmo9cXTyGES+XLpSdgMTiK5IrjIpxvTDZYG4SoBKAELAK+g2K
 JZn6AoHaM88UcJMgLzEaUTYM2GErB8w067T+mKjoYqz3pID3aJFTLaLB9sy0fVfbQBwQ
 J+1SoqZa3YbU4UQPH01BqYevIEUA85mvWaKDKZcl2EbqrX4e7/J18/f3cIOLmdFbRYZ8
 7EtQ==
X-Gm-Message-State: AOJu0YxxCjH+wjs8waKKD5aG9sCLCqSAJQs4NiRhG5eVC9FxZAhU2PL+
 HL5QV7jgS1BgeadJIzHlnQh2y0V+woIZxTfhDz0G9KMZ7yNRl8XBoYSbslVjlfIIP9JDqK17uqK
 Q8NNl
X-Gm-Gg: ATEYQzweC5BnBiJX8fuOnkHtD/09istBLLwCzWPA3H6G/fmuFW6PWlQJBaw33/0hu8L
 kgRtXqJ2qkBtQsjfv4riTATyzXCGinyGIyEPYM7//ixDhFy+Rp3JY/bNA32NPntjk9FgBLFp4be
 CvjCNSTw03Fv+bnsSKDHLAEKitfC9o1S/RvnezdD3Z5bXTz/b8p9+s0CTcBInboi6Yj3VsIvI8V
 XCNo/VSa1OQ6ZF8vAwurnLNfZqmozovzFYZJIaK+4e0gHYry8SpcYSoqVZvXh0KKZTTXBPDuMCa
 BEIZZtOH8gc9MiISow4+I+SLNFW+6rSnzv5vj39RB13fy9VMly/QFmz57UK7G7kIXmB38HQVSGP
 acKNRBgvtIpdNAXSzzOIbH/ca8Fq8+HOotqglUva8oNwiEhUvj7Y5j7YHxrT10gtHcD1s28BJzg
 PmuSQCW5QVA/CSPSuSnIMzwrCip0NICV0HSxARM68+MK0JSMKYz+WnWsFOJZM867BcREsjJ4neC
 TFF1NbXxm21OuZYFf0Gyg==
X-Received: by 2002:a05:600c:1550:b0:485:38fc:7069 with SMTP id
 5b1f17b1804b1-48556704780mr64356645e9.23.1773418748451; 
 Fri, 13 Mar 2026 09:19:08 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm215503345e9.4.2026.03.13.09.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:19:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 13 Mar 2026 17:18:24 +0100
Message-ID: <20260313161825.1224877-5-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773418748; x=1774023548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzA4Gda8S9KmlgqtgVXwGCneQyKD3Nf5UN6fnS2NhMo=;
 b=aAnC53OVA48GTlWGDgiQ/gqXO4SlriOWUMVL4wXgely4qqq8RklkljSiFgKIaO0pKB
 LHSS0s7toaVcSCLS7NbPeRDxVD2P3zGO/wVwjsn1wIWFl5BSln8WcfR73fhAuWj312Uw
 ci21F0i77YPkg6RDPlGdaZY4lqhuseh4dfjLA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=aAnC53OV
Subject: [Buildroot] [PATCH v2 5/6] linux: Add Rust support
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
index 50b3042194..fbb0fee3d6 100644
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
