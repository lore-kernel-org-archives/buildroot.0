Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7281C77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 18:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BA481ECC;
	Mon, 24 Apr 2023 18:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BA481ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyV4eeph1gxe; Mon, 24 Apr 2023 18:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F07081EAE;
	Mon, 24 Apr 2023 18:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F07081EAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4D391BF831
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 18:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D3794151C
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 18:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3794151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eW5VWYmvhaKe for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 18:42:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 849454151A
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 18:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 849454151A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7081A844F1; Mon, 24 Apr 2023 18:42:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 20:38:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f38b5dcbd09ae8eb73ff64741c1df0be3b1c0f7
X-Git-Newrev: 2dff6e93ca2a675cebe5cfb6d864ff5da78a4ef4
X-Patchwork-Hint: ignore
Message-Id: <20230424184253.7081A844F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/readline: add upstream patch to
 fix crash with invalid locale specification
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dff6e93ca2a675cebe5cfb6d864ff5da78a4ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch to fix crash with invalid locale specification (see [1]
for details).

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=15456

[1] https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00002.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...2-patch-1-fix-crash-when-readline-is-star.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
new file mode 100644
index 0000000000..b0f784b8ba
--- /dev/null
+++ b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
@@ -0,0 +1,41 @@
+From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Wed, 5 Oct 2022 10:41:16 -0400
+Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
+ an invalid locale specification
+
+[Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
+ Stripped unrelated ._.gitignore change]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ nls.c      | 4 ++++
+ patchlevel | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/nls.c b/nls.c
+index 5c6a13b..8c027d6 100644
+--- a/nls.c
++++ b/nls.c
+@@ -141,6 +141,10 @@ _rl_init_locale (void)
+   if (lspec == 0)
+     lspec = "";
+   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
++  if (ret == 0 || *ret == 0)
++    ret = setlocale (LC_CTYPE, (char *)NULL);
++  if (ret == 0 || *ret == 0)
++    ret = RL_DEFAULT_LOCALE;
+ #else
+   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
+ #endif
+diff --git a/patchlevel b/patchlevel
+index d8c9df7..fdf4740 100644
+--- a/patchlevel
++++ b/patchlevel
+@@ -1,3 +1,3 @@
+ # Do not edit -- exists only for use by patch
+ 
+-0
++1
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
