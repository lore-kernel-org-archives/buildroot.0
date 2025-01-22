Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1162CC02182
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C905640728;
	Wed, 22 Jan 2025 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i8GeCv9qOVr; Wed, 22 Jan 2025 20:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B05934078B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B05934078B;
	Wed, 22 Jan 2025 20:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A9E01DA8
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E644060C
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDm14h0sPSEj for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 20:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A0CB403DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A0CB403DA
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:59:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45C9786115; Wed, 22 Jan 2025 20:59:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 21:49:33 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 477c35f036746495fef846883f19fd8877b9c7c2
X-Git-Newrev: 7457eb49fcb8a3e2ed384b15f82c2cc719e69431
X-Patchwork-Hint: ignore
Message-Id: <20250122205936.45C9786115@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/ffmpeg: add
 optional dependency to libfribidi
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

commit: https://git.buildroot.net/buildroot/commit/?id=7457eb49fcb8a3e2ed384b15f82c2cc719e69431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3181a1b572ba19f0221d3ee34933b710a256f5e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index dd98756c2a..1b6b9e7693 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -407,6 +407,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libharfbuzz
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+FFMPEG_CONF_OPTS += --enable-libfribidi
+FFMPEG_DEPENDENCIES += libfribidi
+else
+FFMPEG_CONF_OPTS += --disable-libfribidi
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 FFMPEG_CONF_OPTS += --enable-libopenjpeg
 FFMPEG_DEPENDENCIES += openjpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
