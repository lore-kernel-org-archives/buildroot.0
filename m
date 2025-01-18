Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A59C02187
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F2F408D6;
	Sat, 18 Jan 2025 21:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYDDB79o3MW1; Sat, 18 Jan 2025 21:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C0240909
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C0240909;
	Sat, 18 Jan 2025 21:43:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B282F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EF6605E7
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2ZT47BJCc2K for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76B0605DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D76B0605DD
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:43:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF86585ECA; Sat, 18 Jan 2025 21:43:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:30:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42c3b687e89365428a23c2c18956f73d2835bf25
X-Git-Newrev: 201bf5346df8758a383eaddc02a592595bb50ace
X-Patchwork-Hint: ignore
Message-Id: <20250118214314.BF86585ECA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add optional dependency to
 harfbuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=201bf5346df8758a383eaddc02a592595bb50ace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=16279

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
