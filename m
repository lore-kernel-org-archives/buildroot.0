Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1F3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 07:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E5D84CBA;
	Sat, 28 May 2022 07:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrJ204xBUifL; Sat, 28 May 2022 07:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2947284CBD;
	Sat, 28 May 2022 07:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED3A1BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BDEC4198D
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLqBqsApu91q for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EF46404F3
 for <buildroot@buildroot.org>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 446A783D21; Sat, 28 May 2022 06:57:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 08:46:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d2463c1d2bd6d62778f189903a19a8d7a3da7cd5
X-Git-Newrev: c5c6010a2bf1b5054441c974db9a4cd7709dc7e3
X-Patchwork-Hint: ignore
Message-Id: <20220528065730.446A783D21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/glslsandbox-player: fix build with libexecinfo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5c6010a2bf1b5054441c974db9a4cd7709dc7e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix build failure raised on uclibc and musl since the addition of
libexecinfo package in commit:
eea8ba446c10701a273432552108d80fb2224ef4

Fixes:
- http://autobuild.buildroot.net/results/9591ffe5968fe5f20b29799d1c234426cacd549a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 99113727d6458fff1aaae7f9e9305f9b657d4263)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glslsandbox-player/glslsandbox-player.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index c5fbf062b7..70bd5ca370 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -12,6 +12,11 @@ GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
 GLSLSANDBOX_PLAYER_LICENSE = BSD-2-Clause
 GLSLSANDBOX_PLAYER_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libexecinfo
+GLSLSANDBOX_PLAYER_CONF_ENV += LIBS="-lexecinfo"
+endif
+
 ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_PNG),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += libpng
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-libpng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
