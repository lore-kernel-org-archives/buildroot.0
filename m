Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB8FC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF91410C9;
	Wed,  1 Feb 2023 05:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF91410C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7Q_W3pBvQii; Wed,  1 Feb 2023 05:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE744154A;
	Wed,  1 Feb 2023 05:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE744154A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF831BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B3A405AE
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B3A405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdpLpxjAguBc for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEA9240584
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEA9240584
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m15so2845927ilh.9
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jHe8H8F06j+vSCU7GyG7cOy5jHkpbzaBpau4rKPRKY=;
 b=mY2YF6c4OBqk2zuc86GqreAMAmysETgYaQFBqNzqEHgbLSRr6QTgRFwqKeVFLaJvj/
 EXiRMpiwkLWF/IK7e2JnSSB6a6GNRwOVjhMqg7KQpzKK06zlQD+qEuzLbvlY9O2MuDdt
 NQNXjSkVHBSM1yxyKzs6eRtAO2DK5G9whTAAJtv1c9xpDomRglFd385g5KBzPs1eVQ15
 QdIv/g7XW3u2pAKp9a2D/4yW93E02+mICv/5V0tgVrKn69QqnqOQJ41He3QIkvjWzndo
 aJvRRJezRGqkMyRqouJz23hJ5wSPuYw04vmvWUAXnQEBMDdViuPWQJ82W001IC0QcXCa
 NiTw==
X-Gm-Message-State: AO0yUKXBJmVpoHeIzwYbAI9XpDvL+h/wWl+fXsuRcAZ2/x1vTPC5dFZ8
 912bcMow6FjvUEuaqHWrX7n7qYzhMlPbhg==
X-Google-Smtp-Source: AK7set927tSYcGPH3eq4Pk+g2pyUEC0LErwm6b14q18rjGXsC6ECmiIzvyMuPwUcvJrseV5c3XJYMg==
X-Received: by 2002:a05:6e02:1807:b0:310:9bad:89a7 with SMTP id
 a7-20020a056e02180700b003109bad89a7mr903559ilv.14.1675228631197; 
 Tue, 31 Jan 2023 21:17:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:48 -0700
Message-Id: <20230201051658.383420-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jHe8H8F06j+vSCU7GyG7cOy5jHkpbzaBpau4rKPRKY=;
 b=d8ufdXh9MDrFSvfrRsZOQOA+eOngcpG88cSiH+4VvoybqK3ddDeqGJde/jwmuP0ufd
 zqbbcstKC52nPEMYWK2pCpGnUFFs7lwR+yPQ+Swbn1NZmwr//LdDm1oXAYoJwN+oyPP5
 6Qso/nQosYqqXOYc3uvkkt0VlG+enlGKTgGx9c9Cdc2P67i0QjZq1Covq8N2H5I1W/ye
 x98Qn+qb7loql5Ue7NH7NREo5yYSatg9fploDmGpO4rov7Uado4fs9cELkRmPQw9wzCh
 eZNHhSch8vhscAYqCV5F0Sbyt/Rf8zFJwMpy8BPDvUPz3bHY80Nmvv6HCsbiPeD4SDf/
 trPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d8ufdXh9
Subject: [Buildroot] [PATCH 03/13] package/gst1-plugins-base: bump version
 to 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The videoconvert and videoscale plugins have been combined into
the new videoconvertscale plugin.

Rework config options using videoconvert/videoscale to use the new
videoconvertscale option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in.legacy                                   | 14 ++++++++++++++
 package/gstreamer1/gst1-plugins-base/Config.in     | 13 ++++---------
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 ++--
 .../gst1-plugins-base/gst1-plugins-base.mk         | 14 ++++----------
 .../gstreamer1-editing-services/Config.in          |  3 +--
 package/webkitgtk/Config.in                        |  3 +--
 package/wpewebkit/Config.in                        |  3 +--
 7 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 41c5fdefb3..3fff2b1ddd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	bool "videoscale removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	help
+	  The videoscale option has been combined with videoconvert.
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	bool "videoconvert removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	help
+	  The videoconvert option has been combined with videoscale.
+
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "imx-gpu-viv X11 output has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index bd4ee0b994..df10774ac7 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -59,10 +59,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
 	help
 	  various encoding-related elements
 
-config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	bool "videoconvert"
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	bool "videoconvertscale (mandatory for video playback)"
+	default y
 	help
-	  Colorspace conversion
+	  Colorspace conversion, resizes video
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
 	bool "gio"
@@ -123,12 +124,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
 	help
 	  Adjusts video frames
 
-config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
-	bool "videoscale (mandatory for video playback)"
-	default y
-	help
-	  Resizes video
-
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	bool "volume (mandatory for audio playback)"
 	default y
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 5c729d832f..bac4f8398a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.4.tar.xz.sha256sum
-sha256  8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225  gst-plugins-base-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.0.tar.xz.sha256sum
+sha256  f53672294f3985d56355c8b1df8f6b49c8c8721106563e19f53be3507ff2229d  gst-plugins-base-1.22.0.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index d225cdf910..7d509331fe 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.20.4
+GST1_PLUGINS_BASE_VERSION = 1.22.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -147,10 +147,10 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dencoding=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvert=enabled
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvertscale=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvert=disabled
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvertscale=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO),y)
@@ -219,12 +219,6 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dvideorate=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoscale=enabled
-else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoscale=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
 GST1_PLUGINS_BASE_CONF_OPTS += -Dvolume=enabled
 else
diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in b/package/gstreamer1/gstreamer1-editing-services/Config.in
index 9c41e8142b..e824781d47 100644
--- a/package/gstreamer1/gstreamer1-editing-services/Config.in
+++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
@@ -6,9 +6,8 @@ config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE # runtime
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC # runtime
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE # runtime
 	help
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index cafe497491..dc5d738dae 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -104,8 +104,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04ed40bd92..7a8dc557c3 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -97,8 +97,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
