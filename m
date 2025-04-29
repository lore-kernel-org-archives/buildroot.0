Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D4C3ABA9
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FA640C1B;
	Tue, 29 Apr 2025 10:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3DBeFnlWLVV; Tue, 29 Apr 2025 10:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA7940504
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA7940504;
	Tue, 29 Apr 2025 10:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F29B1E3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25C0260C24
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GiH2VepnhQe for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 10:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11CA260729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11CA260729
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11CA260729
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f8619031f1so20786a12.1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 03:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745921772; x=1746526572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rK2NvfSGXWFyrtsyPZ47tNTqFTMxDsulOphhz9iCNE=;
 b=doc//CjD6IGBTolBHOYvLpcP1fyr7qwf7vZtDOps4Yoyb22m8YuUDQ/DLzn3HJvVqt
 L9RFI0Pjm6q5pXN40+KFEmP6DdzejpyK3i5nwLIGNY2enfSW2hd8v/XvhxNPgeN7Y0Eb
 FKgLGT6OWSZUjLPf5+RH9TqEHhkgI6PFKjuuFoP5NGt+z5jwjfuijYxDK9oRvUKw7qpE
 +QNn7nixyhzQPYCnuyB//KuUIKfOo8ceaSM649y5TPfdDVyGvyQgWodsE/S2A4Jfs1NP
 1LYoaZ0rKIKprZDg/jSs2d+akrKrWzvbjks7a+pa7ZwyMiyD9OzD7Mv2er9itLEkHgxr
 i/Zw==
X-Gm-Message-State: AOJu0YxLqw+W9vB6GaMGD4fiB8RtiuIhIqj2ZISabQSYy7gNysInxhvu
 3Oe8j/VFHoR0d3njwCyadC7gd1QWb9b0ejlhPm4j66V4B+iNDoHQMw04qfiMSA1mvsTQa3PD4Ik
 f
X-Gm-Gg: ASbGnctkJMdI9c3qvR2xVgiz2f0yyn3Ip91FjTGSldSYgx0v1oUed7XN807iUvMooRw
 7KEUiyB0zU9XKgB0fJTOx0VfTpPqHaBAtbscBGDOLhW4lNyA4AtwdEirpY3x+035nIq8fD6wWMy
 gXDRqK1Q30pGcEVAbjLUDmwMLAh/c4p+/RMBfBj0DrIbYCi35Zp01KqpXob4NqrlGscz7VFW0Vt
 GjJOBwCZ3PjwG0R+sARUWLoOTynZQFyk0UXCEL81Gw044W6shAvCR1SKm9gPA17GUAQKBdLfcS6
 iRo4Z3i4aPneC6VnYyNyuc/BpDbwY23VOXWrxEU45wkmYiiL0YGKdQdHNqqvfPVkXILd/qMorEC
 w7UISJp3QeYtPfcEv/2t8SD52f2WIrwl2JnpHU7nUh6TjA0CU2B2d49Hn6XPkNBbkV+oj3OgMU9
 eyCESp
X-Google-Smtp-Source: AGHT+IGguntZOXlCCeukdg+1kcjlRoWBbIZv0STC3T50LqkUQCnP0G4FsEiXycyIDVrn8us+H+8WtA==
X-Received: by 2002:a17:907:3da5:b0:ac7:390f:e36a with SMTP id
 a640c23a62f3a-ace71425ad4mr506555666b.14.1745921771726; 
 Tue, 29 Apr 2025 03:16:11 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2001-1c00-8182-4700-3d78-0c42-7f3a-1345.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:3d78:c42:7f3a:1345])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4f8835sm768254166b.67.2025.04.29.03.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:16:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 29 Apr 2025 12:16:07 +0200
Message-ID: <20250429101607.864604-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
References: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745921772; x=1746526572;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rK2NvfSGXWFyrtsyPZ47tNTqFTMxDsulOphhz9iCNE=;
 b=aedTLkrk+iYtI7YRuL+twWdLU4VSHbTBdbICKfyiA6YsJhTk5p5qZAy1HbZwROYwAg
 HvW3mt/8P3dBfk21sbTk8y7an4Ab1SjaI3gqQcjzkwrZIXO0UcbCuXl2ganQBxTbSr6Z
 GI16ro1H0bqaieWM8gieSXCG2l7e9WbgH23Xw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aedTLkrk
Subject: [Buildroot] [PATCH v2 3/3] package/mender-update-modules: enable
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

Script is enabled by default to preserve the existing behavior of the mender
package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V1 -> v2: script is always installed

 package/mender-update-modules/Config.in       | 39 +++++++++++++++++++
 .../mender-update-modules.mk                  |  9 +++++
 package/mender/mender.mk                      |  7 +---
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index b789a0a00c..4ea0bce6c3 100644
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
@@ -160,6 +177,28 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	bool "swupdate"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index b66505060a..a8429d9929 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -10,6 +10,8 @@ MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
 MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
 MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
 
+MENDER_UPDATE_MODULES_MODULES = script
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
 MENDER_UPDATE_MODULES_MODULES += dfu
 endif
@@ -22,6 +24,9 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
 MENDER_UPDATE_MODULES_MODULES += dirty
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER),y)
+MENDER_UPDATE_MODULES_MODULES += docker
+endif
 
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
@@ -50,6 +55,10 @@ endef
 MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM),y)
+MENDER_UPDATE_MODULES_MODULES += rpm
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
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
