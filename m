Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357D2C369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 13:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB13540762;
	Sat, 19 Apr 2025 13:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKlSrW6w-BN4; Sat, 19 Apr 2025 13:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCBD4078B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCBD4078B;
	Sat, 19 Apr 2025 13:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ABF2228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C37C40116
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDDiMijGQPzu for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 13:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5805B400EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5805B400EC
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E0807FD31; Sat, 19 Apr 2025 13:30:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 14:57:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24a41c8fb5a63cb1e2dd512368e023af73beabf8
X-Git-Newrev: 5621fe94afd766ca09f65789ced4ce4e8a6bdbe0
X-Patchwork-Hint: ignore
Message-Id: <20250419133042.1E0807FD31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add support for libopenmpt
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
Content-Type: multipart/mixed; boundary="===============2479604393257242719=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2479604393257242719==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5621fe94afd766ca09f65789ced4ce4e8a6bdbe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure ffmpeg to use libopenmpt if available.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 93870b0470..799201c820 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -362,6 +362,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libmodplug
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENMPT),y)
+FFMPEG_CONF_OPTS += --enable-libopenmpt
+FFMPEG_DEPENDENCIES += libopenmpt
+else
+FFMPEG_CONF_OPTS += --disable-libopenmpt
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 FFMPEG_CONF_OPTS += --enable-libspeex
 FFMPEG_DEPENDENCIES += speex

--===============2479604393257242719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2479604393257242719==--
