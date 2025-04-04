Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FDBC3601A
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CECC084073;
	Fri,  4 Apr 2025 16:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjsaPwNDLBju; Fri,  4 Apr 2025 16:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BA7D84848
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA7D84848;
	Fri,  4 Apr 2025 16:48:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD02117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D83441E92
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxHMYrpNXl7c for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.13;
 helo=smtp-190d.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECCEF40F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCEF40F3B
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [185.125.25.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECCEF40F3B
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:12 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0W1m9tz30;
 Fri,  4 Apr 2025 18:48:11 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0V5mxFzhXD; Fri,  4 Apr 2025 18:48:10 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:36 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-5-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 5/9] package/libcamera: improve reproducibility
 for optional dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

libcamera has some optional dependencies that automatically detected at
build time.

To improve reproducibility, we should add a dependency on those optional
dependencies if the symbols that build them are enabled so that the
order in which packages are built does not influence the libcamera
package.

Note that the optional libyuv dependency isn't added as:
1) it is only used for the virtual pipeline and the android feature,
   both of which are disabled/not supported right now,
2) libcamera has it in a submodule if missing (though if that works with
   Buildroot is to be determined),
3) adding the dependency isn't enough as meson somehow doesn't find the
   dependency,

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/libcamera.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index ac5c12ff72d34ec04fba8511bfcb492df17ec284..b5b17a5c946490e9798073f51fc03e939a4c8dc1 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -82,6 +82,27 @@ LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+# Optional dependency on libdw
+LIBCAMERA_DEPENDENCIES += elfutils
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBCAMERA_DEPENDENCIES += jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+LIBCAMERA_DEPENDENCIES += libdrm
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+LIBCAMERA_DEPENDENCIES += libunwind
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2),y)
+LIBCAMERA_DEPENDENCIES += sdl2
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LIBCAMERA_DEPENDENCIES += tiff
 endif

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
