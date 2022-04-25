Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0FDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1A881775;
	Mon, 25 Apr 2022 19:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZelFPOAZZf_W; Mon, 25 Apr 2022 19:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E14781756;
	Mon, 25 Apr 2022 19:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E92561BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7AA860D61
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEvSjgosHRqC for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 302BA60BDE
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0959A8437E; Mon, 25 Apr 2022 19:25:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:10:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7f72651254ba24efc5faea743f1ce34d9ef6ed5
X-Git-Newrev: 288353ec746d91dd84e6abe76bf424909db82d1b
X-Patchwork-Hint: ignore
Message-Id: <20220425192518.0959A8437E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=288353ec746d91dd84e6abe76bf424909db82d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 1.20.0 in commit 34317969278d7b6d923d4889fb4235f112b2b201:

../ext/soup/gstsouploader.c: In function 'gst_soup_load_library':
../ext/soup/gstsouploader.c:219:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (guint i = 0; i < len; i++) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/21792a9839d9722815075569123df8747fc450e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 1168feb293..2b6cf769aa 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -10,6 +10,7 @@ GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 
+GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_GOOD_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
