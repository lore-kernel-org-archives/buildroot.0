Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD09C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 19:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC4D4162E;
	Thu, 20 Jan 2022 19:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rnHyXn3ygLG; Thu, 20 Jan 2022 19:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A30D041637;
	Thu, 20 Jan 2022 19:26:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDF01BF2B6
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 19:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A9234016B
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 19:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVqF5ySj_g2u for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 19:26:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6EA840108
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642706787;
 bh=5rH/9mHaiTuzCHdU91lx1cIQUel4cgZQNE9qym3SZ9Y=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=gIFFZj8HEU+SYlwXaHze0xmW1qUqTrHLiZ/t+6hgqMUWuJLm66wH3WYwKf2IHq8Tn
 CkqMyjBJfCQRbsJwtcxOYrRMI8IZo+5vFgjUJVDdyBRBNQkV8YAoLPeucjVCqv8Hxw
 cEjYq8PLPCy9EglSOLlvqtfRyetQaAHcKOsJIuBU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MBUqL-1n0yIH3Bbb-00CxEe for <buildroot@buildroot.org>; Thu, 20 Jan 2022
 20:26:26 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 20:26:26 +0100
Message-Id: <20220120192626.11046-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:uWiJisO9KfgPTIC3uG1yQBlFlIgpRt2NmftW6u22l2ZScGKG683
 u5MyYBtQ00Vj4SOpf+nDJNkGsXjX5xSWWcicWeEFJ6Ve1iMV5rKg7RXJupQsRilaXOuWfGT
 6TcTKcqso95RSdAWLanHz4SiACbAKdRIqvV1a3DGjxrTenIQV2WfkK2zX3DFJ6NUUgKyJCU
 /9m5IWDAfxwln9gj/f7dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fjx2F6QW6vw=:aJDvGijNmaOrpS+KATV7o+
 KcVVyye9wwe7JrSNDRJSmWwPN/xum/idtsCii4bUsaElbElYNw+59ZDyJxdVAj0QZ9gWiUeq6
 ylysHrZnhoJSG9pZSk1sSfk/Ux6vGiRaD7ZdAA2MdNF94A0Q6RIezRqhj6Bp8kuS+MnN9wVam
 93ZUKyJ3pLilhyuGuddoA6N/Y9AovxckYN2KnBrCJAKdBwFBMF8+ZxCAJWJYfesxdnbnsXmnN
 MJPspdJ9Hn1ZozJwM7QRHyRmZhKtqPZ2l9k/s0pQTUB32bXSUgWB9+wxH1leTSXmyDHBzVGKq
 UkE9rshKF1hW2xTUBkrvKkojkfnrdp9s8cMjlsuAI1QA6is/1Iyo4f3Kg3J4wS+tzjK+Usneo
 N+TDhrU2HU01rTXB5ylL2fb20bLFNhRZ5gLzlf7wPNmMs45ksMp9Al9GrBpfgs217fCIVsJhA
 TC83PZdKaSKBtHhS2x225wffzto3P3VQQZT048jTAC22Tg1safwdc7f2HzI8tDX7K8Ovaw2T0
 z4MHI4DYXII8FToSE3aiMfXx9LFI+kYcxU9vsK8JKOLQJnOh55jTsSx2nq4H54ZcwYMbG5Wus
 oZroANiXRfTQa+GbRJfHnQYFbBrQDJLALFOKOIrXcKRwo/NXOrsl5aFakA6+4oX/GVeiXZdJd
 vXXegqIwePqder+AT1LvC0nhIhZ88kdiOHQPcsuzI2PKO5iaSaOjMrWJeGlEDCuhthGi3Q5x+
 /z3KWo9JJpsgqgXgNE4norxU5zfKbQiLtw1v+e7NYBVdli8gu9nUg24NrY/m6KjgoG0xrKsLK
 DNzxLlvgeWN/VZ11ZRwI8N2LIUZa6GYGJ6uhGpVBcX4UMCCFAQTylbRfxBFG3WObPSkS+L+No
 xFPaCh8BS/S3FkkwN5Uu9eD45hu4VonlzHWlA/jRMPIqwwYwKtmCysPzrQ2tm4NGCQN2SnnEq
 kG0kykS4VljlaVyAm/UzQO3nsFmyl0DNWu8+gyHjl2XIhuL5dR+QVmA6G81eUqDUFuIN7PVx+
 J/XAAeK8eeeRNXBo3ktnWJSgJaz3SLM4vWzgzHaBW7jWcTD+IT8ZYRYGqABaXFllN908SVwtU
 GCEonyJS0JISAI=
Subject: [Buildroot] [PATCH v1] package/bash: bump version to 5.1.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove upstream patch level patches
  0001-bash51-001.patch
  0002-bash51-002.patch
  0003-bash51-003.patch
  0004-bash51-004.patch

- renumber remaining patches

For details see [1].

[1] http://git.savannah.gnu.org/cgit/bash.git/log

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bash/0001-bash51-001.patch            |  83 -----------
 ...ut.h-add-missing-include-on-stdio.h.patch} |   0
 package/bash/0002-bash51-002.patch            |  60 --------
 ...ocal_shiftstates-vs.-locale_shiftst.patch} |   0
 package/bash/0003-bash51-003.patch            |  56 --------
 ...uote_pathname-vs.-udequote_pathname.patch} |   0
 package/bash/0004-bash51-004.patch            | 129 ------------------
 package/bash/bash.hash                        |   4 +-
 package/bash/bash.mk                          |   2 +-
 9 files changed, 3 insertions(+), 331 deletions(-)
 delete mode 100644 package/bash/0001-bash51-001.patch
 rename package/bash/{0005-input.h-add-missing-include-on-stdio.h.patch => 0001-input.h-add-missing-include-on-stdio.h.patch} (100%)
 delete mode 100644 package/bash/0002-bash51-002.patch
 rename package/bash/{0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch => 0002-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch} (100%)
 delete mode 100644 package/bash/0003-bash51-003.patch
 rename package/bash/{0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch => 0003-glob-fix-dequote_pathname-vs.-udequote_pathname.patch} (100%)
 delete mode 100644 package/bash/0004-bash51-004.patch

diff --git a/package/bash/0001-bash51-001.patch b/package/bash/0001-bash51-001.patch
deleted file mode 100644
index 8f18cccc31..0000000000
--- a/package/bash/0001-bash51-001.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-001]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.1
-Patch-ID:	bash51-001
-
-Bug-Reported-by:	Fazal Majid <fazal@majid.org>
-Bug-Reference-ID:	<DEAB7D2C-C626-450C-B2E5-281AFF2D26D4@majid.org>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00000.html
-
-Bug-Description:
-
-There is a missing dependency on a constructed file, which can cause highly
-parellel builds to fail.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.1-patched/Makefile.in	2020-12-04 09:51:19.000000000 -0500
---- b/Makefile.in	2020-12-16 11:28:36.000000000 -0500
-***************
-*** 1316,1319 ****
---- 1316,1320 ----
-  bashline.o: pcomplete.h ${BASHINCDIR}/chartypes.h input.h
-  bashline.o: ${BASHINCDIR}/shmbutil.h ${BASHINCDIR}/shmbchar.h
-+ bashline.o: ${DEFDIR}/builtext.h
-  bracecomp.o: config.h bashansi.h ${BASHINCDIR}/ansi_stdlib.h
-  bracecomp.o: shell.h syntax.h config.h bashjmp.h ${BASHINCDIR}/posixjmp.h
-***************
-*** 1436,1439 ****
---- 1437,1441 ----
-  builtins/evalstring.o: jobs.h builtins.h flags.h input.h execute_cmd.h
-  builtins/evalstring.o: bashhist.h $(DEFSRC)/common.h pathnames.h
-+ builtins/evalstring.o: ${DEFDIR}/builtext.h
-  builtins/getopt.o: config.h ${BASHINCDIR}/memalloc.h
-  builtins/getopt.o: shell.h syntax.h bashjmp.h command.h general.h xmalloc.h error.h
-
-*** ../bash-5.1-patched/builtins/Makefile.in	2019-07-25 08:03:45.000000000 -0400
---- b/builtins/Makefile.in	2020-12-16 11:29:29.000000000 -0500
-***************
-*** 362,366 ****
-  evalstring.o: $(topdir)/flags.h $(topdir)/input.h $(topdir)/execute_cmd.h
-  evalstring.o: $(topdir)/bashhist.h $(srcdir)/common.h
-! evalstring.o: $(topdir)/trap.h $(topdir)/redir.h ../pathnames.h
-  #evalstring.o: $(topdir)/y.tab.h
-  getopt.o: ../config.h $(BASHINCDIR)/memalloc.h
---- 362,366 ----
-  evalstring.o: $(topdir)/flags.h $(topdir)/input.h $(topdir)/execute_cmd.h
-  evalstring.o: $(topdir)/bashhist.h $(srcdir)/common.h
-! evalstring.o: $(topdir)/trap.h $(topdir)/redir.h ../pathnames.h ./builtext.h
-  #evalstring.o: $(topdir)/y.tab.h
-  getopt.o: ../config.h $(BASHINCDIR)/memalloc.h
-
-*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
-***************
-*** 1,5 ****
-  /* patchlevel.h -- current bash patch level */
-  
-! /* Copyright (C) 2001-2016 Free Software Foundation, Inc.
-  
-     This file is part of GNU Bash, the Bourne Again SHell.
---- 1,5 ----
-  /* patchlevel.h -- current bash patch level */
-  
-! /* Copyright (C) 2001-2020 Free Software Foundation, Inc.
-  
-     This file is part of GNU Bash, the Bourne Again SHell.
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 0
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 1
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0005-input.h-add-missing-include-on-stdio.h.patch b/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
similarity index 100%
rename from package/bash/0005-input.h-add-missing-include-on-stdio.h.patch
rename to package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
diff --git a/package/bash/0002-bash51-002.patch b/package/bash/0002-bash51-002.patch
deleted file mode 100644
index c9836082c1..0000000000
--- a/package/bash/0002-bash51-002.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-002]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.1
-Patch-ID:	bash51-002
-
-Bug-Reported-by:	oguzismailuysal@gmail.com
-Bug-Reference-ID:	<CAH7i3LoHFUa4aSF5-AD2r80HG-p-YzD_9ZxomarZkhP8NMq63g@mail.gmail.com>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00037.html
-
-Bug-Description:
-
-If there are no jobs, and the `-n' and `-p' options are both supplied to
-`wait', bash can assign a value to the variable name specified with `-p'
-instead of leaving it unset.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.1-patched/builtins/wait.def	2020-04-09 15:13:57.000000000 -0400
---- b/builtins/wait.def	2020-12-11 09:46:49.000000000 -0500
-***************
-*** 214,222 ****
-  
-        status = wait_for_any_job (wflags, &pstat);
--       if (status < 0)
-- 	status = 127;
-- 
-        if (vname && status >= 0)
-  	bind_var_to_int (vname, pstat.pid);
-        if (list)
-  	unset_waitlist ();
---- 214,222 ----
-  
-        status = wait_for_any_job (wflags, &pstat);
-        if (vname && status >= 0)
-  	bind_var_to_int (vname, pstat.pid);
-+ 
-+       if (status < 0)
-+ 	status = 127;
-        if (list)
-  	unset_waitlist ();
-
-*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 1
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 2
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch b/package/bash/0002-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
similarity index 100%
rename from package/bash/0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
rename to package/bash/0002-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
diff --git a/package/bash/0003-bash51-003.patch b/package/bash/0003-bash51-003.patch
deleted file mode 100644
index ff13fb0c9f..0000000000
--- a/package/bash/0003-bash51-003.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-003]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.1
-Patch-ID:	bash51-003
-
-Bug-Reported-by:	oguzismailuysal@gmail.com
-Bug-Reference-ID:	<CAH7i3LpG91BnNcDtaTUm2Ph7a+PnJkuh6nAc87cVL7_38tOaMQ@mail.gmail.com>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00050.html
-
-Bug-Description:
-
-Bash does not put a command substitution process that is started to perform an
-expansion in a child process into the right process group where it can receive
-keyboard-generated signals.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.1-patched/subst.c	2020-11-16 10:33:15.000000000 -0500
---- b/subst.c	2020-12-12 13:50:11.000000000 -0500
-***************
-*** 6357,6362 ****
-  #if defined (JOB_CONTROL)
-    old_pipeline_pgrp = pipeline_pgrp;
-!   /* Don't reset the pipeline pgrp if we're already a subshell in a pipeline. */
-!   if ((subshell_environment & SUBSHELL_PIPE) == 0)
-      pipeline_pgrp = shell_pgrp;
-    cleanup_the_pipeline ();
---- 6357,6364 ----
-  #if defined (JOB_CONTROL)
-    old_pipeline_pgrp = pipeline_pgrp;
-!   /* Don't reset the pipeline pgrp if we're already a subshell in a pipeline or
-!      we've already forked to run a disk command (and are expanding redirections,
-!      for example). */
-!   if ((subshell_environment & (SUBSHELL_FORK|SUBSHELL_PIPE)) == 0)
-      pipeline_pgrp = shell_pgrp;
-    cleanup_the_pipeline ();
-
-*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 2
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 3
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch b/package/bash/0003-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
similarity index 100%
rename from package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
rename to package/bash/0003-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
diff --git a/package/bash/0004-bash51-004.patch b/package/bash/0004-bash51-004.patch
deleted file mode 100644
index 48a38645f7..0000000000
--- a/package/bash/0004-bash51-004.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-004]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.1
-Patch-ID:	bash51-004
-
-Bug-Reported-by:	oguzismailuysal@gmail.com
-Bug-Reference-ID:	<CAH7i3LoHGmwaghDpCWRUfcY04gQmeDTH3RiG=bf2b=KbU=gyhw@mail.gmail.com>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00039.html
-
-Bug-Description:
-
-If a key-value compound array assignment to an associative array is supplied
-as an assignment statement argument to the `declare' command that declares the
-array, the assignment doesn't perform the correct word expansions.
-
-This patch makes key-value assignment and subscript assignment perform the
-same expansions when they're supplied as an argument to `declare'.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.1-patched/arrayfunc.c	2020-10-09 11:38:58.000000000 -0400
---- b/arrayfunc.c	2020-12-11 15:12:22.000000000 -0500
-***************
-*** 598,601 ****
---- 598,622 ----
-      }
-  }
-+ 
-+ /* Return non-zero if L appears to be a key-value pair associative array
-+    compound assignment. */ 
-+ int
-+ kvpair_assignment_p (l)
-+      WORD_LIST *l;
-+ {
-+   return (l && (l->word->flags & W_ASSIGNMENT) == 0 && l->word->word[0] != '[');	/*]*/
-+ }
-+ 
-+ char *
-+ expand_and_quote_kvpair_word (w)
-+      char *w;
-+ {
-+   char *t, *r;
-+ 
-+   t = w ? expand_assignment_string_to_string (w, 0) : 0;
-+   r = sh_single_quote (t ? t : "");
-+   free (t);
-+   return r;
-+ }
-  #endif
-       
-***************
-*** 641,645 ****
-  
-  #if ASSOC_KVPAIR_ASSIGNMENT
-!   if (assoc_p (var) && nlist && (nlist->word->flags & W_ASSIGNMENT) == 0 && nlist->word->word[0] != '[')	/*]*/
-      {
-        iflags = flags & ~ASS_APPEND;
---- 662,666 ----
-  
-  #if ASSOC_KVPAIR_ASSIGNMENT
-!   if (assoc_p (var) && kvpair_assignment_p (nlist))
-      {
-        iflags = flags & ~ASS_APPEND;
-*** ../bash-5.1-patched/arrayfunc.h	2020-04-29 17:24:15.000000000 -0400
---- b/arrayfunc.h	2020-12-11 14:23:50.000000000 -0500
-***************
-*** 68,71 ****
---- 68,74 ----
-  extern void quote_compound_array_list PARAMS((WORD_LIST *, int));
-  
-+ extern int kvpair_assignment_p PARAMS((WORD_LIST *));
-+ extern char *expand_and_quote_kvpair_word PARAMS((char *));
-+ 
-  extern int unbind_array_element PARAMS((SHELL_VAR *, char *, int));
-  extern int skipsubscript PARAMS((const char *, int, int));
-*** ../bash-5.1-patched/subst.c	2020-11-16 10:33:15.000000000 -0500
---- b/subst.c	2020-12-11 15:11:10.000000000 -0500
-***************
-*** 11605,11608 ****
---- 11605,11609 ----
-    WORD_LIST *l, *nl;
-    char *t;
-+   int kvpair;
-    
-    if (flags == 0)
-***************
-*** 11619,11622 ****
---- 11620,11627 ----
-        /* Associative array */
-        l = parse_string_to_word_list (value, 1, "array assign");
-+ #if ASSOC_KVPAIR_ASSIGNMENT
-+       kvpair = kvpair_assignment_p (l);
-+ #endif
-+ 
-        /* For associative arrays, with their arbitrary subscripts, we have to
-  	 expand and quote in one step so we don't have to search for the
-***************
-*** 11624,11627 ****
---- 11629,11638 ----
-        for (nl = l; nl; nl = nl->next)
-  	{
-+ #if ASSOC_KVPAIR_ASSIGNMENT
-+ 	  if (kvpair)
-+ 	    /* keys and values undergo the same set of expansions */
-+ 	    t = expand_and_quote_kvpair_word (nl->word->word);
-+ 	  else
-+ #endif
-  	  if ((nl->word->flags & W_ASSIGNMENT) == 0)
-  	    t = sh_single_quote (nl->word->word ? nl->word->word : "");
-
-*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 3
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 4
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 2e547c8c30..4660e9d38a 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://mirror.keystealth.org/gnu/bash/bash-5.1.tar.gz.sig
-sha256  cc012bc860406dcf42f64431bcd3d2fa7560c02915a601aba9cd597a39329baa  bash-5.1.tar.gz
+# https://ftp.gnu.org/gnu/bash/bash-5.1.16.tar.gz.sig
+sha256  5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558  bash-5.1.16.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 7b853ece08..3aca22898e 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.1
+BASH_VERSION = 5.1.16
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
