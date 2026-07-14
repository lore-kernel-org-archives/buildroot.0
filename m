Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11C8C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 12:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD7680C9B;
	Tue, 14 Jul 2026 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGIpcxMzpP_z; Tue, 14 Jul 2026 12:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB4B8115E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784031435;
	bh=d7rDdIhuyNGcz11rC6S8ASt+g9R2k3Q2Rjd5QG5Cq/E=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFI6iHbvRM+VI7TfRanklUCqPfQfL7qCT3AhxO88cctDcAlrVvQFeptMxEM95V5Dt
	 diBIkr2IydBlBK40pto5emURX4NEws22noehwnqd0IzOz6YmClDcKX/r0wz5pRpFXM
	 gQUA1bgkM1LnNZAvwv/xw80zMo+/FxmT2hBBeZO+T4IU4Q8RfVsqBd9g0SNlmFbhnZ
	 Tvf+yi0oao1UpD1rHfq6cDb8yh1tfzW/r/SrnICGDsr00disth0rWHtzzxGyZgLbZ2
	 uE3DSZEx/ow2WDjZ/2H0SjqxGyElXDLrAyRzW56Q/dYLb4EfDes9ONeIdl0UeFAc+g
	 mGwU/fVdhxnxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB4B8115E;
	Tue, 14 Jul 2026 12:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7869396C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A82D608FD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1miThqspt9T for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 12:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.119.228.102;
 helo=smtprelay07.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87F90608EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F90608EA
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87F90608EA
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:17:13 +0000 (UTC)
Received: from [84.191.230.110] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1wjbgq-000000005VS-2IP8
 for buildroot@buildroot.org; Tue, 14 Jul 2026 13:52:44 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 14 Jul
 2026 13:52:09 +0200
Received: from go-sys.de (192.168.1.122) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 14 Jul 2026 13:52:09 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@buildroot.org>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 14 Jul 2026 13:52:03 +0200
Message-ID: <20260714115205.29838-2-mf@go-sys.de>
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
Subject: [Buildroot] [PATCH 2/4] package/sdl3_gfx: new package
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

SDL3_gfx provides basic antialiased drawing routines such as lines,
circles or polygons, an interpolating rotozoomer for SDL surfaces,
framerate control and MMX image filters, as an extension to SDL3.

https://github.com/sabdul-khabir/SDL3_gfx

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sdl3_gfx/Config.in     | 10 ++++++++++
 package/sdl3_gfx/sdl3_gfx.hash |  3 +++
 package/sdl3_gfx/sdl3_gfx.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/sdl3_gfx/Config.in
 create mode 100644 package/sdl3_gfx/sdl3_gfx.hash
 create mode 100644 package/sdl3_gfx/sdl3_gfx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f44548ea0..f3b29acf42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2407,6 +2407,7 @@ N:	Michael Fischer <mf@go-sys.de>
 F:	package/gnuplot/
 F:	package/sdl2/
 F:	package/sdl3/
+F:	package/sdl3_gfx/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index 91903361c5..3cb843a29d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ comment "Graphic libraries"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
 	source "package/sdl3/Config.in"
+	source "package/sdl3_gfx/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3_gfx/Config.in b/package/sdl3_gfx/Config.in
new file mode 100644
index 0000000000..d7f5a9d7ee
--- /dev/null
+++ b/package/sdl3_gfx/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDL3_GFX
+	bool "sdl3_gfx"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  The SDL3_gfx library is an extension to the SDL3 library
+	  which provides basic antialiased drawing routines such as
+	  lines, circles or polygons, an interpolating rotozoomer for
+	  SDL surfaces, framerate control and MMX image filters.
+
+	  https://github.com/sabdul-khabir/SDL3_gfx
diff --git a/package/sdl3_gfx/sdl3_gfx.hash b/package/sdl3_gfx/sdl3_gfx.hash
new file mode 100644
index 0000000000..2c3b091c1d
--- /dev/null
+++ b/package/sdl3_gfx/sdl3_gfx.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b92e6002825f92b19e10abe8a974f0c38839f6bfb9b065f2d8dd14c51bf12a77  sdl3_gfx-1.0.1.tar.gz
+sha256  72bf1f2078e66213b5a563fbb1c1905c96d8e62d922aa08b79088ec7a7e237ca  COPYING
diff --git a/package/sdl3_gfx/sdl3_gfx.mk b/package/sdl3_gfx/sdl3_gfx.mk
new file mode 100644
index 0000000000..fb747c0e95
--- /dev/null
+++ b/package/sdl3_gfx/sdl3_gfx.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# sdl3_gfx
+#
+################################################################################
+
+SDL3_GFX_VERSION = 1.0.1
+SDL3_GFX_SITE = $(call github,sabdul-khabir,SDL3_gfx,v$(SDL3_GFX_VERSION))
+SDL3_GFX_LICENSE = Zlib
+SDL3_GFX_LICENSE_FILES = COPYING
+SDL3_GFX_INSTALL_STAGING = YES
+SDL3_GFX_DEPENDENCIES = sdl3 host-pkgconf
+
+SDL3_GFX_CONF_OPTS = \
+	-DSDL3_GFX_TESTS=OFF \
+	-DSDL3_GFX_INSTALL=ON
+
+ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),yy)
+SDL3_GFX_CONF_OPTS += -DSDL3_GFX_MMX=ON
+else
+SDL3_GFX_CONF_OPTS += -DSDL3_GFX_MMX=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
