Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE58CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 15:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD800418BE;
	Thu,  4 Apr 2024 15:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mv3l9jvPPZ4H; Thu,  4 Apr 2024 15:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C34D94190D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34D94190D;
	Thu,  4 Apr 2024 15:34:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C96DE1BF41F
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B50C4418BE
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTpRh3Q2dVos for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 15:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2433417ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2433417ED
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2433417ED
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 15:34:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87BA4FF803;
 Thu,  4 Apr 2024 15:34:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rsP6t-00E0K1-2R;
 Thu, 04 Apr 2024 17:34:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 17:34:37 +0200
Message-Id: <20240404153438.3337807-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404153438.3337807-1-peter@korsgaard.com>
References: <20240404153438.3337807-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] package/tiff: explicitly disable jbig
 support for host and target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_TIFF_JBIG did actually not do anything, as no explicit
--enable-jbig was passed to configure and there is no libjbig in Buildroot,
so drop it and instead explicitly disable jbig support.

Also add --disable-jbig for the host build, which was missed when host
support was added in commit 91b16fbbf9db (tiff: add host variant).

As the TIFF_JBIG option was a noop, do not add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/Config.in | 4 ----
 package/tiff/tiff.mk   | 6 ++----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d1004d6668..d357d08406 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -63,10 +63,6 @@ config BR2_PACKAGE_TIFF_OLD_JPEG
 	bool "Old JPEG decompression"
 	default y
 
-config BR2_PACKAGE_TIFF_JBIG
-	bool "JBIG compression"
-	default y
-
 config BR2_PACKAGE_TIFF_UTILITIES
 	bool "tiff utilities"
 	help
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8ec53d4fe1..0e5e0dd48a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -17,6 +17,7 @@ TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-lerc \
+	--disable-jbig \
 	--disable-tests \
 	--disable-webp
 
@@ -28,6 +29,7 @@ HOST_TIFF_CONF_OPTS = \
 	--disable-lerc \
 	--disable-libdeflate \
 	--disable-lzma \
+	--disable-jbig \
 	--disable-jpeg \
 	--disable-tests \
 	--disable-webp \
@@ -101,10 +103,6 @@ ifneq ($(BR2_PACKAGE_TIFF_OLD_JPEG),y)
 TIFF_CONF_OPTS += --disable-old-jpeg
 endif
 
-ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
-TIFF_CONF_OPTS += --disable-jbig
-endif
-
 ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
 TIFF_CONF_OPTS += --enable-tools
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
