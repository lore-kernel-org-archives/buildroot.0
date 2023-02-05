Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5C9C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4556FFF6;
	Tue, 21 Feb 2023 01:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB4556FFF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgMES7yL05Gp; Tue, 21 Feb 2023 01:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 505E46FFF4;
	Tue, 21 Feb 2023 01:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505E46FFF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26DF11BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5388D6FBF5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5388D6FBF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DB3ASmLNoElM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 728846FBE0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 728846FBE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE2D828C8; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:42:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ce2ac1fecfdd61c01bb34984624f2d37fea91f91
X-Git-Newrev: 1f618aa388535181c281c85e2b5264532de4ef0f
X-Patchwork-Hint: ignore
Message-Id: <20230220205247.5AE2D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tmux: add utf8proc
 optional dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
