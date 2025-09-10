Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DFBCAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0E54193C;
	Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kl5QX7rgngT5; Wed, 10 Sep 2025 21:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E174194C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E174194C;
	Wed, 10 Sep 2025 21:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0C7234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF35843B9
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2wFMbP9kZpL for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F8638420E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8638420E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F8638420E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6EEE2C6B3BE;
 Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44815606D4;
 Wed, 10 Sep 2025 21:33:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51ECC102F29D6; 
 Wed, 10 Sep 2025 23:33:32 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 23:32:23 +0200
Message-ID: <20250910213241.1529448-16-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540012; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wELc7rx6AkYizu/+t+2AOB8XqJ6ZT7kRnlTZrC+U3FI=;
 b=kgDP3wZYOEEpl2ckVajzJ62+6Hc1mR9HHok3ng7xuwjh9KESEpnh0UTJeIIShku1KuGoZR
 oWuZA7nyOkyHKS6Wug5juBrBuHXA8fEo0a03Ss5ZbCO5LepiKLHv0CKQP76ygwCdOtp8xb
 ZExbyihB9xrCjbI6dHXCe2qgUReHYfeBlKxP+hEgI8FIVt8zRcKi6b0oxrTFuH6i9g9Ez4
 0XLk79uO/zwOhA5m9s+urEfPyKqtkJ6h8CuO3R3+KHQ8SOOgAdDYlQVH2q9S8jw55Y0oUK
 iZ0XXEIhej26qUPYWH7lSe3KoPO8i+pkinrU6GjjWPRUef/3sJpq0fo1l7aqMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=kgDP3wZY
Subject: [Buildroot] [PATCH 15/23] package/netsurf: drop support for gtk
 backend
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the libgtk2 package, let's drop the gtk
backend from netsurf. It is worth mentioning that the gtk3 backend
remains in place as an alternative.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           | 8 ++++++++
 package/netsurf/Config.in  | 6 ------
 package/netsurf/netsurf.mk | 7 -------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5c3b289688..e1fe008cf5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_NETSURF_GTK
+	bool "gtk backend of netsurf has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the gtk backend of netsurf
+	  has been removed. The gtk3 backend can be used instead for
+	  example.
+
 config BR2_PACKAGE_METACITY
 	bool "metacity has been removed"
 	select BR2_LEGACY
diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 394befcf28..dd37d876f6 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -40,12 +40,6 @@ config BR2_PACKAGE_NETSURF_SDL
 	help
 	  Select SDL 1.2 frontend.
 
-config BR2_PACKAGE_NETSURF_GTK
-	bool "gtk2 frontend"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  Select GTK+ 2 frontend.
-
 config BR2_PACKAGE_NETSURF_GTK3
 	bool "gtk3 frontend"
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 574c1423df..383cd8ab9d 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -25,17 +25,10 @@ define NETSURF_DUKTAPE_CONFIGURE_CMDS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
-NETSURF_DEPENDENCIES += libgtk2
-NETSURF_FRONTEND = gtk2
-endif
-
 ifeq ($(BR2_PACKAGE_NETSURF_GTK3),y)
 NETSURF_DEPENDENCIES += libgtk3
 NETSURF_FRONTEND = gtk3
-endif
 
-ifeq ($(BR2_PACKAGE_NETSURF_GTK)$(BR2_PACKAGE_NETSURF_GTK3),y)
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 NETSURF_DEPENDENCIES += librsvg
 define NETSURF_SVG_CONFIGURE_CMDS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
