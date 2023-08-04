Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA26C00528
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 11:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C9960706;
	Fri,  4 Aug 2023 11:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C9960706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2TlTTYQ2Aa5; Fri,  4 Aug 2023 11:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0C460B06;
	Fri,  4 Aug 2023 11:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0C460B06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE8E1BF279
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 11:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93EB841C50
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 11:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93EB841C50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaJA2EEnqNEb for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 11:33:18 +0000 (UTC)
X-Greylist: delayed 1225 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 04 Aug 2023 11:33:18 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4293B4058D
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4293B4058D
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 11:33:18 +0000 (UTC)
Received: from [223.38.85.202] (helo=pony)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1qRsjh-00AYfZ-0y; Fri, 04 Aug 2023 12:12:49 +0100
Message-ID: <049052a13b668b1243c1a035955b57e2b12c90dc.camel@codethink.co.uk>
To: buildroot@buildroot.org
Date: Fri, 04 Aug 2023 20:12:43 +0900
Organization: Codethink
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mesa3d: Allow building patent
 encumbered video codecs
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
From: Tristan van Berkom via buildroot <buildroot@buildroot.org>
Reply-To: Tristan van Berkom <tristan.vanberkom@codethink.co.uk>
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds some options to allow building the patent encumbered
codecs in mesa, such as H.264/H.265 encoders/decoders which are useful
for hardware accelerated decoding via libva/gstreamer.

These codecs are now disabled by default in upstream mesa as per:
  https://gitlab.freedesktop.org/mesa/mesa/-/commit/7d969fe9e91e39e03041cdfac69bf33337bc2c96

Signed-off-by: Tristan van Berkom <tristan.vanberkom@codethink.co.uk>
---
 package/mesa3d/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 package/mesa3d/mesa3d.mk | 11 +++++++++++
 2 files changed, 47 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c7ee2a8db0..7f1d74fe9a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -56,6 +56,42 @@ config BR2_PACKAGE_MESA3D_OPENCL
        select BR2_PACKAGE_LIBCLC
        select BR2_PACKAGE_HAS_LIBOPENCL
 
+# inform the .mk file of video codec selection
+config BR2_PACKAGE_MESA3D_VIDEO_CODEC
+       bool
+
+comment "Patent encumbered video codecs"
+
+config BR2_PACKAGE_MESA3D_VIDEO_CODEC_VC1DEC
+       bool "VC-1 decoder"
+       select BR2_PACKAGE_MESA3D_VIDEO_CODEC
+       help
+         Decoder module for VC-1 video coding
+
+config BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264DEC
+       bool "H.264 decoder"
+       select BR2_PACKAGE_MESA3D_VIDEO_CODEC
+       help
+         Decoder module for H.264 video coding
+
+config BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264ENC
+       bool "H.264 encoder"
+       select BR2_PACKAGE_MESA3D_VIDEO_CODEC
+       help
+         Encoder module for H.264 video coding
+
+config BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265DEC
+       bool "H.265 decoder"
+       select BR2_PACKAGE_MESA3D_VIDEO_CODEC
+       help
+         Decoder module for H.265 video coding
+
+config BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265ENC
+       bool "H.265 encoder"
+       select BR2_PACKAGE_MESA3D_VIDEO_CODEC
+       help
+         Encoder module for H.265 video coding
+
 # inform the .mk file of gallium, dri, dri3 or vulkan driver selection
 config BR2_PACKAGE_MESA3D_DRI3
        bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6fa5c1c686..149e6c2e7f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -98,6 +98,17 @@ else
 MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
 endif
 
+# Video codecs (patent encumbered)
+MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_VC1DEC)  += vc1dec
+MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264DEC) += h264dec
+MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264ENC) += h264enc
+MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265DEC) += h265dec
+MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265ENC) += h265enc
+
+ifeq ($(BR2_PACKAGE_MESA3D_VIDEO_CODEC),y)
+MESA3D_CONF_OPTS += -Dvideo-codecs=$(subst $(space),$(comma),$(MESA3D_VIDEO_CODECS-y))
+endif
+
 # Drivers
 
 #Gallium Drivers
-- 
2.25.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
