Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309CDC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB167417B9;
	Fri, 16 May 2025 14:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pc_whlYWFD1; Fri, 16 May 2025 14:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E1144177E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1144177E;
	Fri, 16 May 2025 14:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B79613D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CC5440ABE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWzQJ1bXy7of for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 108B04057B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108B04057B
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 108B04057B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:10:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad53bcef8c2so8210766b.0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747404624; x=1748009424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ccn/vf6eOZAwM8jddmpMNBNT81LHS2gqkI5h0kM5Duw=;
 b=Dr5vKsXSpTu8BOWAYUvaeOOIaUYCoqTSHaXcNZk9AoHt8nlMutA0A5Ha3gb7sY9G04
 BiVMS1Iigh49cJkW7ijDrAln7ShcyyO4Lz72ph1ruMxQwhT8upy7do/R4vRKE25vfZIB
 /QU0t6keVXhn2ayTD9hC/+7pHmB8+TXlGFDZFw/Nb8Wp0I/HwPsmEAH0j0FYwc3ZXFKm
 OxwbJda+NisFfMV8IocTGg/c2hfDVPrCHHu5ga6TpeQnNPzjTfJ0lGAqlIX6A6YqsAys
 MPlqEa3JRNXe3Kni43JCvnJqzrFSIEj3ud8nFf91FFNve9Xrs4qR4nX10akcm4lxqfFr
 M+mA==
X-Gm-Message-State: AOJu0YwLudXkBFirI7vlBZ4IdHhUwPzbqrAx6dS7DZgbrtfFUPMjQ9Ze
 /glNXr56QCLjqd71G4yUuzoKf2cizSPvR/Eu8ORGLHEtTpC8pAPpTp9JmkRQdnb+w3WhuPRQCBi
 twS+xVog=
X-Gm-Gg: ASbGnctrlPpX1coYtjfPia8lHfLGNgZB7n2kDs7e7qWure9C+72sBZmuxPZOz57g8pR
 AVqcqfBU0eVjaUJ2AxynSAdAqK+Q0zC+UPyb2Q5ElIpudOtZ4Ob9ycvcRgqlX1Si89VCjRMkJPI
 edzrYa7LG0kEPMkoHOjQ3GSKNmLMAqlE80L30j3OZG//aO8NYAjr2P35tgiTIONuu887GjZFUlC
 nlTNm2bhPMn1LjAX+G+3y5BMJ/nKOmAJHdxo0J63ozqXtNB/T/UYVEW81Y7fifTyI7LPK0JsdtZ
 m/NjhrBBA4AV4dF5TPaxP3yzNGFaUwgfHaRMqBGS2a2OsLzbFUaalLGsnk+HxTb7i1dLKUIXAil
 1klTNwaz7jqwDO+j3h7QZIobQzVIAkjlybagIryNFE0HnkK/U0FqrPv/soN6rtPa/+BtolgKAWJ
 YAYrDmrBpjAwVnlpR4R/WAv2UiULZtAtg=
X-Google-Smtp-Source: AGHT+IF50VCWHdlCEzXi85R1CSee0mM7vS/wP1HV/Xq1Cx3QRwlJFcaZ0OofwdhZoUyvX5nkFaSmDg==
X-Received: by 2002:a17:907:68a5:b0:ad2:219f:8637 with SMTP id
 a640c23a62f3a-ad52d5bb636mr105907166b.13.1747404624049; 
 Fri, 16 May 2025 07:10:24 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06d533sm167027166b.45.2025.05.16.07.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 07:10:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 16:10:21 +0200
Message-ID: <20250516141021.600390-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516141021.600390-1-adam.duskett@amarulasolutions.com>
References: <20250516141021.600390-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747404624; x=1748009424;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ccn/vf6eOZAwM8jddmpMNBNT81LHS2gqkI5h0kM5Duw=;
 b=l+3haL8pP8POOM5BQSgvUJqIYhKodVncl/Bxd6+evA+BwHsUTjyAjJl9iXrxhE2632
 PKm1f7utKnB6Za4ifLz713Icmjcc+So6ZlKke4qo4/ymOx3S/5eN7V+vEXedvxy60LgL
 sW2UVu4rZpshAmgTehx1I184QoHUDIP1rmYNk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l+3haL8p
Subject: [Buildroot] [PATCH v4 2/2] package/mender-update-modules: enable
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

v3 -> v4:
  - select docker-cli for the docker plugin.
  - Add jq to the docker plugin

 package/mender-update-modules/Config.in       | 56 +++++++++++++++++++
 .../mender-update-modules.mk                  | 10 ++++
 package/mender/mender.mk                      |  7 +--
 3 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 8181cfe91b..beec9d24e7 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -72,6 +72,40 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
+	bool "docker"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS # docker-engine, docker-cli
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS # docker-engine, docker-cli
+	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
+	depends on BR2_USE_MMU # containerd
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccom
+	select BR2_PACKAGE_DOCKER_ENGINE
+	select BR2_PACKAGE_DOCKER_CLI
+	select BR2_PACKAGE_JQ # runtime
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
@@ -157,6 +191,28 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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
