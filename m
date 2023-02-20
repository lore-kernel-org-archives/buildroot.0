Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95704C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4061370144;
	Tue, 21 Feb 2023 02:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4061370144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIN2R2HuOx3c; Tue, 21 Feb 2023 02:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E697019E;
	Tue, 21 Feb 2023 02:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E697019E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A30841BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E00242A99
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E00242A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDgIdXpSDvZe for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4399342A87
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4399342A87
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E1878649D; Mon, 20 Feb 2023 21:07:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 22:07:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3093e258aba57015d23d40ab478c818128c6a13
X-Git-Newrev: 54237eec447abd4bd788b0a8ac5d48293c2c4eb5
X-Patchwork-Hint: ignore
Message-Id: <20230220210739.2E1878649D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tmux: fix BR2_SHARED_STATIC_LIBS
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

commit: https://git.buildroot.net/buildroot/commit/?id=54237eec447abd4bd788b0a8ac5d48293c2c4eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tmux uses custom --enable-static option to drive whether a static link
should be attempted, which is not what the standard libtool directive
is about and that we pass in our autotools-package infra.

This results in the following build failure with systemd or utf8proc
raised since commits 1f618aa388535181c281c85e2b5264532de4ef0f and
e279599d255a79c08ef20b97b96eb248689d52a9:

checking for utf8proc.h... yes
checking for library containing utf8proc_charwidth... no
configure: error: "utf8proc not found"

In file included from tmux.h:34,
                 from alerts.c:23:
compat.h:379:18: error: conflicting types for 'forkpty'; have 'pid_t(int *, char *, struct termios *, struct winsize *)' {aka 'int(int *, char *, struct termios *, struct winsize *)'}
  379 | pid_t            forkpty(int *, char *, struct termios *, struct winsize *);
      |                  ^~~~~~~

Link to (closed) upstream issue:
https://github.com/tmux/tmux/issues/3290

Fixes:
 - http://autobuild.buildroot.org/results/6e8523d8d514bf6d8fc3377d05e5edbe7fc2d5bb
 - http://autobuild.buildroot.org/results/cba06f3bb6d9be25e91f56c390a70ddf9904832e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tmux/tmux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 47ee9b16ca..af06c8570b 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -25,6 +25,12 @@ else
 TMUX_CONF_OPTS += --disable-utf8proc
 endif
 
+# tmux uses custom --enable-static option, instead of standard libtool
+# directive resulting in a build failure with systemd or utf8proc
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+TMUX_CONF_OPTS += --disable-static
+endif
+
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define TMUX_ADD_TMUX_TO_SHELLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
