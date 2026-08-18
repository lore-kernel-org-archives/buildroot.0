Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF39BC5DF7E
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 15:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43089608F5;
	Tue, 18 Aug 2026 15:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-w8Obo2Qvp9; Tue, 18 Aug 2026 15:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA393608E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787067264;
	bh=oVCo+Hr/chpbRnaladJaXSbq7gT76Sg+KNa2HXbA1EU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FA/XOHFhUiVKqsZlLVrxEpjjUccPhGE8hJIbbjT2nLU5bSb3mNdJtvOJr6uHgcHLO
	 o3hi1UmhBHqpyR6UJrfJklUYCKADU+cd/x0yZkEdpmgrzPZw+w0kFmRGGC6I3f5Kqh
	 6WWQW3T/oVmHxAHhXZUiC14N/Ejp7OivqkbGyjdOg5Cq/NLrKcotVtVg3HRKjzXWHS
	 J8sqPlHpVwXkl14Z0lwyXmIuImKAYur/BXul5I571nMhXHDI71clsvRwYSWIwPL60f
	 repDwYS1wfM8tf2+IuEbrehCBM7Xs9Ny8/mG5y8ohyPPGukha3ZdBSjYiu1oR4naQH
	 QOYVJWZPk1MHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA393608E4;
	Tue, 18 Aug 2026 15:34:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73396237
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 15:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650DD80B63
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 15:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DcHlcMpucfd for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 15:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F385B80B3F
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F385B80B3F
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F385B80B3F
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787067259; bh=qYFNcko69ZZmPdW2ugH/qqSmDBna6Wwn1hszwV56bBs=;
 h=Date:From:To:Subject:From;
 b=E7avqpW5iHqGrslwuGlRYJeA3YIEoaMTEQpDo5n3HuX1CXJbFoAtE2vAGtWXam9lP
 lukLeG/VGOtBOhYH2zzR8jdaU/Og750Nwo27c4mP7I1rJeSQbBXDCoXOctCTzAoT07
 4AcvbzLlSK1Dj/sKLsl3RwqBL7QvRU6c5zbkW0E9WkBMmMF7QEgGH3aUeJHphIxX1b
 z0SAwm4SG+ZZj9tsy2jWLQflL/QZUn0xyJXb63rDRYEmZRU36YyA9RvlwqcOVSev43
 SCFjDoHiN4c36ZfIv08wCtXeBd8ySwx4dZwXruxm4Hjd3SagJ7LCkHH/O3RbXVtcOj
 UEpYw4dD0s5KQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6022A31E0C1E; Tue, 18 Aug 2026 17:34:19 +0200 (CEST)
Date: Tue, 18 Aug 2026 17:34:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoR7ez3vQcTtkViY@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: PPC fix e500 fenv support
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

Problem found via Buildroot autobuilders, seems to be some
bitrotting code. Tested with qemu_ppc_mpc8544ds_defconfig
and a hard-float toolchain.

Fixes:
 - https://autobuild.buildroot.net/results/464/46448883b1682718aeff066d204349d8e9a3b1d1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0002-ppc-fix-e500-fenv-support.patch      | 237 ++++++++++++++++++
 1 file changed, 237 insertions(+)
 create mode 100644 package/uclibc/0002-ppc-fix-e500-fenv-support.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
