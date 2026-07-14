Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D918EC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D90A40504;
	Tue, 14 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueH5SxtdQPBF; Tue, 14 Jul 2026 11:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24DD40560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784030293;
	bh=1zIXekITRBV5QbXog7MVQKaUP6id1msMz+fj0v21eZQ=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coM3niY4TGuu5Tv2cFQwM8/kUcae7fzXiGrGYZcgRJZ2KHPYncFxQyU8PfU/iC8iB
	 8zAHqvNLVwg7CCbErNfiRxMFIdlUaThxxDRe/HCAwrmAE6/LNGK0Y1ycHYlDgXK6jY
	 01HEwbOEq1dasRv+F48XXyH9MOHc6l+fCctkDibF0ILgNMl4nhdlDbU6MWYM9BhMfe
	 wDTtuiT5WEHKYEpyvBjBnaIBfv8nHEWC4+jGgC7jN47/it6/27JgpMO3Phkb+93Jjt
	 B7rh/H5OocG28n4MNDCPOKweqjjR0eyMO+tSh4lqLSTtBDjX1K1G027Z6y85TLhTcD
	 SPaTAh3VmlXfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24DD40560;
	Tue, 14 Jul 2026 11:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3DD9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27BF08110C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJ3A-I_sNI40 for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.119.228.102;
 helo=smtprelay07.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CAF28110B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CAF28110B
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CAF28110B
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:58:11 +0000 (UTC)
Received: from [84.191.230.110] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1wjbgr-000000005VS-0k5G
 for buildroot@buildroot.org; Tue, 14 Jul 2026 13:52:45 +0200
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
Date: Tue, 14 Jul 2026 13:52:05 +0200
Message-ID: <20260714115205.29838-4-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714115205.29838-1-mf@go-sys.de>
References: <20260714115205.29838-1-mf@go-sys.de>
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH 4/4] package/sdl3_ttf: new package
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

SDL3_ttf is a TrueType font rendering library for SDL3, based on
freetype, with optional harfbuzz support.

https://github.com/libsdl-org/SDL_ttf

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sdl3_ttf/Config.in     |  9 +++++++++
 package/sdl3_ttf/sdl3_ttf.hash |  3 +++
 package/sdl3_ttf/sdl3_ttf.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/sdl3_ttf/Config.in
 create mode 100644 package/sdl3_ttf/sdl3_ttf.hash
 create mode 100644 package/sdl3_ttf/sdl3_ttf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ae5ba01850..93ff873770 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2409,6 +2409,7 @@ F:	package/sdl2/
 F:	package/sdl3/
 F:	package/sdl3_gfx/
 F:	package/sdl3_image/
+F:	package/sdl3_ttf/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
diff --git a/package/Config.in b/package/Config.in
index 7889f00845..19b5f7c1d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ comment "Graphic libraries"
 	source "package/sdl3/Config.in"
 	source "package/sdl3_gfx/Config.in"
 	source "package/sdl3_image/Config.in"
+	source "package/sdl3_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/virglrenderer/Config.in"
diff --git a/package/sdl3_ttf/Config.in b/package/sdl3_ttf/Config.in
new file mode 100644
index 0000000000..d1c6c2efd0
--- /dev/null
+++ b/package/sdl3_ttf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL3_TTF
+	bool "sdl3_ttf"
+	depends on BR2_PACKAGE_SDL3
+	select BR2_PACKAGE_FREETYPE
+	help
+	  SDL3_ttf is a sample TrueType font library. It allows you to
+	  use TrueType fonts in your SDL3 applications.
+
+	  http://www.libsdl.org/projects/SDL_ttf/
diff --git a/package/sdl3_ttf/sdl3_ttf.hash b/package/sdl3_ttf/sdl3_ttf.hash
new file mode 100644
index 0000000000..a959f011ce
--- /dev/null
+++ b/package/sdl3_ttf/sdl3_ttf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  63547d58d0185c833213885b635a2c0548201cc8f301e6587c0be1a67e1e045d  SDL3_ttf-3.2.2.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
new file mode 100644
index 0000000000..12441e243e
--- /dev/null
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sdl3_ttf
+#
+################################################################################
+
+SDL3_TTF_VERSION = 3.2.2
+SDL3_TTF_SOURCE = SDL3_ttf-$(SDL3_TTF_VERSION).tar.gz
+SDL3_TTF_SITE = https://www.libsdl.org/projects/SDL_ttf/release
+SDL3_TTF_LICENSE = Zlib
+SDL3_TTF_LICENSE_FILES = LICENSE.txt
+SDL3_TTF_INSTALL_STAGING = YES
+
+SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
+
+SDL3_TTF_CONF_OPTS = \
+	-DSDLTTF_VENDORED=OFF \
+	-DSDLTTF_HARFBUZZ=OFF
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+SDL3_TTF_DEPENDENCIES += harfbuzz
+SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
