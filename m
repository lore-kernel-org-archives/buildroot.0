Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F44C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F71483A6C;
	Thu, 17 Jul 2025 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcZ-JymcvM-m; Thu, 17 Jul 2025 19:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F6883B76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F6883B76;
	Thu, 17 Jul 2025 19:16:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 198D5DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 167A740438
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlpd6hUP_ceC for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC1440427
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC1440427
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:16:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1493A866FA; Thu, 17 Jul 2025 19:16:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 21:12:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 413b9774a4bceda35c4e0c67f4d5aea78ee38924
X-Git-Newrev: fecc337d21f337a30ef7f9f448683d99c01fc245
X-Patchwork-Hint: ignore
Message-Id: <20250717191640.1493A866FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/ffmpeg: add support for
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fecc337d21f337a30ef7f9f448683d99c01fc245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e44aff6b1b1a5237b3f5cae019982370671dbd42 which added
support for linking ffmpeg against libpulse if it is present to provide
libavdevice support for the PulseAudio protocol. However, it turns out
that this creates a dependency cycle when BR2_PACKAGE_LIBSOXR is
enabled, since the pulseaudio daemon can use libsoxr for resampling and
libsoxr can use the FFT implementation from ffmpeg.

Resolving this would probably mean breaking up the pulseaudio package
into the client libraries and the daemon proper (a standalone libpulse
without the daemon is still useful since it can talk to a remote daemon
via the network or more likely today talk to a local instance of
PipeWire, which also implements the PulseAudio protocol).

For now, break the dependency cycle by reverting to the original state
(no pulseaudio client support in ffmpeg).

Reported-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9ba7ac0f61..2d65623926 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -94,13 +94,6 @@ else
 FFMPEG_CONF_OPTS += --disable-libjack
 endif
 
-ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-FFMPEG_DEPENDENCIES += pulseaudio
-FFMPEG_CONF_OPTS += --enable-libpulse
-else
-FFMPEG_CONF_OPTS += --disable-libpulse
-endif
-
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
