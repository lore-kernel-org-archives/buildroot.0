Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169CDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A15460DF6;
	Sat, 15 Oct 2022 23:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A15460DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QJ6IGHkiQib; Sat, 15 Oct 2022 23:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC64160DED;
	Sat, 15 Oct 2022 23:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC64160DED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1A31BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F4260DED
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F4260DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zcW3FBAfJxf for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6160C60DE5
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6160C60DE5
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:40 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id i65so6602673ioa.0
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qtsz4rao8lBSICog3NsmDQNzcP9KC+e5n4pRCKKuZHI=;
 b=coD8oorYu+MqEMmUpW2yWSQnU4F9VRWGrvJQut0bo1GKjPiUWk18ICzmczLKCs4zHH
 CeziEXIIVKdKiArB1EPT+VHW/OvD4ViLFXJ3V7rkENB/fFWml9/q/ew6YehwUBy45Y4l
 OzxvEV/DrvBWHVcT1u1u6wcjWTAG4jf1xSe5DzvufwMegHAFFW7zZ90ep7etLDGLNOF5
 +JLNxKZuZz8cZfyUfCD/R0CP6q0b3Onsl8iikRgfb4RmquPICGY14H8Zhk+23fq5RgbJ
 YJkBcfxDIoRp9+cKToyrqTd/O4E3HWNijuH6Dcs1kJF6YK8kb5kABfwicenFubuNSRFN
 BoLA==
X-Gm-Message-State: ACrzQf3Wc+/wsyjgfl1VqWMk5AVYu1tm0JiscXIeA0HbnaxQ34bQZs+J
 7EviSElVRUqMq1vDcJ1wLDtr+4nMka6tzw==
X-Google-Smtp-Source: AMsMyM75PiVdO48/eqh+GaeKlmEJ/IOsTqZSPBdRl4Tzt4CaeRPhz1PVOihVxp9J1qwxzyZziv1LKA==
X-Received: by 2002:a05:6602:2b94:b0:6a4:7b57:ecfb with SMTP id
 r20-20020a0566022b9400b006a47b57ecfbmr1850528iov.8.1665875139171; 
 Sat, 15 Oct 2022 16:05:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:24 -0600
Message-Id: <20221015230534.4016536-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qtsz4rao8lBSICog3NsmDQNzcP9KC+e5n4pRCKKuZHI=;
 b=q2j71S0EwQ3KGN1uGPFfTm9TjvvZdGKZaeDhOKluPobKwIjqPJyOa0oXixr5q1I8Lq
 0aGyczRlrzxH3+m1Fu0Y44paFZp7w8ri9Au3yECfhUqTlm9w3yHbxCtcHnRfYLBbulq/
 Z5Crimuexo63gLE8RYZzR0wTMu6Z7ddWw1QL8u9Zw/wiasYpZNMUtd2oJU65au13y0my
 mnl9LjGlaon0orl8lccHK8itAIe3gCiL0qyPHlMYWnIZOImD+7sBeFCstwVMc4TjnGG4
 mioaG4LFUwJrBnHlIyJZy3f50gClJhfTHX2BQwKp1z2lxCnBxXBjbjnsDc2beeOsRWeo
 64dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q2j71S0E
Subject: [Buildroot] [PATCH 02/12] package/gst1-plugins-base: bump version
 to 1.20.4
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 105708f1da..5c729d832f 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.3.tar.xz.sha256sum
-sha256  7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f  gst-plugins-base-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.4.tar.xz.sha256sum
+sha256  8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225  gst-plugins-base-1.20.4.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index c244a0c621..d225cdf910 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.20.3
+GST1_PLUGINS_BASE_VERSION = 1.20.4
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
