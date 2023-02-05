Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C7C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 04:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93DAE60C25;
	Sun,  5 Feb 2023 04:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93DAE60C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kG9SJfH3XCc1; Sun,  5 Feb 2023 04:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB1760BEB;
	Sun,  5 Feb 2023 04:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB1760BEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 636681BF3F9
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 04:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F34381757
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 04:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F34381757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaTkhv9Io2Tj for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 04:22:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0137681756
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0137681756
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 04:22:41 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h18so3610908ilj.6
 for <buildroot@buildroot.org>; Sat, 04 Feb 2023 20:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Cqjyz8tL8zRar1pd1GeYPQLWw1OsgFJyhcI6ATGi5w=;
 b=b0MrkOHgz2DFJKDPeaKnaUw5uQDc0AwrR9ii40o8PP1ypHLay+aMM6MSzfzR/GvaNO
 WeRMaBJ77uNujIB4Ad2G52S+bKkTWQKF8JAmDOv2D4s1FSO4xIoMJzTHbJpQjBky4mx4
 aO3O4ecM978q6UKYKulQEcCxMd0wvukkZF2Q3yE2KircUkpx3FZ3Hr6+TWyTQbfpMW+H
 3+MG84X2gufcWeYBbJB0bWkAj2rrnG66DWT7yN6k/blzo0u/yc+rMOqpkuShkevs1U/r
 wYROeFKUMWJPUFpXfTqULWNmulAFk2vEX/Ujm52TU4ct3btJ8WOFn8aPx9mFNw+JPfus
 xIHA==
X-Gm-Message-State: AO0yUKW3+V0pe699frZeZ7l8WRRTR+fUKXX+0yR2+eE40xRoHUBv0UTP
 zfw9kWX5oVwgwhHCvrbqk0yk942ajnvnMA==
X-Google-Smtp-Source: AK7set8fVGOXiK1I2iweEb2h+0k+uo5D3+Dx5sBEiqeBqHYkJcXoBiMXoZGxXgY8wOg87wbprEKUHg==
X-Received: by 2002:a05:6e02:1b09:b0:30d:c0b3:3272 with SMTP id
 i9-20020a056e021b0900b0030dc0b33272mr16636602ilv.0.1675570960883; 
 Sat, 04 Feb 2023 20:22:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 i15-20020a92c94f000000b00304ae88ebebsm2066712ilq.88.2023.02.04.20.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:22:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Feb 2023 21:22:32 -0700
Message-Id: <20230205042232.1014672-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Cqjyz8tL8zRar1pd1GeYPQLWw1OsgFJyhcI6ATGi5w=;
 b=IEe050bdSIdVSWcgYcFIvFRodyEg7aBV/CGGrN8ckSUNg+pSutsEoeFBkHZsVTRIYm
 qPH4DBDVrh5EiuTv9aHn1w7i6K8xPda6FpNOHF8vIB88kHT/Sm72kW0nGAUEoFLBlTzu
 19xDxC1RRY3/u2iJtmc+hn+DOFzhsVg3Vb7U/r7UJQgJg9hR1PWWGRpulHa9bYr5EvUZ
 cREcqPWsMk39m/Zj/zQXsINLI+x28Ib6dBDAit015XLE1+Srf/AoAqBeM6oq+AjTRBBw
 Lb4tnL4/r/gvd5awL1yeb0yQu7Rio9HAMcxIYHYdJE0pPWynZxsLfTS5jfS7IFWlT8aT
 rPrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IEe050bd
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-bad: add new va option
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This option enables va plugin support.

These plugins are vaapi based encoders/decoders that are eventually
intended to replace the legacy vaapi plugins.

Details:
https://gstreamer.freedesktop.org/documentation/va/index.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in         | 11 +++++++++++
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bcb4cb1545..1e89cd124f 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -629,6 +629,17 @@ comment "uvch264 needs a toolchain w/ threads, wchar, gcc >= 4.9"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA
+	bool "va"
+	depends on !BR2_STATIC_LIBS # libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	select BR2_PACKAGE_LIBVA
+	help
+	  VA-API new plugin
+
+comment "va needs a toolchain w/ threads, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 	bool "voaacenc"
 	select BR2_PACKAGE_VO_AACENC
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 8f11ce6b37..dfe1f1c9eb 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -745,6 +745,16 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libva
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
+endif
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
