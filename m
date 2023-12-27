Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F217C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 11:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8647860F9A;
	Wed, 27 Dec 2023 11:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8647860F9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJEPpfe2Ouib; Wed, 27 Dec 2023 11:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D051860F95;
	Wed, 27 Dec 2023 11:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D051860F95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC0D61BF592
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 11:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A591781AA7
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 11:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A591781AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xvJpyfDGuL2 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 11:48:58 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85691817A6
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 11:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85691817A6
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso37245765e9.2
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 03:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703677736; x=1704282536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IcRTCXsT75LRQl1H9IBQndQJJ1GOaog8qhf5HdRnK88=;
 b=OnPpQy0q5cxJDATNtT7Ft89QThPBYh058kgzXDDckA4v0GsxtSI5XetpX0tufeCl9A
 aGqDBQJHCl6aHn4vuYFZGxKYhKwFyAMkpA315DZxWSFXPfDptRq1S0bcrH3W8UH8j/at
 rJ7a1UopxQiBO5Etak6z8FClIIutfK1v6LOMFliJBSa4pfxrjzgF3GAu0R3JGvjYl4e/
 rLVewkCO/PdgYO6MpjuGmofZVmsn7V8h6OhAFoStOBdE1gevcKQNd4qriyoIC0avjlH6
 SNeGUNdci8CtsLmk4UXJptqskCNuB+rzceAwcftkuRUB0MdAUo2wY+TFtCJMt2SVrmOa
 MI4Q==
X-Gm-Message-State: AOJu0YxVcGw77q12z7bd7+ZSRpBDxzf4DxC9aPyXkTkpj3RKEe2ogQIs
 oNHgyGMYyiUNH8vfPSqzYRKjiHFRUto=
X-Google-Smtp-Source: AGHT+IFj6AirVRgNe85N+LQuFrHTL4Ojd3l2NHL+N8HdNui5Gl3xDgO66BtVF0o2qPhR4oNP7R3hhg==
X-Received: by 2002:a05:600c:4fcc:b0:40d:5d9a:ac0 with SMTP id
 o12-20020a05600c4fcc00b0040d5d9a0ac0mr500795wmq.48.1703677735913; 
 Wed, 27 Dec 2023 03:48:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b0040d5a4865casm5314205wmq.36.2023.12.27.03.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 03:48:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 12:48:23 +0100
Message-ID: <20231227114823.1167238-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703677736; x=1704282536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IcRTCXsT75LRQl1H9IBQndQJJ1GOaog8qhf5HdRnK88=;
 b=Qhg71kL8V0qK1W0KA/JoXsl6BCQusQ9x2S1ySKl3g2WCyeX4HqnxLrwa8vQU5RkTc1
 CF2cOqRGGj4gJTRlg435J+k1P+34jCfXx5Qtdj7kJJ3HzqCvNK8V8j7iuDxwFVKwlqrA
 i7VGulYwZKUA4NNFNsKGNWF7ZEYqSQKie0eJWSX77m6IL0CZf1fxDeEc9NitVnInIWOH
 FP5lY9c1Gd9JZDSV0hLA1LoKpe7qWyyqMijPBPdcEZxl9pXHtNhODSfnIrcDeamagmDs
 RsvBjujAARSCuMU/w0wVvy71Y6rLgcIIjhLs2kYRMGxA9yT0qm+RO9IKskMv3u9i/UEP
 +llw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qhg71kL8
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good:
 switch to libsoup3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsoup3 is supported since
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c3455def2e7bd09a7c3806283ceb69d0bef24869

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in         | 10 +++++-----
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk  |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 36a542227a..e1e2674a4a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -261,7 +261,7 @@ comment "plugins with external dependencies"
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
 	bool "adaptivedemux2 (Adaptive Streaming 2)"
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
@@ -383,11 +383,11 @@ comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
-	depends on BR2_USE_WCHAR # libsoup -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
-	select BR2_PACKAGE_LIBSOUP
+	depends on BR2_USE_WCHAR # libsoup3 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup3 -> glib2
+	select BR2_PACKAGE_LIBSOUP3
 	help
-	  libsoup HTTP client src/sink
+	  libsoup3 HTTP client src/sink
 
 comment "souphttpsrc needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 4a84ea01b9..d1a0d71dfb 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -60,7 +60,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled
-GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup libxml2
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup3 libxml2
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
 endif
@@ -453,7 +453,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dsoup=enabled
-GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup3
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dsoup=disabled
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
