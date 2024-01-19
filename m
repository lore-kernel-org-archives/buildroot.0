Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80258C47422
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 02:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B5B760F07;
	Fri, 19 Jan 2024 02:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5B760F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqZtaDHZt-hK; Fri, 19 Jan 2024 02:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644FF60EE3;
	Fri, 19 Jan 2024 02:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644FF60EE3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCAA51BF405
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 02:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5774424F3
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 02:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5774424F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSMMRc7m_Asj for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 02:11:36 +0000 (UTC)
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C7C3428AF
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 02:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C7C3428AF
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id E18FE480086F;
 Fri, 19 Jan 2024 03:11:29 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 0b9df2e7
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Fri, 19 Jan 2024 03:11:29 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id 41aee40e;
 Fri, 19 Jan 2024 02:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 03:11:23 +0100
Message-ID: <20240119021124.92277-1-stefan@ott.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118144823.5105c00f@windsurf>
References: <20240118144823.5105c00f@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1705630289; bh=N6OH9IQ1OYTTy/Q1FtJ6j/kTQZgPoO0eo2BPnJDaTyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k9lg5Jyk003d6+p/uct9w64EgdmC/w/XS+nwxMRYi16N2jumXtcJ6q4fxcZV6QgpA
 A5+ULgab3XwhPtQ8WRdxUXSf5OT2LexeGuWA4yRPMuyjseKc1S+C+P9Q0xQuuOaCzY
 AN5ksA7eCagWAmugyUqMhczuebWedkCR88YOTscGy1xBEkYXlm8SV6xUu/FJ+3mxP7
 0NzYTjAzjk73sgV5nA3ExiieMLVJ3misQvl5v20zu7dRKVDTj8c6m2MCPKeAlKfwKQ
 XqklhsGSlSn54PA7faHMju5gwZzyNbksb9s8g30HD/P3TiBW3ep+ajW5WwEcmN94hF
 cDYDfnHpLQStQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=k9lg5Jyk
Subject: [Buildroot] [PATCH v2] package/sway: make systemd optional
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
Changes v1 -> v2:
  - Automatically enable systemd integration for builds with systemd
    support (suggested by Thomas Petazzoni)
---
 package/sway/Config.in |  6 ++----
 package/sway/sway.mk   | 10 +++++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 4f6d9fb215..084ba830d7 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SWAY
 	bool "sway"
-	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
@@ -54,9 +53,8 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
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
index 0aad9de712..60492ae720 100644
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
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
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
