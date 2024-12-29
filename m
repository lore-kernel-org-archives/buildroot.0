Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D82CE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0A980C9F;
	Sun, 29 Dec 2024 14:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fGBqNKtArsA; Sun, 29 Dec 2024 14:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1868D80F0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1868D80F0D;
	Sun, 29 Dec 2024 14:56:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72637C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 503C260852
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaR8UhXWWg47 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1AC46083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1AC46083D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1AC46083D
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D6E22E0002;
 Sun, 29 Dec 2024 14:55:46 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 29 Dec 2024 15:55:29 +0100
Message-ID: <20241229145542.742168-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BsbmFHwv7IKZelId58ZdQsav15Aaa6wsUALeETZZDM=;
 b=B4aNNBr8DyLMNIkvZJu72J/pVf0MRIOIhniXPVTresdiDEf8j/mIghjgbo3rp2fZuAaiJs
 4k6laBaRTYjyL2qiKku1jFB/G/O7icSuGoh7w8kzMo7g+vrg6JAV6+CADgzxlZSeXDkFBJ
 KpCkqT95YhOrp/4uvPYq6gHH6b8xBjf5EDXe5LGSDeVT/MC/rZNZTPTIqTWZhHLBZpLZc6
 jWaRV7kM/ddwZgFYh0EdzXV+5CgCWN14qlIVLiHtyxj42qB0nM08RqhMYnYpw0XbKB1AOv
 vCgXOR6uDsgeZLpi6pR9nC/Cc5t69rKG1h9BW9/qnJivkxOaXeJMps7hUGz1kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B4aNNBr8
Subject: [Buildroot] [PATCH 06/12] package/qt5/qt5base: drop directfb
 graphics backend
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the DirectFB package, let's drop the DirectFB
graphics backend in Qt5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               | 7 +++++++
 package/qt5/qt5base/Config.in  | 8 --------
 package/qt5/qt5base/qt5base.mk | 5 ++---
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 124bb1ae44..76d656846e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_QT5BASE_DIRECTFB
+	bool "qt5base directfb support removed"
+	select BR2_LEGACY
+	help
+	  The directfb support from qt5base is no longer available, as
+	  directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "gstreamer directfb plugin removed"
 	select BR2_LEGACY
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 16a17dfc27..c45b8c1591 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -128,7 +128,6 @@ config BR2_PACKAGE_QT5BASE_GUI
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT5BASE_LINUXFB if \
-	       !BR2_PACKAGE_QT5BASE_DIRECTFB && \
 	       !BR2_PACKAGE_QT5BASE_XCB && \
 	       !BR2_PACKAGE_QT5BASE_EGLFS
 	help
@@ -195,13 +194,6 @@ config BR2_PACKAGE_QT5BASE_VULKAN
 config BR2_PACKAGE_QT5BASE_LINUXFB
 	bool "linuxfb support"
 
-config BR2_PACKAGE_QT5BASE_DIRECTFB
-	bool "directfb support"
-	depends on BR2_PACKAGE_DIRECTFB
-
-comment "directfb backend available if directfb is enabled"
-	depends on !BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_QT5BASE_XCB
 	bool "X.org XCB support"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3fd5d30251..add460c257 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -40,7 +40,8 @@ QT5BASE_CONFIGURE_OPTS += \
 	-system-pcre \
 	-no-pch \
 	-shared \
-	-no-feature-relocatable
+	-no-feature-relocatable \
+	-no-directfb
 
 # starting from version 5.9.0, -optimize-debug is enabled by default
 # for debug builds and it overrides -O* with -Og which is not what we
@@ -173,8 +174,6 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widge
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
 QT5BASE_CONFIGURE_OPTS += -xkbcommon
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
