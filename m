Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A8EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1772360F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1772360F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD6A7837BC;
	Sat,  9 Oct 2021 12:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uctfZduJEl6U; Sat,  9 Oct 2021 12:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC3A838D7;
	Sat,  9 Oct 2021 12:03:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D43231BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD8994068C
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhm4OqT3sD3I for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09B9F40685
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3ED629359A; Sat,  9 Oct 2021 12:00:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:26:52 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 92c89a5df3a0c043b9531d593c4c6d4f35917dff
X-Git-Newrev: 3c00c226e01f3f8d22ff62a41e56c46183b0c561
X-Patchwork-Hint: ignore
Message-Id: <20211009120015.3ED629359A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/wpewebkit: add
 option to enable media-stream
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c00c226e01f3f8d22ff62a41e56c46183b0c561
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

This has a compile time dependency on gst1-plugins-bad due to
the codecparsers dependency.

We need to prevent the wpe plugin from being selected when wpewebkit
media-stream support is enabled as the wpe plugin requires wpewebkit
which would create a circular dependency with gst1-plugins-bad.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7749e73b9acf35a11c9abaae86649c6333def88d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++++
 package/wpewebkit/Config.in                   | 5 +++++
 package/wpewebkit/wpewebkit.mk                | 7 +++++++
 3 files changed, 18 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index ba20da7a2d..1204a65681 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -647,11 +647,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	default y
 	depends on BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	depends on !BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
 
 comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
 	depends on !BR2_PACKAGE_WPEWEBKIT \
 		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
+comment "wpe is incompatible w/ wpewebkit media-stream support"
+	depends on BR2_PACKAGE_WPEWEBKIT
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	depends on BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS
 	bool "v4l2codecs"
 	depends on BR2_PACKAGE_HAS_UDEV # libgudev
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04b2bf3beb..6fc1e668fd 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -107,6 +107,11 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
 if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
+config BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
+	bool "media-stream support"
+	help
+	  This option enables media-stream support.
+
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5c5e6625f8..9ad569a472 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -46,6 +46,13 @@ WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_WEB_AUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=ON
+WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
