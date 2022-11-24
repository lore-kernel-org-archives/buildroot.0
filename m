Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 09:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32B0D410BD;
	Thu, 24 Nov 2022 09:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B0D410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAq_jN364Wzy; Thu, 24 Nov 2022 09:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B57410BB;
	Thu, 24 Nov 2022 09:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B57410BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E25C31BF616
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 09:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD86060B2A
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 09:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD86060B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wP-dwMDhsiu for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 09:16:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D6F60AE3
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 09:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D6F60AE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5DFC844BD; Thu, 24 Nov 2022 09:16:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 10:13:26 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e8c625c01e6ee0b0d6cb9360859d0bac5f151a39
X-Git-Newrev: 75fbc14769b6097e75572008a3dce0dc446c2a7a
X-Patchwork-Hint: ignore
Message-Id: <20221124091640.C5DFC844BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/sdl: add upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=75fbc14769b6097e75572008a3dce0dc446c2a7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

SDL v1.2 was discovered to contain a use-after-free via the XFree function
at /src/video/x11/SDL_x11yuv.c.

https://github.com/advisories/GHSA-wr7h-5wm3-p3h4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b7368099ae9767a57ec72fcfbb29a5d85ac7bcf7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
