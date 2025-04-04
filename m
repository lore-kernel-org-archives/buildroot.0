Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1482C369A1
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D6080E45;
	Fri,  4 Apr 2025 16:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErXbSNanU1yu; Fri,  4 Apr 2025 16:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B042E8114A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B042E8114A;
	Fri,  4 Apr 2025 16:55:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BF11C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63271812ED
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_L7YssJyq1g for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.11;
 helo=smtp-190b.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A10C80B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A10C80B71
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch
 [185.125.25.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A10C80B71
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0V5tXPz2y;
 Fri,  4 Apr 2025 18:48:10 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0V1stZzl3w; Fri,  4 Apr 2025 18:48:10 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:35 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-4-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 4/9] package/libcamera: improve future
 reproducibility by forcing auto features to disabled
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

meson allows to force all features set to "auto" to default to disabled
except if explicitly enabled via the auto_features argument, c.f.
https://mesonbuild.com/Build-options.html#features

"""
If the value of a feature option is set to auto, that value is
overridden by the global auto_features option (which defaults to auto).
This is intended to be used by packagers who want to have full control
on which dependencies are required and which are disabled, and not rely
on build-deps being installed (at the right version) to get a feature
enabled.
"""

The only auto feature that we hadn't disabled explicitly is the
gstreamer plugin. It is however expected that this wasn't a mistake as
the dependencies for the gstreamer pluging wouldn't have been met
thanks to the explicit LIBCAMERA_DEPENDENCIES we have based on the
presence of the gstreamer symbols in the global config.

This should make it less likely for future releases of libcamera to
regress in terms of reproducibility because of "auto" features (though
changes from "auto" to "enabled" wouldn't be caught and would be
susceptible to race conditions with their dependencies in case they
aren't properly specified and built after libcamera is).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/libcamera.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 0f52f08e39ab885a4989d337aec13fc3f88d654f..ac5c12ff72d34ec04fba8511bfcb492df17ec284 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -16,9 +16,9 @@ LIBCAMERA_DEPENDENCIES = \
 	libyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
+	-Dauto_features=disabled \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
-	-Dqcam=disabled \
 	-Dtest=false \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
@@ -48,8 +48,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
 LIBCAMERA_DEPENDENCIES += python3 python-pybind
 LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
-else
-LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
@@ -71,8 +69,6 @@ LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELIN
 ifeq ($(BR2_PACKAGE_LIBCAMERA_COMPLIANCE),y)
 LIBCAMERA_DEPENDENCIES += gtest libevent
 LIBCAMERA_CONF_OPTS += -Dlc-compliance=enabled
-else
-LIBCAMERA_CONF_OPTS += -Dlc-compliance=disabled
 endif
 
 # gstreamer-video-1.0, gstreamer-allocators-1.0
@@ -84,8 +80,6 @@ endif
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
-else
-LIBCAMERA_CONF_OPTS += -Dcam=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
@@ -95,15 +89,11 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCAMERA_CONF_OPTS += -Dudev=enabled
 LIBCAMERA_DEPENDENCIES += udev
-else
-LIBCAMERA_CONF_OPTS += -Dudev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LIBCAMERA_CONF_OPTS += -Dtracing=enabled
 LIBCAMERA_DEPENDENCIES += lttng-libust
-else
-LIBCAMERA_CONF_OPTS += -Dtracing=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
