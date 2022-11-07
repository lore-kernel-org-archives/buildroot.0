Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F95C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 02:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900DB81763;
	Mon,  7 Nov 2022 02:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900DB81763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WT2xwrFL-OjC; Mon,  7 Nov 2022 02:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF8E81762;
	Mon,  7 Nov 2022 02:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF8E81762
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECB321BF398
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 02:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D539E40142
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 02:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D539E40142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muK9FS5NAx4d for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 02:25:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 214FE400C4
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 214FE400C4
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 02:25:07 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id 11so7876372iou.0
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 18:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVowZ+5W/JGEyYZLKnGNBjfwFJlKWkfMugAaOc4yKCA=;
 b=z06/qY9rILfB1Rm3dUMDzpYPuJodRytGTFoKudK4uoSowu2rjuxiYTuPWwmHyRIM4V
 Xn6q4ar1jRcQx0GL59RyUGEHxEYhd9FM6Foblns67WdYBUGYT5gjHJSzqEwMPOtJlVMP
 LGpSe9n7Gs5pyUael6JIMRKhRffZA0BQCDRfV5JTtRCtyNOziO/tBrO6ZEypZBkOcGZ0
 R33mc42kMxZ/h6DnE0fv6VFK8xZ8sw6251cwgN+OF8f7XQ4I79QrQXjqJlkUrucXiXm/
 rsuGKJjphi0VoSt7y7pFh6AWwZeKgSIk6DtvLSrI6BlQdJG+AiG8uYuSOKuv9ssYgxI4
 rE5A==
X-Gm-Message-State: ACrzQf3a2jBImned4k1mmil11dxSYBLUFzKuj9oBZqzJyimrXZ9g1X6p
 KK5WeYoVrxtS+7v+VJOp1dzspUfxDviNMA==
X-Google-Smtp-Source: AMsMyM7XKI/Qg4LgiLPsNznc/AldeSzXeFIzqgrmjye17YYMlah1o0RO3V+k6ka0vgjkLnAmsdCgXQ==
X-Received: by 2002:a6b:7d05:0:b0:68b:7243:63ff with SMTP id
 c5-20020a6b7d05000000b0068b724363ffmr30095963ioq.191.1667787905881; 
 Sun, 06 Nov 2022 18:25:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z25-20020a027a59000000b003717c1df569sm2215225jad.165.2022.11.06.18.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 18:25:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 19:24:58 -0700
Message-Id: <20221107022458.3448020-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107022458.3448020-1-james.hilliard1@gmail.com>
References: <20221107022458.3448020-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVowZ+5W/JGEyYZLKnGNBjfwFJlKWkfMugAaOc4yKCA=;
 b=qLAVitcCY93569l/LYP1Ij3QQ/XXAcqqXJRTDC5yjr09mrtJDqgtTCmKtx5RUDjAxT
 48iT9nkEGMyUOLL6oU9unKhtwWc2GTaItrD1O1HYeESQxd+xi2Ad87qZh2N/SWOVR2xm
 qcGgr+DkCh+fGic0uJj3oecQfJUPtwqMp+62L4EJ96Ov3/6s453ak/61lEPVuHVCxaXe
 1TUwgvWWULzEeGV40UlFqPokZZgE/0kxLbJ8K0LgvejBVFUoQGQvckkfPTtA4VXUcXuu
 s/g2nICIzYcr/UT1/L2Tr8cfLbdTdZeNQ3N5cjV7z6DM06b5HLSbFIvZXHxfr1TJsOds
 NR9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qLAVitcC
Subject: [Buildroot] [PATCH 3/3] package/gstreamer1/gst1-plugins-bad: add
 zxing plugin support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 9 +++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bcb4cb1545..83dcf37b76 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -727,6 +727,15 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
+	bool "zxing"
+	depends on !BR2_STATIC_LIBS # zxing-cpp
+	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
+	select BR2_PACKAGE_ZXING_CPP
+
+comment "zxing plugin needs a toolchain w/ C++, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+
 endif
 
 comment "gst1-plugins-bad needs a toolchain w/ C++"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 14710a2501..78b5096639 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -70,7 +70,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dwasapi2=disabled \
-	-Dzxing=disabled \
 	-Dmagicleap=disabled \
 	-Disac=disabled \
 	-Diqa=disabled \
@@ -802,6 +801,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzxing=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += zxing-cpp
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzxing=disabled
+endif
+
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dgpl=enabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
