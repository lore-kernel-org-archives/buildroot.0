Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17259C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 07:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774D481DCA;
	Mon, 20 Feb 2023 07:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 774D481DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfszwp_5Jcl1; Mon, 20 Feb 2023 07:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B502481C19;
	Mon, 20 Feb 2023 07:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B502481C19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E35E1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 07:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F8441620
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 07:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F8441620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eknODpr0cHqY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 07:19:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F1194161C
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F1194161C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 07:19:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w27so565418lfu.4
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 23:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uki5+wqPZ01EzqoYZXx5IRqCDm883xl2HPujJIlCJ8k=;
 b=Hw/lI0+3TeXAHuWq4h1FrfLy9wRRHOqAQvZi8iNv4vD9F//DeHYbhgplz1n5x9b5e6
 l85cg6O+DhMRGkGP8RF+XHjFHjrDQHS4aA9a17qO3zWOu7T+JNjNoNe4vWPInkuRo/QF
 eWcf/DuOrlHGTmxOjYE2KJQuNRtjaJOX7zX0JHVShJYkALyd7Bm3DlGawzUCpgeCR2Od
 fkZX/M6PJibKacVLjyt/fXaG2n0B2EyPvzXofx8ShUkBIfcjdhlN5sTIIHuAVrYnrG4F
 Q6jMgi1E1xMSbJgO2EorWCzW+20N5NnB9ExsDcwc7KCtMLiQ16vOaEpx88H8YgQ0iKJz
 TFVw==
X-Gm-Message-State: AO0yUKVmAvmO7w+bIUR/lh+hD0ghdPV4pEbjdtLL3lszYm5FdrzSX2Tv
 hhvWPrlVUy0Iv4H6MDUUkdtLs9dV6NEDmw==
X-Google-Smtp-Source: AK7set+oWeKOQRZL2mHI5iM7FRO+2HuIvoOpfZzWvMj+6rUlloOl4hS1/ZdctOyZlHpWL12UjsO8zA==
X-Received: by 2002:a05:6512:143:b0:4d3:f0f2:b97 with SMTP id
 m3-20020a056512014300b004d3f0f20b97mr633160lfo.38.1676877540738; 
 Sun, 19 Feb 2023 23:19:00 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 r28-20020ac252bc000000b004b56bebdc4esm1444475lfm.14.2023.02.19.23.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 23:18:59 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 08:18:46 +0100
Message-Id: <20230220071846.2334907-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uki5+wqPZ01EzqoYZXx5IRqCDm883xl2HPujJIlCJ8k=;
 b=hq4wl0uKMJeRXVkdKmU1ZC2gj02HdTB6nAM0NpOuVJ8ENmYM3n9a3XuxO21xH2mOqP
 cUZLmS4akJJBX2dMMsSUA9mSfHM04b76X0NuweSR2GUM+cJaYfkum2+9GKerV2fe0Sw7
 G/gdlel+ADH/puXvillJAP6u92T7efyD1vndVZKbKX1Bh8NYhI+0vGkYi7yxojmvag0s
 apM1+Gc9KXBO1Aj4Rrp/fmNTDHC9zBeQX6z85Vn4DIuNoXcZMRbz4s6hxDNVGftjaOoC
 6HII3foHx4u+uJpN+dwE1CH2bZO9/zq+Wh/m05grOWnlOC/iX63YtFzsxy5YzUamr/N4
 IlFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hq4wl0uK
Subject: [Buildroot] [PATCH v2] package/libcamera-apps: enable LIBAV only if
 libdrm is present
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
does enable LIBAV by default which depends on libdrm.

Fixes:
- http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/

/home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
   13 | #include <libdrm/drm_fourcc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
        -Add dependency to ffmpeg

 package/libcamera-apps/Config.in         | 1 +
 package/libcamera-apps/libcamera-apps.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index 711fd6de05..d0cc6a4210 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+	select BR2_PACKAGE_FFMPEG if BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 290ee9a026..1464875298 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -23,10 +23,12 @@ LIBCAMERA_APPS_CONF_OPTS = \
 	-DENABLE_TFLITE=0
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-LIBCAMERA_APPS_DEPENDENCIES += libdrm
+LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
 else
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
