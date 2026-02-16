Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E9E63F3D
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C600060B20;
	Mon, 16 Feb 2026 09:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0a0f5YUR-kw1; Mon, 16 Feb 2026 09:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 846B860AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771233088;
	bh=JZpqGuMsaaYFbWc5zy8fparAiMwIKM4lEBQlBSq77zU=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kDjP1L9hRt8gJu1J2Javgjj+956KZ53LF4F4YgrEmWkmKYAkuvb5VzcuU+nY2kL2C
	 XDp7gjggTjQDpymunCyGhHZVY+McxUlbAvKaEgx4V1dItBrkklBqInLXH0WAc1Fnlp
	 tbo4CPaZjfYCQzF4lWiXUKAovEMYOm/FeIzkot/JAv0CH8p77xevr/RExM5gPmBbCI
	 szxeogK38jVZHi42O99Gfa4zTQfdWWJf6bHan+5sgBBy7L5qkyY9hIyzIi4SMepBni
	 K2KEga14hIkFMW3ydm/vn10pWljqm8gjI9T4k2KP8Pc2Y+1FO9+VmFZCuVRGmgF6v5
	 yWirc1SpbOIfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846B860AEF;
	Mon, 16 Feb 2026 09:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B88EE35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A679E83B92
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdRsAMwmytv1 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:11:26 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 09:11:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93F8B82AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F8B82AEF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.26;
 helo=smtprelay03.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.31.26])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93F8B82AEF
 for <buildroot@busybox.net>; Mon, 16 Feb 2026 09:11:26 +0000 (UTC)
Received: from [80.128.8.127] (helo=mail.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1vruYX-000000005uu-1olm
 for buildroot@busybox.net; Mon, 16 Feb 2026 10:06:13 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 16 Feb
 2026 10:06:12 +0100
Received: from go-sys.de (192.168.1.113) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Mon, 16 Feb 2026 10:06:12 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Mon, 16 Feb 2026 10:06:11 +0100
Message-ID: <20260216090611.7184-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] SDL3_gfx: Add new package SDL3_gfx
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

The SDL3_gfx library is an extension to the SDL3 library
which provides basic antialiased drawing routines such as
lines, circles or polygons, an interpolating rotozoomer for
SDL surfaces, framerate control and MMX image filters.

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/Config.in              |  1 +
 package/sdl3_gfx/Config.in     |  8 ++++++++
 package/sdl3_gfx/sdl3_gfx.hash |  4 ++++
 package/sdl3_gfx/sdl3_gfx.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/sdl3_gfx/Config.in
 create mode 100644 package/sdl3_gfx/sdl3_gfx.hash
 create mode 100644 package/sdl3_gfx/sdl3_gfx.mk

diff --git a/package/Config.in b/package/Config.in
index a2615edf0e..f7c7d3dbf7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ comment "Graphic libraries"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
 	source "package/sdl3/Config.in"
+	source "package/sdl3_gfx/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
diff --git a/package/sdl3_gfx/Config.in b/package/sdl3_gfx/Config.in
new file mode 100644
index 0000000000..863aaf751d
--- /dev/null
+++ b/package/sdl3_gfx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SDL3_GFX
+	bool "sdl3_gfx"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  The SDL3_gfx library is an extension to the SDL3 library
+	  which provides basic antialiased drawing routines such as
+	  lines, circles or polygons, an interpolating rotozoomer for
+	  SDL surfaces, framerate control and MMX image filters.
diff --git a/package/sdl3_gfx/sdl3_gfx.hash b/package/sdl3_gfx/sdl3_gfx.hash
new file mode 100644
index 0000000000..10ed9147fb
--- /dev/null
+++ b/package/sdl3_gfx/sdl3_gfx.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  b92e6002825f92b19e10abe8a974f0c38839f6bfb9b065f2d8dd14c51bf12a77  sdl3_gfx-1.0.1.tar.gz
+sha256  72bf1f2078e66213b5a563fbb1c1905c96d8e62d922aa08b79088ec7a7e237ca  COPYING
+sha256  2a2d2a31bb2d83bf698e947515a8a070b7004960a55a204c5b3438439289b53f  SDL3_framerate.h
diff --git a/package/sdl3_gfx/sdl3_gfx.mk b/package/sdl3_gfx/sdl3_gfx.mk
new file mode 100644
index 0000000000..57b2532f10
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
+SDL3_GFX_LICENSE_FILES = LICENSE
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
