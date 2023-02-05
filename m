Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813DCC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322E48146A;
	Sun,  5 Feb 2023 14:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322E48146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFlGd2SmXugl; Sun,  5 Feb 2023 14:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B39813B8;
	Sun,  5 Feb 2023 14:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B39813B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7224D1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48AF9813B8
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AF9813B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kue00vwVxiM4 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:42:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 871A0813B5
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871A0813B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73E8F838AE; Sun,  5 Feb 2023 14:42:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:42:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce2ac1fecfdd61c01bb34984624f2d37fea91f91
X-Git-Newrev: 1f618aa388535181c281c85e2b5264532de4ef0f
X-Patchwork-Hint: ignore
Message-Id: <20230205144220.73E8F838AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tmux: add utf8proc optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f618aa388535181c281c85e2b5264532de4ef0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

utf8proc is an optional dependency since version 2.3 and
https://github.com/tmux/tmux/commit/6c94774b70f72952c4c512e4aa59a207ca1c34f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tmux/tmux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 281b7d8ee6..b1c0af1a83 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -11,6 +11,13 @@ TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VENDOR = tmux_project
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+ifeq ($(BR2_PACKAGE_UTF8PROC),y)
+TMUX_DEPENDENCIES += utf8proc
+TMUX_CONF_OPTS += --enable-utf8proc
+else
+TMUX_CONF_OPTS += --disable-utf8proc
+endif
+
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define TMUX_ADD_TMUX_TO_SHELLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
