Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48336CD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D292541F3A;
	Fri,  8 May 2026 19:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CR9E12a_y3J; Fri,  8 May 2026 19:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E3741F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778267904;
	bh=rX7Mmt+uoITdGy/4azCThgKVcAvk2w8Zi6RMCtMfEcI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OOkG89v/t5SJ3a8iSbW2yz91X37yqmKnxRCGLQEdcsmbp40skov/kd0EglP92bEeB
	 +05PX6ZHQENgMbjRzAV++Wdak5ZuPCSmQDysvreAKPsIvyX3nkhU/uqofivuM/LmHw
	 QNgleTyZAY3skWUeqC89wz0JMbHi6Y2TazyapiOaNUd9skvT5E2YrmXLyTK9dlNceg
	 rq0jGLDe/8sKtV3verwMrP9RP21scG8pSkhFYAVaYaSYD3v1R+oldL6F0dlBeGfAV7
	 dZGGieFdAW4/aKo0ABkvQjnvNDOzvGdCG8wEB/E1YmsD76/xfL9zDRtr55M4N/K8hs
	 gbQqGV6HKREHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E3741F3B;
	Fri,  8 May 2026 19:18:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63B8F272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 477FC61B1E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEBPqrMPo7Q0 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1976561B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1976561B21
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1976561B21
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:18:20 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E3BB331E01E2; Fri, 08 May 2026 21:18:17 +0200 (CEST)
Date: Fri, 8 May 2026 21:18:17 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <af42-dxArYlXGip6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1778267898; bh=jJQK5NL54DtjfAV2nBkIyD+Ve72GJI95G29vDRIwsCo=;
 h=Date:From:To:Subject:From;
 b=coD4Sw/W1uVcuoP+ym6citkD/TrKslTzenD+MO64bfIuuN853VOzowdyYDORNORh6
 zq5sCvuk72zaQkHDk2pNthbJaChitx4a8yqopUkcfaXxg2LFwMITYkztwcIKAEPOGP
 V8sLK+QIlJb/fDWzrPQd8HtBAPnY0BSESvHZyp96uScOqqtl61T8Nu1aBzFQowfVrm
 fZ6pmVI3qepS01CRfapisLamIlfaSucYsJlzvol09/ujUu3jBmFsVBH6bRZMCFt8VP
 GdLUevl0Rd0xdZWGP9UDR+cYjO4qxO6cLc09xoVwHYEjnkAuxU//UfTuQQqsMYUk5k
 jS2EMrSCdxSKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/readline: fix a segfault in connmanctl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reported via IRC in #buildroot connmanctl segfaults randomly
on startup and keyboard input is not echoed back.

Could be reproduced with Raspberry PI4 (32 Bit) defconfig and glibc
based userland.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ch-2-fix-crash-if-the-calling-applic.patch | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/readline/0002-Readline-8.3-patch-2-fix-crash-if-the-calling-applic.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
