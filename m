Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3133ACA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C91614E9;
	Wed, 10 Sep 2025 21:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iV--umeL92RY; Wed, 10 Sep 2025 21:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50F3610CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50F3610CB;
	Wed, 10 Sep 2025 21:34:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B62E234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8177B843BA
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2eN3oULhDvF for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72D8D8420E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D8D8420E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72D8D8420E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AD15D1A0D98
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 85022606D4;
 Wed, 10 Sep 2025 21:33:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C043102F2A68; 
 Wed, 10 Sep 2025 23:33:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.knight@collins.com>
Date: Wed, 10 Sep 2025 23:32:30 +0200
Message-ID: <20250910213241.1529448-23-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540036; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=oOZZQ03bwaE2g9nbnKjV0aV5yvygboJYxSlV0vfCfzs=;
 b=SoRJ+GfRUsDzAvag3UqWd8MV47LMHC3ngMWpN72/oGp8f/pbF9UlffRgR1VZCPS3GllCXD
 k8f42E6EO5Odb8jN+xGezCeTl2s1ZtvIf6dHM1cjBz94R1dXSMDqhiyAQlb30pqFSF0NAL
 /3w6u7OOwPhj4jh/iMXy4/uEaPHoUFIh5Oip8IjvTiHulrxQ1uG3hG6lGEBJdr6Aa99ECJ
 /s5Iv9aiI9+Mcs7ahJf5DyYF4xlI0dCGeWytqDWtTNZKHaOmDf9Ulx1/l+QZazI6MCS74H
 76J34eeuR14/XrVdbaT0y9e++ZSrIgRzObhpcnE7lb1nrUxMuTDIH1F60lr70Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SoRJ+GfR
Subject: [Buildroot] [PATCH 22/23] package/yad: drop support for gtk2
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

As we're about to remove libgtk2, we need to first drop support for
gtk2 in yad. It continues to support gtk3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yad/Config.in | 8 +++-----
 package/yad/yad.mk    | 3 ---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/yad/Config.in b/package/yad/Config.in
index 300525ee3c..4a140f63d7 100644
--- a/package/yad/Config.in
+++ b/package/yad/Config.in
@@ -1,13 +1,11 @@
 config BR2_PACKAGE_YAD
 	bool "yad"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
+	depends on BR2_PACKAGE_LIBGTK3_X11
 	help
 	  YAD (yet another dialog) is a tool for create graphical
 	  dialogs from shell scripts.
 
 	  http://sourceforge.net/projects/yad-dialog/
 
-comment "yad needs libgtk2 or libgtk3 w/ X11 backend"
-	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3_X11
+comment "yad needs libgtk3 w/ X11 backend"
+	depends on !BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index 15788efac0..fdddb6523d 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -16,9 +16,6 @@ YAD_CONF_OPTS = --enable-html=no
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 YAD_DEPENDENCIES += libgtk3
 YAD_CONF_OPTS += --with-gtk=gtk3
-else
-YAD_DEPENDENCIES += libgtk2
-YAD_CONF_OPTS += --with-gtk=gtk2
 endif
 
 $(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
