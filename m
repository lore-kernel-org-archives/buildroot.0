Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FABC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 13:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944306006A;
	Tue, 24 May 2022 13:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUiWgqfhlFKe; Tue, 24 May 2022 13:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D40B56059A;
	Tue, 24 May 2022 13:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 564C21BF989
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D7E41677
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bh99BjtdE1rW for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 13:01:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 449894162C
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF7BF86432; Tue, 24 May 2022 12:50:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 14:52:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 71b9653a28e6e5df438cac596bdb57a8553a4433
X-Git-Newrev: 9388b29dd6df5db5085df4fb2a5c5f0eb9b5e26d
X-Patchwork-Hint: ignore
Message-Id: <20220524125009.CF7BF86432@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mc: fix build
 with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=9388b29dd6df5db5085df4fb2a5c5f0eb9b5e26d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit c99d2d34298ddfed16581ae3405ed70b52640cb5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
