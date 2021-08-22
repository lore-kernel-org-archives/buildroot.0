Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510A6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082DE61181
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 082DE61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC77401CC;
	Sun, 22 Aug 2021 19:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPiXyKrKqlH5; Sun, 22 Aug 2021 19:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A75040252;
	Sun, 22 Aug 2021 19:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 276031BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16783401B5
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-cm6t3ctUHk for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 19:03:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8167401A2
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 19:03:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q10so22835225wro.2
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvAPBOb9U921Vn6F6AlBrcpAng0zV7TWF5vZX/hC5rE=;
 b=SriWf2/868XaQFPRyR6O4l0yTM2EIsLZCe0UfTXg+ltZIhj+2pwLZhd7ruJBis7NFV
 UbA+w4HcUvAbZ20y6637KmVApTRj5jgNMPbxIpDlmYN+exXJO61r+fw2h6q8woaUAVnv
 +Jrniyhi3v5ylmJs3FWK1PCQFA05MWiLaQ68YpXRCU7dOTsbP7A43c4al7kp3b5Kk8fG
 aBaax8rsP5xotlMbiZzH8cAPbjJAILL3Wr4zS3wbC4VLhtfYxA2xly/06OxXvKnNPnXY
 07t1MSR2V2w3szU41XHd14HlkVI2QMGtgxlsCJdU5+ynpsRNzBQAW7hEYKFyOxAGozjz
 +9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvAPBOb9U921Vn6F6AlBrcpAng0zV7TWF5vZX/hC5rE=;
 b=oMBlXxLFMY3IfCaep94nApqlVDMAGyHGN8vuaaHsUYMnPr1IYDOyHomSlkK1a2wfIW
 Oc1x33o3I8Qw/jVQK17Zc2Hi/88lREZmvMxPoh4jOAmUcbCRGFVR3OOunagsJWuoTZ6i
 dR0iJuyDIjHmMNuLCPz6xmYFEc2Md33pEC85zZk2VfFNSZ9TEnRcQa1U2jy+1i/IEqXC
 8B0JL/x/19OFQJ2bpZHvZRyfOIJbsWDYU3QAuAnH+/eiCX+zY1PKyKYu9NilNSGchZtW
 9RdfXiDgveD3+IigeaDXDRo4CkLhcv9soHPIlObJD14Z1OgC1nOzE9pCbvW5GFs5R1NO
 U6Aw==
X-Gm-Message-State: AOAM5302fIQmdA1xlFRTcp+WleaZ4yGVQHhhbJ7YKUbQPItfkN46zBGM
 fvzGCazyQF3/gkuqKG3i7M8vxsvYKAf2+u/9
X-Google-Smtp-Source: ABdhPJxt0o/BbGu/Ukqn55GmgQgonL6FjMFDpCfwT1rjQDJo9p8B6DttcbJ4rBX4SugClv8TrmmFEg==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr9614725wrg.134.1629658981694; 
 Sun, 22 Aug 2021 12:03:01 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id p18sm12703760wrt.13.2021.08.22.12.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:03:01 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 21:02:51 +0200
Message-Id: <20210822190251.280313-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210822190251.280313-1-petr.vorel@gmail.com>
References: <20210822190251.280313-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/localedef: bump to version
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

resync the version with glibc package.

Dropped 2 patches (fixes backported from previous releases),
rebased 2 which are kept (only line numbers changed).

Suggested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New in v2.

 ...y-parameter-warning-for-__sigsetjmp-.patch | 155 ------------------
 ...overflow-warning-in-pthread_cleanup_.patch | 125 --------------
 ...ACK-only-build-and-install-localedef.patch |  12 +-
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch |  12 +-
 .../localedef.hash                            |   2 +-
 package/localedef/localedef.mk                |   2 +-
 6 files changed, 14 insertions(+), 294 deletions(-)
 delete mode 100644 package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
 delete mode 100644 package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
 rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4}/0001-HACK-only-build-and-install-localedef.patch (88%)
 rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (90%)
 rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4}/localedef.hash (70%)

diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
deleted file mode 100644
index 888d27fe4a..0000000000
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 44f1469daff3a0bfe67fb5839243f114ace3bad8 Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Mon, 5 Oct 2020 16:46:46 +0000
-Subject: [PATCH 3/4] Fix GCC 11 -Warray-parameter warning for __sigsetjmp (bug
- 26647)
-
-This patch fixes part of bug 26647 (-Werror=array-parameter error
-building with GCC 11 because of __sigsetjmp being declared using an
-array parameter in one header and a pointer parameter in another).
-
-The fix is to split the struct __jmp_buf_tag definition out to a
-separate bits/types/ header so it can be included in pthread.h, so
-that pthread.h can declare __sigsetjmp with the type contents visible,
-so can use an array (as in setjmp.h) rather than a pointer in the
-declaration.
-
-Note that several other build failures with GCC 11 remain.  This does
-not fix the jmp_buf-related -Wstringop-overflow errors (also discussed
-in bug 26647), or -Warray-parameter errors for other functions (bug
-26686), or -Warray-bounds errors (bug 26687).
-
-Tested, with older compilers, natively for x86_64 and with
-build-many-glibc.py for aarch64-linux-gnu.  Tested with
-build-many-glibcs.py with GCC mainline for aarch64-linux-gnu that this
-gets past the -Warray-parameter issue for __sigsetjmp (with the next
-build failure being the other one discussed in bug 26647).
-
-[Upstream: https://github.com/bminor/glibc/commit/19302b27bdacfe87e861ff46fc0fbad60dd6602d.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- include/bits/types/struct___jmp_buf_tag.h |  1 +
- setjmp/Makefile                           |  3 +-
- setjmp/bits/types/struct___jmp_buf_tag.h  | 37 +++++++++++++++++++++++
- setjmp/setjmp.h                           | 15 +--------
- sysdeps/nptl/pthread.h                    |  5 +--
- 5 files changed, 44 insertions(+), 17 deletions(-)
- create mode 100644 include/bits/types/struct___jmp_buf_tag.h
- create mode 100644 setjmp/bits/types/struct___jmp_buf_tag.h
-
-diff --git a/include/bits/types/struct___jmp_buf_tag.h b/include/bits/types/struct___jmp_buf_tag.h
-new file mode 100644
-index 00000000..e3250150
---- /dev/null
-+++ b/include/bits/types/struct___jmp_buf_tag.h
-@@ -0,0 +1 @@
-+#include <setjmp/bits/types/struct___jmp_buf_tag.h>
-diff --git a/setjmp/Makefile b/setjmp/Makefile
-index dcac5693..603f61d7 100644
---- a/setjmp/Makefile
-+++ b/setjmp/Makefile
-@@ -22,7 +22,8 @@ subdir	:= setjmp
- 
- include ../Makeconfig
- 
--headers	:= setjmp.h bits/setjmp.h bits/setjmp2.h
-+headers	:= setjmp.h bits/setjmp.h bits/setjmp2.h \
-+	   bits/types/struct___jmp_buf_tag.h
- 
- routines	:= setjmp sigjmp bsd-setjmp bsd-_setjmp \
- 		   longjmp __longjmp jmp-unwind
-diff --git a/setjmp/bits/types/struct___jmp_buf_tag.h b/setjmp/bits/types/struct___jmp_buf_tag.h
-new file mode 100644
-index 00000000..9d8634f1
---- /dev/null
-+++ b/setjmp/bits/types/struct___jmp_buf_tag.h
-@@ -0,0 +1,37 @@
-+/* Define struct __jmp_buf_tag.
-+   Copyright (C) 1991-2020 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#ifndef	__jmp_buf_tag_defined
-+#define	__jmp_buf_tag_defined 1
-+
-+#include <bits/setjmp.h>		/* Get `__jmp_buf'.  */
-+#include <bits/types/__sigset_t.h>
-+
-+/* Calling environment, plus possibly a saved signal mask.  */
-+struct __jmp_buf_tag
-+  {
-+    /* NOTE: The machine-dependent definitions of `__sigsetjmp'
-+       assume that a `jmp_buf' begins with a `__jmp_buf' and that
-+       `__mask_was_saved' follows it.  Do not move these members
-+       or add others before it.  */
-+    __jmp_buf __jmpbuf;		/* Calling environment.  */
-+    int __mask_was_saved;	/* Saved the signal mask?  */
-+    __sigset_t __saved_mask;	/* Saved signal mask.  */
-+  };
-+
-+#endif
-diff --git a/setjmp/setjmp.h b/setjmp/setjmp.h
-index 4e3443c3..c6c59f40 100644
---- a/setjmp/setjmp.h
-+++ b/setjmp/setjmp.h
-@@ -27,20 +27,7 @@
- __BEGIN_DECLS
- 
- #include <bits/setjmp.h>		/* Get `__jmp_buf'.  */
--#include <bits/types/__sigset_t.h>
--
--/* Calling environment, plus possibly a saved signal mask.  */
--struct __jmp_buf_tag
--  {
--    /* NOTE: The machine-dependent definitions of `__sigsetjmp'
--       assume that a `jmp_buf' begins with a `__jmp_buf' and that
--       `__mask_was_saved' follows it.  Do not move these members
--       or add others before it.  */
--    __jmp_buf __jmpbuf;		/* Calling environment.  */
--    int __mask_was_saved;	/* Saved the signal mask?  */
--    __sigset_t __saved_mask;	/* Saved signal mask.  */
--  };
--
-+#include <bits/types/struct___jmp_buf_tag.h>
- 
- typedef struct __jmp_buf_tag jmp_buf[1];
- 
-diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
-index 8a403cbf..d4194da7 100644
---- a/sysdeps/nptl/pthread.h
-+++ b/sysdeps/nptl/pthread.h
-@@ -28,6 +28,7 @@
- #include <bits/wordsize.h>
- #include <bits/types/struct_timespec.h>
- #include <bits/types/__sigset_t.h>
-+#include <bits/types/struct___jmp_buf_tag.h>
- 
- 
- /* Detach state.  */
-@@ -730,8 +731,8 @@ extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
- #endif
- 
- /* Function used in the macros.  */
--struct __jmp_buf_tag;
--extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
-+extern int __sigsetjmp (struct __jmp_buf_tag __env[1],
-+			int __savemask) __THROWNL;
- 
- 
- /* Mutex handling.  */
--- 
-2.31.1
-
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
deleted file mode 100644
index 83f3f15eb6..0000000000
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From ea50889c35fb73ed9e140d800303aae9148c2888 Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Fri, 30 Oct 2020 22:25:42 +0000
-Subject: [PATCH 4/4] Avoid -Wstringop-overflow warning in pthread_cleanup_push
- macros
-
-GCC 11 introduces a -Wstringop-overflow warning for calls to functions
-with an array argument passed as a pointer to memory not large enough
-for that array.  This includes the __sigsetjmp calls from
-pthread_cleanup_push macros, because those use a structure in
-__pthread_unwind_buf_t, which has a common initial subsequence with
-jmp_buf but does not include the saved signal mask; this is OK in this
-case because the second argument to __sigsetjmp is 0 so the signal
-mask is not accessed.
-
-To avoid this warning, use a function alias __sigsetjmp_cancel with
-first argument an array of exactly the type used in the calls to the
-function, if using GCC 11 or later.  With older compilers, continue to
-use __sigsetjmp with a cast, to avoid any issues with compilers
-predating the returns_twice attribute not applying the same special
-handling to __sigsetjmp_cancel as to __sigsetjmp.
-
-Tested with build-many-glibcs.py for arm-linux-gnueabi that this fixes
-the testsuite build failures.
-
-[Upstream: https://github.com/bminor/glibc/commit/548f467fa14ffe7d955beeb31b30e2aeae4467e0.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- misc/sys/cdefs.h       |  8 ++++++++
- sysdeps/nptl/pthread.h | 37 +++++++++++++++++++++++++++----------
- 2 files changed, 35 insertions(+), 10 deletions(-)
-
-diff --git a/misc/sys/cdefs.h b/misc/sys/cdefs.h
-index 38221d0b..ce877487 100644
---- a/misc/sys/cdefs.h
-+++ b/misc/sys/cdefs.h
-@@ -556,4 +556,12 @@ _Static_assert (0, "IEEE 128-bits long double requires redirection on this platf
- #  define __attr_access(x)
- #endif
- 
-+/* Specify that a function such as setjmp or vfork may return
-+   twice.  */
-+#if __GNUC_PREREQ (4, 1)
-+# define __attribute_returns_twice__ __attribute__ ((__returns_twice__))
-+#else
-+# define __attribute_returns_twice__ /* Ignore.  */
-+#endif
-+
- #endif	 /* sys/cdefs.h */
-diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
-index d4194da7..3a34d823 100644
---- a/sysdeps/nptl/pthread.h
-+++ b/sysdeps/nptl/pthread.h
-@@ -512,13 +512,15 @@ extern void pthread_testcancel (void);
- 
- /* Cancellation handling with integration into exception handling.  */
- 
-+struct __cancel_jmp_buf_tag
-+{
-+  __jmp_buf __cancel_jmp_buf;
-+  int __mask_was_saved;
-+};
-+
- typedef struct
- {
--  struct
--  {
--    __jmp_buf __cancel_jmp_buf;
--    int __mask_was_saved;
--  } __cancel_jmp_buf[1];
-+  struct __cancel_jmp_buf_tag __cancel_jmp_buf[1];
-   void *__pad[4];
- } __pthread_unwind_buf_t __attribute__ ((__aligned__));
- 
-@@ -658,8 +660,8 @@ __pthread_cleanup_routine (struct __pthread_cleanup_frame *__frame)
-     __pthread_unwind_buf_t __cancel_buf;				      \
-     void (*__cancel_routine) (void *) = (routine);			      \
-     void *__cancel_arg = (arg);						      \
--    int __not_first_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *)     \
--					__cancel_buf.__cancel_jmp_buf, 0);    \
-+    int __not_first_call = __sigsetjmp_cancel (__cancel_buf.__cancel_jmp_buf, \
-+					       0);			      \
-     if (__glibc_unlikely (__not_first_call))				      \
-       {									      \
- 	__cancel_routine (__cancel_arg);				      \
-@@ -693,8 +695,8 @@ extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
-     __pthread_unwind_buf_t __cancel_buf;				      \
-     void (*__cancel_routine) (void *) = (routine);			      \
-     void *__cancel_arg = (arg);						      \
--    int __not_first_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *)     \
--					__cancel_buf.__cancel_jmp_buf, 0);    \
-+    int __not_first_call = __sigsetjmp_cancel (__cancel_buf.__cancel_jmp_buf, \
-+					       0);			      \
-     if (__glibc_unlikely (__not_first_call))				      \
-       {									      \
- 	__cancel_routine (__cancel_arg);				      \
-@@ -730,9 +732,24 @@ extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
-      ;
- #endif
- 
--/* Function used in the macros.  */
-+/* Function used in the macros.  Calling __sigsetjmp, with its first
-+   argument declared as an array, results in a -Wstringop-overflow
-+   warning from GCC 11 because struct pthread_unwind_buf is smaller
-+   than jmp_buf.  The calls from the macros have __SAVEMASK set to 0,
-+   so nothing beyond the common prefix is used and this warning is a
-+   false positive.  Use an alias with its first argument declared to
-+   use the type in the macros if possible to avoid this warning.  */
-+#if __GNUC_PREREQ (11, 0)
-+extern int __REDIRECT_NTHNL (__sigsetjmp_cancel,
-+			     (struct __cancel_jmp_buf_tag __env[1],
-+			      int __savemask),
-+			     __sigsetjmp) __attribute_returns_twice__;
-+#else
-+# define __sigsetjmp_cancel(env, savemask) \
-+  __sigsetjmp ((struct __jmp_buf_tag *) (void *) (env), (savemask))
- extern int __sigsetjmp (struct __jmp_buf_tag __env[1],
- 			int __savemask) __THROWNL;
-+#endif
- 
- 
- /* Mutex handling.  */
--- 
-2.31.1
-
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
similarity index 88%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
index d327008c1d..b289000c8a 100644
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 442e9a3f262c49cf61f9e7bdf12882f0a427666b Mon Sep 17 00:00:00 2001
 From: Michael Olbrich <m.olbrich@pengutronix.de>
 Date: Mon, 21 May 2018 16:45:02 +0200
 Subject: [PATCH] HACK: only build and install localedef
@@ -13,10 +13,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  2 files changed, 13 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index 16afa6acaa..6c208db788 100644
+index b1137afe71..2aeac31922 100644
 --- a/Rules
 +++ b/Rules
-@@ -190,10 +190,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -216,10 +216,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -38,10 +38,10 @@ index 16afa6acaa..6c208db788 100644
  
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
-index 764e751c36..c28322d71f 100644
+index b7c60681fa..de4cf4003f 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
-@@ -32,15 +32,15 @@ categories	= ctype messages monetary numeric time paper name \
+@@ -33,15 +33,15 @@ categories	= ctype messages monetary numeric time paper name \
  		  address telephone measurement identification collate
  aux		= $(categories:%=lc-%) $(categories:%=C-%) SYS_libc C_name \
  		  xlocale localename global-locale coll-lookup
@@ -61,5 +61,5 @@ index 764e751c36..c28322d71f 100644
  
  libBrokenLocale-routines = broken_cur_max
 -- 
-2.21.0
+2.33.0
 
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 90%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index a6e87cc317..d848af142f 100644
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -1,4 +1,4 @@
-From 313e04bfbd281f9b46fdde097aacb59d501820a3 Mon Sep 17 00:00:00 2001
+From 85412262460f6ba9f6e2cf8da74fc1904c54c854 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 6 Feb 2020 14:36:21 -0600
 Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
@@ -29,10 +29,10 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 6d26b824..9ac2e5e9 100755
+index 9619c10991..0c481d2339 100755
 --- a/configure
 +++ b/configure
-@@ -4601,7 +4601,7 @@ $as_echo_n "checking version of $AS... " >&6; }
+@@ -4651,7 +4651,7 @@ $as_echo_n "checking version of $AS... " >&6; }
    ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -41,7 +41,7 @@ index 6d26b824..9ac2e5e9 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -4731,7 +4731,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+@@ -4781,7 +4781,7 @@ $as_echo_n "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -50,7 +50,7 @@ index 6d26b824..9ac2e5e9 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5140,7 +5140,7 @@ int
+@@ -5189,7 +5189,7 @@ int
  main ()
  {
  
@@ -60,5 +60,5 @@ index 6d26b824..9ac2e5e9 100755
  #endif
    ;
 -- 
-2.18.0
+2.33.0
 
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
similarity index 70%
rename from package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
rename to package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
index b1d5243fcc..595de95a58 100644
--- a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
+++ b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
+sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 57ab5a3458..87d921cffe 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
+LOCALEDEF_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
