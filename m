Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E333C4725D
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 00:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AEC41EF6;
	Thu, 18 Jan 2024 00:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AEC41EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zc4SkZwuxWRm; Thu, 18 Jan 2024 00:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC0441DA8;
	Thu, 18 Jan 2024 00:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC0441DA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51AD91BF969
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 00:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A53881973
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 00:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A53881973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wr61-HG5Ce2e for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 00:38:38 +0000 (UTC)
X-Greylist: delayed 578 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 18 Jan 2024 00:38:37 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A20DA8193E
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A20DA8193E
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 00:38:37 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 28E164803040;
 Thu, 18 Jan 2024 01:28:50 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 6c085931
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Thu, 18 Jan 2024 01:28:49 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id a78813f9;
 Thu, 18 Jan 2024 00:28:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 01:28:34 +0100
Message-ID: <20240118002834.76578-1-stefan@ott.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1705537730; bh=t8RK91T22NjuTMhGcf7sFLdhZgaWP5RQx5nTIxfoDPs=;
 h=From:To:Cc:Subject:Date:From;
 b=KXzsERqrf1S8Nmy6aEsbG+NOQbMCtavcg5Gt2OFOtYPJHIgYcAuSt2QbEk+XrLTvx
 8DWROmYeFHVSq+aAA8qpGRBRQLSDUh3BgakWkM1m8yFuYNJqjr4MeEeQRGm5XF8zRp
 4vdjYlK0no85LMIGwseiw13pqe0rP7zFVAZFPEYCQ3hRF7Zf9E5Yhn1cJ2BDdt4sUy
 WKoFYPYCdPKSRXDFLuvRBJ9pca4KFy/HYaKnq5Wvg8pbSnh5L7A3301mBQaHIRlgDy
 YyPQoxtTbal7022kecW4dq/WQA3nfsLnv5qSr4Jm7Bl6IG8KBK+rutNuS0Rxxmap8y
 ZxRLJzAJK1QOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=KXzsERqr
Subject: [Buildroot] [PATCH] package/sway: make systemd optional
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
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sway works perfectly fine without it.

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 package/sway/Config.in | 22 ++++++++++++++++++----
 package/sway/sway.mk   | 10 +++++++---
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 4f6d9fb215..8d79d3ca6a 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SWAY
 	bool "sway"
-	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
@@ -30,6 +29,22 @@ config BR2_PACKAGE_SWAY
 
 if BR2_PACKAGE_SWAY
 
+choice BR2_PACKAGE_SWAY_SD_BUS_PROVIDER
+	prompt "Provider of the sd-bus library"
+	default BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_AUTO
+
+config BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_AUTO
+	bool "auto"
+
+config BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_LIBSYSTEMD
+	bool "libsystemd"
+	depends on BR2_PACKAGE_SYSTEMD
+
+comment "The systemd backend needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
+endchoice
+
+
 config BR2_PACKAGE_SWAY_SWAYBAR
 	bool "swaybar"
 	select BR2_PACKAGE_DEJAVU
@@ -54,9 +69,8 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
 endif # BR2_PACKAGE_SWAY
 
-comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
-	depends on !BR2_PACKAGE_SYSTEMD || \
-		!BR2_PACKAGE_HAS_UDEV || \
+comment "sway needs udev, EGL w/ Wayland backend and OpenGL ES support"
+	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		!BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 0aad9de712..cce3b72d14 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -8,13 +8,17 @@ SWAY_VERSION = 1.8.1
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
-SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
+SWAY_DEPENDENCIES = host-pkgconf wlroots json-c pcre cairo pango
 SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dman-pages=disabled \
-	-Dsd-bus-provider=libsystemd
+	-Dman-pages=disabled
+
+ifeq ($(BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_LIBSYSTEMD),y)
+SWAY_CONF_OPTS += -Dsd-bus-provider=libsystemd
+SWAY_DEPENDENCIES += systemd
+endif
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 SWAY_CONF_OPTS += -Dxwayland=enabled
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
