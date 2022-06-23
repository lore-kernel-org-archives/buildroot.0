Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4EEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 04:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6F8846C8;
	Thu, 23 Jun 2022 04:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6F8846C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bX95QrEl905R; Thu, 23 Jun 2022 04:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 005C0846BE;
	Thu, 23 Jun 2022 04:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005C0846BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C00C1BF94D
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 04:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35C4942413
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 04:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C4942413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWMgddF-RwGF for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 04:55:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD554240E
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDD554240E
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 04:55:33 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h85so1795445iof.4
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWWnuxJgL9b429hkkPYTfnN2M/VMSuBEotgtEMqGvFo=;
 b=VeXjcJYXz4g9dO3WgBKi1ykabDUg9yVR/hqsB3NikU2zmaS0yUjgDydom2VDjyiJhB
 nWF2BysIGN9pKbzLZ1Mj3Gz0Oo3vFo+QANwStdiVw89breCLPvkCbEG6mAN2yvLBrNES
 fRFE0IGiZjSECDzvb6zKKQcI7YfkuC4OhU1Sdv3eg6bmD6cxO7MMOn9LeW3npEhw3D44
 zywxh4xg/1OD/f+W9t56og5iEdFZPGtMB1gxBhQhogFjsgZeG+9bELhbhWjH1S4xE5Hk
 0J44wvZ+Segb6wpVHo7TZJYwBfjQY54tWx2kcyYqOqCEL74Nsm5Ofh/3qDzOIf0/nzA4
 PdIQ==
X-Gm-Message-State: AJIora+ZJc3iXQiaIdFpAr9AGdSvhR0jBQP+xP19xU+5s6Na82PEL4fY
 MHbzXocMFVg+zEGYRyXfKE5EUNaVaY0=
X-Google-Smtp-Source: AGRyM1tksCQRCGZdYddiwsM8JRxqbToRby+2jxiXDKDNvXWETvvXjbRYbqJpaJYdLcVkfXNzsPIliA==
X-Received: by 2002:a05:6638:2684:b0:331:c326:93d6 with SMTP id
 o4-20020a056638268400b00331c32693d6mr4389377jat.148.1655960132821; 
 Wed, 22 Jun 2022 21:55:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 e16-20020a926910000000b002d3bb071d5bsm1515324ilc.0.2022.06.22.21.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 21:55:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:55:26 -0600
Message-Id: <20220623045526.2152211-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWWnuxJgL9b429hkkPYTfnN2M/VMSuBEotgtEMqGvFo=;
 b=JNVMrSkHsBv4WzAlTBwleAS9d3ZHsMQvdBLZh7AP4g4S4j2oX5xil8/zOufBcZ6aKq
 2TR+wFYgJyqKO0DNVTNlFMf34rlpxbBB/48duGeV9TU2/DxfSLVyJlJ9mRss0MIcaOBi
 4tHvTP3lGTSxQur0oc6XLww0b7YD+Bx6d9GEBrHpNUjOyd/hIZfhPgeYZjZiVJa0lNqa
 2qCHzU9Bl4iBdyBgfejsIu/Ud9I1HW7DUqX1CColHzItMuXASFjLka/d1ByQuWsoC/9K
 lytTBjYLERHj7W8yzsKB5//eB5uYrrfKIr+f25xq5AD3+TeU2NAsYg0fIPv0e1Twu1RR
 Wx+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JNVMrSkH
Subject: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select debugutils for multimedia
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using webkit with multimedia support the fakevideosink element
is used in some places, as such we should select debugutils which
provides fakevideosink when building with multimedia support.

See:
https://github.com/WebKit/WebKit/blob/12086bcde7a296a07dbb4ac6d2ff0030b297305a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamer.cpp#L3863

Additionally webkit may also use the fpsdisplaysink element which
is also provided by debugutils.

See:
https://github.com/WebKit/WebKit/blob/12086bcde7a296a07dbb4ac6d2ff0030b297305a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamer.cpp#L3897

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 052800c8cf..2575108363 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -95,6 +95,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 8e80c73302..f50e0da21c 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -88,6 +88,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
