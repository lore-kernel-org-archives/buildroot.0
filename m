Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF20CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EE961535;
	Sun, 31 May 2026 15:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1aJN2P3aGdc; Sun, 31 May 2026 15:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C03C6153E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241793;
	bh=uAtmCxwXwwrjeU/WOn0pgloOYBHfbfDvOtI4jmicCYQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Yh7muCQVB77is/ckXQqIt17jRFBMz6jR6c3BdYHhtm4tQ0ReTBZDdkBxKI727QleK
	 0iShgBkEkrrAwZJhJRHgfD7rdYx1fy0pJu16CihZXjiVTCLinRFxPWbi6yXSJ0HHsQ
	 XxRcmeqyWBb6hUNQ5eYbXC1mnj+AlQD/n4NbG/R3yzx+9kA+H086esQo+KkxWvOOpk
	 IqkqBl7Scn6+PA2LEB+dJlTW32I2yqhDKbgvn6OjJrF3lOvMfweHX9zYU32Dlf5hm4
	 nD+11K/23O8+QapEwksPPv1Qp2ukyfTEXJGEOGdCOWeGc8+AEb08f/vn+L0IvrtY+w
	 CyGZhPv/FFnaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C03C6153E;
	Sun, 31 May 2026 15:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44DB3F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B8260FA9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-DkgBXGedYM for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC97660F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC97660F76
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC97660F76
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so60606045e9.3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241783; x=1780846583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iQxyaryIwm4OU175nJ2xTctQ7lzXR97QlzGaXiZGX6Q=;
 b=am1kwy+3IglnD7fVx91hEFs4pkVaNWdYpZUGjUrz0//vHERseLHz09CvukcOuWY6YH
 3QNVmOcdUgbJQLL1dCwcqKnlK85gBxroCWA2yRSiZoeoPDRkW9k5ZgbCXYw3lWqJhmqF
 67Pfv9bwfVaz/VWTFwvapNu9beQJtc9g6eF4cu0fzWSPEvFhtcm63MkeuOHbDJSXl+gv
 J9ZppiDANysqhHhOvEf1a9DN13PmBwPHhvv8eAcMzwUKK59uTQvIAzzFc7+WnFmiesgo
 5cE9v51idgHrlK1pfdh2QbydPkuV3rMg5T9nNNgpBydieOhTHTHDtar6DXiO3DU6baoo
 tWSg==
X-Gm-Message-State: AOJu0YykhPNN3xZ16QbbVBYsov4eiyXuKH8ym2zfmzsXQ6yt4W8D2eiA
 JqnTFhWzVOSMuGHo5Qks4FhT1Zeu6nBUNCX0sYbupMnk+MA6H+ewmRu8fKqNaz/aK7RQNQlDYF3
 lAc3t+Hs=
X-Gm-Gg: Acq92OG8jCHX7ynlO5ie05/gYUdoEol12P3OJALLbN8XmBiCQlgugYuc+2fiFwmsBRJ
 joNSj6JYkMMdGNaH/7Oi+DvUsvPEmgObgzkVrwjjyLoJOtLWf8kc9Rj+aMECSO9LPOJrVhhCwCh
 b0Z4VsYyUN9I8DJJgCGOk8tCqq8JjKgsZroJA0EcbJxDC3sMBy+140I5FwSwjgZXFFgvJoBkUik
 TzAvPSKS5asj+9eBIu7NcQZfwCrs8QReM2sKTdTQwl9tdrIay10WXac82yC1jCN9idpjgOZlLKQ
 Wvvkruc06FGRWY1NTqITS106ZqwmM31uTJWW+1Qg21gtA3ZL9oQbmldmW8K+H9bt9jttMXPmpDL
 Fwj/RFs84MroLtuu21P6iLxvIrlr1OY2CYWvqSdCGVcRtyfALvksXbt/za7jO3fLl+Gb6moIqCN
 LiXl9wVg521U1NAci4t+ONbr8+5kEfQqnZwWX5RGD2OjjN0KTEKZ4M504/YCt/YXYc0P6HlQi6N
 WhS6h02lZcqedvSkzengE1zg5PpnM9f
X-Received: by 2002:a05:600c:450d:b0:490:778:4fe4 with SMTP id
 5b1f17b1804b1-490a2952091mr135723865e9.26.1780241783446; 
 Sun, 31 May 2026 08:36:23 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:50 +0200
Message-ID: <20260531153557.2375580-7-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241783; x=1780846583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQxyaryIwm4OU175nJ2xTctQ7lzXR97QlzGaXiZGX6Q=;
 b=Ha8yx7X9eDSo4J5cvhyTAJAlnXsODgBU2TFRK56Ty7ZD0Q8zuFtjACJnuwjrCxXV8S
 y8ms3cAci928VfGF0i6Klq8VU8+KaZ44WSGPFSzKCcjuUx2TNKZIKjaKgsu16fTrmHVX
 XNAovtTgkq8JMpqLGzZRg+AZxvNIXC+VNxcPhUJ+ybNSAgKGime88qxQbeyhfRzxjCCF
 TPoOyp++lWFos6xSuDYTUjk0voJR6gp8JPi2+honQdXqDOoekpEzh7PbLcZ3rXSEhplJ
 tg6YN9JpBsU3KzsfwFUbXvb7l3QbsPShQd2/OncbzbzhrWcYBde1I+pE1/jd1ry7JJN2
 B82Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ha8yx7X9
Subject: [Buildroot] [PATCH v4 6/9] support/kconfig: reference environment
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
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
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
 Config.in                                     | 51 +++++--------------
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
 package/nodejs/Config.in.host                 |  8 +--
 package/openjdk/Config.in                     |  4 +-
 package/openssl/Config.in                     |  2 +-
 package/protobuf/Config.in                    | 22 ++++----
 package/qt5/qt5webengine/Config.in            |  2 +-
 package/rustc/Config.in.host                  | 16 +++---
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
 30 files changed, 78 insertions(+), 107 deletions(-)

diff --git a/Config.in b/Config.in
index 59d01b0776..85cdb3b413 100644
--- a/Config.in
+++ b/Config.in
@@ -1,6 +1,6 @@
 #
 
-mainmenu "Buildroot $BR2_VERSION Configuration"
+mainmenu "Buildroot $(BR2_VERSION_FULL) Configuration"
 
 config BR2_HAVE_DOT_CONFIG
 	bool
@@ -15,67 +15,46 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
-config BR2_HIDE_SECONDARY_TARGET_OPTIONS
-	bool
-	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
-
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
@@ -227,14 +206,10 @@ config BR2_TAR_OPTIONS
 
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
@@ -1030,4 +1005,4 @@ source "package/Config.in.host"
 source "Config.in.legacy"
 
 # br2-external menus definitions
-source "$BR2_BASE_DIR/.br2-external.in.menus"
+source "$(BASE_DIR)/.br2-external.in.menus"
diff --git a/Config.in.legacy b/Config.in.legacy
index aa8437e28f..ce6c085ead 100644
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
index 9cd912fc74..58a8ffd765 100644
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
index f4788cd72e..46a1cf5d59 100644
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
index c3592b9d20..ec489adac8 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 15.2.rel1"
 	depends on BR2_aarch64_be
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index ae1298bfe2..ac60c57aa6 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 15.2.rel1"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 992ba09518..982654ffa0 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
