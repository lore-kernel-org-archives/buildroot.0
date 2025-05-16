Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3790C3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 12:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D28883ABC;
	Fri, 16 May 2025 12:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ci2YCCXQPdtN; Fri, 16 May 2025 12:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622D683AD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622D683AD7;
	Fri, 16 May 2025 12:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29D8F185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A6964078E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWju998UkMY9 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 12:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02E1540784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E1540784
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02E1540784
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad4d94c6590so21482266b.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 05:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747400016; x=1748004816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6S8Z4V9hJ9mNIFwAVoJRv+GyKFoDnHJGaTAjEAG9UMA=;
 b=CmH8A4/64gbxeuRXD07sZiBcDlp2YQ4MncioxCC9o1HsmBAobcFiZWHnnXCzzyUwVs
 iJj/BoGwNKnhj9cLbWnlpoHmhbEta4vjSpVKvlUMb5SLVnSFT/oQr0aB2sxXpJcaRjRb
 JeZvC22JC+cvkYr99lS2sGqlGvSUhCo0upb0RJOaXxjIPMAuOP/pf6pifWNseCj7ARMt
 bovDNVoDhpHBjbnG/x+ldF12XEKV524EZVEKTrTEw/VELy4uqwK1LyDowdbg/0j3vLaB
 08+mLmcWwMOG3DaxY+LcOMCyq/suGWcASt/nGPhIYZJ1PI46L2CsVmGXjB6F6o5OUUwn
 HOVQ==
X-Gm-Message-State: AOJu0YwC6gBvVwmOEmj6XVRkluShpJCGae/ysCOwkf1J2iYH03kQ+rWG
 1j6JCjxCnU6R4QxaWdOGRiHql8O9oT/mNdIDzgVScugy36UFVUgUY4tQdLIlXNtlzPo2+RaINKo
 pgvuybFk=
X-Gm-Gg: ASbGncucGdGGv1WQta7PLzdAvU0uydSUOc37m6pxMK91DSClFyqI8BqzjN5Zkn0/5cA
 sqECQF1AZGHru/aKkmqo5LzKaLAfXmoh5cC5OQ8RsOvi9cX5o6Hx8qhlMsJh8+EN55JN8V0mK95
 jeVwM2bbL0PVQXH92UwlG34AmccBIvogN9E1HqWpl1JCLJ74grlhdYGTP6lETuoUG+DH9VOqP4j
 dnrONfTf06twCpwVKwRi9WsHd6zSpo+J1/TfICwFdPX/q1kZ4LKd1D1dabh/1osaVs5BotYlizv
 k98z0P6PcSERiHwIuOlzp/8gsuTY/zlvX8vLno1mRuUaPl5fU9+Vsuh8Yp/3hco2pC/BM6kNFon
 HrKt6N/tY86Z57ohVOzmBLLm4Q3KJ+qrwJlspid5QJM/ehwvReNTuKVPzp2WwFbNMjVNquFzx+4
 vDxSni7JwENjFVaxSKjvFqQAome13R8L8=
X-Google-Smtp-Source: AGHT+IFU6tyfb72kDgkKw0WhjTRDuHZdgqCZS6pwM7KoeXHeoDaZaTqITZ3feYZLnVpbK4edG7hJ7g==
X-Received: by 2002:a17:907:7636:b0:ac3:bd68:24f1 with SMTP id
 a640c23a62f3a-ad52d55f2f2mr97403466b.8.1747400016268; 
 Fri, 16 May 2025 05:53:36 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca5basm154206366b.161.2025.05.16.05.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 05:53:35 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 14:53:32 +0200
Message-ID: <20250516125333.3681798-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516125333.3681798-1-adam.duskett@amarulasolutions.com>
References: <20250516125333.3681798-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747400016; x=1748004816;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6S8Z4V9hJ9mNIFwAVoJRv+GyKFoDnHJGaTAjEAG9UMA=;
 b=MoHaYOhmt/TY36cHvx8lX7rVJvU1mdZnGmp2x3NhzCzZ7gkGJJ7WWSuiuKlb/EhDsk
 Ckbw3QezCgm1bvVamIeLFCqOM3qgDDhq9M8IjMlJGb3jU7b68zp/ZFXDGMJfHLkdizab
 ZSkoCIimp8PiqWel7yvmPvILCd8H8a5BREFbw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MoHaYOhm
Subject: [Buildroot] [PATCH v3 3/3] package/mender-update-modules: enable
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
v1 -> v2: script is always installed
v2 -> v3:
  - Change docker to docker-engine (Thomas)
  
 package/mender-update-modules/Config.in       | 54 +++++++++++++++++++
 .../mender-update-modules.mk                  | 10 ++++
 package/mender/mender.mk                      |  7 +--
 3 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index f5bd85fa98..fe6495d397 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -72,6 +72,38 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
+	bool "docker"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
+	depends on BR2_USE_MMU # containerd
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccom
+	select BR2_PACKAGE_DOCKER_ENGINE
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
+comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 3.17"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 	bool "ipk"
 	select BR2_PACKAGE_OPKG
@@ -154,6 +186,28 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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
index 90c076ea96..0024acc189 100644
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
@@ -22,6 +24,10 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
 MENDER_UPDATE_MODULES_MODULES += dirty
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER),y)
+MENDER_UPDATE_MODULES_MODULES += docker
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
 endif
@@ -49,6 +55,10 @@ endef
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
