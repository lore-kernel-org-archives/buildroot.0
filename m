Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E6FCD3420
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 10:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490574025F;
	Tue,  3 Sep 2024 10:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIZOIPEuTPbk; Tue,  3 Sep 2024 10:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1466402A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1466402A6;
	Tue,  3 Sep 2024 10:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A49461BF263
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 10:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9212260658
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 10:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoeQhSelOo9D for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 10:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A4056063D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4056063D
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A4056063D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 10:51:10 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slR7r-008vzw-V7; Tue, 03 Sep 2024 12:51:07 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 015a38c7;
 Tue, 3 Sep 2024 10:51:06 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 13:51:04 +0300
Message-ID: <20240903105105.3285178-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z9l4Z2xZu16kzj4O5geL/J/+0XGrnJguLZ0cWIlob00=; b=jZ328q88d1RRQEZgOfPYn8KJs2
 wdnqJ+Qx8yXbLIdIMhbUbj6IT8LUflvDzhV2aldvlzFt5s3dKFAtclViVyJScHMefytdezSKTlzHb
 zRxgS8Hg7aHyRMB0jTh/rTRWgk0zs3WP9gEo7SyVdlp4nVKNUsguxG+cYt+5x2pRbVPlcmFNGVj8b
 X2dFSCq9VMERAtRhIYLKaDL/M+513tgdZYXiv/x4TE2H7VPsG6Qk5TQTrJjBFrpLmrhGsboWt/kMh
 o3pBTHHUB3EFutNFWAfWQKgveXEffKBr2M0DdsM9vEhqG8TvUQ7LD8uEnpLWfE8kzy3UA0TIZknjJ
 AhVLKiFQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=jZ328q88
Subject: [Buildroot] [PATCH] package/webkitgtk: add option to enable
 MiniBrowser
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

Add an option to enable building and installing the MiniBrowser program
included in the WebKitGTK source tree. This may be handy now that Midori
will no longer be packaged in Builroot. A post-install hook installs a
symbolic link to it into /usr/bin for convenience.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    |  5 +++++
 package/webkitgtk/webkitgtk.mk | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 8ee90dda1c..e6ab405cd5 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -139,4 +139,9 @@ config BR2_PACKAGE_WEBKITGTK_WEBDRIVER
 	  Enable support for WebDriver. This will build and install the
 	  WebKitWebDriver program in the target.
 
+config BR2_PACKAGE_WEBKITGTK_MINIBROWSER
+	bool "MiniBrowser"
+	help
+	  Example browser application included with WebKitGTK.
+
 endif
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9aaff5da8f..d29c533e1a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -61,6 +61,16 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_MINIBROWSER),y)
+define WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
+	ln -sf ../libexec/webkit2gtk-4.1/MiniBrowser $(TARGET_DIR)/usr/bin/MiniBrowser
+endef
+WEBKITGTK_POST_INSTALL_TARGET_HOOKS += WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
+WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=ON
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
 WEBKITGTK_DEPENDENCIES += lcms2
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
