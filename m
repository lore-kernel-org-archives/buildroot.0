Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A715EC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 19:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCBF60E8D;
	Thu, 27 Jun 2024 19:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REOIjg_C8ibC; Thu, 27 Jun 2024 19:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD30160E6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD30160E6A;
	Thu, 27 Jun 2024 19:33:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A137D1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C88180F40
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2u49TA-SoJW for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70FE783F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FE783F36
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70FE783F36
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMusD-008G4x-QM; Thu, 27 Jun 2024 21:33:37 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cc748b0f;
 Thu, 27 Jun 2024 19:33:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 22:33:30 +0300
Message-ID: <20240627193335.4069574-3-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
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
 bh=G+C0RUYbPWdT/x7W3KsI1os98XBP2FlIbEzo76PSqa4=; b=EDmfns6E38hJwPXbE1kx4wnFpe
 yVOUaN45JUOwYV4h55j6YxJK/UibkBi2WgmRG/4uMLwgtbRteU8/lghamtIN7ONcRxflWg47GhwvJ
 feu2VCManlXIpGtVQlc5x1mbw18hXnL7NI6vQvphBAAgvtEIMr9ssv7pt4IF1F5CkCEodDctDYsJu
 ae65QLlW5bZjZmT1fUTuEY4iWp/y80KB3jcFwUsDIMWA33XOYHqw9R2q6ojIdOlqE5+7b/akcG7EK
 Dt43lu2GGeMtTN+ZpBp+R524tBHu8dNbwKKA6221QKGCucJ3AnsQiV7bixciJcH6CQV3wahoxvlMX
 5OQEj2eg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=EDmfns6E
Subject: [Buildroot] [PATCH v2 2/4] package/cog: depend on wpebackend-fdo
 only if needed
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

---
v1 -> v2:
- Unchanged.

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
index 7f680bb7005..166f095118b 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,7 +8,7 @@ COG_VERSION = 0.18.4
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
