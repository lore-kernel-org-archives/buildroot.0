Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01200CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C703741839;
	Wed,  3 Apr 2024 19:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfJF37khGZJh; Wed,  3 Apr 2024 19:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A723F418D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A723F418D3;
	Wed,  3 Apr 2024 19:54:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3FB41BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C08E64189D
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgvGngMZbjMh for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F9044179A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9044179A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F9044179A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41628f4c665so601575e9.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174049; x=1712778849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UI1+swYjYFANSCbIFUDzf5WUSEx5UH9HtbCMhP5aam0=;
 b=gxb2Xqe37m99jKg/AGHBnrEgYPSCxL13Zf0R1S47INdCEKcAHUCJ+bnINeIIf71hS0
 0furqkH7UmQpwZ6oRhYLkGIhKvpNReWbz3zjIgrlmtyEnQp0zDVm+6+V5hAIOckSd83s
 qH5WOO5en1oL3fbKSmftpEuoG4p0Mc/oFSI6dvTvrlvGp3hxcGghlo+FX/eG8xyErDXR
 2upX9mh71cN92wXiERJkzck7p9h/hKx49TR6oKPOGLxqMqxA/zEmF3y9LJw1jvuLM0/D
 /mgHBxElm8PVqwUGPwBFSwGJh17clY1yg+j9fQ1rDb1zPFrUoRnO+WIZU1v/ZNDUGUaF
 FCVA==
X-Gm-Message-State: AOJu0Yy6qjVjt5tNSV+1CKoQoEKFbweLPxk3CSDrpcYCs43VBMdgJp/O
 LfFHEhFQSuH/N0r/JABwU9ChQOabFGlgBCKGjQ58rtgS4pIqVYJW8QFwgYSefipjkRax6VksNde
 Q
X-Google-Smtp-Source: AGHT+IGutxhzc3HGNAQjsSzuW97D7IwTA2EpFZ/FOVWrO9woPwaCMBYrfovKtc4r3eaI62l+RupzdQ==
X-Received: by 2002:adf:b309:0:b0:341:db6c:1eec with SMTP id
 j9-20020adfb309000000b00341db6c1eecmr389051wrd.0.1712174049015; 
 Wed, 03 Apr 2024 12:54:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:08 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:39 +0200
Message-ID: <20240403195403.1359007-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174049; x=1712778849;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UI1+swYjYFANSCbIFUDzf5WUSEx5UH9HtbCMhP5aam0=;
 b=M/JW1ItayyN6ONib/mnSur9I5ZECZhqLVSfIIGOd7JikOKwGsyifQqU8NnoYSksbbO
 4fXhaENjcxN6ZPH4c6SWOYwVVhQMjiRr/YODgueT97uuLj93s92FWm7f/Tg2GHWVfjZT
 2dJdEZp7y8PChA4kfTLWWDhJLbs70uyT6WCZ1O/tDlZnvocrmxsUcSUiOu3bp/Y8Q11C
 Wl3ax424KH+A9zS61+ocXPhAqz3Oip+9x6yrLam1e3ROU2IH7C+NIf+amYpw1vV987xx
 dzitV9p+ZktbhPVfLVoEEph/G/1krNvCb/Oh7WGHsrRz9gtHLa+6eIp7KvEz1TJei1Nx
 naRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=M/JW1Ita
Subject: [Buildroot] [PATCH v11 05/17] boot/ti-k3-r5-loader: add
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option
BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN to add additional host packages
in U-Boot build dependency to use binman.

When BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is set, BINMAN_INDIRS
environment variable to provide the directory to search for binary
blobs and select the packages required by binman. Make sure that
ti-k3-boot-firmware package has been installed before building
ti-k3-r5-loader in order to provide such firmwares.

The BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option is currently needed
since we are in the middle of the process to switch TI AM62 and AM64
board defconfig to binman. Keep BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
disabled for them until the u-boot/ti-k3-r5-loader version bump to
2024.01.

The dependency of binman is not really easy to follow. First we have
the packages list from binman.rst [1] then we have to install
additional python modules [2]. Maybe in the future it will be
necessary to add host-lzma and host-lz4 in the dependencies list.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Use BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option while AM62 and AM64
  still use ti-k3-image-gen
- Add missing ti-k3-boot-firmware dependency

Changes in v6:
- Update the commit message adding the links of requirements.

Changes in v5:
- Add dependecy on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
- Drop runtime dependecies
- Add host-python-pylibfdt dependency without requiring
  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT configuration
- Add host-python3 and host-python-setuptools dependencies
- Add SOB and COB tags of Romain Naour

Changes in v4:
- Drop the BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option

Changes in v2:
- Change commit message
- Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Select packages required by binman if
  BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled
---
 boot/ti-k3-r5-loader/Config.in          |  8 ++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f86c045c9..cfae45ac98 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -93,4 +93,12 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
+	bool "ti-k3-r5-loader use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f..cf18b43871 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -60,6 +60,21 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml \
+	ti-k3-boot-firmware
+# Make sure that all binman requirements are build before ti-k3-r5-loader.
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python3 \
+	host-python-pyelftools \
+	host-python-pylibfdt \
+	host-python-setuptools
+TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
