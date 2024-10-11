Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EDFD0D78D
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 13:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D2561189;
	Fri, 11 Oct 2024 13:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyWsSk5HCbb2; Fri, 11 Oct 2024 13:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD8061187
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD8061187;
	Fri, 11 Oct 2024 13:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3ACA1BF997
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A04F9404FE
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm9FahLK2zzX for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E61B400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E61B400D1
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5749F85D62; Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 14:52:21 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 11d52d7e4d65704c87c6e85b31341ed2a6320f73
X-Git-Newrev: d8210fd0eb28124409acef80f1b2333876660b71
X-Patchwork-Hint: ignore
Message-Id: <20241011130719.5749F85D62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/ffmpeg: fix build
 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8210fd0eb28124409acef80f1b2333876660b71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

ffmpeg builds with `--enable-vaapi` opt made GCC v14 and 32 bit target
will throw an 'Wincompatible-pointer-types' error.

This is a downport of an upstreamed commit but not yet present in any
ffmpeg version that fix the pointer type.

Fixes:
 - http://autobuild.buildroot.org/results/f5f/f5f2d16226ad9500ecf046779d5282ee071a54d3/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 24fc2f9d177b897f0c204f2c6611e6a3ed306a3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
