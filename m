Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E8E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6CE80C72;
	Sun, 29 Dec 2024 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXbXqhroU-AW; Sun, 29 Dec 2024 14:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5351580CA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5351580CA4;
	Sun, 29 Dec 2024 14:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F17C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 115E24003A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFBFKDcipNfk for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FEA240906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FEA240906
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FEA240906
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AB54AE0006;
 Sun, 29 Dec 2024 14:55:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:27 +0100
Message-ID: <20241229145542.742168-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xivkGcp4u2wRMpj7b9ukCqv0uWxV4270sIQr3e+efD4=;
 b=ilMNWWbcbVzNdnSck1d3x39NiNw7HNOLMuGsZygZbHQyeqntHr/G6pfHVxCi/f2vSaUy5C
 rHnxgHYk2oOnXqxViYuSWgbK0vbIkSzvH5PvhSXkPoVuT/SrrzCJTAcnTw8V2M6BhZDGon
 wzRqgA7pclg+iIGWJNLV6ndx4IoTOf3vYT33yCx9Pc3pVsrNWGgWEkyAC70vCBF3iegyA6
 NtphX2SRg2/WXCiEPb1pDimy3YuNiruFRnU0Rmuzgd/8zE6TiL3eKtUSJVAgpl63kk/8od
 ZtfOutUU/gKTtlKZQRwqO4BvIDOpbUNBRS174i4MkkPFupTIDskW1X2/kbt4BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ilMNWWbc
Subject: [Buildroot] [PATCH 04/12] package/links: drop directfb support
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

As we're about to remove the DirectFB package, let's drop DirectFB
support in links.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/links/Config.in |  6 +++---
 package/links/links.mk  | 11 +----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/links/Config.in b/package/links/Config.in
index cc2389c9f1..e7fffaf130 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_LINKS
 
 config BR2_PACKAGE_LINKS_GRAPHICS
 	bool "use graphics"
-	depends on BR2_PACKAGE_GPM || BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_GPM || BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LINKS_GRAPHICS
 	  Framebuffer output requires GPM (console mouse).
 	  Otherwise links will be text-mode only.
 
-comment "links graphics needs GPM, DirectFB or X11"
-	depends on !BR2_PACKAGE_GPM && !BR2_PACKAGE_DIRECTFB && !BR2_PACKAGE_XORG7
+comment "links graphics needs GPM or X11"
+	depends on !BR2_PACKAGE_GPM && !BR2_PACKAGE_XORG7
 
 endif
diff --git a/package/links/links.mk b/package/links/links.mk
index 7ebe3af474..a2833c9514 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -11,6 +11,7 @@ LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPL-2.0+
 LINKS_LICENSE_FILES = COPYING
 LINKS_CPE_ID_VENDOR = twibright
+LINKS_CONF_OPTS = --without-directfb
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPTS += --enable-graphics
@@ -24,16 +25,6 @@ LINKS_DEPENDENCIES += xlib_libXt
 else
 LINKS_CONF_OPTS += --without-x
 endif
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-ifeq ($(BR2_STATIC_LIBS),y)
-LINKS_CONF_ENV += LIBS=-lstdc++
-endif
-LINKS_CONF_OPTS += --with-directfb
-LINKS_DEPENDENCIES += directfb
-else
-LINKS_CONF_OPTS += --without-directfb
-endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LINKS_CONF_OPTS += --with-libjpeg
 LINKS_DEPENDENCIES += jpeg
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
