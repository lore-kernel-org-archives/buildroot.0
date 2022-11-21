Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78680C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 07:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D4E60E41;
	Mon, 21 Nov 2022 07:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D4E60E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDe3OudOqw6Z; Mon, 21 Nov 2022 07:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED1D60E43;
	Mon, 21 Nov 2022 07:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED1D60E43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA35F1BF3EB
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 07:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE5C040097
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 07:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE5C040097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Djj3T1sktKA for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 07:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB7D415A9
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DB7D415A9
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 07:32:56 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 719A5CD3F7
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 07:24:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C0C3240005;
 Mon, 21 Nov 2022 07:24:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ox1Ac-00GhXB-A5; Mon, 21 Nov 2022 08:24:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 08:24:43 +0100
Message-Id: <20221121072444.3980541-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sdl: add upstream security fix for
 CVE-2022-34568
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SDL v1.2 was discovered to contain a use-after-free via the XFree function
at /src/video/x11/SDL_x11yuv.c.

https://github.com/advisories/GHSA-wr7h-5wm3-p3h4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x11yuv.c-fix-possible-use-after-free.patch | 28 +++++++++++++++++++
 package/sdl/sdl.mk                            |  3 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch

diff --git a/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
new file mode 100644
index 0000000000..d7858d0f96
--- /dev/null
+++ b/package/sdl/0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
@@ -0,0 +1,28 @@
+From d7e00208738a0bc6af302723fe64908ac35b777b Mon Sep 17 00:00:00 2001
+From: Ozkan Sezer <sezeroz@gmail.com>
+Date: Sat, 18 Jun 2022 14:55:00 +0300
+Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
+
+Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/video/x11/SDL_x11yuv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/video/x11/SDL_x11yuv.c b/src/video/x11/SDL_x11yuv.c
+index 62698dfd..0d5754e3 100644
+--- a/src/video/x11/SDL_x11yuv.c
++++ b/src/video/x11/SDL_x11yuv.c
+@@ -374,8 +374,8 @@ SDL_Overlay *X11_CreateYUVOverlay(_THIS, int width, int height, Uint32 format, S
+ #ifdef PITCH_WORKAROUND
+ 		if ( hwdata->image != NULL && hwdata->image->pitches[0] != (width*bpp) ) {
+ 			/* Ajust overlay width according to pitch */ 
+-			XFree(hwdata->image);
+ 			width = hwdata->image->pitches[0] / bpp;
++			XFree(hwdata->image);
+ 			hwdata->image = SDL_NAME(XvCreateImage)(GFX_Display, xv_port, format,
+ 								0, width, height);
+ 		}
+-- 
+2.30.2
+
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 7389cd3edb..462600debb 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -13,6 +13,9 @@ SDL_CPE_ID_VENDOR = libsdl
 SDL_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL_INSTALL_STAGING = YES
 
+# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
+SDL_IGNORE_CVES += CVE-2022-34568
+
 # we're patching configure.in, but package cannot autoreconf with our version of
 # autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
