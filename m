Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B25C7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 09:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0862781A3B;
	Sun, 22 Jun 2025 09:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhpBf2-PWjug; Sun, 22 Jun 2025 09:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4455B81A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4455B81A6A;
	Sun, 22 Jun 2025 09:43:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 207BCC8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CA440D13
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ae6gIu9OgO-3 for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 09:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138844109E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 138844109E
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:43:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F5C18106C; Sun, 22 Jun 2025 09:43:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 10:31:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 962081259d91fea1e9a59c1af85d9a85ba45d0dd
X-Git-Newrev: 3142a7cf31c08e14c0c5bbf5167ee8f26a7c3b32
X-Patchwork-Hint: ignore
Message-Id: <20250622094336.0F5C18106C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
 OpenCV4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3142a7cf31c08e14c0c5bbf5167ee8f26a7c3b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 30cf7020de..2d65623926 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -297,6 +297,10 @@ endif
 ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv3
+else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
+FFMPEG_CONF_OPTS += --enable-libopencv \
+	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
+FFMPEG_DEPENDENCIES += opencv4
 else
 FFMPEG_CONF_OPTS += --disable-libopencv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
