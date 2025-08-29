Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130AECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD18183C1D;
	Fri, 29 Aug 2025 15:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWCjVKtZIGbl; Fri, 29 Aug 2025 15:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E669B83DDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E669B83DDD;
	Fri, 29 Aug 2025 15:41:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F3C6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC88E4157E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EayyRubEXrDO for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4472E40735
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4472E40735
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FC7487DCB; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:38:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bf2a854f93c6d5d6b230a3bf2a661b1e9a9b245
X-Git-Newrev: 8db836d2924ca50269f4a2de199cce19cab5a2d7
X-Patchwork-Hint: ignore
Message-Id: <20250829154101.2FC7487DCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Reapply "package/ffmpeg: add support for
 pulseaudio"
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

commit: https://git.buildroot.net/buildroot/commit/?id=8db836d2924ca50269f4a2de199cce19cab5a2d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit fecc337d21f337a30ef7f9f448683d99c01fc245,
re-adding optional support for pulseuadio in ffmpeg.

This is possible now that the circular dependency:

  pulseaudio -> libsoxr -> ffmpeg -> pulseaudio

has been broken between libsoxr and ffmpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d7fce41369..ddf6dbad16 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -92,6 +92,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libjack
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+FFMPEG_DEPENDENCIES += pulseaudio
+FFMPEG_CONF_OPTS += --enable-libpulse
+else
+FFMPEG_CONF_OPTS += --disable-libpulse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
