Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1000C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 02:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271FC41854;
	Sun,  5 Feb 2023 02:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 271FC41854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6kbGwtGDSc3; Sun,  5 Feb 2023 02:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB8C4184C;
	Sun,  5 Feb 2023 02:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB8C4184C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C66E81BF28B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 02:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A15B34026A
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 02:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15B34026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmCokwR1Sn87 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 02:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5154A400D2
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5154A400D2
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 02:37:19 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id u8so3551796ilq.13
 for <buildroot@buildroot.org>; Sat, 04 Feb 2023 18:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fX7ScOBVX5cE1utnC/gFJx6Wd6K+RAKp7MBH0URFLKM=;
 b=utc8i68ofXBVJxOVvUCwt9nDy5gYaV59SjVgUh4x3hp7pxdB/8f/EMwuUJ1mpXPcYI
 fKqI6U/P0VVnG2PuEq4n3Viyf0PLgtMxWCtR8tY9/EJoEEydJHUvt8PHViAX1TpHWOv3
 BgWWpgla7bEMkD9pH1frUuWYQYhjVkDmBibl57hSFwNylS157kPk5eopBlQYr4t+BreN
 anXpiQD3DKTHJ1ABV/3t8OKPGO8TcakKJ1By89lCoynjD99cdVl33gQM+L3sBAgy0ITd
 a7yOi+h7zykI3iQVP1e36J2I8n6NjfSyWxK1YMZruVBwjb7Kje/wC9MnVTL2i3pheT5l
 ycjA==
X-Gm-Message-State: AO0yUKUd2VieF3O7Uo5H3CnJ56sPkVRvCS1UyrE6XiV6KPevaLzyUCg2
 7AZQs5Z+FVw76zW4unsVz0pvp5+2xkVfyw==
X-Google-Smtp-Source: AK7set+4WYTh7qpe6YJQr0fBSpqhjS3NPg8qJCUFJ0TPI7Aow2PikQ5MaVdseXBebIi9TzqLlWJWxQ==
X-Received: by 2002:a05:6e02:12e2:b0:311:19ad:720a with SMTP id
 l2-20020a056e0212e200b0031119ad720amr12298360iln.29.1675564638155; 
 Sat, 04 Feb 2023 18:37:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 r22-20020a02c6d6000000b0039e68e9988csm2196691jan.56.2023.02.04.18.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 18:37:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Feb 2023 19:37:09 -0700
Message-Id: <20230205023709.799349-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fX7ScOBVX5cE1utnC/gFJx6Wd6K+RAKp7MBH0URFLKM=;
 b=lqmGjXr6n61CzV6znoVKnylb6SfodXbYU0WZTU6iWmltFVjTuPpFM+mOPWJC9O8Ntt
 zSAp5wuyIuDZ299AL/3Yj55VVi7qJbyzy9eVAKQ7dPVrIWaL5lzQ//kv2Fur8Th67ewV
 E68yanQDHSHZrwMONfTqMGz+mFhYy23FOy849VxUf684D9PsxTSBwpmeJmIIXDEiFw0v
 ECYlhDnOfyOsTzX8NbVxePn9zFYwD/xL3kv0k1sUW5jkXIlIXrbq52u+pSVHKHPw8C57
 DnrK9sJomSiqLbydUlToKVzkCNFNLkSRWi4lvNlHN4f+fpPRDVT3pxGsLZ1Qr6AAZ5/p
 xC+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lqmGjXr6
Subject: [Buildroot] [PATCH 1/1] package/gst1-vaapi: fix x11 dependencies
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

The x11 feature needs libx11 and libxrandr support.

Select and depend on these when x11 is enabled.

Fixes:
gst1-vaapi-1.22.0/meson.build:96:0: ERROR: Dependency "xrandr" not found, tried pkgconfig and cmake

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-vaapi/Config.in     | 2 ++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index ade8b83a5f..a1062097ed 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_GST1_VAAPI
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  gstreamer-vaapi consists in a collection of VA-API based
 	  plugins for GStreamer and helper libraries.
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 3d9eb91ffb..9533cdf2b6 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -43,8 +43,9 @@ else
 GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
 GST1_VAAPI_CONF_OPTS += -Dx11=enabled
+GST1_VAAPI_DEPENDENCIES += xlib_libX11 xlib_libXrandr
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 GST1_VAAPI_CONF_OPTS += -Dglx=enabled
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
