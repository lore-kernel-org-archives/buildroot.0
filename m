Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43536CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 16:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D6240205;
	Sat, 25 Oct 2025 16:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4Q8E-7fx0Xw; Sat, 25 Oct 2025 16:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2911F40207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2911F40207;
	Sat, 25 Oct 2025 16:58:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 171B3DA1
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 063D0608BB
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOhcmWHJMvxc for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BB76081F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03BB76081F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5B348771D; Sat, 25 Oct 2025 16:58:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 11:34:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12b6b87d59ce1b9b5c21eea44bbb401ee8b9a210
X-Git-Newrev: ebd07998d0b3f5e748aba7a9aabbd7df879bc1a8
X-Patchwork-Hint: ignore
Message-Id: <20251025165814.E5B348771D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgphoto2: fix build with gcc >=
 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebd07998d0b3f5e748aba7a9aabbd7df879bc1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit adds a backported upstream patch to fix the following build
failure:

ptp2/ptp-pack.c:3168:31: note: earlier argument should specify number of elements, later size of each element
ptp2/chdk.c: In function 'yuv_live_to_jpeg':
ptp2/chdk.c:1203:41: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
 1203 |         jpeg_mem_dest (&cinfo, &outbuf, &outlen);
      |                                         ^~~~~~~
      |                                         |
      |                                         uint64_t * {aka long long unsigned int *}
In file included from ptp2/chdk.c:31:
/home/autobuild/autobuild/instance-0/output-1/per-package/libgphoto2/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/jpeglib.h:989:43: note: expected 'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long long unsigned int *'}
  989 |                            unsigned long *outsize);

Fixes:
- https://autobuild.buildroot.org/results/db742e301a401c9f4bdf3c7e8cfde9f0ba1c4558

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...n-length-with-jpeg-jeaders.-fixes-https-g.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
new file mode 100644
index 0000000000..910c9b125a
--- /dev/null
+++ b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
@@ -0,0 +1,39 @@
+From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 4 Dec 2023 13:26:08 +0100
+Subject: [PATCH] align outlen length with jpeg jeaders. fixes
+ https://github.com/gphoto/libgphoto2/issues/941
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5
+---
+ camlibs/ptp2/chdk.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index e1d898f37811..e775ea1d4bbb 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	uint64_t	outlen = 0;
++	unsigned long	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 		sshift = 6;
+ 		dshift = (width/height > 2) ? 6 : 12;
+ 		xshift = 4;
+-	/* Digic 6 cameras: 8 bit per element UYVY,
+-	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
++		/* Digic 6 cameras: 8 bit per element UYVY,
++		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
+ 	} else {
+ 		row_inc = buf_width*2;
+ 		sshift = 4;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
