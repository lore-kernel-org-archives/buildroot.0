Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23033C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CA6610C7
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3CA6610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D3260F2C;
	Wed,  6 Oct 2021 19:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sc6zOnjsjnWV; Wed,  6 Oct 2021 19:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06EBC60F25;
	Wed,  6 Oct 2021 19:32:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0C01BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8112407F9
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Fi6vZlzi_og for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E99407FC
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4309D93465; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e991c2cba6f1a350461a91c9646a20ac7d3853b9
X-Git-Newrev: 7749e73b9acf35a11c9abaae86649c6333def88d
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.4309D93465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: add option to enable
 media-stream
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

commit: https://git.buildroot.net/buildroot/commit/?id=7749e73b9acf35a11c9abaae86649c6333def88d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This has a compile time dependency on gst1-plugins-bad due to
the codecparsers dependency.

We need to prevent the wpe plugin from being selected when wpewebkit
media-stream support is enabled as the wpe plugin requires wpewebkit
which would create a circular dependency with gst1-plugins-bad.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index 50714b4366..5d5b5f744d 100644
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
