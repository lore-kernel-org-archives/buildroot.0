Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85DFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553B660F0B;
	Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553B660F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4GxDgFj2B1y; Sat, 25 Jun 2022 06:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64B7460F0D;
	Sat, 25 Jun 2022 06:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64B7460F0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 166211BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F296C8476E
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F296C8476E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBDecLftrFLl for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BFB484387
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BFB484387
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1D15087556; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:37:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 094b545270e14c8dacc6b6f9439d54d77bdc963a
X-Git-Newrev: e82614287407f18c1029bb26e49b0bcdbea2bf95
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.1D15087556@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{webkitgtk,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e82614287407f18c1029bb26e49b0bcdbea2bf95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
