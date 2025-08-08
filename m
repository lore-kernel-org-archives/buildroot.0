Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A84C87FD3
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 928D640BF1;
	Fri,  8 Aug 2025 13:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDmar87oFutk; Fri,  8 Aug 2025 13:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 261F440B76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 261F440B76;
	Fri,  8 Aug 2025 13:31:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 055C59CF
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBABF81EA4
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZHU4dGxvyjH for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 13:31:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EBA5811F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBA5811F8
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EBA5811F8
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so17792065e9.3
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 06:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754659892; x=1755264692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NivnTV+bLXLzmpNCV7/rpKUg9j+K8OSmMM3ym+Eh1ag=;
 b=b6YcBuYG5EDsDvPFg2FO4Kyel0tpSMlMx00yl+ZnQHqBrAabL1ovCLNL2o1Twd6phy
 0LC0euE0JlwUUswP0nfh4sxvdT2VdHukcAMBLNpFri89m7u2PBRHj7J58pOiIAGOoDvb
 QZ6eLQ/d2A6jayoTBs0tVUEZTretxi+eUBYF06yFbwzHfDgxCVJiuf1PJWRb1qZgDCP3
 IpXWNCioNjNQfE1LEw4mXsALxFyNEUJ71aBMy9yjRF7hbOrAbB964ZPXNDdWjJZh2rPV
 BipXY/K3KL8SCIJSa8poEX2eCry50nynNLDI8MSF70AAxGQR4Y44+PJESGF5Z8QsVVbW
 FvHw==
X-Gm-Message-State: AOJu0Yw79UILNefk3kg9rAdonU3SUL6eiCHsMupshOjHsOXbJEMi4TUG
 4D2iOuFdOjvFWyRoNDG6f4ZPTG4b6A6ygK2DvbbvdefDd52T9iLQfg+0dmlcggnt3jwySEW9/CM
 ToR6E
X-Gm-Gg: ASbGncui7TUhUDiLrf6W0L0zJ97tw4MYi6rYgIHOozg1/sYUy5mSAIC1ougK4NmXuhD
 Thbmbb7kgW3EqzSfFUF3l4fj0xuRx0KIRu1KnSwvXvlvk26ZkFx37YTrUZ+IqMgdQlmqr3LRlIo
 tVhwDkaWahAQm6pe6wMRa/rPA3ysfIYWbkMHjIenaqv46UyUnon7toeB93ohBjyPc5gjpiA9hHl
 VYWH6AehyAxVP9YKsA0eL/UjKbaBJ0N5NH3Eez2s9w8+CYYe58LCc+ILOBA386o3DRDuFQQ9oDZ
 nwpkvhWXkm/smjy2JJ+siulE+iPxBaCkMXWUNRoCPClBbcsZVkoObmwC2RNYP2YH95FU8dbPFbE
 d7sQh+Nf0GGpFZRWO9GWG4pp1vNhgXGS2MFw7zQK1hgpyy+yuloYDBmeXdyBAuoCkardwmlAgdg
 Bo0yZDo8H5OhrtctWa
X-Google-Smtp-Source: AGHT+IG/cMiLK9dMXPvf+oLkdSjNuPSxdFbog/jHe1h7XT2+5YuFnsOIosTuk9rZAj4bEymbqJphXg==
X-Received: by 2002:a05:600c:4449:b0:459:df25:b839 with SMTP id
 5b1f17b1804b1-459f4f2e2c1mr27350225e9.33.1754659891921; 
 Fri, 08 Aug 2025 06:31:31 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm149053965e9.22.2025.08.08.06.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 06:31:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  8 Aug 2025 15:31:12 +0200
Message-ID: <20250808133112.3212687-6-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754659892; x=1755264692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NivnTV+bLXLzmpNCV7/rpKUg9j+K8OSmMM3ym+Eh1ag=;
 b=prA+lSsSEm2e1hWPwNSlxylmCreBKPEnmDkdK5+bXIvRsCCWoM3d/rF09GZeQcMDdj
 OL60eu/0EDN/rAkjc4KaCJ+o8++B8TU/Ygg/ZPTmcxc5fY660oR+FW0kj22feekFju9/
 jMMnl2G4k7zZ9gIvYqwDUUHbEwgygfloW7bLw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=prA+lSsS
Subject: [Buildroot] [RFC PATCH 5/5] linux: Add Rust support
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
 linux/Config.in |  6 ++++++
 linux/linux.mk  | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 7f90c566b0..86525c9b0a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -557,6 +557,12 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
 	  Enable this option if you get a Linux kernel build failure
 	  such as "python3: not found".
 
+config BR2_LINUX_KERNEL_RUST_SUPPORT
+	bool "Enable Rust support in the kernel"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_HOST_RUST_BINDGEN
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index f5ac64fdd2..d95356342b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -180,6 +180,16 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C TZ='UTC' date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
+LINUX_DEPENDENCIES += host-rustc host-rust-bindgen
+LINUX_MAKE_FLAGS += \
+	RUSTC=$(HOST_DIR)/bin/rustc \
+	BINDGEN=$(HOST_DIR)/bin/bindgen \
+	RUST_LIB_SRC=$(HOST_DIR)/lib/rustlib/src/rust/library \
+	LIBCLANG_PATH=$(HOST_DIR)/lib \
+	RUSTFMT=$(HOST_DIR)/bin/rustfmt
+endif
+
 # gcc-8 started warning about function aliases that have a
 # non-matching prototype.  This seems rather useful in general, but it
 # causes tons of warnings in the Linux kernel, where we rely on
@@ -479,6 +489,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
+	$(if $(BR2_LINUX_KERNEL_RUST_SUPPORT),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_RUST))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
