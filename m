Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C46FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC0240932;
	Fri, 22 Apr 2022 21:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eP8lkOUp7SBw; Fri, 22 Apr 2022 21:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4754090B;
	Fri, 22 Apr 2022 21:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7BEB1BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5F004198A
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kb2b3FAlWVEy for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:49:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4D66419B8
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j9u46+fC0I+LExf7dOIiyoT1V71lyj5KDKEcuzS5VsQ=; b=W5DM/YCPZeqs+HuWKxiKJ/pB5S
 Ss1XI8LgUf9ki88gMn60XetinLutUTQZtsP9mC2/cTEw9JuVo3YobN7X7jbPgcBDcp+0Xo6NlFPOj
 DLYWrDhLF9fnNllsc44wfBCYd8xTHEo0Oaql4Y+z9YVe6Hk9pketdM7icAPPHYe/u9hSm0ZPoFamH
 BZEqlfbI8Cdf3djerUfg4+GMVcBMOUxEIJy9xctvvT3aIo/QiZSacafZwDUBKmzhHIOIT79jY7zdu
 o/v2ohLjbfB3jkOvKP3gDUtzhOzJ2TJIGsqEKdmmHvuftPzUjHPdzqr2sNl+oAuWLHCB3L0v/DM8v
 86LHbEWw==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ni19m-0003SJ-Md; Fri, 22 Apr 2022 23:49:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e466bbcd;
 Fri, 22 Apr 2022 21:49:20 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 00:49:19 +0300
Message-Id: <20220422214919.367067-4-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220422214919.367067-1-aperez@igalia.com>
References: <20220422214919.367067-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/wlroots: enable vulkan renderer if
 possible
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the wlroots' Vulkan renderer if a suitable driver is being built.
Currently only Mesa provides Vulkan drivers, so gating the feature on
BR2_PACKAGE_MESA3D_VULKAN_DRIVER seems reasonable at the moment (and is
done at least by one other package already: pipewire).

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/wlroots.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index baa1edd9e1..4f14d20b11 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -23,8 +23,9 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Drenderers=gles2
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
 
+WLROOTS_RENDERERS = gles2
 WLROOTS_BACKENDS = libinput drm
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
@@ -35,6 +36,13 @@ else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
-WLROOTS_CONF_OPTS += -Dbackends=$(subst $(space),$(comma),$(strip $(WLROOTS_BACKENDS)))
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+WLROOTS_RENDERERS += vulkan
+WLROOTS_DEPENDENCIES += mesa3d
+endif
+
+WLROOTS_CONF_OPTS += \
+	-Dbackends=$(subst $(space),$(comma),$(strip $(WLROOTS_BACKENDS))) \
+	-Drenderers=$(subst $(space),$(comma),$(strip $(WLROOTS_RENDERERS)))
 
 $(eval $(meson-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
