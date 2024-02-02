Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC23C48286
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 02:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3ACF42ECF;
	Fri,  2 Feb 2024 02:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3ACF42ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROW5glPvmwvV; Fri,  2 Feb 2024 02:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D191421B6;
	Fri,  2 Feb 2024 02:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D191421B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6797D1BF423
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 02:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C159401C2
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 02:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C159401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtPUfLmNs3bT for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 02:10:54 +0000 (UTC)
X-Greylist: delayed 461 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 02 Feb 2024 02:10:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4760840133
Received: from mail.ott.net (mail.ott.net [IPv6:2001:1620:2092:1::13:1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4760840133
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 02:10:53 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 391B3480100E;
 Fri,  2 Feb 2024 03:03:09 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id cb6164ce
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Fri, 2 Feb 2024 03:03:08 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id 90d68f84;
 Fri, 2 Feb 2024 02:03:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 03:02:57 +0100
Message-ID: <20240202020258.600562-1-stefan@ott.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1706839389; bh=d119vkgxtHUwU2pJENA/oRFXD1rmfaHAdUcjsBNTeNw=;
 h=From:To:Cc:Subject:Date:From;
 b=v5IR9zES9PSzXEk8sKLoD9oPrMnw83UxblW0TjoubC9KlQ535PxGTsFw1oQA4TN8I
 i3Mjspj7vyE+SA7wAHYPcsAfH52Rc6CXWGF+z6gb9xf/ccjRdrrV/UogDXfkLwVdiX
 HA/A+HF3KAA/n0VMC+IkvOzIEUnUeyFV++ZUOD2iKizk2ebaMYVq32DYdpZwwCKUBX
 KpaSOofA+hyVTE5qws4XoPGvGyjLSuDOUAEYUNUSPJcWsffAmDoHx8w9/pgr1n2RLf
 UM4QPBXpVIwGNBbREKgs9150RPKTJzx/dxj9J7qhEnuVIqkKJI49vqfUVCahI4G7WB
 b2+r7DQlygvnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=v5IR9zES
Subject: [Buildroot] [PATCH v3] package/sway: make systemd optional
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
Changes v2 -> v3:
  - Make BR2_PACKAGE_SWAY_SWAYBAR_TRAY depend on systemd and set
    sd-bus-provider=libsystemd if SWAY_SWAYBAR_TRAY is enabled
Changes v1 -> v2:
  - Automatically enable systemd integration for builds with systemd
    support (suggested by Thomas Petazzoni)
---
 package/sway/Config.in | 10 ++++++----
 package/sway/sway.mk   |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 4f6d9fb215..f11c473fa8 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SWAY
 	bool "sway"
-	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
@@ -42,9 +41,13 @@ if BR2_PACKAGE_SWAY_SWAYBAR
 
 config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
 	bool "swaybar tray"
+	depends on BR2_PACKAGE_SYSTEMD
 	help
 	  Enable support for swaybar tray
 
+comment "swaybar tray needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
+
 endif # BR2_PACKAGE_SWAY_SWAYBAR
 
 config BR2_PACKAGE_SWAY_SWAYNAG
@@ -54,9 +57,8 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
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
index 0aad9de712..87a01002f0 100644
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
@@ -54,7 +53,8 @@ SWAY_CONF_OPTS += -Dswaynag=false
 endif
 
 ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
-SWAY_CONF_OPTS += -Dtray=enabled
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
