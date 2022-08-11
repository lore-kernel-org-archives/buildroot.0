Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D10C25B06
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E212404F0;
	Thu, 11 Aug 2022 17:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E212404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zza2vVYPcL0b; Thu, 11 Aug 2022 17:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6FBF4038E;
	Thu, 11 Aug 2022 17:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FBF4038E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5581C116E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A46440BBD
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A46440BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cq4-0ejROcfj for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A3B340BA4
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A3B340BA4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B08A18718A; Thu, 11 Aug 2022 17:19:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:30:59 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 0a19278555ed218c8993bbd2e411019c7d34686b
X-Git-Newrev: 97e19b306b7f41dc1bebd08c71418dd6ab0af9ea
X-Patchwork-Hint: ignore
Message-Id: <20220811171922.B08A18718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/{webkitgtk,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97e19b306b7f41dc1bebd08c71418dd6ab0af9ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit d8358ae1787f661e19dfe968993492c06afaa7b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 2c255693c9..b3a1ada767 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -93,6 +93,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 73ac94a47b..ce016bf74f 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -86,6 +86,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
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
