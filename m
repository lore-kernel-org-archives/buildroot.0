Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB4CAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89EBA41959;
	Wed, 10 Sep 2025 21:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ja-O1c464JM8; Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EE241938
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EE241938;
	Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D297C234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8F86615B1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kd0oWAwHiXHv for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E692614E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E692614E4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E692614E4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6F4C64E40B8D
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 46898606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24450102F29F4; 
 Wed, 10 Sep 2025 23:33:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:26 +0200
Message-ID: <20250910213241.1529448-19-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540017; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SwgQukGNpX8dvI9jYWq1y/qxfaFYZYlgfLycUeBiFos=;
 b=vEVjuiVduHFqS9qFhCBh+e88NKdqKS7T8QPahX9geBsEPQKQMH/iw84rWT/MNlDgAzbeyp
 rI0ejpSucKshNBJKXGwRDNmHqbzb+EKYWDNUj7drgDUCTj0dcWkOoZ1Zp2XaOXdaTuzjLu
 fm4FZz+Q8r7s5/jjAQR3ZfY2XG9QI3ZrD475Jv/M6S7M4S/hXlbCmJRVLS4xpMeYD9DNh7
 4BHS0ZsWmJ2P0Rxa4fPeEgB2CuazER6wVyiKVojCA9dfZY8iMz8TIpitZr+NVtQlpx/5y5
 BY3DDOy7gHIsrPAqZ+cX2dP2JxqdIkgjgeKu87w6TPIfhV7y/pAIzC2rIVNTjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=vEVjuiVd
Subject: [Buildroot] [PATCH 18/23] package/pinentry: remove gtk2 backend
 support
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

As we're about to remove libgtk2, we need to first remove support for
the gtk2 backend of pinentry, which this patch does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  7 +++++++
 package/pinentry/Config.in   | 22 ----------------------
 package/pinentry/pinentry.mk | 12 +++---------
 3 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e1fe008cf5..a1b321578b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_PINENTRY_GTK2
+	bool "gtk2 backend of pinentry has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the gtk2 backend of pinentry
+	  has been removed.
+
 config BR2_PACKAGE_NETSURF_GTK
 	bool "gtk backend of netsurf has been removed"
 	select BR2_LEGACY
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index bd5e3af5a1..dc8c9724d7 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -6,7 +6,6 @@ menuconfig BR2_PACKAGE_PINENTRY
 	select BR2_PACKAGE_LIBGPG_ERROR
 	# At least one backend is needed to avoid build breakage
 	select BR2_PACKAGE_PINENTRY_NCURSES if \
-		!BR2_PACKAGE_PINENTRY_GTK2 && \
 		!BR2_PACKAGE_PINENTRY_QT5
 	help
 	  A collection of simple PIN or pass-phrase entry dialogs
@@ -46,27 +45,6 @@ config BR2_PACKAGE_PINENTRY_NCURSES
 	help
 	  The pinentry-ncurses tool
 
-config BR2_PACKAGE_PINENTRY_GTK2
-	bool "pinentry-gtk2"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
-	select BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  The pinentry-gtk2 tool
-
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_PINENTRY_QT5
 	bool "pinentry-qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 7482a93d02..ef17df7657 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -13,10 +13,12 @@ PINENTRY_DEPENDENCIES = \
 	libassuan libgpg-error \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	host-pkgconf
+# --disable-libcap to avoid PAM dependency
 PINENTRY_CONF_OPTS += \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
-	--without-libcap       # requires PAM
+	--without-libcap \
+	--disable-pinentry-gtk2
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
@@ -58,14 +60,6 @@ else
 PINENTRY_CONF_OPTS += --disable-ncurses
 endif
 
-# pinentry-gtk2 backend
-ifeq ($(BR2_PACKAGE_PINENTRY_GTK2),y)
-PINENTRY_CONF_OPTS += --enable-pinentry-gtk2
-PINENTRY_DEPENDENCIES += libgtk2
-else
-PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
-endif
-
 # pinentry-qt5 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_QT5),y)
 PINENTRY_CONF_OPTS += --enable-pinentry-qt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
