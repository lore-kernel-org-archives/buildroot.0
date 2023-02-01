Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22312C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A55E819F3;
	Wed,  1 Feb 2023 05:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A55E819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VikTPy3Ky57B; Wed,  1 Feb 2023 05:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2134814AB;
	Wed,  1 Feb 2023 05:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2134814AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41EF91BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29269409E6
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29269409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fz5R0f-_ET9I for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3275409EB
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3275409EB
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h18so4700644ilj.6
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zQE1cvBBAnHhdx1eaF9Xrlp/hs5nAaV/1aj63iWZ4w=;
 b=6krjVZNZ/KI3/bw1wZ33Kt6P+kyyrAwM00CHM3k9202zdwzApM6H5TZSXTTO1y6EbY
 nnUMsVAzpRQmUj5C2UPOqqvGJyrGGywGzIgF5IjEml7iMD21FBMkuc6kLX2+ihM9dQmW
 dCwFeb3a+Q1BQ6dS2Na4h4OFPuEJ+YPk1Eu070V5QWGVKg5uoAfuwjSToQiw8Aj+/Ww/
 YaTf5cNwKH2D62rXicZCEKp9DgCCn8au77Icwhido3V9KK09/kRL5z+kOL87uVu+YUOJ
 RGhFM1mDTpAEsw5PWTwWokIjd8IZjJiPiY8VrVmtvm+GXz9smJmyr4SdvnDCYmrtLYCR
 6HSg==
X-Gm-Message-State: AO0yUKU9cjLwybg7EU5hkUBl4rsCxKb/oJxI73sKGau7z3gA41R1qs6q
 DFZr6ZNgLXzyNnxqIPKPSfKFKKI8sNY+mA==
X-Google-Smtp-Source: AK7set/2gjOrGl8BJGayQWM0c8nwzMKfp+aRgrw50EvQvbMDrAQFBfv0h8um0fzL60ZPCH2QX0DAJQ==
X-Received: by 2002:a05:6e02:156e:b0:310:e9e7:e8dc with SMTP id
 k14-20020a056e02156e00b00310e9e7e8dcmr1003735ilu.15.1675228635398; 
 Tue, 31 Jan 2023 21:17:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:54 -0700
Message-Id: <20230201051658.383420-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zQE1cvBBAnHhdx1eaF9Xrlp/hs5nAaV/1aj63iWZ4w=;
 b=i5xB5la69mcTPEqiJib20kaoaxgbOXr/5bFCV0AeffoB2+OMNsgcyTKE6mhPJVHUGt
 epMS9ZUVHkz+6Coua7tLgfx16CJ8ijohVVjJgoUikvByWwCsqVODPaFvviFbKBHj/f8z
 1MFjApbXZE3GoPwDhXn1St0e/TmoCla8UoY6SXIcXhme2mE+shauixpeOtpqKcIHWoVH
 DnpnOejo6jKHpcTrv1uEZJk5tUY9UlPbs9msp7YyQaszNDOZeoruDYA+uBse9XtSvo1F
 r/JHaae7GI2+ynKegIz6qrYn6LIoB9fUB2MCbfmdg9TzO6ffaq72EkUfVfGTDlYj4OV2
 yJgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i5xB5la6
Subject: [Buildroot] [PATCH 09/13] package/gst1-vaapi: bump version to 1.22.0
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

Update config option names and dependency requirements.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 37 +++++++++++++++----
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 5baaa4dfb7..6dec625c93 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.4.tar.xz.sha256sum
-sha256  ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a  gstreamer-vaapi-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.0.tar.xz.sha256sum
+sha256  593ccad19f88e5fa29f40f98356c007806bd535828707b1406944d16a90bdff5  gstreamer-vaapi-1.22.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index bd6c16be3e..3d9eb91ffb 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.20.4
+GST1_VAAPI_VERSION = 1.22.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
@@ -18,19 +18,40 @@ GST1_VAAPI_DEPENDENCIES += \
 	libdrm
 
 GST1_VAAPI_CONF_OPTS += \
-	-Dwith_drm=yes \
-	-Dwith_x11=no \
-	-Dwith_glx=no \
-	-Dwith_wayland=no \
-	-Dwith_egl=no \
+	-Ddrm=enabled \
+	-Degl=enabled \
 	-Dexamples=disabled \
 	-Dtests=disabled \
 	-Ddoc=disabled
 
 ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
-GST1_VAAPI_CONF_OPTS += -Dwith_encoders=yes
+GST1_VAAPI_CONF_OPTS += -Dencoders=enabled
 else
-GST1_VAAPI_CONF_OPTS += -Dwith_encoders=no
+GST1_VAAPI_CONF_OPTS += -Dencoders=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+GST1_VAAPI_CONF_OPTS += -Degl=enabled
+GST1_VAAPI_DEPENDENCIES += libegl
+else
+GST1_VAAPI_CONF_OPTS += -Degl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+GST1_VAAPI_CONF_OPTS += -Dwayland=enabled
+else
+GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST1_VAAPI_CONF_OPTS += -Dx11=enabled
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+GST1_VAAPI_CONF_OPTS += -Dglx=enabled
+else
+GST1_VAAPI_CONF_OPTS += -Dglx=disabled
+endif
+else
+GST1_VAAPI_CONF_OPTS += -Dx11=disabled -Dglx=disabled
 endif
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
