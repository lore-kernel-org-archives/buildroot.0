Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C86CE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D798380C35;
	Sun, 29 Dec 2024 14:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6WjlJ6EFJFr; Sun, 29 Dec 2024 14:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A1580C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A1580C38;
	Sun, 29 Dec 2024 14:55:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32ACB72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2024C4003A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X02Imdh5-VQj for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0ECA0408D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ECA0408D4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ECA0408D4
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4B712E0007;
 Sun, 29 Dec 2024 14:55:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:28 +0100
Message-ID: <20241229145542.742168-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPJg7uIisrbOLydZt8vBt9ozAyOVdSI1C3rXl1nL5Fo=;
 b=LFYbLQq2wAylZ6wJAnPqOWBrNnyrA34v1absUgsQawKfeP90NRB6MuEp6vC0gsmdQMPQGO
 vNjy4EFdqkTrAoVSJOCdhsnmyv7VLVC7xEflPPUQAgVFdrL7G5Rdw37LRKa/gby4c2sJhX
 wT7t2y2DWjMtIPXuxZF/7rlBhGASnSymEkXBbPtayXp4IqJVIMDaHOy3+EoAuQTX6dvZ0r
 W7k7Q+7KtAbNnAtiNZZ55Y3XtAgLA1LIm8UB5B1rxO5eGPjNiKxWxZyQBPq6EsaMePKTd0
 zke1gp7GEFwrWmgMfy7hLS3tEyeVBurD8Ouzh3Ht965QdWFBaDydraG1q1CpEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LFYbLQq2
Subject: [Buildroot] [PATCH 05/12] package/gstreamer1/gst1-plugins-bad: drop
 directfb plugin
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

As we're about to remove the DirectFB package, let's drop the
GStreamer DirectFB plugin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                       |  7 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in          |  5 -----
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk    | 10 ++--------
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c4c52c64d0..124bb1ae44 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
+	bool "gstreamer directfb plugin removed"
+	select BR2_LEGACY
+	help
+	  The directfb plugin from GStreamer is no longer supported,
+	  as directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_LITE
 	bool "lite has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index e85ec16784..158e6a4ed3 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -396,11 +396,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
 comment "decklink needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP  || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
-	bool "directfb"
-	default y
-	depends on BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
 	# FEC_2_5 / QAM_4_NR definitions
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 7d36c041cc..11ce19e7f2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -73,7 +73,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dmagicleap=disabled \
 	-Disac=disabled \
 	-Diqa=disabled \
-	-Dopencv=disabled
+	-Dopencv=disabled \
+	-Ddirectfb=disabled
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
@@ -547,13 +548,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddecklink=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=enabled
-GST1_PLUGINS_BAD_DEPENDENCIES += directfb
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddvb=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
