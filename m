Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B5C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8337841B50;
	Sat,  3 Feb 2024 17:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8337841B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeTLXBegUWWv; Sat,  3 Feb 2024 17:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9961741B48;
	Sat,  3 Feb 2024 17:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9961741B48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A14FC1BF5E9
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 03:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E305400F8
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 03:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9zSiq9su20U for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 03:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.109.144.132;
 helo=mail.ott.net; envelope-from=stefan@ott.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F4E9400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4E9400EA
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F4E9400EA
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 03:01:45 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 529F24801023;
 Sat,  3 Feb 2024 04:01:40 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 7f6ea92d
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Sat, 3 Feb 2024 04:01:39 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id 18476979;
 Sat, 3 Feb 2024 03:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 04:01:37 +0100
Message-ID: <20240203030138.1934339-1-stefan@ott.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d000051f-9013-41e0-b72f-68cbd0652854@gmail.com>
References: <d000051f-9013-41e0-b72f-68cbd0652854@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1706929300; bh=/nTx+jw6kerSj5mPisqsPz03Hq3y+iLGEzh0VYJh3k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PtVYXPxC0dak40bNDIOg/SDqnAnbpWAhEXrLYJeLYJUVksTEzICgy53eRYxceXLJ8
 qOGy2eNv996BIAdJdGKPnNdpScGOgGRbidcaCYgTfxI2SigJmNKjW5g7F5XHnA7iAN
 /D86/FbRs+VQaHAAc+GcEcCJR81O99DSMV6ZYlf9mJEc/Y8/8TkXGL9jQXxqlU0tFR
 NMrO+ZvBGNz7a0/XChcam5Mu5tyRBM047ypUiufP9C80l2RAkRGVHfl7a5F890E8X7
 IbQ2XpHK3dwJYy2QF3bbMHYc4x8YiOfn0DQZtGZPxXDbNfA5c+4KF7rH6kDOLbVPPO
 wd2MZ/JPeUOHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=ott.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ott.net header.i=@ott.net header.a=rsa-sha256
 header.s=onbz5 header.b=PtVYXPxC
Subject: [Buildroot] [PATCH v4] package/sway: make systemd optional
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
Changes v3 -> v4:
  - Automatically enable tray support if systemd is enabled (suggested
    by Raphael Pavlidis)
Changes v2 -> v3:
  - Make BR2_PACKAGE_SWAY_SWAYBAR_TRAY depend on systemd and set
    sd-bus-provider=libsystemd if SWAY_SWAYBAR_TRAY is enabled
Changes v1 -> v2:
  - Automatically enable systemd integration for builds with systemd
    support (suggested by Thomas Petazzoni)
---
 package/sway/Config.in | 15 ++-------------
 package/sway/sway.mk   | 10 +++++-----
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 4f6d9fb215..d2fcdc6d70 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SWAY
 	bool "sway"
-	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
@@ -38,15 +37,6 @@ config BR2_PACKAGE_SWAY_SWAYBAR
 	help
 	  Enable support for swaybar
 
-if BR2_PACKAGE_SWAY_SWAYBAR
-
-config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
-	bool "swaybar tray"
-	help
-	  Enable support for swaybar tray
-
-endif # BR2_PACKAGE_SWAY_SWAYBAR
-
 config BR2_PACKAGE_SWAY_SWAYNAG
 	bool "swaynag"
 	help
@@ -54,9 +44,8 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
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
index 0aad9de712..089b533baf 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -8,13 +8,12 @@ SWAY_VERSION = 1.8.1
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
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 SWAY_CONF_OPTS += -Dxwayland=enabled
@@ -53,8 +52,9 @@ else
 SWAY_CONF_OPTS += -Dswaynag=false
 endif
 
-ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
-SWAY_CONF_OPTS += -Dtray=enabled
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SWAY_DEPENDENCIES += systemd
+SWAY_CONF_OPTS += -Dtray=enabled -Dsd-bus-provider=libsystemd
 else
 SWAY_CONF_OPTS += -Dtray=disabled
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
