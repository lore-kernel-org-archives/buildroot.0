Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F496C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5E2240A01;
	Wed,  7 Dec 2022 13:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E2240A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbfPDKgQzHS8; Wed,  7 Dec 2022 13:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF2F04054B;
	Wed,  7 Dec 2022 13:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF2F04054B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9CB01BF95D
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6069402F2
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6069402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5Jz3ERhL_ZM for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:29:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAFF8400D2
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAFF8400D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A84D985D78; Wed,  7 Dec 2022 13:29:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 13:46:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c28a5e0b4246dab4d589b3754d313b33d9171111
X-Git-Newrev: 75822b8b3d191e181d55e8ad2104ec6a052deb63
X-Patchwork-Hint: ignore
Message-Id: <20221207132943.A84D985D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/vlc: fix
 compilation with dav1d 1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=75822b8b3d191e181d55e8ad2104ec6a052deb63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
http://autobuild.buildroot.net/results/a74/a74151c73b5dc613ce327a869105cb93631cbce9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a6ab074b3fe6e5aa2e84da5986d123fd7a42c6e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dav1d-fix-compilation-with-upcoming-dav1d.patch | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch b/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch
new file mode 100644
index 0000000000..74b8645379
--- /dev/null
+++ b/package/vlc/0011-dav1d-fix-compilation-with-upcoming-dav1d.patch
@@ -0,0 +1,88 @@
+From 2202c892c8dc1381b596c53c2ebd3ca680061f95 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Fri, 18 Mar 2022 11:42:49 +0100
+Subject: [PATCH] dav1d: fix compilation with (upcoming) dav1d 1.0
+
+(cherry picked from commit dbf45cea2a8abdfbef897b8a71f3eb782bb1b712) (edited)
+edited:
+- 3.0 has the 128 pixels padding elsewhere
+- 3.0 has an extra parameter for add_integer_with_range()
+- 3.0 was setting i_extra_picture_buffers further down in the code
+- 3.0 uses 16 threads max
+
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+
+Downloaded from upstream commit
+https://code.videolan.org/videolan/vlc/-/commit/2202c892c8dc1381b596c53c2ebd3ca680061f95
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/codec/dav1d.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/modules/codec/dav1d.c b/modules/codec/dav1d.c
+index 039165f52ec..cfabbc27cb3 100644
+--- a/modules/codec/dav1d.c
++++ b/modules/codec/dav1d.c
+@@ -63,10 +63,16 @@ vlc_module_begin ()
+     set_category(CAT_INPUT)
+     set_subcategory(SUBCAT_INPUT_VCODEC)
+ 
++#if DAV1D_API_VERSION_MAJOR >= 6
++    add_integer_with_range("dav1d-thread-frames", 0, 0, DAV1D_MAX_THREADS,
++                THREAD_FRAMES_TEXT, THREAD_FRAMES_LONGTEXT, false)
++    add_obsolete_string("dav1d-thread-tiles") // unused with dav1d 1.0
++#else
+     add_integer_with_range("dav1d-thread-frames", 0, 0, DAV1D_MAX_FRAME_THREADS,
+                 THREAD_FRAMES_TEXT, THREAD_FRAMES_LONGTEXT, false)
+     add_integer_with_range("dav1d-thread-tiles", 0, 0, DAV1D_MAX_TILE_THREADS,
+                 THREAD_TILES_TEXT, THREAD_TILES_LONGTEXT, false)
++#endif
+ vlc_module_end ()
+ 
+ /*****************************************************************************
+@@ -294,6 +300,11 @@ static int OpenDecoder(vlc_object_t *p_this)
+         return VLC_ENOMEM;
+ 
+     dav1d_default_settings(&p_sys->s);
++#if DAV1D_API_VERSION_MAJOR >= 6
++    p_sys->s.n_threads = var_InheritInteger(p_this, "dav1d-thread-frames");
++    if (p_sys->s.n_threads == 0)
++        p_sys->s.n_threads = (i_core_count < 16) ? i_core_count : 16;
++#else
+     p_sys->s.n_tile_threads = var_InheritInteger(p_this, "dav1d-thread-tiles");
+     if (p_sys->s.n_tile_threads == 0)
+         p_sys->s.n_tile_threads =
+@@ -303,6 +314,7 @@ static int OpenDecoder(vlc_object_t *p_this)
+     p_sys->s.n_frame_threads = var_InheritInteger(p_this, "dav1d-thread-frames");
+     if (p_sys->s.n_frame_threads == 0)
+         p_sys->s.n_frame_threads = (i_core_count < 16) ? i_core_count : 16;
++#endif
+     p_sys->s.allocator.cookie = dec;
+     p_sys->s.allocator.alloc_picture_callback = NewPicture;
+     p_sys->s.allocator.release_picture_callback = FreePicture;
+@@ -313,12 +325,20 @@ static int OpenDecoder(vlc_object_t *p_this)
+         return VLC_EGENERIC;
+     }
+ 
++#if DAV1D_API_VERSION_MAJOR >= 6
++    msg_Dbg(p_this, "Using dav1d version %s with %d threads",
++            dav1d_version(), p_sys->s.n_threads);
++
++    dec->i_extra_picture_buffers = (p_sys->s.n_threads - 1);
++#else
+     msg_Dbg(p_this, "Using dav1d version %s with %d/%d frame/tile threads",
+             dav1d_version(), p_sys->s.n_frame_threads, p_sys->s.n_tile_threads);
+ 
++    dec->i_extra_picture_buffers = (p_sys->s.n_frame_threads - 1);
++#endif
++
+     dec->pf_decode = Decode;
+     dec->pf_flush = FlushDecoder;
+-    dec->i_extra_picture_buffers = (p_sys->s.n_frame_threads - 1);
+ 
+     dec->fmt_out.video.i_width = dec->fmt_in.video.i_width;
+     dec->fmt_out.video.i_height = dec->fmt_in.video.i_height;
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
