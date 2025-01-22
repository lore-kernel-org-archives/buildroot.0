Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724D6C0218C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5F08405F;
	Wed, 22 Jan 2025 20:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4dRqNZbeqH6; Wed, 22 Jan 2025 20:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D3C8405A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58D3C8405A;
	Wed, 22 Jan 2025 20:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DC4FB88
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EAC08405A
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIYw1EIL8faX for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 20:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE1B8404D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BE1B8404D
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:59:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3907D86114; Wed, 22 Jan 2025 20:59:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 21:35:15 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 04dd89947ebec474bc369a4cbb24a46d361137d2
X-Git-Newrev: 477c35f036746495fef846883f19fd8877b9c7c2
X-Patchwork-Hint: ignore
Message-Id: <20250122205936.3907D86114@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/ffmpeg: add
 optional dependency to harfbuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=477c35f036746495fef846883f19fd8877b9c7c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes https://bugs.busybox.net/show_bug.cgi?id=16279

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 201bf5346df8758a383eaddc02a592595bb50ace)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1e18b5e2da..dd98756c2a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -400,6 +400,13 @@ else
 FFMPEG_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+FFMPEG_CONF_OPTS += --enable-libharfbuzz
+FFMPEG_DEPENDENCIES += harfbuzz
+else
+FFMPEG_CONF_OPTS += --disable-libharfbuzz
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 FFMPEG_CONF_OPTS += --enable-libopenjpeg
 FFMPEG_DEPENDENCIES += openjpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
