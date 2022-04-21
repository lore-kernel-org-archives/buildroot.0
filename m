Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5A9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C06883F98;
	Thu, 21 Apr 2022 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmoWsC6_5VIA; Thu, 21 Apr 2022 21:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC8F84156;
	Thu, 21 Apr 2022 21:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FBFF1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CD5A60FA3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUAYCYiZ8OWo for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD1A60EC1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3D11F84042; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:05:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6addf4606c3a41cdad5c6ac4c6508b298b6e92a
X-Git-Newrev: c99d2d34298ddfed16581ae3405ed70b52640cb5
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.3D11F84042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mc: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c99d2d34298ddfed16581ae3405ed70b52640cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 4.8.26 in commit e648dfa6f7078a6fbbc5feb83292c6a98300fe8f and
https://github.com/MidnightCommander/mc/commit/8b4386df83ab5a525f0568113fe1e53d362f433e:

tty-ncurses.c: In function 'tty_colorize_area':
tty-ncurses.c:575:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int row = 0; row < rows; row++)
     ^

Fixes:
 - http://autobuild.buildroot.org/results/d9f0a11bde42fe6ae2e9449d3365609d59a6545d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mc/mc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index ac12c2173a..3858d62886 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -10,7 +10,9 @@ MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+MC_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -std=c99" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
