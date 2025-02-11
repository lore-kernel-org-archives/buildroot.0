Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7208EC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 22:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16201811C1;
	Tue, 11 Feb 2025 22:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxAbesmlEW6o; Tue, 11 Feb 2025 22:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3148F804DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3148F804DA;
	Tue, 11 Feb 2025 22:37:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F0BE6C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EFCB60EF6
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lF5vrJe8sbaQ for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 22:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 353DC60D54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 353DC60D54
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 22:37:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F4DE8754A; Tue, 11 Feb 2025 22:37:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Feb 2025 23:27:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e11413a23e8498106dc984c79df473ba47a708b0
X-Git-Newrev: abd20d7a27fb2fc0a7bd9d8ccd515485da742133
X-Patchwork-Hint: ignore
Message-Id: <20250211223739.1F4DE8754A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
 libxml2
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd20d7a27fb2fc0a7bd9d8ccd515485da742133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for libxml2 was added 2017 in ffmpeg version 3.4:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=96d70694aea64616c68db8be306c159c73fb3980

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1b6b9e7693..93870b0470 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -383,6 +383,13 @@ else
 FFMPEG_CONF_OPTS += --disable-iconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+FFMPEG_CONF_OPTS += --enable-libxml2
+FFMPEG_DEPENDENCIES += libxml2
+else
+FFMPEG_CONF_OPTS += --disable-libxml2
+endif
+
 # ffmpeg freetype support require fenv.h which is only
 # available/working on glibc.
 # The microblaze variant doesn't provide the needed exceptions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
