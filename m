Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78030C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477B480DD4;
	Sun, 15 Sep 2024 21:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGBNa4WlpK4n; Sun, 15 Sep 2024 21:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E8E7813E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8E7813E7;
	Sun, 15 Sep 2024 21:37:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14FFA1BF95A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1123D40A15
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbwwoBun3B25 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58D340A0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58D340A0B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1B9B83682; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 21:56:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b870057c646a6b7abc822d3ce2ea0f41683420b
X-Git-Newrev: 24fc2f9d177b897f0c204f2c6611e6a3ed306a3d
X-Patchwork-Hint: ignore
Message-Id: <20240915213636.D1B9B83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix build error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24fc2f9d177b897f0c204f2c6611e6a3ed306a3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg builds with `--enable-vaapi` opt made GCC v14 and 32 bit target
will throw an 'Wincompatible-pointer-types' error.

This is a downport of an upstreamed commit but not yet present in any
ffmpeg version that fix the pointer type.

Fixes:
 - http://autobuild.buildroot.org/results/f5f/f5f2d16226ad9500ecf046779d5282ee071a54d3/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...util-hwcontext-vaapi-use-the-correct-type.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
new file mode 100644
index 0000000000..177b4f1885
--- /dev/null
+++ b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
@@ -0,0 +1,28 @@
+From 6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 31 Jul 2024 10:00:54 -0300
+Subject: [PATCH] avutil/hwcontext_vaapi: use the correct type for
+ VASurfaceAttribExternalBuffers.buffers
+
+Should fix ticket #11115.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+Upstream: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libavutil/hwcontext_vaapi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavutil/hwcontext_vaapi.c b/libavutil/hwcontext_vaapi.c
+index 4cb25dd03212e..15fd84aa40679 100644
+--- a/libavutil/hwcontext_vaapi.c
++++ b/libavutil/hwcontext_vaapi.c
+@@ -1225,7 +1225,7 @@ static int vaapi_map_from_drm(AVHWFramesContext *src_fc, AVFrame *dst,
+ 
+     if (!use_prime2 || vas != VA_STATUS_SUCCESS) {
+         int k;
+-        unsigned long buffer_handle;
++        uintptr_t buffer_handle;
+         VASurfaceAttribExternalBuffers buffer_desc;
+         VASurfaceAttrib buffer_attrs[2] = {
+             {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
