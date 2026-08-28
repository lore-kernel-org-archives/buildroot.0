Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8A1C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786FB81231;
	Fri, 28 Aug 2026 14:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Af5Q6mFyz8Tz; Fri, 28 Aug 2026 14:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927185;
	bh=KcJdsZjUT0cQwMurDEXBcZAq7pFx+uQyOGiS6w4Vwy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SVsK/MiCNAINixE4C0tGa8ZXOfEdXrqfDF1+44LzhKviQkNeI9nLzj6V5uSQr0pwk
	 AQeG5Htecoggv37IOwgIKZe6yc1fpC0X/hzoOmwIxKlFck0c6OraNKI4xEXMrYi5by
	 UGf4rJ8DIZXnDWnyXsRM0SxsmR7ytsHb0/o6sR2mbDKAb/hEh3AJkTlmwhE+ETkvag
	 g69WDV2Ew9ofjQOQh3zZ6y1Ufcxqm0s25KZzAqa9YAoARpjdNI0D4LOEnJs0b0lS5I
	 Em2DpHor1KktYoTLAVyitE//KD4hZh3AFw2kRTcbsL8nKaRAF5Gy+wTXN5eWm+sPBN
	 XyovJv1PzHA+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC08681218;
	Fri, 28 Aug 2026 14:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB95CD2C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD84380E6A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yRN8LwHetln for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AEBE80F4C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3939F921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 848e36f65b631e80fc2713a3c796d59e125880d4
X-Git-Newrev: b1b2c3f00aaffacd8b9e6239c64314f124345e36
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.3939F921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/uclibc: PPC fix
 e500 fenv support
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1b2c3f00aaffacd8b9e6239c64314f124345e36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Problem found via Buildroot autobuilders, seems to be some
bitrotting code. Tested with qemu_ppc_mpc8544ds_defconfig
and a hard-float toolchain.

Fixes:
 - https://autobuild.buildroot.net/results/464/46448883b1682718aeff066d204349d8e9a3b1d1/
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219363

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: add link to CI build failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5795000c25c89db3f568c4039b21a256fc662706)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../uclibc/0002-ppc-fix-e500-fenv-support.patch    | 237 +++++++++++++++++++++
 1 file changed, 237 insertions(+)

diff --git a/package/uclibc/0002-ppc-fix-e500-fenv-support.patch b/package/uclibc/0002-ppc-fix-e500-fenv-support.patch
new file mode 100644
index 0000000000..bc64b8f762
--- /dev/null
+++ b/package/uclibc/0002-ppc-fix-e500-fenv-support.patch
@@ -0,0 +1,237 @@
+From dff69277d71965cff0a757a030e03994a4a83aa6 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Tue, 18 Aug 2026 06:02:54 +0200
+Subject: [PATCH] ppc: fix e500 fenv support
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/dff69277d71965cff0a757a030e03994a4a83aa6
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libm/powerpc/e500/fpu/fclrexcpt.c    | 1 -
+ libm/powerpc/e500/fpu/fe_nomask.c    | 1 -
+ libm/powerpc/e500/fpu/fedisblxcpt.c  | 1 -
+ libm/powerpc/e500/fpu/feenablxcpt.c  | 1 -
+ libm/powerpc/e500/fpu/fegetenv.c     | 1 -
+ libm/powerpc/e500/fpu/fegetexcept.c  | 1 -
+ libm/powerpc/e500/fpu/fegetround.c   | 1 -
+ libm/powerpc/e500/fpu/feholdexcpt.c  | 2 --
+ libm/powerpc/e500/fpu/fenv_const.c   | 1 -
+ libm/powerpc/e500/fpu/fesetenv.c     | 5 +----
+ libm/powerpc/e500/fpu/fesetround.c   | 2 --
+ libm/powerpc/e500/fpu/feupdateenv.c  | 1 -
+ libm/powerpc/e500/fpu/fgetexcptflg.c | 1 -
+ libm/powerpc/e500/fpu/fraiseexcpt.c  | 3 ---
+ libm/powerpc/e500/fpu/fsetexcptflg.c | 1 -
+ libm/powerpc/e500/fpu/ftestexcept.c  | 1 -
+ 16 files changed, 1 insertion(+), 23 deletions(-)
+
+diff --git a/libm/powerpc/e500/fpu/fclrexcpt.c b/libm/powerpc/e500/fpu/fclrexcpt.c
+index 805aaa487..02dc4bcf8 100644
+--- a/libm/powerpc/e500/fpu/fclrexcpt.c
++++ b/libm/powerpc/e500/fpu/fclrexcpt.c
+@@ -1,6 +1,5 @@
+ /* Clear given exceptions in current floating-point environment.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+diff --git a/libm/powerpc/e500/fpu/fe_nomask.c b/libm/powerpc/e500/fpu/fe_nomask.c
+index d5915165c..fe709803d 100644
+--- a/libm/powerpc/e500/fpu/fe_nomask.c
++++ b/libm/powerpc/e500/fpu/fe_nomask.c
+@@ -1,6 +1,5 @@
+ /* Procedure definition for FE_NOMASK_ENV.
+    Copyright (C) 1997 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+diff --git a/libm/powerpc/e500/fpu/fedisblxcpt.c b/libm/powerpc/e500/fpu/fedisblxcpt.c
+index 0700f4577..0a54df6fb 100644
+--- a/libm/powerpc/e500/fpu/fedisblxcpt.c
++++ b/libm/powerpc/e500/fpu/fedisblxcpt.c
+@@ -1,6 +1,5 @@
+ /* Disable floating-point exceptions.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/feenablxcpt.c b/libm/powerpc/e500/fpu/feenablxcpt.c
+index 9f03181f4..bc1c30a83 100644
+--- a/libm/powerpc/e500/fpu/feenablxcpt.c
++++ b/libm/powerpc/e500/fpu/feenablxcpt.c
+@@ -1,6 +1,5 @@
+ /* Enable floating-point exceptions.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/fegetenv.c b/libm/powerpc/e500/fpu/fegetenv.c
+index c1a914dc3..934ac92e9 100644
+--- a/libm/powerpc/e500/fpu/fegetenv.c
++++ b/libm/powerpc/e500/fpu/fegetenv.c
+@@ -1,7 +1,6 @@
+ /* Store current floating-point environment.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004
+-   This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+diff --git a/libm/powerpc/e500/fpu/fegetexcept.c b/libm/powerpc/e500/fpu/fegetexcept.c
+index bf0215d62..b932f8036 100644
+--- a/libm/powerpc/e500/fpu/fegetexcept.c
++++ b/libm/powerpc/e500/fpu/fegetexcept.c
+@@ -1,6 +1,5 @@
+ /* Get floating-point exceptions.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/fegetround.c b/libm/powerpc/e500/fpu/fegetround.c
+index f501c6ce8..7b54ead30 100644
+--- a/libm/powerpc/e500/fpu/fegetround.c
++++ b/libm/powerpc/e500/fpu/fegetround.c
+@@ -1,6 +1,5 @@
+ /* Return current rounding direction.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/feholdexcpt.c b/libm/powerpc/e500/fpu/feholdexcpt.c
+index edeb2cf81..2b0c4ca4c 100644
+--- a/libm/powerpc/e500/fpu/feholdexcpt.c
++++ b/libm/powerpc/e500/fpu/feholdexcpt.c
+@@ -1,6 +1,5 @@
+ /* Store current floating-point environment and clear exceptions.
+    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -41,4 +40,3 @@ feholdexcept (fenv_t *envp)
+ 
+   return 0;
+ }
+-libm_hidden_def (feholdexcept)
+diff --git a/libm/powerpc/e500/fpu/fenv_const.c b/libm/powerpc/e500/fpu/fenv_const.c
+index 3c9f5578a..cfbff0793 100644
+--- a/libm/powerpc/e500/fpu/fenv_const.c
++++ b/libm/powerpc/e500/fpu/fenv_const.c
+@@ -1,6 +1,5 @@
+ /* Constants for fenv_bits.h.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/fesetenv.c b/libm/powerpc/e500/fpu/fesetenv.c
+index 392e0c0bf..28d113959 100644
+--- a/libm/powerpc/e500/fpu/fesetenv.c
++++ b/libm/powerpc/e500/fpu/fesetenv.c
+@@ -1,6 +1,5 @@
+ /* Install given floating-point environment.
+    Copyright (C) 1997,99,2000,01,02 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+@@ -21,7 +20,7 @@
+ #include <sys/prctl.h>
+ 
+ int
+-__fesetenv (const fenv_t *envp)
++fesetenv (const fenv_t *envp)
+ {
+   fenv_union_t u;
+   INTERNAL_SYSCALL_DECL (err);
+@@ -33,5 +32,3 @@ __fesetenv (const fenv_t *envp)
+   /* Success.  */
+   return 0;
+ }
+-
+-libm_hidden_ver (__fesetenv, fesetenv)
+diff --git a/libm/powerpc/e500/fpu/fesetround.c b/libm/powerpc/e500/fpu/fesetround.c
+index 783541d5b..800a8a4d2 100644
+--- a/libm/powerpc/e500/fpu/fesetround.c
++++ b/libm/powerpc/e500/fpu/fesetround.c
+@@ -1,6 +1,5 @@
+ /* Set current rounding direction.
+    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -33,4 +32,3 @@ fesetround (int round)
+ 
+   return 0;
+ }
+-libm_hidden_def (fesetround)
+diff --git a/libm/powerpc/e500/fpu/feupdateenv.c b/libm/powerpc/e500/fpu/feupdateenv.c
+index 47f316318..6c1f8941c 100644
+--- a/libm/powerpc/e500/fpu/feupdateenv.c
++++ b/libm/powerpc/e500/fpu/feupdateenv.c
+@@ -1,6 +1,5 @@
+ /* Install given floating-point environment and raise exceptions.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/fgetexcptflg.c b/libm/powerpc/e500/fpu/fgetexcptflg.c
+index d27356574..d4847ef6d 100644
+--- a/libm/powerpc/e500/fpu/fgetexcptflg.c
++++ b/libm/powerpc/e500/fpu/fgetexcptflg.c
+@@ -1,6 +1,5 @@
+ /* Store current representation for exceptions.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+diff --git a/libm/powerpc/e500/fpu/fraiseexcpt.c b/libm/powerpc/e500/fpu/fraiseexcpt.c
+index 0c92b2868..43025fe25 100644
+--- a/libm/powerpc/e500/fpu/fraiseexcpt.c
++++ b/libm/powerpc/e500/fpu/fraiseexcpt.c
+@@ -1,6 +1,5 @@
+ /* Raise given exceptions.
+    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -24,5 +23,3 @@
+ #define __FERAISEEXCEPT_INTERNAL feraiseexcept
+ 
+ #include "../spe-raise.c"
+-
+-libm_hidden_def (feraiseexcept)
+diff --git a/libm/powerpc/e500/fpu/fsetexcptflg.c b/libm/powerpc/e500/fpu/fsetexcptflg.c
+index 11ea89f16..2fde513a0 100644
+--- a/libm/powerpc/e500/fpu/fsetexcptflg.c
++++ b/libm/powerpc/e500/fpu/fsetexcptflg.c
+@@ -1,6 +1,5 @@
+ /* Set floating-point environment exception handling.
+    Copyright (C) 1997,99,2000,01,04 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+diff --git a/libm/powerpc/e500/fpu/ftestexcept.c b/libm/powerpc/e500/fpu/ftestexcept.c
+index 55f752b25..2c082f509 100644
+--- a/libm/powerpc/e500/fpu/ftestexcept.c
++++ b/libm/powerpc/e500/fpu/ftestexcept.c
+@@ -1,6 +1,5 @@
+ /* Test exception in current environment.
+    Copyright (C) 2004 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
