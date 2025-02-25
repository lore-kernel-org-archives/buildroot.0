Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F4C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F030360649;
	Tue, 25 Feb 2025 13:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcybV9KEbGmp; Tue, 25 Feb 2025 13:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B65606F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B65606F5;
	Tue, 25 Feb 2025 13:38:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE2B2DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FE1E607E0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wxw2gFX8a2vt for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 13:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07AC260649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07AC260649
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07AC260649
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:38:33 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abad214f9c9so103612066b.0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 05:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740490712; x=1741095512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n6MkQx1x8NpHhNZdpHlNwrIUhQCsaCFxhS8ohmYLB44=;
 b=nlQyvbtvxqEi0hGgzbZ4DcJxGUlb+9u0HIm92o/PEejAZAyTV0Kh2lptm5EzCeJQ8r
 cxLDNDaiYBPr+1q2NlBy5e6hkqq22GVvgL8fLUZ0mwFIoI6oRMmmEuK5EHCuEWHL3C0c
 FEWGAx8/DVfCjAEyyCdKKL8qYoQo+fQvZqfXQxk0gIJffWes0UTsqFHPif1B62Y3YSL2
 D5NgYlhonLBg/2m9j8ERuzxbv35gGGZhxyYqhcdB/R3vxE2uVRTSw9plGxR4G9oMD/qW
 jUQFhkQQZ/7jIV1ZG3PtpgioT7AXyMgkcvsu3lPKyKP0muH8qVw5EbY9bmB1+PprmtKm
 TFpg==
X-Gm-Message-State: AOJu0YxU/4DvvWum3LJtE1VGnFGnANFzfr360cfjoSeRyKnPcdmJyP+g
 peXhrI0Ai4oQhJWynopdIY91doPiEE1pxT1OYigOd/MsaYk5A8eusNXGGHsY2JkFT3udm5p6SfI
 Iy/nITw==
X-Gm-Gg: ASbGncsbsrLWEn/d2Mg5IdlLrw6qspGsTr9oYCSyXvRz8Fk7Cy36zQqrYL2Bm7DsNuR
 ibmJF9cFiZQ1gQ1hvcB7xFbtzF4flkaZr2fiij963qDhxyrHVyKeKBPFRMx6vkxeAAMj6zfB2rT
 noIcZnEEaZduotz8U3DGUzgXm8ZRdsgfvWKbVB3D78S0XIgTV95sHYlzD24gZqYBNGyG4enLdSg
 5mMpwpt6mYp9jM6L4GbzrR6nsR2o5XfU8PXmS7Rq7RfyEyneCcTPGQRVbQHQSz7HtspLnnsGx4I
 eOeYhFlwesrK08VvgFbdUplfon8S4Ej6q1dVsBr48TdKWwgx48pQYhtceestryC/azqqjtFwafx
 N2hzxoS48G4iLu/dBgXTcO6QYBP2vVtUhe4B9elBlB8QTsM20Ry6hcUkWcJ0t7qOUhio=
X-Google-Smtp-Source: AGHT+IGH7b2Mh+NjsLgqL3gdJaYOXfnWXKvWZs4FENiC80eIPM5QK5LnzkvjMGfW10PqHxxK0zIsJw==
X-Received: by 2002:a17:907:2d20:b0:ab6:b8e0:4f25 with SMTP id
 a640c23a62f3a-abc09a14d0dmr741395766b.4.1740490711713; 
 Tue, 25 Feb 2025 05:38:31 -0800 (PST)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed2010fbasm143775966b.105.2025.02.25.05.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 05:38:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 25 Feb 2025 14:38:29 +0100
Message-ID: <20250225133829.2888663-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225133829.2888663-1-adam.duskett@amarulasolutions.com>
References: <20250225133829.2888663-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740490712; x=1741095512;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n6MkQx1x8NpHhNZdpHlNwrIUhQCsaCFxhS8ohmYLB44=;
 b=AwbpSC/q7g479hfVkw0qjFxownnEgpzWQl56XDVIIU0S9cWpKZAj0vWSzpLdXmEv5I
 ugV9iNXkDvu6jAP5mQP1M+4Rj55cbvRwUpU5ay5UkpIHsfpdkHeiW2r9VEYT+0krn2To
 Aeb6/5i84EnXZhnyNoKNooPj6FlF+giGqul8w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AwbpSC/q
Subject: [Buildroot] [PATCH 2/2] package/mender-update-modules: enable
 docker, rpm, and script modules
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

Starting with mender 5.x, the docker, rpm and script modules provided by
the mender package now reside in the mender-update-modules repository.

Even though the mender package provided by Buildroot is not updated yet to 5.x,
it is best to enable the modules here to help facilitate the future update of
the mender package to 5.x, and to ensure that any future modifications or bug
fixes to these modules are easy to apply by simply bumping the upstream package
version.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/Config.in       | 58 +++++++++++++++++++
 .../mender-update-modules.mk                  | 12 ++++
 package/mender/mender.mk                      |  7 +--
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 5386049f6f..b2b65798ca 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -78,6 +78,23 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
+	bool "docker"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_DOCKER
+	help
+	  The Docker Update Module handles the Docker images that shall
+	  be running in the device. A deployment with this module will
+	  stop all currently running Docker containers in the device,
+	  and start new containers with the provided list of Docker
+	  images in the Mender Artifact.
+
+	  In case of an unforeseen error during the process, the module
+	  will use the rollback mechanism of the Mender client to
+	  restore the previously running Docker containers.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 	bool "ipk"
 	select BR2_PACKAGE_OPKG
@@ -126,6 +143,47 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 comment "rootfs version check needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
+	bool "rpm"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_RPM
+	help
+	  The Rpm Update Module updates software on the device using
+	  the native local package manager.
+
+	  A Mender Artifact containing one or more software packages
+	  is sent to the device, where the Update Module will call
+	  the package manager to install them in alphabetical order.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
+
+comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_SCRIPT
+	bool "script"
+	help
+	  The Script Update Module allows to execute any general
+	  purpose script or binary on the target device. A Mender
+	  Artifact containing one or more executables
+	  (usually scripts) is sent to the device, where the Update
+	  Module will execute these during the ArtifactInstall state.
+
+	  If multiple scripts are provided, they will be executed in
+	  alphabetical order on the device.
+
+	  Example use-cases:
+	    - Restart application into diagnostic mode
+	    - Run diagnostics script
+	    - Execute any other generic command
+
+	    https://github.com/mendersoftware/mender-update-modules/tree/master/script
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	bool "swupdate"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index f16e219c6e..76210214b3 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -22,6 +22,10 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
 MENDER_UPDATE_MODULES_MODULES += dirty
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER),y)
+MENDER_UPDATE_MODULES_MODULES += docker
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
 endif
@@ -45,6 +49,14 @@ endef
 MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM),y)
+MENDER_UPDATE_MODULES_MODULES += rpm
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SCRIPT),y)
+MENDER_UPDATE_MODULES_MODULES += script
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU),y)
 MENDER_UPDATE_MODULES_MODULES += swu
 endif
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 146e6b2b73..770589390f 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -45,12 +45,7 @@ MENDER_DEPENDENCIES = host-pkgconf openssl
 
 MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
 
-MENDER_UPDATE_MODULES_FILES = \
-	directory \
-	script \
-	single-file \
-	$(if $(BR2_PACKAGE_DOCKER_CLI),docker) \
-	$(if $(BR2_PACKAGE_RPM),rpm)
+MENDER_UPDATE_MODULES_FILES = directory single-file
 
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
