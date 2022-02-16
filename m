Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C207FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859D560C2E;
	Wed, 16 Feb 2022 21:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhogKks9R7we; Wed, 16 Feb 2022 21:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E4660C29;
	Wed, 16 Feb 2022 21:51:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4FF91BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABD8E4088B
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-rFuZk2DCi8 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 216F740469
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 506F983777; Wed, 16 Feb 2022 21:41:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:38:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e253e41ce2e50d3af689a40b4dd0f5c615985787
X-Git-Newrev: d7b999e947fae16ddbe8857640c7e87433a1d54b
X-Patchwork-Hint: ignore
Message-Id: <20220216214135.506F983777@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base: fix
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7b999e947fae16ddbe8857640c7e87433a1d54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 1.20.0 in commit 801131157dcef2c97e947a1d3e8c9bfa7aa3d870:

../gst-libs/gst/video/video-converter.c: In function 'convert_I420_v210':
../gst-libs/gst/video/video-converter.c:3771:7: error: 'for' loop initial declarations are only allowed in C99 mode
       for (int j = width * 4 - 1; j >= 0; j--) {
       ^

Fixes:
 - http://autobuild.buildroot.org/results/c4b1449f35debcbabff7e42abe239695d4ad4d21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 68281738fa..08aac850cd 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -11,6 +11,8 @@ GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.1+
 
+GST1_PLUGINS_BASE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
