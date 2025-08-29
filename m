Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F6DCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC2F83BE7;
	Fri, 29 Aug 2025 15:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1k3GvkskbZYX; Fri, 29 Aug 2025 15:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84DA83BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C84DA83BEE;
	Fri, 29 Aug 2025 15:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D334FD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFADA83BEE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_pOFvkAsu-d for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1CF83BE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1CF83BE7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3985C87DCC; Fri, 29 Aug 2025 15:41:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:38:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8db836d2924ca50269f4a2de199cce19cab5a2d7
X-Git-Newrev: c719a73a21ba5b35901e422f899afe5c19bf76fc
X-Patchwork-Hint: ignore
Message-Id: <20250829154101.3985C87DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
 libsoxr
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

commit: https://git.buildroot.net/buildroot/commit/?id=c719a73a21ba5b35901e422f899afe5c19bf76fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that libsoxr no longer depends on ffmpeg, we can actually use
libsoxr in ffmpeg.

See:

  https://trac.ffmpeg.org/wiki/FFmpeg%20and%20the%20SoX%20Resampler

for some details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddf6dbad16..4c841d7a94 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -376,6 +376,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libopenmpt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOXR),y)
+FFMPEG_CONF_OPTS += --enable-libsoxr
+FFMPEG_DEPENDENCIES += libsoxr
+else
+FFMPEG_CONF_OPTS += --disable-libsoxr
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 FFMPEG_CONF_OPTS += --enable-libspeex
 FFMPEG_DEPENDENCIES += speex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
