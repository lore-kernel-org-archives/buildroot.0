Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA682C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D35150597;
	Fri, 28 Feb 2025 17:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ap2VqkCxLkCQ; Fri, 28 Feb 2025 17:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013C24FA2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 013C24FA2A;
	Fri, 28 Feb 2025 17:17:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 084F468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 995B242D3E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bToIv_Us3P1Y for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D9C42F2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D9C42F2F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5397987611; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Feb 2025 23:27:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e11413a23e8498106dc984c79df473ba47a708b0
X-Git-Newrev: abd20d7a27fb2fc0a7bd9d8ccd515485da742133
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.5397987611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: add optional
 support for libxml2
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
