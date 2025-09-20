Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBE7CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 11:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D55240F81;
	Sat, 20 Sep 2025 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTulndP-5Gbt; Sat, 20 Sep 2025 11:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5012B40F97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5012B40F97;
	Sat, 20 Sep 2025 11:21:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03027D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F8D400BD
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbsLs8ZJibGO for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 11:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C7C340057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C7C340057
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C7C340057
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:21:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-62fbfeb0870so2436531a12.2
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 04:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758367307; x=1758972107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ph+NTL358ihsaEc+Kv43WShr8RFLKDG1l0rPeopwIqI=;
 b=C/4joie9mdxT3u0wBdYHemzs2ug0WbD+7xAtGBDS34tluCHmY7uTIA261SncBV0/3t
 cJIY+j9lwdXkByZB9yns/9jSCtbs67R8VOAu5568ypzoYRNK+l0adZqZr0kF3b0lzc0W
 x3i4jIZjMs7R4mNpd4V3KBDUCnMTC52svYCKu2hCPZMip5uR6dsHiZmgy7hY9AvQzFXT
 QAUkdwolk6sVWvuM+7HIB3dPe8XoqwKGkcWVjlXb77cITDqZCacWX/X4xa1UhMhCTYsc
 Exrxo9EfQgIDc5DPXYJ6xts4NEBpY2ZKKYKlm4Xx59POWrOFtZlUCvyvc3+cr6ICSCei
 /RwQ==
X-Gm-Message-State: AOJu0Yz6JEujfKSD+HlFTpBhwYCZ8MjbbOuB3o4nZjUbqKCZORvd4tRE
 vabJ4VA2wN5e1jsROUK/AU/z1kqNXI6HqAZatnibZKKM7DfNakbYJg4KKPeRhKlIm2Gg4RaDlWd
 oooHo
X-Gm-Gg: ASbGnct+zKUu88LuZG1q0s4A8A1siXx+VPhbnLJIckmX8moS95eZ5qQQyE4JyxFdp3l
 0ADnqKgoHNGVkHf8DGPRzcBgXHCCpgFDinEDRsFSbqqLBKYU0ZrRIYyK33uFNAxYEKz31u6nqwh
 HGS+4FEa8EGgaXMki4kqnRQBFP+B5q15MpqUmd9Z2aoMxV1lRRRbtP2YssGgN9+mq1ybIndJtRF
 eXn+wkMAWGmmP7iVuasz+StETm4Inwu0dtR6T8AmfzhzFu/6e1rdmkK1+a4IFQru4YC84m0E6dM
 5ZvfYk+Kgxi3/pE+/xepMIjpcY9U3K6MYKjjNWYQOwzsvuOqISkgzLJXdd2oStDpSgquGruGy6u
 9nTP05RxwtTxdlv1/P4agwWpOqOVkKTWKu16z2q265QZMScw7b9p3SNmztJawh8CqDXl059Y3Ue
 bT4gxUQ0rGlZh115HN1vRdg7BeQgCUlWz/vuC5ciuJjm69Uwe7HAN5E7LJU8BeqwnV
X-Google-Smtp-Source: AGHT+IHYQYWF12/DTJooDAqTBaMwciYJB3iLPkfizFFRNA8DN+vNFDUS7dlNrhpXlyP+Wkp+QJxqsw==
X-Received: by 2002:a05:6402:5411:b0:61c:8114:8832 with SMTP id
 4fb4d7f45d1cf-62fc090ab2fmr5533227a12.16.1758367306773; 
 Sat, 20 Sep 2025 04:21:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d03befsm5243613a12.2.2025.09.20.04.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 04:21:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 20 Sep 2025 13:21:37 +0200
Message-ID: <20250920112138.2577200-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758367307; x=1758972107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ph+NTL358ihsaEc+Kv43WShr8RFLKDG1l0rPeopwIqI=;
 b=di+SE2XDoEwx3lr6kMPfzOONh2nXOvgZpw3d7aOTedsXAqrDXgwHyrJUxHDeeEgQY9
 O3JYgvI47r1xWy9tRlUdO5NM90litDgzNEVKMnt5D72LorOichva8N8GxZUUWipA4Kny
 AAxWld5ZRzJ1fENCjIhLFflLChpBWnezWUUuQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=di+SE2XD
Subject: [Buildroot] [PATCH 1/2] package/bc: bump to 1.08.2
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

Release notes:
https://mail.gnu.org/archive/html/info-gnu/2025-01/msg00000.html
https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00002.html
https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00006.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |   3 -
 ...and-write-errors-on-input-and-output.patch | 793 ------------------
 .../0003-dc-fix-exit-code-of-q-command.patch  |  46 -
 package/bc/0004-no-gen-libmath.patch          |  97 ---
 package/bc/bc.hash                            |   2 +-
 package/bc/bc.mk                              |   6 +-
 6 files changed, 4 insertions(+), 943 deletions(-)
 delete mode 100644 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
 delete mode 100644 package/bc/0003-dc-fix-exit-code-of-q-command.patch
 delete mode 100644 package/bc/0004-no-gen-libmath.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index d8d0bc6969fe..ed81b4e0e87a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -245,9 +245,6 @@ package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch lib_pa
 package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstream
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch lib_patch.Upstream
-package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch lib_patch.Upstream
-package/bc/0003-dc-fix-exit-code-of-q-command.patch lib_patch.Upstream
-package/bc/0004-no-gen-libmath.patch lib_patch.Upstream
 package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch lib_patch.Upstream
 package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch lib_patch.Upstream
 package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch lib_patch.Upstream
diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
deleted file mode 100644
index 7649ae8c4f5b..000000000000
--- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
+++ /dev/null
@@ -1,793 +0,0 @@
-From af96fb92052c307818eefa4b687f964f1e3f542e Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Thu, 12 Sep 2019 15:04:35 -0500
-Subject: [PATCH] notice read and write errors on input and output
-
-Quoting from the bug report:
-   bc (1.06-19ubuntu1) dapper; urgency=low
-   * Make dc notice read and write errors on its input and output.
-     I grepped for mentions of the strings `putc', `print', `getc',
-     `FILE', `stdin', `stdout' and `stderr' and added calls to new
-     error-checking functions unless it was clear from the
-     immediately-surrounding code that the program was exiting
-     nonzero, or would exit nonzero if the call failed.  I ignored
-     hits in lib/getopt*, which seems to pervasively ignore write
-     errors when printing usage messages, in the hope that these
-     were correct.  I _think_ I got them all.  -iwj.
-     -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
-
-Upstream:
-https://sources.debian.org/patches/bc/1.07.1-2/05_notice_read_write_errors.diff/
-
-[Reformatted to GIT for 1.0.7.1 by Matt W]
-Updated by Ryan Kavanagh <rak@debian.org> for 1.0.7.1 on 26 July 2017.
-Author: Ian Jackson <iwj@ubuntu.com>
-Origin: other
-Bug-Debian: http://bugs.debian.org/488735
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd:
- Updated to incorporate changes by Matthias Klose <doko@debian.org>
- on 2024-03-13 that fix Debian bug https://bugs.debian.org/1065375]
----
- bc/execute.c | 10 +++++++++-
- bc/main.c    |  3 +++
- bc/sbc.y     |  2 ++
- bc/scan.c    |  2 ++
- bc/scan.l    |  3 +++
- bc/util.c    | 15 ++++++++++++--
- dc/dc.c      |  3 +++
- dc/eval.c    | 55 +++++++++++++++++++++++++++++++++++++++-------------
- dc/misc.c    |  1 +
- dc/numeric.c |  9 +++++++++
- dc/stack.c   | 11 ++++++++++-
- dc/string.c  |  2 ++
- h/number.h   | 11 +++++++----
- lib/number.c | 24 +++++++++++++++++++++++
- 14 files changed, 129 insertions(+), 22 deletions(-)
-
-diff --git a/bc/execute.c b/bc/execute.c
-index 256e4b7..50eac49 100644
---- a/bc/execute.c
-+++ b/bc/execute.c
-@@ -104,6 +104,7 @@ execute (void)
- 	      }
- 	    out_char ('\n');
- 	  }
-+	checkferror_output(stdout);
-       }
- #endif
- 
-@@ -224,6 +225,7 @@ execute (void)
- 		}
- 	    }
- 	fflush (stdout);
-+	checkferror_output(stdout);
- 	break;
- 
-       case 'R' : /* Return from function */
-@@ -259,6 +261,7 @@ execute (void)
- 	if (inst == 'W') out_char ('\n');
- 	store_var (4);  /* Special variable "last". */
- 	fflush (stdout);
-+	checkferror_output(stdout);
- 	pop ();
- 	break;
- 
-@@ -342,6 +345,7 @@ execute (void)
-       case 'w' : /* Write a string to the output. */
- 	while ((ch = byte(&pc)) != '"') out_schar (ch);
- 	fflush (stdout);
-+	checkferror_output(stdout);
- 	break;
- 		   
-       case 'x' : /* Exchange Top of Stack with the one under the tos. */
-@@ -549,7 +553,10 @@ execute (void)
-     {
-       signal (SIGINT, use_quit);
-       if (had_sigint)
--	printf ("\ninterrupted execution.\n");
-+	{
-+	  printf ("\ninterrupted execution.\n");
-+	  checkferror_output(stdout);
-+	}
-     }
- }
- 
-@@ -584,6 +591,7 @@ input_char (void)
- 	  out_col = 0;  /* Saw a new line */
- 	}
-     }
-+  checkferror_input(stdin);
- 
-   /* Classify and preprocess the input character. */
-   if (isdigit(in_ch))
-diff --git a/bc/main.c b/bc/main.c
-index 012075c..c96207b 100644
---- a/bc/main.c
-+++ b/bc/main.c
-@@ -353,6 +353,9 @@ use_quit (int sig)
-   errno = save;
- #else
-   write (1, "\n(interrupt) Exiting bc.\n", 26);
-+#ifdef READLINE
-+  rl_initialize (); /* Clear readline buffer */
-+#endif
-   bc_exit(0);
- #endif
- }
-diff --git a/bc/sbc.y b/bc/sbc.y
-index 586686b..921ab1e 100644
---- a/bc/sbc.y
-+++ b/bc/sbc.y
-@@ -86,7 +86,9 @@ program			: /* empty */
- 			      if (interactive && !quiet)
- 				{
- 				  show_bc_version ();
-+				  checkferror_output(stdout);
- 				  welcome ();
-+				  checkferror_output(stdout);
- 				}
- 			    }
- 			| program input_item
-diff --git a/bc/scan.c b/bc/scan.c
-index b237f55..8dee4e9 100644
---- a/bc/scan.c
-+++ b/bc/scan.c
-@@ -791,6 +791,7 @@ bcel_input (char *buf, yy_size_t  *result, int max)
-       if (bcel_len != 0)
- 	history (hist, &histev, H_ENTER, bcel_line); 
-       fflush (stdout);
-+      checkferror_output(stdout);
-     }
- 
-   if (bcel_len <= max)
-@@ -863,6 +864,7 @@ rl_input (char *buf, int *result, int max)
- 	add_history (rl_line); 
-       rl_line[rl_len-1] = '\n';
-       fflush (stdout);
-+      checkferror_output(stdout);
-     }
- 
-   if (rl_len <= max)
-diff --git a/bc/scan.l b/bc/scan.l
-index eb2e2dd..79186bb 100644
---- a/bc/scan.l
-+++ b/bc/scan.l
-@@ -99,6 +99,7 @@ bcel_input (char *buf, yy_size_t  *result, int max)
-       if (bcel_len != 0)
- 	history (hist, &histev, H_ENTER, bcel_line); 
-       fflush (stdout);
-+      checkferror_output(stdout);
-     }
- 
-   if (bcel_len <= max)
-@@ -171,6 +172,7 @@ rl_input (char *buf, int *result, int max)
- 	add_history (rl_line); 
-       rl_line[rl_len-1] = '\n';
-       fflush (stdout);
-+      checkferror_output(stdout);
-     }
- 
-   if (rl_len <= max)
-@@ -295,6 +297,7 @@ limits return(Limits);
- 	    if (c == EOF)
- 	      {
- 		fprintf (stderr,"EOF encountered in a comment.\n");
-+                checkferror_output(stderr);
- 		break;
- 	      }
- 	  }
-diff --git a/bc/util.c b/bc/util.c
-index 8eba093..cacd796 100644
---- a/bc/util.c
-+++ b/bc/util.c
-@@ -247,9 +247,10 @@ init_gen (void)
-   continue_label = 0;
-   next_label  = 1;
-   out_count = 2;
--  if (compile_only) 
-+  if (compile_only) {
-     printf ("@i");
--  else
-+    checkferror_output(stdout);
-+  } else
-     init_load ();
-   had_error = FALSE;
-   did_gen = FALSE;
-@@ -272,6 +273,7 @@ generate (const char *str)
- 	  printf ("\n");
- 	  out_count = 0;
- 	}
-+      checkferror_output(stdout);
-     }
-   else
-     load_code (str);
-@@ -289,6 +291,7 @@ run_code(void)
-       if (compile_only)
- 	{
- 	  printf ("@r\n"); 
-+	  checkferror_output(stdout);
- 	  out_count = 0;
- 	}
-       else
-@@ -326,6 +329,7 @@ out_char (int ch)
- 	}
-       putchar (ch);
-     }
-+  checkferror_output(stdout);
- }
- 
- /* Output routines: Write a character CH to the standard output.
-@@ -355,6 +359,7 @@ out_schar (int ch)
- 	}
-       putchar (ch);
-     }
-+  checkferror_output(stdout);
- }
- 
- 
-@@ -639,6 +644,7 @@ limits(void)
- #ifdef OLD_EQ_OP
-   printf ("Old assignment operatiors are valid. (=-, =+, ...)\n");
- #endif 
-+  checkferror_output(stdout);
- }
- 
- /* bc_malloc will check the return value so all other places do not
-@@ -703,6 +709,7 @@ yyerror (str, va_alist)
-   fprintf (stderr,"%s %d: ",name,line_no);
-   vfprintf (stderr, str, args);
-   fprintf (stderr, "\n");
-+  checkferror_output(stderr);
-   had_error = TRUE;
-   va_end (args);
- }
-@@ -743,6 +750,7 @@ ct_warn (mesg, va_alist)
-       fprintf (stderr,"%s %d: Error: ",name,line_no);
-       vfprintf (stderr, mesg, args);
-       fprintf (stderr, "\n");
-+      checkferror_output(stderr);
-       had_error = TRUE;
-     }
-   else
-@@ -755,6 +763,7 @@ ct_warn (mesg, va_alist)
- 	fprintf (stderr,"%s %d: (Warning) ",name,line_no);
- 	vfprintf (stderr, mesg, args);
- 	fprintf (stderr, "\n");
-+	checkferror_output(stderr);
-       }
-   va_end (args);
- }
-@@ -789,6 +798,7 @@ rt_error (mesg, va_alist)
-   va_end (args);
-   
-   fprintf (stderr, "\n");
-+  checkferror_output(stderr);
-   runtime_error = TRUE;
- }
- 
-@@ -823,6 +833,7 @@ rt_warn (const char *mesg)
-   va_end (args);
- 
-   fprintf (stderr, "\n");
-+  checkferror_output(stderr);
- }
- 
- /* bc_exit: Make sure to reset the edit state. */
-diff --git a/dc/dc.c b/dc/dc.c
-index 6a2bb26..ccdb1c2 100644
---- a/dc/dc.c
-+++ b/dc/dc.c
-@@ -45,6 +45,7 @@
- #include <getopt.h>
- #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
- 
- #ifndef EXIT_SUCCESS	/* C89 <stdlib.h> */
- # define EXIT_SUCCESS	0
-@@ -59,6 +59,7 @@ static void
- bug_report_info DC_DECLVOID()
- {
- 	printf("Email bug reports to:  bug-dc@gnu.org .\n");
-+	checkferror_output(stdout);
- }
- 
- static void
-@@ -69,6 +70,7 @@ show_version DC_DECLVOID()
- This is free software; see the source for copying conditions.  There is NO\n\
- warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE,\n\
- to the extent permitted by law.\n", DC_COPYRIGHT);
-+	checkferror_output(stdout);
- }
- 
- /* your generic usage function */
-@@ -85,6 +87,7 @@ Usage: %s [OPTION] [file ...]\n\
- \n\
- ", progname);
- 	bug_report_info();
-+	checkferror_output(f);
- }
- 
- /* returns a pointer to one past the last occurance of c in s,
-diff --git a/dc/eval.c b/dc/eval.c
-index 05a3d9e..6c54e61 100644
---- a/dc/eval.c
-+++ b/dc/eval.c
-@@ -41,6 +41,7 @@
- #endif
- #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
- 
- typedef enum {DC_FALSE, DC_TRUE} dc_boolean;
- 
-@@ -97,12 +97,15 @@ static int input_pushback;
- static int
- input_fil DC_DECLVOID()
- {
-+		int c;
- 	if (input_pushback != EOF){
--		int c = input_pushback;
-+		c = input_pushback;
- 		input_pushback = EOF;
- 		return c;
- 	}
--	return getc(input_fil_fp);
-+	c = getc(input_fil_fp);
-+	checkferror_input(input_fil_fp);
-+	return c;
- }
- 
- /* passed as an argument to dc_getnum */
-@@ -301,11 +304,13 @@ dc_func DC_DECLARG((c, peekc, negcmp))
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
- 			if (2 <= tmpint  &&  tmpint <= DC_IBASE_MAX)
- 				dc_ibase = tmpint;
--			else
-+			else {
- 				fprintf(stderr,
- 						"%s: input base must be a number \
- between 2 and %d (inclusive)\n",
- 						progname, DC_IBASE_MAX);
-+				checkferror_output(stderr);
-+			}
- 		}
- 		break;
- 	case 'k':	/* set scale to value on top of stack */
-@@ -313,11 +318,12 @@ between 2 and %d (inclusive)\n",
- 			tmpint = -1;
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
--			if ( ! (tmpint >= 0) )
-+			if ( ! (tmpint >= 0) ) {
- 				fprintf(stderr,
- 						"%s: scale must be a nonnegative number\n",
- 						progname);
--			else
-+				checkferror_output(stderr);
-+			} else
- 				dc_scale = tmpint;
- 		}
- 		break;
-@@ -341,11 +347,12 @@ between 2 and %d (inclusive)\n",
- 			tmpint = 0;
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
--			if ( ! (tmpint > 1) )
-+			if ( ! (tmpint > 1) ) {
- 				fprintf(stderr,
- 						"%s: output base must be a number greater than 1\n",
- 						progname);
--			else
-+				checkferror_output(stderr);
-+			} else
- 				dc_obase = tmpint;
- 		}
- 		break;
-@@ -378,6 +385,7 @@ between 2 and %d (inclusive)\n",
- 				fprintf(stderr,
- 						"%s: square root of nonnumeric attempted\n",
- 						progname);
-+				checkferror_output(stderr);
- 			}else if (dc_sqrt(datum.v.number, dc_scale, &tmpnum) == DC_SUCCESS){
- 				dc_free_num(&datum.v.number);
- 				datum.v.number = tmpnum;
-@@ -424,6 +432,7 @@ between 2 and %d (inclusive)\n",
- 				dc_garbage("at top of stack", -1);
- 		}
- 		fflush(stdout);
-+		checkferror_output(stdout);
- 		break;
- 	case 'Q':	/* quit out of top-of-stack nested evals;
- 				 * pops value from stack;
-@@ -440,6 +449,7 @@ between 2 and %d (inclusive)\n",
- 			fprintf(stderr,
- 					"%s: Q command requires a number >= 1\n",
- 					progname);
-+			checkferror_output(stderr);
- 		}
- 		break;
- 	case 'R':	/* pop a value off of the evaluation stack,;
-@@ -483,11 +493,12 @@ between 2 and %d (inclusive)\n",
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
- 			if (dc_pop(&datum) == DC_SUCCESS){
--				if (tmpint < 0)
-+				if (tmpint < 0) {
- 					fprintf(stderr,
- 							"%s: array index must be a nonnegative integer\n",
- 							progname);
--				else
-+					checkferror_output(stderr);
-+				} else
- 					dc_array_set(peekc, tmpint, datum);
- 			}
- 		}
-@@ -499,18 +510,21 @@ between 2 and %d (inclusive)\n",
- 			tmpint = -1;
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
--			if (tmpint < 0)
-+			if (tmpint < 0) {
- 				fprintf(stderr,
- 						"%s: array index must be a nonnegative integer\n",
- 						progname);
--			else
-+				checkferror_output(stderr);
-+			} else
- 				dc_push(dc_array_get(peekc, tmpint));
- 		}
- 		return DC_EATONE;
- 
- 	default:	/* What did that user mean? */
- 		fprintf(stderr, "%s: ", progname);
-+		checkferror_output(stderr);
- 		dc_show_id(stdout, c, " unimplemented\n");
-+		checkferror_output(stdout);
- 		break;
- 	}
- 	return DC_OKAY;
-@@ -538,6 +552,7 @@ evalstr DC_DECLARG((string))
- 		fprintf(stderr,
- 				"%s: eval called with non-string argument\n",
- 				progname);
-+		checkferror_output(stderr);
- 		return DC_OKAY;
- 	}
- 	interrupt_seen = 0;
-@@ -635,6 +650,7 @@ evalstr DC_DECLARG((string))
- 				return DC_FAIL;
- 			}
- 			fprintf(stderr, "%s: unexpected EOS\n", progname);
-+			checkferror_output(stderr);
- 			return DC_OKAY;
- 		}
- 	}
-@@ -692,6 +708,7 @@ dc_evalfile DC_DECLARG((fp))
- 	stdin_lookahead = EOF;
- 	for (c=getc(fp); c!=EOF; c=peekc){
- 		peekc = getc(fp);
-+		checkferror_input(stdin);
- 		/*
- 		 * The following if() is the only place where ``stdin_lookahead''
- 		 * might be set to other than EOF:
-@@ -717,24 +734,30 @@ dc_evalfile DC_DECLARG((fp))
- 		signal(SIGINT, sigint_handler);
- 		switch (dc_func(c, peekc, negcmp)){
- 		case DC_OKAY:
--			if (stdin_lookahead != peekc  &&  fp == stdin)
-+			if (stdin_lookahead != peekc  &&  fp == stdin) {
- 				peekc = getc(fp);
-+				checkferror_input(stdin);
-+			}
- 			break;
- 		case DC_EATONE:
- 			peekc = getc(fp);
-+			checkferror_input(fp);
- 			break;
- 		case DC_EVALREG:
- 			/*commands which send us here shall guarantee that peekc!=EOF*/
- 			c = peekc;
- 			peekc = getc(fp);
-+			checkferror_input(fp);
- 			stdin_lookahead = peekc;
- 			if (dc_register_get(c, &datum) != DC_SUCCESS)
- 				break;
- 			dc_push(datum);
- 			/*@fallthrough@*/
- 		case DC_EVALTOS:
--			if (stdin_lookahead != peekc  &&  fp == stdin)
-+			if (stdin_lookahead != peekc  &&  fp == stdin) {
- 				peekc = getc(fp);
-+				checkferror_input(stdin);
-+			}
- 			if (dc_pop(&datum) == DC_SUCCESS){
- 				if (datum.dc_type == DC_NUMBER){
- 					dc_push(datum);
-@@ -744,6 +767,7 @@ dc_evalfile DC_DECLARG((fp))
- 							goto reset_and_exit_quit;
- 						fprintf(stderr, "%s: Q command argument exceeded \
- string execution depth\n", progname);
-+						checkferror_output(stderr);
- 					}
- 				}else{
- 					dc_garbage("at top of stack", -1);
-@@ -756,8 +780,11 @@ string execution depth\n", progname);
- 			fprintf(stderr,
- 					"%s: Q command argument exceeded string execution depth\n",
- 					progname);
--			if (stdin_lookahead != peekc  &&  fp == stdin)
-+			checkferror_output(stderr);
-+			if (stdin_lookahead != peekc  &&  fp == stdin) {
- 				peekc = getc(fp);
-+				checkferror_input(stdin);
-+			}
- 			break;
- 
- 		case DC_INT:
-diff --git a/dc/misc.c b/dc/misc.c
-index cd23602..cd910b8 100644
---- a/dc/misc.c
-+++ b/dc/misc.c
-@@ -47,6 +47,7 @@
- #include <getopt.h>
- #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
- 
- #ifndef EXIT_FAILURE	/* C89 <stdlib.h> */
- # define EXIT_FAILURE	1
-@@ -89,6 +89,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
- 		fprintf(fp, "'%c' (%#o)%s", (unsigned int) id, id, suffix);
- 	else
- 		fprintf(fp, "%#o%s", (unsigned int) id, suffix);
-+	checkferror_output(fp);
- }
- 
- 
-diff --git a/dc/numeric.c b/dc/numeric.c
-index 37759de..60cfb85 100644
---- a/dc/numeric.c
-+++ b/dc/numeric.c
-@@ -133,6 +133,7 @@ dc_div DC_DECLARG((a, b, kscale, result))
- 	bc_init_num(CastNumPtr(result));
- 	if (bc_divide(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
- 		fprintf(stderr, "%s: divide by zero\n", progname);
-+		checkferror_output(stderr);
- 		return DC_DOMAIN_ERROR;
- 	}
- 	return DC_SUCCESS;
-@@ -155,6 +156,7 @@ dc_divrem DC_DECLARG((a, b, kscale, quotient, remainder))
- 	if (bc_divmod(CastNum(a), CastNum(b),
- 						CastNumPtr(quotient), CastNumPtr(remainder), kscale)){
- 		fprintf(stderr, "%s: divide by zero\n", progname);
-+		checkferror_output(stderr);
- 		return DC_DOMAIN_ERROR;
- 	}
- 	return DC_SUCCESS;
-@@ -173,6 +175,7 @@ dc_rem DC_DECLARG((a, b, kscale, result))
- 	bc_init_num(CastNumPtr(result));
- 	if (bc_modulo(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
- 		fprintf(stderr, "%s: remainder by zero\n", progname);
-+		checkferror_output(stderr);
- 		return DC_DOMAIN_ERROR;
- 	}
- 	return DC_SUCCESS;
-@@ -225,6 +228,7 @@ dc_sqrt DC_DECLARG((value, kscale, result))
- 	tmp = bc_copy_num(CastNum(value));
- 	if (!bc_sqrt(&tmp, kscale)){
- 		fprintf(stderr, "%s: square root of negative number\n", progname);
-+		checkferror_output(stderr);
- 		bc_free_num(&tmp);
- 		return DC_DOMAIN_ERROR;
- 	}
-@@ -470,6 +474,7 @@ dc_dump_num DC_DECLARG((dcvalue, discard_p))
- 
- 	for (cur=top_of_stack; cur; cur=next) {
- 		putchar(cur->digit);
-+		checkferror_output(stdout);
- 		next = cur->link;
- 		free(cur);
- 	}
-@@ -587,6 +592,8 @@ out_char (ch)
- 			out_col = 1;
- 		}
- 		putchar(ch);
-+                checkferror_output(stdout);
-+		checkferror_output(stderr);
- 	}
- }
- 
-@@ -626,6 +633,7 @@ rt_error (mesg, va_alist)
- 	vfprintf (stderr, mesg, args);
- 	va_end (args);
- 	fprintf (stderr, "\n");
-+	checkferror_output(stderr);
- }
- 
- 
-@@ -659,6 +667,7 @@ rt_warn (mesg, va_alist)
- 	vfprintf (stderr, mesg, args);
- 	va_end (args);
- 	fprintf (stderr, "\n");
-+	checkferror_output(stderr);
- }
- 
- 
-diff --git a/dc/stack.c b/dc/stack.c
-index 49422df..174411d 100644
---- a/dc/stack.c
-+++ b/dc/stack.c
-@@ -33,9 +33,13 @@
- #include "dc.h"
- #include "dc-proto.h"
- #include "dc-regdef.h"
-+#include "number.h"
- 
- /* an oft-used error message: */
--#define Empty_Stack	fprintf(stderr, "%s: stack empty\n", progname)
-+#define Empty_Stack do{					\
-+    fprintf(stderr, "%s: stack empty\n", progname);	\
-+    checkferror_output(stderr);				\
-+  }while(0)
- 
- 
- /* simple linked-list implementation suffices: */
-@@ -91,6 +94,7 @@ dc_binop DC_DECLARG((op, kscale))
- 	if (dc_stack->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return;
- 	}
- 	(void)dc_pop(&b);
-@@ -131,6 +135,7 @@ dc_binop2 DC_DECLARG((op, kscale))
- 	if (dc_stack->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return;
- 	}
- 	(void)dc_pop(&b);
-@@ -169,6 +174,7 @@ dc_cmpop DC_DECLVOID()
- 	if (dc_stack->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return 0;
- 	}
- 	(void)dc_pop(&b);
-@@ -206,6 +212,7 @@ dc_triop DC_DECLARG((op, kscale))
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return;
- 	}
- 	(void)dc_pop(&c);
-@@ -327,6 +334,7 @@ dc_register_get DC_DECLARG((regid, result))
- 		*result = dc_int2data(0);
- 	}else if (r->value.dc_type==DC_UNINITIALIZED){
- 		fprintf(stderr, "%s: BUG: register ", progname);
-+		checkferror_output(stderr);
- 		dc_show_id(stderr, regid, " exists but is uninitialized?\n");
- 		return DC_FAIL;
- 	}else{
-@@ -402,6 +410,7 @@ dc_register_pop DC_DECLARG((stackid, result))
- 	r = dc_register[stackid];
- 	if (r==NULL || r->value.dc_type==DC_UNINITIALIZED){
- 		fprintf(stderr, "%s: stack register ", progname);
-+		checkferror_output(stderr);
- 		dc_show_id(stderr, stackid, " is empty\n");
- 		return DC_FAIL;
- 	}
-diff --git a/dc/string.c b/dc/string.c
-index dee9169..389d899 100644
---- a/dc/string.c
-+++ b/dc/string.c
-@@ -45,6 +45,7 @@
- #endif
- #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
- 
- /* here is the completion of the dc_string type: */
- struct dc_string {
-@@ -94,6 +94,7 @@ dc_out_str DC_DECLARG((value, discard_flag))
- 	dc_discard discard_flag DC_DECLEND
- {
- 	fwrite(value->s_ptr, value->s_len, sizeof *value->s_ptr, stdout);
-+        checkferror_output(stdout);
- 	if (discard_flag == DC_TOSS)
- 		dc_free_str(&value);
- }
-@@ -169,6 +170,7 @@ dc_readstring DC_DECLARG((fp, ldelim, rdelim))
- 		}
- 		*p++ = c;
- 	}
-+	checkferror_input(fp);
- 	return dc_makestring(line_buf, (size_t)(p-line_buf));
- }
- 
-diff --git a/h/number.h b/h/number.h
-index abf6332..1983ab4 100644
---- a/h/number.h
-+++ b/h/number.h
-@@ -23,10 +23,10 @@
-     You may contact the author by:
-        e-mail:  philnelson@acm.org
-       us-mail:  Philip A. Nelson
--                Computer Science Department, 9062
--                Western Washington University
--                Bellingham, WA 98226-9062
--       
-+		Computer Science Department, 9062
-+		Western Washington University
-+		Bellingham, WA 98226-9062
-+
- *************************************************************************/
- 
- #ifndef _NUMBER_H_
-@@ -140,4 +140,7 @@ void bc_out_num (bc_num num, int o_base, void (* out_char)(int),
- 			     int leading_zero);
- 
- void bc_out_long (long val, int size, int space, void (*out_char)(int));
-+
-+void checkferror_input (FILE*);
-+void checkferror_output (FILE*);
- #endif
-diff --git a/lib/number.c b/lib/number.c
-index f394e92..80b33e3 100644
---- a/lib/number.c
-+++ b/lib/number.c
-@@ -1713,6 +1713,7 @@ static void
- out_char (int c)
- {
-   putchar(c);
-+  checkferror_output(stdout);
- }
- 
- 
-@@ -1721,6 +1722,7 @@ pn (bc_num num)
- {
-   bc_out_num (num, 10, out_char, 0);
-   out_char ('\n');
-+  checkferror_output(stdout);
- }
- 
- 
-@@ -1732,6 +1734,28 @@ pv (char *name, unsigned char *num, int len)
-   printf ("%s=", name);
-   for (i=0; i<len; i++) printf ("%c",BCD_CHAR(num[i]));
-   printf ("\n");
-+  checkferror_output(stdout);
- }
- 
- #endif
-+
-+/* check ferror() status and if so die */
-+void
-+checkferror_input (fp)
-+	FILE *fp;
-+{
-+	if (ferror(fp)) {
-+		perror("dc: could not read input file");
-+		exit(EXIT_FAILURE);
-+	}
-+}
-+
-+void
-+checkferror_output (fp)
-+	FILE *fp;
-+{
-+	if (ferror(fp)) {
-+		perror("dc: could not write output file");
-+		exit(EXIT_FAILURE);
-+	}
-+}
--- 
-2.17.1
-
diff --git a/package/bc/0003-dc-fix-exit-code-of-q-command.patch b/package/bc/0003-dc-fix-exit-code-of-q-command.patch
deleted file mode 100644
index 24f665c808a4..000000000000
--- a/package/bc/0003-dc-fix-exit-code-of-q-command.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7243037e63bff34b08bb1c993787b98dee585b2f Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 27 Jun 2019 13:10:47 +0800
-Subject: [PATCH] dc: fix exit code of q command
-
-The exit code for "echo q | dc" is 1 for dc-1.4.1;
-while the exit code for "echo q | dc" is 0 for dc-1.4.
-
-Here is the answer from ken@gnu.org:
-dc-1.4 was right.  There was a rewrite of a chunk of code for 1.4.1 to
-fix a corner case in the Q command, and somehow the placement of the
-clean-up label for the 'q' command got misplaced on the error-handling
-branch instead of the clean-exit branch.  The patch below fixes this
-(it is committed for whenever the next bc/dc release gets made).
-
-Thanks for the report,
-        --Ken Pizzini
-
-Upstream:
-https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- dc/eval.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dc/eval.c b/dc/eval.c
-index 6c54e61..9c28f18 100644
---- a/dc/eval.c
-+++ b/dc/eval.c
-@@ -841,10 +841,10 @@ error_fail:
- 	fprintf(stderr, "%s: ", progname);
- 	perror("error reading input");
- 	return DC_FAIL;
--reset_and_exit_quit:
- reset_and_exit_fail:
- 	signal(SIGINT, sigint_default);
- 	return DC_FAIL;
-+reset_and_exit_quit:
- reset_and_exit_success:
- 	signal(SIGINT, sigint_default);
- 	return DC_SUCCESS;
--- 
-2.17.1
-
diff --git a/package/bc/0004-no-gen-libmath.patch b/package/bc/0004-no-gen-libmath.patch
deleted file mode 100644
index 15b7b9e5a8a8..000000000000
--- a/package/bc/0004-no-gen-libmath.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From a543af443c5f86b24ca89a994b75b6ef4751ac66 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Thu, 12 Sep 2019 15:12:40 -0500
-Subject: [PATCH] no gen libmath
-
-These rules are not cross-friendly so delete them.  libmath has been
-generated offline and included as part of this patch as the fbc tool
-used to generate that header is assuming the cross architecture and
-can't execute.
-
-Upstream:
-https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/no-gen-libmath.patch
-https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/libmath.h
-
-[Reformatted to GIT for 1.0.7.1 by Matt W]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- bc/Makefile.am |  8 --------
- bc/libmath.h   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 46 insertions(+), 8 deletions(-)
- create mode 100644 bc/libmath.h
-
-diff --git a/bc/Makefile.am b/bc/Makefile.am
-index d9d412e..f244241 100644
---- a/bc/Makefile.am
-+++ b/bc/Makefile.am
-@@ -31,14 +31,6 @@ global.o: libmath.h
- 
- fbcOBJ = main.o bc.o scan.o execute.o load.o storage.o util.o warranty.o
- 
--libmath.h: libmath.b $(fbcOBJ) $(LIBBC)
--	echo '{0}' > libmath.h
--	$(MAKE) global.o
--	$(LINK) -o fbc $(fbcOBJ) global.o $(LIBBC) $(LIBL) $(READLINELIB) $(LIBS)
--	./fbc -c $(srcdir)/libmath.b </dev/null >libmath.h
--	$(srcdir)/fix-libmath_h
--	rm -f ./fbc ./global.o
--
- sbcOBJ = main.o sbc.o scan.o execute.o global.o load.o storage.o util.o \
-          warranty.o
- sbc.o: sbc.c
-diff --git a/bc/libmath.h b/bc/libmath.h
-new file mode 100644
-index 0000000..63e1acb
---- /dev/null
-+++ b/bc/libmath.h
-@@ -0,0 +1,46 @@
-+{"@iK20:s2:p@r",
-+"@iF1,5.6,7,8,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C1,0:",
-+"s14:pl7:s0:pl14:RN1:l5:0<Z2:1s12:pl5:ns5:pN2:l2:s15:pK6:l15:+",
-+"K.44:l5:*+s13:pl5:cS1+s2:pN3:l5:1>Z4:l10:1+s10:pl5:K2:/s5:pl2:",
-+"1+s2:pJ3:N4:l13:s2:p1l5:+s14:pl5:s6:p1s8:pK2:s11:pN6:1B7:J5:N8:",
-+"l11:i11:pJ6:N7:l6:l5:*s6:l8:l11:*s8:/s9:pl9:0=Z9:l10:0>Z10:N11:",
-+"l10:d10:Z12:l14:l14:*s14:pJ11:N12:N10:l15:s2:pl12:Z13:1l14:/R",
-+"N13:l14:1/RN9:l14:l9:+s14:pJ8:N5:0R]@r",
-+"@iF2,5.7,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C2,0:",
-+"s14:pl7:s0:pl14:RN1:l5:0{Z2:1K10:l2:^-1/RN2:l2:s15:pK6:l2:+s2:",
-+"pK2:s10:p0s11:pN3:l5:K2:}Z4:l10:K2:*s10:pl5:cRs5:pJ3:N4:N5:l5:",
-+"K.5:{Z6:l10:K2:*s10:pl5:cRs5:pJ5:N6:l5:1-l5:1+/s13:s14:pl13:l13:",
-+"*s12:pK3:s11:pN8:1B9:J7:N10:l11:K2:+s11:pJ8:N9:l13:l12:*s13:l11:",
-+"/s9:pl9:0=Z11:l10:l14:*s14:pl15:s2:pl14:1/RN11:l14:l9:+s14:pJ10:N7:",
-+"0R]@r",
-+"@iF3,5.7,9,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C3,0:",
-+"s14:pl7:s0:pl14:RN1:l2:s15:pK1.1:l15:*K2:+s2:p1C4,0:s14:pl5:0",
-+"<Z2:1s12:pl5:ns5:pN2:0s2:pl5:l14:/K2:+K4:/s13:pl5:K4:l13:*l14:",
-+"*-s5:pl13:K2:%Z3:l5:ns5:pN3:l15:K2:+s2:pl5:s9:s14:pl5:nl5:*s16:",
-+"pK3:s11:pN5:1B6:J4:N7:l11:K2:+s11:pJ5:N6:l9:l16:l11:l11:1-*/*",
-+"s9:pl9:0=Z8:l15:s2:pl12:Z9:l14:n1/RN9:l14:1/RN8:l14:l9:+s14:p",
-+"J7:N4:0R]@r",
-+"@iF5,5.7,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C5,0:s14:pl7:s0:pl14:",
-+"RN1:l2:s15:pl2:K1.2:*s2:pl5:1C4,0:K2:*+C3,0:s14:pl15:s2:pl14:",
-+"1/R0R]@r",
-+"@iF4,5.6,7,9,10,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:",
-+"C4,0:s14:pl7:s0:pl14:RN1:1s12:pl5:0<Z2:1ns12:pl5:ns5:pN2:l5:1",
-+"=Z3:l2:K25:{Z4:K.7853981633974483096156608:l12:/RN4:l2:K40:{Z5:",
-+"K.7853981633974483096156608458198757210492:l12:/RN5:l2:K60:{Z6:",
-+"K.785398163397448309615660845819875721049292349843776455243736",
-+":l12:/RN6:N3:l5:K.2:=Z7:l2:K25:{Z8:K.1973955598498807583700497",
-+":l12:/RN8:l2:K40:{Z9:K.1973955598498807583700497651947902934475",
-+":l12:/RN9:l2:K60:{Z10:K.197395559849880758370049765194790293447585103787852101517688",
-+":l12:/RN10:N7:l2:s15:pl5:K.2:>Z11:l15:K5:+s2:pK.2:C4,0:s6:pN11:",
-+"l15:K3:+s2:pN12:l5:K.2:>Z13:l10:1+s10:pl5:K.2:-1l5:K.2:*+/s5:",
-+"pJ12:N13:l5:s13:s14:pl5:nl5:*s16:pK3:s11:pN15:1B16:J14:N17:l11:",
-+"K2:+s11:pJ15:N16:l13:l16:*s13:l11:/s9:pl9:0=Z18:l15:s2:pl10:l6:",
-+"*l14:+l12:/RN18:l14:l9:+s14:pJ17:N14:0R]@r",
-+"@iF6,13,5.6,7,8,9,10,11,12,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl13:",
-+"l5:C6,00:s14:pl7:s0:pl14:RN1:l2:s15:p0s2:pl13:1/s13:pl13:0<Z2:",
-+"l13:ns13:pl13:K2:%1=Z3:1s12:pN3:N2:1s10:pK2:s11:pN5:l11:l13:{",
-+"B6:J4:N7:l11:i11:pJ5:N6:l10:l11:*s10:pJ7:N4:K1.5:l15:*s2:pl5:",
-+"l13:^K2:l13:^/l10:/s10:p1s9:s14:pl5:nl5:*K4:/s16:pK1.5:l15:*l10:",
-+"cL+l10:cS-s2:p1s11:pN9:1B10:J8:N11:l11:i11:pJ9:N10:l9:l16:*l11:",
-+"/l13:l11:+/s9:pl9:0=Z12:l15:s2:pl12:Z13:l10:nl14:*1/RN13:l10:",
-+"l14:*1/RN12:l14:l9:+s14:pJ11:N8:0R]@r",0}
--- 
-2.17.1
-
diff --git a/package/bc/bc.hash b/package/bc/bc.hash
index a2565a2b5fdd..5c50644062e4 100644
--- a/package/bc/bc.hash
+++ b/package/bc/bc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a  bc-1.07.1.tar.gz
+sha256  ae470fec429775653e042015edc928d07c8c3b2fc59765172a330d3d87785f86  bc-1.08.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 5691ca9e6756..9578e7d55da6 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BC_VERSION = 1.07.1
+BC_VERSION = 1.08.2
 BC_SITE = $(BR2_GNU_MIRROR)/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -12,8 +12,8 @@ BC_LICENSE_FILES = COPYING COPYING.LIB
 BC_CPE_ID_VENDOR = gnu
 BC_CONF_ENV = MAKEINFO=true
 
-# 0001-bc-use-MAKEINFO-variable-for-docs.patch and 0004-no-gen-libmath.patch
-# are patching doc/Makefile.am and Makefile.am respectively
+# 0001-bc-use-MAKEINFO-variable-for-docs.patch
+# is patching doc/Makefile.am
 BC_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
