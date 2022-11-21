Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3C3C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 806EA40920;
	Mon, 20 Feb 2023 21:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 806EA40920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkBiLs2tJU0H; Mon, 20 Feb 2023 21:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7C1415D5;
	Mon, 20 Feb 2023 21:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D7C1415D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2337D1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E276341594
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E276341594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPAHt3R7k4Ij for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DDD14156D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DDD14156D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BA81828C8; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 21:44:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7928c51bf625333102358ed1c9d84efe3e6bdc01
X-Git-Newrev: b7368099ae9767a57ec72fcfbb29a5d85ac7bcf7
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.1BA81828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl: add upstream
 security fix for CVE-2022-34568
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7368099ae9767a57ec72fcfbb29a5d85ac7bcf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SDL v1.2 was discovered to contain a use-after-free via the XFree function
at /src/video/x11/SDL_x11yuv.c.

https://github.com/advisories/GHSA-wr7h-5wm3-p3h4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-SDL_x11yuv.c-fix-possible-use-after-free.patch | 28 ++++++++++++++++++++++
 package/sdl/sdl.mk                                 |  3 +++
 2 files changed, 31 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
