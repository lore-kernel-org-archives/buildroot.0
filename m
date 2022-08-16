Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB482C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F1284010D;
	Tue, 16 Aug 2022 21:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1284010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Afqiybo2uLLC; Tue, 16 Aug 2022 21:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CACE4013E;
	Tue, 16 Aug 2022 21:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CACE4013E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE3C1BF84C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 565AD4013E
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 565AD4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r48UgseAZ6-9 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:05:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D860B4010D
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 21:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D860B4010D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7F768878E4; Tue, 16 Aug 2022 20:50:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 22:59:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3abcae9d56ca35eb734be3b1967fbff63b5f9bc9
X-Git-Newrev: f3fc07e421a7bb479d2b872f87985b8f37ed931c
X-Patchwork-Hint: ignore
Message-Id: <20220816205058.7F768878E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5/qt5webkit:
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
Content-Type: multipart/mixed; boundary="===============5762943205388545721=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5762943205388545721==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f3fc07e421a7bb479d2b872f87985b8f37ed931c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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

--===============5762943205388545721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5762943205388545721==--
