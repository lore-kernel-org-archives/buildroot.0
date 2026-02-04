Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE723E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA686104B;
	Wed,  4 Feb 2026 15:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s34TzWfF3iUm; Wed,  4 Feb 2026 15:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9404E60F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219862;
	bh=plpS9O+PVDo3yAEGm+jKludOJyv/kiGbY+4xeqmzGII=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ecSH1x6AIP4R8iuu797DKXl2jLeRWYJHU8FOP4cXNWgU7svjAPgxMI8mClT0zx3ck
	 7uhC8p8eVP96rGKTFP1THwcuonKSki1hmKaCT4Y+6gCCiKIzBdv5lan1/CKkqZqODa
	 i57UshRlRAwkBXVPUyFIpTdvH0xjMcLC9/N7NeDTuFLk4z/sF2vTFR0Mln1CVkPuc6
	 e/x3Em9XY2SU1OI1xO0XwbPZ5qjz5SCoBEB8AIYWRLL+ddhIAaBPnIAig2BKiPKpnH
	 5UaRt1AE7Lk/tSv7JHNm0KGnWkuUgfWmOnx+fvQQTlK+rNYjOwbwrewScGvMru4sr+
	 93kVDU/IyLmoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9404E60F8E;
	Wed,  4 Feb 2026 15:44:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2EB470E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA934043F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBw6axmh_3ic for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08B5D4016A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B5D4016A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08B5D4016A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:44:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso59529175e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 07:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770219846; x=1770824646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W2r73FZH92bcBGdv4sJ4Z9WM+ybevlK78bHSKKD6lwo=;
 b=UHI2Bd6D4utQquw8dmVMzicLtGLemsgtRE7k7O+Eq3MyX5JXIG1Uts+vBVACkB2jrk
 qsoqyyaxUssQoyAmasOWX6hLlStc/YO6sI+ZK2h/WbArfHZuJjeWQX+XO+HZi9MquhgZ
 /HoWTnKUxppi/Eq/HuxTE27SEIhHyHSDAcFqw+1ZBNYBPwboFGlcFhRopQA7uAHRKkXz
 A91yEyanf1DQolDSxD3PdkCGI0Sg6CALMGm00F0U3lABAa+P5bQGCOTCMeUe7pYR/ytZ
 U2/+jxdtDJt3xp0b2kQDnOL9wuGWwBeXrAeaOK4bDk1+2ubhtM8fo/Os4sTm9BYwWY3q
 WNfA==
X-Gm-Message-State: AOJu0YyngXeUDpgH1iG0C/6iOhcPRkXhJ86hh2aYYBZA9gjzgiaIGJGN
 Jjunrw7z2HTjT9/ugKZJeNxdraoBMvCRrMZcVSrUew9hVxJMtKygFS7UmxnRs5SZp7kQ66bdtez
 wf1ft+XM=
X-Gm-Gg: AZuq6aJ1So/iWct0k/t1RUx81ZujLIQPtj3vx4BF/qm1S6eyUj/NwVZGZpNiYfRCrX0
 0wIDbtg9p5SSLOl8UeN1/kJdW+k+sXe1unyNdxbavGNxAC2nDD0an0SWAYOGI9M5EtVTMtoajrb
 DxzgdQLLdqaC5Co3ccBBQVIRNj+BFF/ax0pZqBvX+E5HDDqxj2w7hXdn+iZv6NwoxLKK1In/V/U
 mugnWhTjao/m7d4Vke0l+GKqxwXjyGZsObXEposlUVPIcP2EiP0nnZ4XSu4OkOUuk6w/gffXmmc
 AcFqjDpIJ0I8hNZNNtgAii0DO1pSr+kFjET8/Wu8zCzY3FI4guKWlSMvWzTtVqQKrb98PBZ5YIH
 06qvXjenaDN5Nkd1e3nV2Vfh1YVc2weMPCOC4u2d3fwimncGP2pUZovfq7MD0Bq065qBE+TpO+o
 iY24pdTAyeldO9maIpZ2oz1l+hBMG8nSFNcBoa8CqPvOEz++lNe1aQpcL7hlE=
X-Received: by 2002:a05:600c:628f:b0:477:a9e:859a with SMTP id
 5b1f17b1804b1-4830e96d45dmr44818485e9.22.1770219845619; 
 Wed, 04 Feb 2026 07:44:05 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm55222545e9.3.2026.02.04.07.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 07:44:05 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 16:43:31 +0100
Message-ID: <20260204154340.766528-5-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204154340.766528-1-titouan.christophe@mind.be>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770219846; x=1770824646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2r73FZH92bcBGdv4sJ4Z9WM+ybevlK78bHSKKD6lwo=;
 b=ez7tKypR0mOOlY4RU7oNAfN4WSeGzXPBOUvoXe5Harg4HAJoYNYVjg4pI5nHbd6cA5
 cJo1nF/LOa5DtnqnRT+AbWLnflhiQkNerB2yi4rvVC/SDD6mc+bnLckSQIR+96DHcFi2
 ebfUIlHLyybEqH8AhU6+iPtdKsQqYurobRQjCzwiN0q1oUAEe7/IBcsJsJFG5C7fwEZe
 SjWqPuYoofz6YDdKEgxoXE7MqBBoCCwRHzuN9UxEPjERYt+2sYF5IRqGo10B+ZWBOnCG
 7yi0nRrqAbPkqTYDN2MvmwsTmRBRFMhZ/6JWKB7W2DoolTpDqRPgILO1DMIzHUv1fvzP
 y8ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ez7tKypR
Subject: [Buildroot] [PATCH v3 4/7] support/kconfig: reference environment
 variables directly (remove 'option env=')
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Petr Vorel <petr.vorel@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

- reference environment variables directly (remove 'option env='), see
  upstream commit [1]:

  BR2_VERSION --> BR2_VERSION_FULL
  BR2_HOSTARCH --> HOSTARCH
  BR2_SKIP_LEGACY --> SKIP_LEGACY
  BR2_BASE_DIR --> BASE_DIR
  BR2_HOST_GCC_VERSION --> HOST_GCC_VERSION
  BR2_DEFCONFIG_FROM_ENV --> BR2_DEFCONFIG

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in                                     | 47 +++++--------------
 Config.in.legacy                              |  6 +--
 linux/Config.ext.in                           |  2 +-
 package/amlogic-boot-fip/Config.in.host       |  2 +-
 package/erlang/Config.in                      |  6 +--
 package/flutter-sdk-bin/Config.in.host        |  2 +-
 package/go/go-bootstrap-stage1/Config.in.host |  6 +--
 package/google-breakpad/Config.in.host        | 12 ++---
 package/jpeg/Config.in                        |  2 +-
 package/kvm-unit-tests/Config.in              |  2 +-
 package/luajit/Config.in                      |  4 +-
 package/mono/Config.in                        |  4 +-
 package/nodejs/Config.in.host                 |  8 ++--
 package/openjdk/Config.in                     |  4 +-
 package/openssl/Config.in                     |  2 +-
 package/protobuf/Config.in                    | 22 ++++-----
 package/qt5/qt5webengine/Config.in            |  2 +-
 package/rustc/Config.in.host                  | 16 +++----
 package/sam-ba/Config.in.host                 |  2 +-
 package/supertuxkart/Config.in                |  4 +-
 package/ti-cgt-pru/Config.in.host             |  2 +-
 package/ti-gfx/Config.in                      |  2 +-
 package/wine/Config.in                        |  6 +--
 system/Config.in                              |  4 +-
 toolchain/toolchain-external/Config.in        |  2 +-
 .../Config.in                                 |  2 +-
 .../toolchain-external-arm-aarch64/Config.in  |  2 +-
 .../toolchain-external-arm-arm/Config.in      |  2 +-
 .../toolchain-external-bootlin/Config.in      |  2 +-
 .../toolchain-external-synopsys-arc/Config.in |  2 +-
 30 files changed, 78 insertions(+), 103 deletions(-)

diff --git a/Config.in b/Config.in
index bb70964609..85cdb3b413 100644
--- a/Config.in
+++ b/Config.in
@@ -1,6 +1,6 @@
 #
 
-mainmenu "Buildroot $BR2_VERSION Configuration"
+mainmenu "Buildroot $(BR2_VERSION_FULL) Configuration"
 
 config BR2_HAVE_DOT_CONFIG
 	bool
@@ -15,63 +15,46 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
-config BR2_VERSION
-	string
-	option env="BR2_VERSION_FULL"
-
-config BR2_HOSTARCH
-	string
-	option env="HOSTARCH"
-
-config BR2_BASE_DIR
-	string
-	option env="BASE_DIR"
-
 # br2-external paths definitions
-source "$BR2_BASE_DIR/.br2-external.in.paths"
-
-# Hidden config symbols for packages to check system gcc version
-config BR2_HOST_GCC_VERSION
-	string
-	option env="HOST_GCC_VERSION"
+source "$(BASE_DIR)/.br2-external.in.paths"
 
 config BR2_HOST_GCC_AT_LEAST_4_9
 	bool
-	default y if BR2_HOST_GCC_VERSION = "4 9"
+	default y if "$(HOST_GCC_VERSION)" = "4 9"
 
 config BR2_HOST_GCC_AT_LEAST_5
 	bool
-	default y if BR2_HOST_GCC_VERSION = "5"
+	default y if "$(HOST_GCC_VERSION)" = "5"
 	select BR2_HOST_GCC_AT_LEAST_4_9
 
 config BR2_HOST_GCC_AT_LEAST_6
 	bool
-	default y if BR2_HOST_GCC_VERSION = "6"
+	default y if "$(HOST_GCC_VERSION)" = "6"
 	select BR2_HOST_GCC_AT_LEAST_5
 
 config BR2_HOST_GCC_AT_LEAST_7
 	bool
-	default y if BR2_HOST_GCC_VERSION = "7"
+	default y if "$(HOST_GCC_VERSION)" = "7"
 	select BR2_HOST_GCC_AT_LEAST_6
 
 config BR2_HOST_GCC_AT_LEAST_8
 	bool
-	default y if BR2_HOST_GCC_VERSION = "8"
+	default y if "$(HOST_GCC_VERSION)" = "8"
 	select BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_HOST_GCC_AT_LEAST_9
 	bool
-	default y if BR2_HOST_GCC_VERSION = "9"
+	default y if "$(HOST_GCC_VERSION)" = "9"
 	select BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_HOST_GCC_AT_LEAST_10
 	bool
-	default y if BR2_HOST_GCC_VERSION = "10"
+	default y if "$(HOST_GCC_VERSION)" = "10"
 	select BR2_HOST_GCC_AT_LEAST_9
 
 config BR2_HOST_GCC_AT_LEAST_11
 	bool
-	default y if BR2_HOST_GCC_VERSION = "11"
+	default y if "$(HOST_GCC_VERSION)" = "11"
 	select BR2_HOST_GCC_AT_LEAST_10
 
 config BR2_HOST_GCC_AT_LEAST_12
@@ -223,14 +206,10 @@ config BR2_TAR_OPTIONS
 
 endmenu
 
-config BR2_DEFCONFIG_FROM_ENV
-	string
-	option env="BR2_DEFCONFIG"
-
 config BR2_DEFCONFIG
 	string "Location to save buildroot config"
-	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
-	default "$(CONFIG_DIR)/defconfig"
+	default "$(BR2_DEFCONFIG)" if "$(BR2_DEFCONFIG)" != ""
+	default "\$(CONFIG_DIR)/defconfig"
 	help
 	  When running 'make savedefconfig', the defconfig file will be
 	  saved in this location.
@@ -1026,4 +1005,4 @@ source "package/Config.in.host"
 source "Config.in.legacy"
 
 # br2-external menus definitions
-source "$BR2_BASE_DIR/.br2-external.in.menus"
+source "$(BASE_DIR)/.br2-external.in.menus"
diff --git a/Config.in.legacy b/Config.in.legacy
index 2971699c78..5dc86189b7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -90,11 +90,7 @@
 #
 # [End of example]
 
-config BR2_SKIP_LEGACY
-	bool
-	option env="SKIP_LEGACY"
-
-if !BR2_SKIP_LEGACY
+if "$(SKIP_LEGACY)" = ""
 
 config BR2_LEGACY
 	bool
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3b72d3cf60..adc9c5c5a4 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -56,6 +56,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	  RTAI Kernel part.
 
 # kernel extensions from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.linux"
+source "$(BASE_DIR)/.br2-external.in.linux"
 
 endmenu
diff --git a/package/amlogic-boot-fip/Config.in.host b/package/amlogic-boot-fip/Config.in.host
index bccc6296d1..54f4075f27 100644
--- a/package/amlogic-boot-fip/Config.in.host
+++ b/package/amlogic-boot-fip/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
 	bool "host amlogic-boot-fip"
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Firmware Image Package (FIP) sources used to sign Amlogic
 	  u-boot binaries in LibreELEC images
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 724f91123b..f3830cefad 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
 
 config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	bool
diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index 181a2ee6e5..c1c97e2ca8 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	bool "host flutter-sdk-bin"
diff --git a/package/go/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
index 56a743caf9..50caad0a8b 100644
--- a/package/go/go-bootstrap-stage1/Config.in.host
+++ b/package/go/go-bootstrap-stage1/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS
 	bool
 	# See src/cmd/dist/unix.c for the list of supported architectures
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "arm"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "arm"
diff --git a/package/google-breakpad/Config.in.host b/package/google-breakpad/Config.in.host
index 28d304766a..84e95957b2 100644
--- a/package/google-breakpad/Config.in.host
+++ b/package/google-breakpad/Config.in.host
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "mips"
-	default y if BR2_HOSTARCH = "mipsel"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "mips"
+	default y if "$(HOSTARCH)" = "mipsel"
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 371f89aa49..0a7e01d28b 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -40,7 +40,7 @@ config BR2_PACKAGE_JPEG_TURBO
 	  http://www.libjpeg-turbo.org
 
 # libjpeg from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.jpeg"
+source "$(BASE_DIR)/.br2-external.in.jpeg"
 
 endchoice
 
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 817d3c4a8f..87e7125313 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
-	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
+	depends on "$(HOSTARCH)" = "x86_64" || !BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 31e9e0243e..408032c7e8 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	# Building for 64-bit target requires a 64-bit host
-	depends on !BR2_ARCH_IS_64 || BR2_HOSTARCH = "x86_64"
+	depends on !BR2_ARCH_IS_64 || "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0152df8268..354dc56d24 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index a8ab89176c..a8b0f3997d 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "ppc64le"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "ppc64le"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 comment "host nodejs needs a host gcc >= 8"
 	depends on !BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 7f29e7a489..271e3fa029 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
 
 # Taken from make/autoconf/platform.m4
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d255a05596..ca9d1a7e50 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_LIBRESSL
 source "package/libressl/Config.in"
 
 # openssl from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.openssl"
+source "$(BASE_DIR)/.br2-external.in.openssl"
 
 endchoice
 
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 633201b38c..1681e8976f 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -16,17 +16,17 @@
 # host-protobuf only builds on certain architectures
 config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "mips"
-	default y if BR2_HOSTARCH = "mipsel"
-	default y if BR2_HOSTARCH = "powerpc"
-	default y if BR2_HOSTARCH = "powerpc64"
-	default y if BR2_HOSTARCH = "powerpc64le"
-	default y if BR2_HOSTARCH = "sparc"
-	default y if BR2_HOSTARCH = "sparc64"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "mips"
+	default y if "$(HOSTARCH)" = "mipsel"
+	default y if "$(HOSTARCH)" = "powerpc"
+	default y if "$(HOSTARCH)" = "powerpc64"
+	default y if "$(HOSTARCH)" = "powerpc64le"
+	default y if "$(HOSTARCH)" = "sparc"
+	default y if "$(HOSTARCH)" = "sparc64"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 2c16d819d2..d40d007ed4 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 		BR2_mips || BR2_mips64
 	# -m32 flag is used for 32bit builds and host tools have
 	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c3e9a13f39..2de23d3edc 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -2,14 +2,14 @@
 # When adding new entries below, update RUST_HOSTS in utils/update-rust
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "powerpc"
-	default y if BR2_HOSTARCH = "powerpc64"
-	default y if BR2_HOSTARCH = "powerpc64le"
-	default y if BR2_HOSTARCH = "riscv64"
-	default y if BR2_HOSTARCH = "s390x"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "powerpc"
+	default y if "$(HOSTARCH)" = "powerpc64"
+	default y if "$(HOSTARCH)" = "powerpc64le"
+	default y if "$(HOSTARCH)" = "riscv64"
+	default y if "$(HOSTARCH)" = "s390x"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 # The pre-built Rust standard library is only available for a number
 # of architectures/C libraries combinations, with different levels of
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index cd11e8633e..9b2e2afb75 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 0f6c244058..0aab4f9e9c 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SUPERTUXKART
 	bool "supertuxkart"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
@@ -34,7 +34,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	  http://supertuxkart.sourceforge.net/Main_Page
 
 comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 9"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
index eab3cd72d5..cf56854dd1 100644
--- a/package/ti-cgt-pru/Config.in.host
+++ b/package/ti-cgt-pru/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_arm
 
 config BR2_PACKAGE_HOST_TI_CGT_PRU
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 40f46335a3..093417fa21 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/wine/Config.in b/package/wine/Config.in
index db3b1570ef..cb764f0c9b 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_WINE_ARCH_SUPPORTS
 	bool
 	default y
 	# Wine only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
-	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
-	           BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86" || \
+	           "$(HOSTARCH)" = "powerpc" || "$(HOSTARCH)" = "arm" || \
+	           "$(HOSTARCH)" = "aarch64"
 	# Wine has much CPU specific code and mostly makes sense on x86
 	depends on BR2_i386
 
diff --git a/system/Config.in b/system/Config.in
index 98bbd93092..47b22cb697 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -20,7 +20,7 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 	  Use custom target skeleton.
 
 # skeleton from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.skeleton"
+source "$(BASE_DIR)/.br2-external.in.skeleton"
 
 endchoice
 
@@ -189,7 +189,7 @@ config BR2_INIT_NONE
 	  or with a rootfs-overlay.
 
 # Init systems from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.init"
+source "$(BASE_DIR)/.br2-external.in.init"
 
 endchoice
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 831387bc4e..11f107b41e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -29,7 +29,7 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
 # Toolchains from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.toolchains"
+source "$(BASE_DIR)/.br2-external.in.toolchains"
 
 endchoice
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 3a71e1356b..bf31e34c8f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 14.2.rel1"
 	depends on BR2_aarch64_be
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 8582fe0ec8..dcdb925e6c 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 14.2.rel1"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 7b1a7fb27f..95237a1735 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
index 6552da9a84..1fa4fccb0f 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 	bool "Bootlin toolchains"
 	depends on BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Bootlin toolchains are built using Buildroot for a large
 	  number of architectures and C libraries configurations.
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 07688a1416..2847b34007 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -3,7 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	depends on BR2_arc750d || BR2_arc770d || \
 		BR2_archs38_64mpy || BR2_archs38_full || \
 		BR2_archs4x_rel31 || BR2_archs4x
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	# The toolchains have libncurses and libexpat in their
 	# sysroot, confusing Buildroot and causing build
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
