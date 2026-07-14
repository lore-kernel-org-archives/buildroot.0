Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0B7C44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554AE40504;
	Tue, 14 Jul 2026 11:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-gYn7LB8RF9; Tue, 14 Jul 2026 11:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D99340560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784030250;
	bh=USVCwPqlifipVwtq3n39gzeHOAsOsYsuXXFsIYV7NP8=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzUsl9H4bfpt1xEB6vnPZs09s43GYrq8h28hlq0Qk9/HBeGHevPzQyIvS5dcFJBug
	 HL82uhw8MM/rWSOXf9LG3a9C4YPpHb0Evx+tQySdE//0n1fNZzbFOG+32J7xNEGGEo
	 NjGTA8fIpLCUigo+WDQ/mlAw89BJvjQOkZd33lMWfy9HuqoEAz5BbTSeUlpJj9qXWF
	 p8FKTeTDYN2/Bs8hqfB7Z5ZtNCiNPCE77PmmKVdBKMG/sYqiPH3PaHHpYaSAs3+5ME
	 GbFBrF7t0dCgGLhRcTUkqSDRjRGwQyEHqYbaecfAq2Hqrisa6rYP07zLCu7kqrHGvZ
	 6T3nR3JBt6cYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D99340560;
	Tue, 14 Jul 2026 11:57:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCFC69CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2BF4608D5
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhpCAKoE8afK for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:57:28 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 14 Jul 2026 11:57:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C6386077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C6386077C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.119.228.102;
 helo=smtprelay07.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C6386077C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:57:28 +0000 (UTC)
Received: from [84.191.230.110] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1wjbgq-000000005VS-3UU5
 for buildroot@buildroot.org; Tue, 14 Jul 2026 13:52:44 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 14 Jul
 2026 13:52:10 +0200
Received: from go-sys.de (192.168.1.122) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 14 Jul 2026 13:52:10 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@buildroot.org>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 14 Jul 2026 13:52:04 +0200
Message-ID: <20260714115205.29838-3-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714115205.29838-1-mf@go-sys.de>
References: <20260714115205.29838-1-mf@go-sys.de>
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH 3/4] package/sdl3_image: new package
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

SDL3_image is an image file loading library for SDL3. For now only
optional PNG support (via libpng) is wired up.

https://github.com/libsdl-org/SDL_image

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/sdl3_image/Config.in       |  9 +++++++++
 package/sdl3_image/sdl3_image.hash |  3 +++
 package/sdl3_image/sdl3_image.mk   | 22 ++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/sdl3_image/Config.in
 create mode 100644 package/sdl3_image/sdl3_image.hash
 create mode 100644 package/sdl3_image/sdl3_image.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f3b29acf42..ae5ba01850 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2408,6 +2408,7 @@ F:	package/gnuplot/
 F:	package/sdl2/
 F:	package/sdl3/
 F:	package/sdl3_gfx/
+F:	package/sdl3_image/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index 3cb843a29d..7889f00845 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ comment "Graphic libraries"
 	source "package/sdl2_ttf/Config.in"
 	source "package/sdl3/Config.in"
 	source "package/sdl3_gfx/Config.in"
+	source "package/sdl3_image/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3_image/Config.in b/package/sdl3_image/Config.in
new file mode 100644
index 0000000000..9b9c4f0d74
--- /dev/null
+++ b/package/sdl3_image/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL3_IMAGE
+	bool "sdl3_image"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  SDL3_image is an image file loading library. It loads images
+	  as SDL surfaces, and supports the following formats: BMP,
+	  GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF, XPM, XV.
+
+	  http://www.libsdl.org/projects/SDL_image/
diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
new file mode 100644
index 0000000000..83f5e7eaf1
--- /dev/null
+++ b/package/sdl3_image/sdl3_image.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
new file mode 100644
index 0000000000..fadb870b6f
--- /dev/null
+++ b/package/sdl3_image/sdl3_image.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sdl3_image
+#
+################################################################################
+
+SDL3_IMAGE_VERSION = 3.1.1
+SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
+SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
+SDL3_IMAGE_LICENSE = Zlib
+SDL3_IMAGE_LICENSE_FILES = LICENSE.txt
+SDL3_IMAGE_INSTALL_STAGING = YES
+SDL3_IMAGE_DEPENDENCIES = sdl3
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+SDL3_IMAGE_DEPENDENCIES += libpng
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON
+else
+SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
