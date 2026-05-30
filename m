Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CDACD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22432851D1;
	Sat, 30 May 2026 09:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD6swcY2eKrD; Sat, 30 May 2026 09:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D18851D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780134556;
	bh=W5yKxTFRFWVIZ4CozGNn5KZxyT1hzzaNQzeVVU9YnXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l82mUok39YwGB+fYS4td1yL7+FlyIDodLG3PraW+JSq0N37i2N/4pwdEFkU2i/N37
	 LBYvykk03rwCef1CLbFJQl7fMFxu8rV13HyDw01GfFso7jQVtYcIjjmYbtnNqbFRYU
	 jxZaoaDQ2vvdhkBbyLpAfz0Xi4tzgxLgnYOkcUlmkpwK/W5II2kB6tgMmwspDtyyqs
	 pNSHOnBuqRUwGHgTk8EDEaE94C1gdImULDCamNtatfLg8PXZTCtK8byujMDyXk8YBV
	 D0IFdvcBTW8A4aO98eUh6OsFg36JRMlkHY59HffRwsLYXX22X/kZI9YTxmj0WZI1Cs
	 xe40AYKxksIbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D18851D4;
	Sat, 30 May 2026 09:49:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABF21D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C954851D4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pin1PPFU5qsg for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE154851D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE154851D1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:49:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D24858705E; Sat, 30 May 2026 09:49:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:48:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60a04a145aa176609bc0fde9e743ea8b5d93a054
X-Git-Newrev: c44987411c79256c47dfd34c0c48b2235c56cf4f
X-Patchwork-Hint: ignore
Message-Id: <20260530094900.D24858705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/readline: fix a segfault in
 connmanctl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c44987411c79256c47dfd34c0c48b2235c56cf4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Reported via IRC in #buildroot connmanctl segfaults randomly
on startup and keyboard input is not echoed back.

Could be reproduced with Raspberry PI4 (32 Bit) defconfig and glibc
based userland.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...3-patch-2-fix-crash-if-the-calling-applic.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch b/package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch
new file mode 100644
index 0000000000..50df37fd4a
--- /dev/null
+++ b/package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch
@@ -0,0 +1,22 @@
+From 9a3a2388e376eb2b43a2fe3dd8c5ce6e62ee3cc0 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Wed, 10 Dec 2025 11:34:13 -0500
+Subject: [PATCH] Readline-8.3 patch 2: fix crash if the calling application
+ sets rl_prompt to NULL without setting a new value
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/?id=9a3a2388e376eb2b43a2fe3dd8c5ce6e62ee3cc0
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff --git a/display.c b/display.c
+index 9aa8c7b..edb525d 100644
+--- a/display.c
++++ b/display.c
+@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
+ 
+ /* Useful shorthand used by rl_redisplay, update_line, rl_move_cursor_relative */
+ #define INVIS_FIRST()	(local_prompt_invis_chars[0])
+-#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line) ? local_prompt_invis_chars[line] : 0)
++#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line && local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
+ 
+ #define W_OFFSET(line, offset) ((line) == 0 ? offset : 0)
+ #define VIS_LLEN(l)	((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] - vis_lbreaks[l]))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
