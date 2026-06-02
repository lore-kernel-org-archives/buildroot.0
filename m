Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B616CD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 11:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E56FC81F7C;
	Tue,  2 Jun 2026 11:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCFGoSpIjaI6; Tue,  2 Jun 2026 11:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005E881F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780400862;
	bh=EPabY+TtwSwfxofByBEGCVjctzSsqJtH8sYUA9CCqYc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bj0XPcYkpcaXSL8m1oODpeMpe7XoOvCMpum/KcjKhcsnea1Gx5xRIx714KZJ/7PqK
	 gWlKBzXNCCrqEblsh0GWkBtjwJGz3CR9eTF7a5/8Fl7AtsT3XoCDkKziONkF1Llx81
	 W4DX8G4lOiwnAknCZC9opIZULYJgseHRb89/+b2Z6LwYzkF2vePwpMgLlT/TK1gYfu
	 pWLbU1aie9trczmlgLYgj6zVQ5pVOmNhMMkg2NYakdzKxfTqZj/vgRhs07+xsm1iNA
	 +LV0KROm1mNgFhSIzUY7t7vluHYzDKjY6R0+C862Qx8Do8FN9/6DOYn66cUQ793J7C
	 acCdWbfLB5O/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 005E881F7D;
	Tue,  2 Jun 2026 11:47:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CDF5223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 11:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31F8481F7D
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 11:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzMjeRUMhtJ9 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 11:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5128881F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5128881F7C
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5128881F7C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 11:47:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5aa68d65d24so2402555e87.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 04:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780400857; x=1781005657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5rjIcBhv3dg/HzqAHQFjobkkeagrrcnwWw7AFvtGm8=;
 b=KamvzXnJ+f49lpzjOcjAicpHbWIxxZKwtkxsNz5VqCqtRVY+EqDD2WR0cSXQra8s1A
 6v0aRKBsfXWqwR2dtgrr93RJtiOEkQYVvJt7fL/LVGOmUOMVE0eAIB0Kaerr63g83fb/
 l42EEAnd1AtuMWXgMLDbl8uJrjz55BEIGGni7rKPnbU8d7q4qJr1NSp42K1Rgf6sQxMR
 mh1jnVlydC4gBtJhvVkC1QpO3+gs2hpDCKKIyJyYnm3cUIf6r8BLe3vlY5r42BjMMbod
 YDKKozqsOhnR2tBTiB5lC/Ys07MI1DYpf1L89Ckp7AUc4d/LA59ftIL5n57LdOeWQeC5
 7rvw==
X-Gm-Message-State: AOJu0YzjG2JkweP/EGPQsaEs5kpzNvxTQwTLGSlzHmCMiCWlaNw/2gT7
 TraU9diMN0w7R+c2FJMRcg22P/01qBe1PcF5/Ful5S5XhzePiVUXT3cznE7uGg==
X-Gm-Gg: Acq92OEudZnfWHObQUmHmA1KQWcIDy7xFLdMzsvjop6JVk6aKMNAVQJ13tXAek2zJRn
 +i00Vb6h025vRr8r5zfp7dq0KlYFup/hawiQd01AshyQx2COsqh/xD5aCsfwcGBZEwdHkF+zGar
 6saHWYnuBddxiKF8Sgf2F44RqGJaSNpHnZfSuzv/8bSUH8nuzQ6Vyp9u8lyb6icsOvKRhnUkPdZ
 UN3wQWa4o7XDf8J3NTkC6qynMZmePgpij8TAI1FqhMcqbDwfy0zTi7IoQiZI9zSGssQYcjiRm3n
 fyTb57IyOYuotkwjxKZNzkmwRnF0zCj2UkGdzGrKJV6fhNi8Pp/EATKXR8k/Kpb0J7rp5Okvzo5
 h5GiDCd0SrobSa8cJFmOMCuY2vh181Gxp2aE9Em6tY3yy41e8ZQsJnHYA0LbGf7neyM1GKeO6bq
 tknZccNZE/5fZ5mnpmoJbT0vlVUZWHhLpHTn1rxi0p0jTgQjP2l0YNPvso+c4BPbq5vfGSQr1gX
 7izFSJW49CctosizdPLsDej6RhG/lKz8F5ocf4u7ho=
X-Received: by 2002:a05:6512:6181:b0:5aa:7880:5246 with SMTP id
 2adb3069b0e04-5aa78805754mr638059e87.31.1780400856648; 
 Tue, 02 Jun 2026 04:47:36 -0700 (PDT)
Received: from precision7530-arch-roy.taild6993c.ts.net
 (12.79-161-109.customer.lyse.net. [79.161.109.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aa6abfb052sm1480304e87.12.2026.06.02.04.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 04:47:35 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue,  2 Jun 2026 13:47:30 +0200
Message-ID: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780400857; x=1781005657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k5rjIcBhv3dg/HzqAHQFjobkkeagrrcnwWw7AFvtGm8=;
 b=DOXIyb0T+vv5VZ6aXYywnbqPRRoLAG6JvEY7LmIw6aiYMNyGnsvDQRciggIHlEN8Fm
 v1htJSQ2wBh55i0M/jcK3zrWgSJb98fMKqAwDke8PYR3uWBCsIUdMrv/i8Bt+8K3AZUv
 UAydPrBd9mhJI2ZYFwl73swWAW/7TuJ/H8Z1WMcTtgMTaCG2b6fv4escrhmijmS5Ktup
 AvQxhY8Rfp3cx39ETAr3Ft90x7nFmuhCLrGdBjIxW0TpgdlqBJfi5P/Mty95mw42UrhG
 ivSQel0y+/2Zof4F2mAws5wvQBCs7R61ZReO4QNXW7UuHHGr1jA7zyBKt03CiGgi8ukD
 jLog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DOXIyb0T
Subject: [Buildroot] [PATCH] package/readline: link host shared library
 against ncurses
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

readline builds its shared library without linking the curses/termcap
library, so termcap symbols (UP, BC, PC) are left undefined.

host-gdb pulls in host-readline, installing this libreadline.so into the
host directory. buildroot runs its fakeroot finalization script with
/bin/sh, and fakeroot puts $(HOST_DIR)/lib in LD_LIBRARY_PATH; so when
/bin/sh is linked against readline (e.g. bash) it loads this host
libreadline.so rather than the system one, and because UP is a data
symbol the loader aborts before /bin/sh can start:

  /bin/sh: symbol lookup error: libreadline.so.8: undefined symbol: UP

This only happens when the host's /bin/sh links readline and host-gdb is
enabled; otherwise the host libreadline.so is never loaded, which is why
it is not seen on every build host.

Pass SHLIB_LIBS so readline's own build links the host shared library
against the libncursesw that host-ncurses already provides (it carries
the termcap symbols), making the host libreadline.so self-contained.
Only the host library is changed: the target library is never loaded
during the build, so it cannot break image generation.

Fixes: d98e15a3639d ("package/gdb: really fix build with GCC 15.x by using external readline")
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/readline/readline.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index f69cbe45e2..99d3711e7b 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -30,5 +30,14 @@ define READLINE_INSTALL_INPUTRC
 endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
 
+# readline does not link its shared library against the curses/termcap
+# library, leaving termcap symbols (UP, BC, PC) undefined. fakeroot runs
+# its finalization script with $(HOST_DIR)/lib in LD_LIBRARY_PATH, so a
+# readline-linked /bin/sh loads this host libreadline.so during root
+# filesystem generation and aborts on the undefined symbols. Link it
+# against the libncursesw that host-ncurses provides (it carries those
+# symbols) via readline's SHLIB_LIBS.
+HOST_READLINE_MAKE_OPTS += SHLIB_LIBS="-L$(HOST_DIR)/lib -lncursesw"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
