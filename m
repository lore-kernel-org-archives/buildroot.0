Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020D7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DC941B4E;
	Wed, 20 Jul 2022 21:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DC941B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAnV2iKStnwZ; Wed, 20 Jul 2022 21:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2545441521;
	Wed, 20 Jul 2022 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2545441521
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13BB81C1135
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E22FF60A8C
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E22FF60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwmWdNroTmkH for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:23:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4065F60737
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4065F60737
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6A261840AE; Wed, 20 Jul 2022 21:09:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 23:23:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb77daa909a83d1d5815c27af0900a1b2eb79cc1
X-Git-Newrev: d8358ae1787f661e19dfe968993492c06afaa7b3
X-Patchwork-Hint: ignore
Message-Id: <20220720210950.6A261840AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{webkitgtk,
 wpewebkit}: select subenc for multimedia
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8358ae1787f661e19dfe968993492c06afaa7b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using webkit with multimedia support the subenc element may
be needed, as such we should select the subenc plugin.

Fixes runtime warning:
isGStreamerPluginAvailable: Plugin subenc not found. Please check your GStreamer installation
WebKit wasn't able to find a WebVTT encoder. Subtitles handling will be degraded unless gst-plugins-bad is installed.

See:
https://github.com/WebKit/WebKit/blob/72b59ad50e079037073722bbdf469c0952e399fa/Source/WebCore/platform/graphics/gstreamer/TextCombinerGStreamer.cpp#L221

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index d0c73f3f29..cafe497491 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -97,6 +97,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index a205e6276f..04ed40bd92 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -90,6 +90,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
