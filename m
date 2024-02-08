Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03012C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 357B641C3A;
	Thu,  8 Feb 2024 09:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FO_T7iL4vmwt; Thu,  8 Feb 2024 09:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13FA841BA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13FA841BA1;
	Thu,  8 Feb 2024 09:55:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2D21BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1815041B29
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aslEVkf_JXpA for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DE89403B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE89403B9
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE89403B9
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:55:36 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rY181-00F8hL-Fs; Thu, 08 Feb 2024 10:55:33 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1fa70103;
 Thu, 8 Feb 2024 09:55:31 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 11:55:29 +0200
Message-ID: <20240208095531.99049-3-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5TApq4vd6e1ppRwHOazHdGESszB4G4PuYBQKiMJJTzg=; b=YkH8PmsdLpn6msy3wt3job4wH6
 L3IsTU9udQOUWPMxnVH0/x6WDk9j1ozhnDMWCP5OJa3oufkou9m56VauebWnA8s9ovppyrxxt+SMi
 JHDCDKW19mU5sMCnM5g8DwqlkvaSVyHVcj2LS1/zGYtPGkcoe+aUU0BFu+Gy7dIO53Lr+B6Q13uqy
 ei+xtcrpE7GjTkqxWPMZb4KdBsz9b4CztCAqRVWVHPh78z6l6rzVjS2zjsyxHnTgsxlb+bBJ+tDPy
 SNvXX1fNjKlpF+0arcduyMwHHyu5dJcJ8wjTyxCn8f3uPVHrRWDIev5vuRDlnp38Syr4C1ThRboi1
 h+aZ+1KA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=YkH8Pmsd
Subject: [Buildroot] [PATCH 2/3] package/cog: depend on wpebackend-fdo only
 if needed
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make the Cog headless platform plug-in selectable, allowing to configure
the build without any plug-in at all. When all plug-ins are disabled,
Cog does not require wpebackend-fdo at build time, and it is still
able to use its built-in "fallback" support to load other WPE backends
like wpebackend-rdk.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/Config.in | 28 ++++++++++++++++++++++++++--
 package/cog/cog.mk    | 13 ++++++++++---
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index d2a910f9b89..d706b045b15 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -19,6 +19,10 @@ config BR2_PACKAGE_COG
 
 if BR2_PACKAGE_COG
 
+config BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO
+	bool
+	default n
+
 config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	string "home uri"
 	default "https://wpewebkit.org"
@@ -30,6 +34,8 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 config BR2_PACKAGE_COG_PLATFORM_FDO
 	bool "Wayland backend"
 	default y
+	depends on BR2_PACKAGE_WPEBACKEND_FDO
+	select BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
@@ -43,6 +49,8 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	depends on BR2_PACKAGE_WPEBACKEND_FDO
+	select BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	help
@@ -50,16 +58,32 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	  with video drivers that support kernel mode-setting (KMS)
 	  via the DRM user-space API.
 
+config BR2_PACKAGE_COG_PLATFORM_HEADLESS
+	bool "Headless backend"
+	depends on BR2_PACKAGE_WPEBACKEND_FDO
+	select BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO
+	help
+	  Enable the headless platform backend.
+
 config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
 	bool "expose system D-Bus control interface"
 	help
 	  Expose remote control interface on system bus
 
-comment "DRM platform needs EGL and GBM"
+comment "Headless platform needs wpebackend-fdo"
+	depends on \
+		!BR2_PACKAGE_WPEBACKEND_FDO
+
+comment "DRM platform needs EGL, GBM, wpebackend-fdo"
 	depends on \
 		!BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGBM || \
 		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF || \
-		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT || \
+		!BR2_PACKAGE_WPEBACKEND_FDO
+
+comment "Wayland platform needs wpebackend-fdo"
+	depends on \
+		!BR2_PACKAGE_WPEBACKEND_FDO
 
 endif
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index e96909f7796..8fc50de56f1 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,7 +8,7 @@ COG_VERSION = 0.18.2
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
+COG_DEPENDENCIES = dbus wpewebkit wayland
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
@@ -19,8 +19,6 @@ COG_CONF_OPTS = \
 	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
 	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
 
-COG_PLATFORMS_LIST = headless
-
 ifeq ($(BR2_PACKAGE_WESTON),y)
 COG_CONF_OPTS += -Dwayland_weston_direct_display=true
 COG_DEPENDENCIES += weston
@@ -28,6 +26,11 @@ else
 COG_CONF_OPTS += -Dwayland_weston_direct_display=false
 endif
 
+ifeq ($(BR2_PACKAGE_COG_PLATFORM_HEADLESS),y)
+COG_PLATFORMS_LIST += headless
+COG_DEPENDENCIES += wpebackend-fdo
+endif
+
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
 COG_PLATFORMS_LIST += wayland
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
@@ -48,4 +51,8 @@ ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
 COG_DEPENDENCIES += libmanette
 endif
 
+ifeq ($(BR2_PACKAGE_COG_NEEDS_WPEBACKEND_FDO),y)
+COG_DEPENDENCIES += wpebackend-fdo
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
