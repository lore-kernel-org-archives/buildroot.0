Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDE2EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F07418FC;
	Thu, 22 Jun 2023 14:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F07418FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtixFy6yjGhf; Thu, 22 Jun 2023 14:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A16D04189C;
	Thu, 22 Jun 2023 14:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A16D04189C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E94F81BF4E7
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 14:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C317060D77
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 14:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C317060D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbLeHARXF43P for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 14:10:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD1160BE7
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCD1160BE7
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:10:08 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b466744368so86432011fa.0
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687443006; x=1690035006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFF8bZVed0oECBbRRfyBlOxwxwGhlfidTI53Pbgyg+I=;
 b=kBHEYzn+fpn3R25ZAnN2lJs7nkBBQAQDbxY5nLIOvk3rZjE5A1HldkGAsKHRfP1seW
 ps1Ep7F/sYJNImXHY1ALYRrwezJNVuBJ+JcPCcF6GlrAKwcV3/PTKkDC4CYMQ5cKxL17
 WVQ+cMo7cPsgLsIIaCiSPonQJOecihimqYXdBm/PQQq8s6XQDADoVeP85smRGDmp1dn7
 SBu+kuGVCbrdGRdSzt0GAZPnrxSsg2DHKK3bWVQiq4nablUB985A4cV2dOpxF9vajWGG
 yu0d+z2MfeWQF10sRiF7D/TG2V2jo707FJ3Rrcg4SAU5/SzFY7C497M35chbUoFRZ0U7
 4UgQ==
X-Gm-Message-State: AC+VfDxS3MUU8NRG3lxg70Cot9bYZrIlKOBIzRotC4828MJK1ZgUOa+X
 gFDNzZPFuoFUDCZpmR9BtRmeccj6byquUYi8s6gWZQ==
X-Google-Smtp-Source: ACHHUZ6q/fmdKI6n8JhxFOXthNUph7NAy+Afwuo/f24CTUdEMDgTAoB4mBD2eUWE0o0yMParJuwltQ==
X-Received: by 2002:a2e:855a:0:b0:2b4:5a26:8b65 with SMTP id
 u26-20020a2e855a000000b002b45a268b65mr11744666ljj.4.1687443005784; 
 Thu, 22 Jun 2023 07:10:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a1709062dc800b00977cc21ddd8sm4709423eji.54.2023.06.22.07.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:10:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 16:09:45 +0200
Message-Id: <20230622140945.3717948-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687443006; x=1690035006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jFF8bZVed0oECBbRRfyBlOxwxwGhlfidTI53Pbgyg+I=;
 b=T39j0zRz5Qi3V7jKXYPo40Akwkm+QRHaksfBBW1ebkXjLYhjFb74XZ0AXPalhtj2qT
 eaFKQFXeskfDIJ29DHkXzBusb6taC15MlNIYpDCbfZiGZcgBoJQ6L2HiGUr8AS/8VWZ6
 hJGj+bfX1VwSdzD/0++FgmNnsAN2XujWKX8QU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=T39j0zRz
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good: add
 adaptivedemux2 plugin option
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently there is no explicit way to enable/disable the adaptivedemux2
plugin. Create a menu entry allowing users to disable or enable the plugin,
like we have for other features.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 7 +++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index d7ec16e80014..3e849307831b 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -32,6 +32,13 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2
 	  Enable bz2 support for the following plugins:
 	  matroska
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
+	bool "Adaptive Streaming 2 support"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBSOUP
+	help
+	  Adaptive Streaming 2 plugin
+
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bbcd3aecabd1..c26e32a1841e 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -58,6 +58,12 @@ GST1_PLUGINS_GOOD_CONF_OPTS += -Dorc=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += orc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
