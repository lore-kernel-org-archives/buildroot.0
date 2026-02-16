Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64ABE63F3F
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D3F60B2B;
	Mon, 16 Feb 2026 09:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2f3RnQNHuKlU; Mon, 16 Feb 2026 09:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8115160AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771233039;
	bh=UldJ7zXiqBKCHUbU7kke1SUAyEnlVAKc1CkHBj1eTok=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZPt9ck0omSetyg+ZRfj+dWs2pBi5CDie4cDzU0aADXVCZogkJm0vEiOw+TktZMAF
	 m6gdhPa23QtjfKwuUozAwyjeutXnsGzvucGY5QOtOEaHuwngOUXXbq1mysDsW3RLwP
	 m3tYvAnMENLdX14XJzPE8vcjAhNHd5rR0S6L+smoSr6cFCmWDkJ6sPDenqfG+GBsAe
	 UWJpPGAyOwQom6caoEhIr421J/OznMbPwyrBPLDK0FTxSSfxp6PvjHKac04PBrO4kW
	 HcUeuUTU8iuG0BQjeEqcwIv5qbDQ4hqolSg1QraodLUuD+NTg3YugU7bxI7GCI/DgJ
	 9cGeRPko8zQ0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8115160AEF;
	Mon, 16 Feb 2026 09:10:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA84B35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7ADA405FD
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGiQEEhdMeHr for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:10:37 +0000 (UTC)
X-Greylist: delayed 301 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 09:10:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD48D40368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD48D40368
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.119.228.97;
 helo=smtprelay07.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.97])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD48D40368
 for <buildroot@busybox.net>; Mon, 16 Feb 2026 09:10:36 +0000 (UTC)
Received: from [80.128.8.127] (helo=mail.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1vruZP-000000007pB-3DsM
 for buildroot@busybox.net; Mon, 16 Feb 2026 10:07:07 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 16 Feb
 2026 10:07:05 +0100
Received: from go-sys.de (192.168.1.113) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Mon, 16 Feb 2026 10:07:05 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Mon, 16 Feb 2026 10:07:03 +0100
Message-ID: <20260216090703.7214-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] SDL3_ttf: Add new package SDL3_fft
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

SDL3_ttf is a TrueType font library. It allows you to
use TrueType fonts in your SDL3 applications.

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl3_ttf/Config.in     |  9 +++++++++
 package/sdl3_ttf/sdl3_ttf.hash |  3 +++
 package/sdl3_ttf/sdl3_ttf.mk   | 25 +++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/sdl3_ttf/Config.in
 create mode 100644 package/sdl3_ttf/sdl3_ttf.hash
 create mode 100644 package/sdl3_ttf/sdl3_ttf.mk

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
+	  SDL3_ttf is a TrueType font library. It allows you to
+	  use TrueType fonts in your SDL3 applications.
+
+	  http://www.libsdl.org/projects/SDL_ttf/
diff --git a/package/sdl3_ttf/sdl3_ttf.hash b/package/sdl3_ttf/sdl3_ttf.hash
new file mode 100644
index 0000000000..b8164194dd
--- /dev/null
+++ b/package/sdl3_ttf/sdl3_ttf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  fab27d078842c458bedcce32afaf17da7d21da7e873d0d8deadd10edc440e96b  SDL3_ttf-3.1.0.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
new file mode 100644
index 0000000000..e995f2bc7d
--- /dev/null
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sdl3_ttf
+#
+################################################################################
+
+SDL3_TTF_VERSION = 3.1.0
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
