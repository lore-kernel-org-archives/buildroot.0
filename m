Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D58DC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0CDA60B6E;
	Tue, 16 Aug 2022 21:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0CDA60B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pKSQBEd0DyO; Tue, 16 Aug 2022 21:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D471860ADD;
	Tue, 16 Aug 2022 21:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D471860ADD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AACFC1BF84C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9363A60B4B
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9363A60B4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GkTDdwUFXj3C for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:05:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6A7560ADD
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A7560ADD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 71437878EC; Tue, 16 Aug 2022 20:51:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 22:59:10 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: de9aa59da6d940180dd7af3bc41d424eab5d96ec
X-Git-Newrev: 56fdf0d2ca0cd60decd0f9d75262a79a21063056
X-Patchwork-Hint: ignore
Message-Id: <20220816205110.71437878EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/qt5/qt5webkit:
 backport upstream fix for GStreamer 1.19.x compatibility
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
Content-Type: multipart/mixed; boundary="===============0405534234771883654=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0405534234771883654==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=56fdf0d2ca0cd60decd0f9d75262a79a21063056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

In GStreamer commit 0a657d6db5ba912b13092a907ea507638cd01cf9, merged
in Gstreamer 1.19.x, the GstAppSinkCallbacks structure was extended
with another field calle new_event. This requires an update in the
WebKit code, without which we have a build failure:

    platform/audio/gstreamer/AudioFileReaderGStreamer.cpp:234:5: error: braces around scalar initializer for type ‘gboolean (*)(GstAppSink*, gpointer) {aka int (*)(_GstAppSink*, void*)}’

There are no autobuilder failures, but the issue could be reproduced
using the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBKIT=y

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[Thomas: find the actual upstream fix and use that, improve the
explanation about the issue in the commit message]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bb50b821702841fdc75bf8151555cd401f764f07)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-to-AppSinkCallbacks-struct-growth-https.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/qt5/qt5webkit/0006-Warnings-due-to-AppSinkCallbacks-struct-growth-https.patch b/package/qt5/qt5webkit/0006-Warnings-due-to-AppSinkCallbacks-struct-growth-https.patch
new file mode 100644
index 0000000000..610d99e35d
--- /dev/null
+++ b/package/qt5/qt5webkit/0006-Warnings-due-to-AppSinkCallbacks-struct-growth-https.patch
@@ -0,0 +1,39 @@
+From 53d5bbf4d597a2fcb26149fab3185a3db09529af Mon Sep 17 00:00:00 2001
+From: Philippe Normand <pnormand@igalia.com>
+Date: Fri, 23 Jul 2021 15:38:29 +0000
+Subject: [PATCH] Warnings due to AppSinkCallbacks struct growth
+ https://bugs.webkit.org/show_bug.cgi?id=228229
+
+Patch by Philippe Normand <pnormand@igalia.com> on 2021-07-23
+Reviewed by Xabier Rodriguez-Calvar.
+
+A new callback was added, for event notifications.
+
+Canonical link: https://commits.webkit.org/239911@main
+git-svn-id: https://svn.webkit.org/repository/webkit/trunk@280243268f45cc-cd09-0410-ab3c-d52691b4dbfc
+[Thomas: backported from upstream, only the part touching
+Source/WebCore/platform/audio/gstreamer/AudioFileReaderGStreamer.cpp
+as other parts are not relevant]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../platform/audio/gstreamer/AudioFileReaderGStreamer.cpp     | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/WebCore/platform/audio/gstreamer/AudioFileReaderGStreamer.cpp b/Source/WebCore/platform/audio/gstreamer/AudioFileReaderGStreamer.cpp
+index 2f24c0cf5..dd9d91cf3 100644
+--- a/Source/WebCore/platform/audio/gstreamer/AudioFileReaderGStreamer.cpp
++++ b/Source/WebCore/platform/audio/gstreamer/AudioFileReaderGStreamer.cpp
+@@ -230,6 +230,10 @@ void AudioFileReader::handleNewDeinterleavePad(GstPad* pad)
+         [](GstAppSink* sink, gpointer userData) -> GstFlowReturn {
+             return static_cast<AudioFileReader*>(userData)->handleSample(sink);
+         },
++#if GST_CHECK_VERSION(1, 19, 1)
++        // new_event
++        nullptr,
++#endif
+         { nullptr }
+     };
+     gst_app_sink_set_callbacks(GST_APP_SINK(sink), &callbacks, this, 0);
+-- 
+2.37.1
+

--===============0405534234771883654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0405534234771883654==--
