Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E6FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E5C4148D;
	Thu, 30 Dec 2021 15:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C65Dxv_rLcix; Thu, 30 Dec 2021 15:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF55E410E1;
	Thu, 30 Dec 2021 15:14:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C75141C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4805401C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzAQY5sbRqZp for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:14:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD82240166
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AAE9C82DD7; Thu, 30 Dec 2021 15:08:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:13:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5521539eb124c0550bf012dd24074ce039da83e6
X-Git-Newrev: 810afe6bf7bf5c5150a3efca433b3233403f8397
X-Patchwork-Hint: ignore
Message-Id: <20211230150846.AAE9C82DD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liboping: add patch to fix utf8
 ncurses support
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

commit: https://git.buildroot.net/buildroot/commit/?id=810afe6bf7bf5c5150a3efca433b3233403f8397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch from upstream merge request [1] to fix fix utf8 ncurses
support.

[1] https://github.com/octo/liboping/issues/36

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liboping/0002-fix-utf8-support.patch | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/liboping/0002-fix-utf8-support.patch b/package/liboping/0002-fix-utf8-support.patch
new file mode 100644
index 0000000000..0697ad5ca4
--- /dev/null
+++ b/package/liboping/0002-fix-utf8-support.patch
@@ -0,0 +1,35 @@
+From dfbdd324769f542b6b89499c1b7f0f4322100bc6 Mon Sep 17 00:00:00 2001
+From: wfaulk <wfaulk@users.noreply.github.com>
+Date: Wed, 7 Aug 2019 18:57:43 -0400
+Subject: [PATCH] fix utf8 support
+
+in oping.c:923 in has_utf8() the #if HAVE_NCURSESW_NCURSES_H is
+wrong. in consequence of this hist_symbols_utf8 is not used and the
+the graph type prettyping is not realy pretty. the name of the header
+file is curses.h see also oping.c:85 or the third changelog entry from
+1997/05/31
+
+https://github.com/octo/liboping/issues/36
+
+[Upstream: https://github.com/octo/liboping/pull/49/commits/a313923ec12d11daa8e70497c6b7b5d50965821b]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/oping.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/oping.c b/src/oping.c
+index 87ca81a..62dbb67 100644
+--- a/src/oping.c
++++ b/src/oping.c
+@@ -903,7 +903,7 @@ static void time_calc (struct timespec *ts_dest, /* {{{ */
+ #if USE_NCURSES
+ static _Bool has_utf8() /* {{{ */
+ {
+-# if HAVE_NCURSESW_NCURSES_H
++# if HAVE_NCURSESW_CURSES_H
+ 	if (!opt_utf8)
+ 	{
+ 		/* Automatically determine */
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
