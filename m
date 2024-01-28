Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DDFC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B30D8272C;
	Sun, 28 Jan 2024 13:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B30D8272C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvc6pk7DA7UK; Sun, 28 Jan 2024 13:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AAB4827A5;
	Sun, 28 Jan 2024 13:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AAB4827A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51A41BF868
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9768540585
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9768540585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGqVV5ftseBo for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:03 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9757E400C8
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9757E400C8
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so1994806f8f.3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448060; x=1707052860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=giLCE7r/w6hE3LNkat5bnTORbHf0cC0VCXvGPCzlC5I=;
 b=RQe2sZ2b8WzS6ZgMJP+zn12WFyf0TlqXXB0XeuD1cvsLLjKzsPl/GeCXbzX6ESSckL
 19FOY3Nbe6F8M+8X2Q85l4a/IA6Zq9dy47wHs7EWO8fqbIjtUH/YaRwC2gr/d1smy/wJ
 TMd0SPWSp3UgGznzRfbJvn391U05yzLXuuc+WkAVzdoZb3sMn3q9jUFRlvLdJzItnPfs
 sjB6yk90Ab8iCifUz9vE31zz2+dgKqdCs4N6C1U/0k7D5fVhtJo6fCtm7YHQEaYBAFLT
 ae574AtKFd768t6Ww87KpVDWVfaR2RHuElA1eQUbrXCSuc9ymLBDS9hd8SMJYXcrot7v
 xvJQ==
X-Gm-Message-State: AOJu0Yzea0tjD6spDo3Qu6wv8zKrXV+yD1O2XgdJmPP0CFx37RzFK+dD
 7rAMMKzXALCxohF1qDEDKgvuaofk/1cfjII4gmLhWTsOG7R1AN+nBV4r3i1S
X-Google-Smtp-Source: AGHT+IFi0T7U34jhnzjNgZyC8Mz7pd9p29/72R0LkEVDueBKy+kPUqQxoQ88acLZNDOQTKMZOk0/BA==
X-Received: by 2002:adf:ed43:0:b0:33a:e6e9:5044 with SMTP id
 u3-20020adfed43000000b0033ae6e95044mr1529984wro.41.1706448060398; 
 Sun, 28 Jan 2024 05:21:00 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:51 +0100
Message-ID: <df16b2a080d81430777e362a57818411d1c57a94.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448060; x=1707052860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=giLCE7r/w6hE3LNkat5bnTORbHf0cC0VCXvGPCzlC5I=;
 b=GQp7V+Uzf9O4wb3glZjx0KaNBzUmJV1Cq6htciIUWyU2p6zj84YRhSZY4wIi7T7j29
 4IHUGd0mb0+my81Ax2Ip7MpTSwHusCG2Yuh6wMk8JlRMXGf+EPsexn0c/YLZ+ebL4WsG
 zt6kurSh1Wks0ALLoNibA+O1bZ8HlBFtDXvgL1n/nnTvk/Ds2DqZnVFChkBZ/WrE3Zq9
 3+WEuSgzbQjZxjLsI7rZyxSOUb5dXPE4qyqQEZuVZzGOuovUHNl8wdKKJY8YEdT9lvzK
 EMyzbDvq8kP8K/igfYE55Vu+a7SgJtcv6IriT7GOX6BftoQ90ncVsvhIhl5q0b3kNba3
 tfOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GQp7V+Uz
Subject: [Buildroot] [PATCH 02/10] package/ivi-homescreen: fix dependencies
 for gstreamer plugin
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gstreamer plugin select the EGL backend of gst1-plugins-base, but
forgot to propagate all of its dependencies, notably the _HAS_API
condition, causing unmet dependencies warnings (unfortunately, not
errors), such as;

    $ KCONFIG_SEED=0x597D22A8 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
      Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API [=n] && BR2_PACKAGE_HAS_LIBEGL [=y]
      Selected by [y]:
      - BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN [=y] && BR2_PACKAGE_IVI_HOMESCREEN [=y] && BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HAS_LIBEGL [=y]

We can't select _HAS_API, because it is a symbol that represents a
capability provided by other features of gst1-plugins-base; it's
semantically like a virtual package: we can't select it, we can only
depend on it.

Add this dependency to fix this situation.

This however causes circular (recursive) dependencies errors:

    package/gstreamer1/gst1-plugins-base/Config.in:135:error: recursive dependency detected!
    package/gstreamer1/gst1-plugins-base/Config.in:135:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL is selected by BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
    package/ivi-homescreen/Config.in:221:   symbol BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
    package/gstreamer1/gst1-plugins-base/Config.in:149:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API is selected by BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
    package/gstreamer1/gst1-plugins-base/Config.in:152:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL

Indeed, _HAS_API is only even set when gstreamer1, gst1-plugins-base,
and the gst1-plugins-base's lib-opengl support, are all already enabled.
As such, the dependency on _HAS_API already implies those, and there is
no need to select them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/ivi-homescreen/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index de7509320f..c24df05b6d 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -222,10 +222,8 @@ config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
 	bool "GStreamer EGL"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API # GST1_PLUGINS_BASE_LIB_OPENGL_EGL
 	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
 	help
 	  A GStreamer-powered alternative to Flutter's video_player that
@@ -233,9 +231,10 @@ config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
 
 	  https://pub.dev/packages/flutter_gstreamer_player
 
-comment "GStreamer plugin needs an EGL backend"
+comment "GStreamer plugin needs gst1-plugins-base with an EGL backend"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_LIBEGL
+	depends on !BR2_PACKAGE_HAS_LIBEGL \
+		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
 
 config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
 	bool "OpenGL Texture"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
