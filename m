Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3073AFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 12:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C56AD84A1B;
	Thu, 30 Apr 2026 12:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgFipoNRouyY; Thu, 30 Apr 2026 12:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B9E849EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777551359;
	bh=biBfymgcwoiL5sXelcT2Ao3G+lAMRk+X2pd/1r7DUp8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SV1dlgz7dk2es4hATi6BoIhIXFtaSwmDpmuxLngZZlIIx0tFFwoWDn0AAwQPUd6qP
	 igLQnNognI8qcZR66dhwAlK4/5x6K01/EcosLDr0NvjsLtmf6dw+SPa+dlt3xeEm+T
	 +wCkdkq82RLJNZQ10SEblnYC19oHGQy4iLkcf18hCKh9wAlIX8HPepA7LC7PAIcNKp
	 g2NiIxqeq8/7MH//ClLAWBpYeS2E2IsKn0mp+MuGHKH7Udi9jA3fa1wooC/HGwn5DY
	 k5pAlOSrsPvcYnUpINODBrq/fm5QM/sb5LeYLEn6cF+RY9fb41F3dLkAFE99hrWTIC
	 W6WR3/90Ojp1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B9E849EE;
	Thu, 30 Apr 2026 12:15:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D15718E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B3814264B
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXcchYceiSx4 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 12:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E8494260A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8494260A
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E8494260A
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:15:56 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2addb31945aso4234805ad.1
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777551356; x=1778156156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/lBMDOjfCBh/pBHYMlM2l2fYaZLKVVinJxC1kHFSrg=;
 b=glW+DWksDKBW4qXY5ZNliQ2vqQkvmfcqtf2KoWylOZR/lyQpbOsOx+dVrsxckUJC54
 NWHNdBJ3oSP4FtgEnmDAkeQk/zeulm5hVnugNTgum3ZH6BLog0kdyFVcE7bmyea5OQzc
 ZQ9SJ0rZQT6SDEt6WMD9dVhe53wwK3A6X/SeDnENp5SNj+JZervB+/iaeX8dMTbavrHw
 tcRCD3SqMd7XgfqPNVI+JEttD/rraxcTeIqmi6cvAJeLNLYWgti96uiJCAmJEhb4qveb
 DQRKSLQXsYaplSrpebycHa0wuQle0atoSBN8FtKs+fqVIbDxuSbXHjI2sUnfncYRbyN+
 PTIg==
X-Gm-Message-State: AOJu0Yx1lTQ+GwHKOjkJJGTQ6VUnpQvgs62DAWkxqb6b/XDUo3i9yUO6
 bQz373oAAX0nQgLTt8P5fUIpgsSq9c0Xkg/TY47092jexwbx3Cpv44JCIDFxUF4e
X-Gm-Gg: AeBDies93U0aJv/ylMMFVZrl5ObbtOJVApozN1gPEAxgbT9j/VU6ojqO3UPmWuL2Iev
 M3jP2OK76lrBzLi8YtCK+75aScBRAHRR8e620sWVkhGqrtlBxdf5XXKImDJ6RoByyenZZFudvJH
 YrWSrEu8kSEhK5JnxkiEMu4xHu0k4x0Dd1zi8RAaQ/vZsk20gTinGhqzjS3+3U0dUmn449XywXs
 dmWzbbh2cOvwBjTIiuBT4ehezMI81S7D6lTkej8W4m0OMBF+b6J4eJU/lOgR5++xWDq1qT/3yeq
 5CXZ6oipmiQ++aaVKWiAHqFI6i7wDQ31u5buUAoUUXwgBKrZzpSSzdeE1QVHqZS0tYrD+f94wC5
 e270FKs34nJXpyu95UQMF6zaJ6uRSCWgshOyU+CjB/L5sotkT58PgtSocrhR3I9TUXvfKNYr4jC
 DVB6OmxVeqCHanQFmtTMZNB8pGQPBhRQYFv/TxNZPPjKrnWg==
X-Received: by 2002:a17:902:850b:b0:2b0:6a22:5165 with SMTP id
 d9443c01a7336-2b9a230b3ecmr19502005ad.7.1777551355451; 
 Thu, 30 Apr 2026 05:15:55 -0700 (PDT)
Received: from fedora ([2409:40e5:1163:19c9:4f2b:7a6c:119a:dd8b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b98859f629sm52107065ad.0.2026.04.30.05.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 05:15:54 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 30 Apr 2026 17:45:19 +0530
Message-ID: <20260430121520.2565804-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777551356; x=1778156156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R/lBMDOjfCBh/pBHYMlM2l2fYaZLKVVinJxC1kHFSrg=;
 b=T4psx6r3GN5uyxobOcnvWcX6Uk/J9JVmIxbV5yuZoa1gL+f3CmnMJDHuijYQ6cc2CR
 c+LvXyyWM3C0AM0P2iISVq2/aadOtOgiayI/d3JRsk8A/TT42GfJk5aYIhUPumvCc8K0
 cONBAmwdP06oingNWb4OVCSTnxlXOcuNArQGLdX78CWfqWLPtETsN1X5ud/WofiFEtXI
 F3uwpksapjfxCZt2qsXy/IaSO8sBo3f8AlHgatRydNfrGinSQ7RlpYyHj4gLy1UM5/d5
 vt9nGsUZNsRxEeHJkSbNZnPNNfON/fzALFLUPpRK2y2v8Rwa+WR6Tuzlhhby+yyDxBVb
 J3aA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=T4psx6r3
Subject: [Buildroot] [PATCH] package/bash: bump to version 5.3
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

Major features:
- New command substitution: ${ cmd; } and ${| cmd; }
- GLOBSORT variable for pathname completion sorting
- compgen can output to variable instead of stdout
- read -E option for readline completions
- Code updated to C23 standard
- Better error reporting and script detection

Changes:
- Add bash_cv_func_strchrnul_works cache variable
- Refresh patch 0001
- Remove upstreamed patch 0002
- Fixed build failure on toolchains without wide character
  support (uClibc) where wint_t was used while remaining undefined.
- builtins/printf.def (Patch 0005): Fixed a type mismatch in the tescape
  call when HANDLE_MULTIBYTE is disabled (passing int * instead of char *).
- lib/glob/smatch.c (Patch 0006): Fixed build failure by guarding usage of
  locale_utf8locale and UTF8_SINGLEBYTE with HANDLE_MULTIBYTE.
- package/bash/bash.mk: Added bash_cv_func_strchrnul_works=yes to BASH_CONF_ENV
  to prevent multiple definition errors of strchrnul in static builds against uClibc.

CHANGELOGS:
- https://lwn.net/Articles/1029079/

Tested Using:
- utils/test-pkg -a -p  bash
- utils/test-pkg -T br-arm-basic -p  bash
-
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...put.h-add-missing-include-on-stdio.h.patch | 20 +++---
 ...hline.c-fix-typo-in-vi_advance_point.patch | 31 ++++++++
 ...compilation-for-non-multibyte-builds.patch | 63 -----------------
 ...d-when-HANDLE_MULTIBYTE-is-undefined.patch | 36 ++++++++++
 ...fix-build-failure-when-multibyte-sup.patch | 44 ++++++++++++
 ...def-fix-type-mismatch-in-tescape-cal.patch | 46 ++++++++++++
 ...c-fix-build-failure-when-multibyte-s.patch | 70 +++++++++++++++++++
 package/bash/bash.hash                        |  4 +-
 package/bash/bash.mk                          |  8 ++-
 9 files changed, 243 insertions(+), 79 deletions(-)
 create mode 100644 package/bash/0002-bashline.c-fix-typo-in-vi_advance_point.patch
 delete mode 100644 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
 create mode 100644 package/bash/0003-builtins-printf.def-fix-build-when-HANDLE_MULTIBYTE-is-undefined.patch
 create mode 100644 package/bash/0004-lib-glob-glob.c-fix-build-failure-when-multibyte-sup.patch
 create mode 100644 package/bash/0005-builtins-printf.def-fix-type-mismatch-in-tescape-cal.patch
 create mode 100644 package/bash/0006-lib-glob-smatch.c-fix-build-failure-when-multibyte-s.patch

diff --git a/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch b/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
index fd008e9472..eb0fd5c6fb 100644
--- a/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
+++ b/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
@@ -1,4 +1,4 @@
-From 4fa85c85b9a76afd3b19ed75bf17ccd2940f1f55 Mon Sep 17 00:00:00 2001
+From 62410ba4a20da08140050583f7468192fe8c3f85 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 16 Feb 2020 16:18:48 +0100
 Subject: [PATCH] input.h: add missing include on stdio.h
@@ -15,24 +15,22 @@ Fixes:
  - http://autobuild.buildroot.org/results/bfca306868df54c567215c45c8cdac838d02f567
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://savannah.gnu.org/support/?110196]
+Upstream: https://savannah.gnu.org/support/?110196
 ---
- input.h | 2 ++
- 1 file changed, 2 insertions(+)
+ input.h | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/input.h b/input.h
-index 6aef1269..08b0fdea 100644
+index 592b6cb..37a60e1 100644
 --- a/input.h
 +++ b/input.h
-@@ -21,6 +21,8 @@
+@@ -20,6 +20,7 @@
+ 
  #if !defined (_INPUT_H_)
  #define _INPUT_H_
- 
 +#include <stdio.h>
-+
+ 
  #include "stdc.h"
  
- /* Function pointers can be declared as (Function *)foo. */
 -- 
-2.24.1
-
+2.54.0
diff --git a/package/bash/0002-bashline.c-fix-typo-in-vi_advance_point.patch b/package/bash/0002-bashline.c-fix-typo-in-vi_advance_point.patch
new file mode 100644
index 0000000000..d8a087f76d
--- /dev/null
+++ b/package/bash/0002-bashline.c-fix-typo-in-vi_advance_point.patch
@@ -0,0 +1,31 @@
+From aea2c50ea51c94b63d0475a4ff0e71960d16f87c Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 30 Apr 2026 15:05:28 +0530
+Subject: [PATCH] bashline.c: fix typo in vi_advance_point
+
+Bash 5.3 contains a typo where a colon is used instead of a
+semicolon in the non-multibyte version of vi_advance_point.
+This causes build failures when HANDLE_MULTIBYTE is not defined.
+
+Upstream: https://lists.gnu.org/archive/html/bug-bash/2025-07/msg00045.html
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ bashline.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bashline.c b/bashline.c
+index 2b4da75..c603984 100644
+--- a/bashline.c
++++ b/bashline.c
+@@ -4142,7 +4142,7 @@ vi_advance_point (void)
+ 	}
+     }
+ #else
+-    rl_point++:
++    rl_point++;
+ #endif
+   return point;
+ }
+-- 
+2.54.0
+
diff --git a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
deleted file mode 100644
index 378ff0dfd3..0000000000
--- a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 0217fc2816e47ee296472df71d1011f0eb2937e6 Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <vfazio@gmail.com>
-Date: Fri, 27 Jan 2023 14:37:26 -0600
-Subject: [PATCH] parse.y: fix compilation for non-multibyte builds
-
-Builds configured with --disable-multibyte or when the toolchain does
-not have WCHAR support would encounter a compile error due to an
-undeclared reference to shell_input_line_property in shell_getc.
-
-Add a HANDLE_MULTIBYTE guard to conditionally compile the block that
-references shell_input_line_property in shell_getc as it's only declared
-when HANDLE_MULTIBYTE is defined.
-
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[Upstream status: https://savannah.gnu.org/patch/index.php?10309]
----
- parse.y | 2 ++
- y.tab.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/parse.y b/parse.y
-index 1d12e639..8f1355c6 100644
---- a/parse.y
-+++ b/parse.y
-@@ -2640,6 +2640,7 @@ next_alias_char:
-       parser_state |= PST_ENDALIAS;
-       /* We need to do this to make sure last_shell_getc_is_singlebyte returns
- 	 true, since we are returning a single-byte space. */
-+#if defined (HANDLE_MULTIBYTE)
-       if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
- 	{
- #if 0
-@@ -2653,6 +2654,7 @@ next_alias_char:
- 	  shell_input_line_property[shell_input_line_index - 1] = 1;
- #endif
- 	}
-+#endif /* HANDLE_MULTIBYTE */
-       return ' ';	/* END_ALIAS */
-     }
- #endif
-diff --git a/y.tab.c b/y.tab.c
-index 50c5845b..799f730f 100644
---- a/y.tab.c
-+++ b/y.tab.c
-@@ -4955,6 +4955,7 @@ next_alias_char:
-       parser_state |= PST_ENDALIAS;
-       /* We need to do this to make sure last_shell_getc_is_singlebyte returns
- 	 true, since we are returning a single-byte space. */
-+#if defined (HANDLE_MULTIBYTE)
-       if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
- 	{
- #if 0
-@@ -4968,6 +4969,7 @@ next_alias_char:
- 	  shell_input_line_property[shell_input_line_index - 1] = 1;
- #endif
- 	}
-+#endif /* HANDLE_MULTIBYTE */
-       return ' ';	/* END_ALIAS */
-     }
- #endif
--- 
-2.25.1
-
diff --git a/package/bash/0003-builtins-printf.def-fix-build-when-HANDLE_MULTIBYTE-is-undefined.patch b/package/bash/0003-builtins-printf.def-fix-build-when-HANDLE_MULTIBYTE-is-undefined.patch
new file mode 100644
index 0000000000..a68d10a42a
--- /dev/null
+++ b/package/bash/0003-builtins-printf.def-fix-build-when-HANDLE_MULTIBYTE-is-undefined.patch
@@ -0,0 +1,36 @@
+From 3fd891f6a71f88aeeaa09ebee9296d8708cdcd08 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 30 Apr 2026 15:29:45 +0530
+Subject: [PATCH] builtins/printf.def: fix build when HANDLE_MULTIBYTE is
+ undefined
+
+The local variable mb_cur_max is only declared when HANDLE_MULTIBYTE is
+defined, but it is assigned MB_CUR_MAX unconditionally, leading to a
+compilation error when multibyte support is disabled.
+
+Wrap the assignment in the same HANDLE_MULTIBYTE guard used for the
+declaration and other usages in the function.
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ builtins/printf.def | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/builtins/printf.def b/builtins/printf.def
+index 7d7f8c2..f7abf53 100644
+--- a/builtins/printf.def
++++ b/builtins/printf.def
+@@ -355,7 +355,9 @@ printf_builtin (WORD_LIST *list)
+ 
+   garglist = orig_arglist = list->next;
+ 
++#if defined (HANDLE_MULTIBYTE)
+   mb_cur_max = MB_CUR_MAX;
++#endif
+ 
+   /* Basic algorithm is to scan the format string for conversion
+      specifications -- once one is found, find out if the field
+-- 
+2.54.0
+
diff --git a/package/bash/0004-lib-glob-glob.c-fix-build-failure-when-multibyte-sup.patch b/package/bash/0004-lib-glob-glob.c-fix-build-failure-when-multibyte-sup.patch
new file mode 100644
index 0000000000..6deb6b5a75
--- /dev/null
+++ b/package/bash/0004-lib-glob-glob.c-fix-build-failure-when-multibyte-sup.patch
@@ -0,0 +1,44 @@
+From e37247455b11f745e30ea981c79fb9c24363931c Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 30 Apr 2026 16:45:59 +0530
+Subject: [PATCH] lib/glob/glob.c: fix build failure when multibyte support is
+ disabled
+
+When multibyte support is disabled (e.g. uClibc without wide character
+support), wint_t is undefined. This causes a compilation error in
+lib/glob/glob.c which uses wint_t in external declarations.
+
+This fixes the following failure seen with br-arm-basic toolchain:
+
+In file included from glob.c:1016:
+glob_loop.c: In function 'internal_glob_pattern_p':
+glob_loop.c:52:18: error: 'wint_t' undeclared (first use in this function)
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ lib/glob/glob.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/glob/glob.c b/lib/glob/glob.c
+index 4681f58..67ab5af 100644
+--- a/lib/glob/glob.c
++++ b/lib/glob/glob.c
+@@ -120,10 +120,14 @@ static char **glob_dir_to_array (char *, char **, int);
+ 
+ /* Make sure these names continue to agree with what's in smatch.c */
+ extern char *glob_patscan (char *, char *, int, int);
++#if HANDLE_MULTIBYTE
+ extern wchar_t *glob_patscan_wc (wchar_t *, wchar_t *, wint_t, int);
++#endif
+ 
+ /* And this from gmisc.c/gm_loop.c */
++#if HANDLE_MULTIBYTE
+ extern int wextglob_pattern_p (wchar_t *);
++#endif
+ 
+ extern char *glob_dirscan (char *, int);
+ 
+-- 
+2.54.0
+
diff --git a/package/bash/0005-builtins-printf.def-fix-type-mismatch-in-tescape-cal.patch b/package/bash/0005-builtins-printf.def-fix-type-mismatch-in-tescape-cal.patch
new file mode 100644
index 0000000000..d850df2384
--- /dev/null
+++ b/package/bash/0005-builtins-printf.def-fix-type-mismatch-in-tescape-cal.patch
@@ -0,0 +1,46 @@
+From 11f4edc20dcce079be1c6afd2df9442fa8341215 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 30 Apr 2026 16:46:26 +0530
+Subject: [PATCH] builtins/printf.def: fix type mismatch in tescape call
+
+When HANDLE_MULTIBYTE is disabled, the 'c' variable is an int, but
+tescape expects a char * as its second argument. This causes a type
+mismatch error.
+
+This fixes the following failure seen with br-arm-basic toolchain:
+
+./printf.def:1230:26: error: passing argument 2 of 'tescape' from incompatible pointer type [-Werror=incompatible-pointer-types]
+ 1230 |       s += tescape (s, &c, (int *)NULL, &temp);
+      |                        ^~
+      |                        |
+      |                        int *
+./printf.def:1068:30: note: expected 'char *' but argument is of type 'int *'
+ 1068 | tescape (char *estart, char *cp, int *lenp, int *sawc)
+      |                        ~~~~~~^~
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ builtins/printf.def | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/builtins/printf.def b/builtins/printf.def
+index 7d7f8c2..3e59cdf 100644
+--- a/builtins/printf.def
++++ b/builtins/printf.def
+@@ -1225,7 +1225,11 @@ bexpand (char *string, size_t len, int *sawc, size_t *lenp)
+       memset (mbch, '\0', sizeof (mbch));
+       s += tescape (s, mbch, &mblen, &temp);
+ #else
+-      s += tescape (s, &c, (int *)NULL, &temp);
++      {
++	char cc;
++	s += tescape (s, &cc, (int *)NULL, &temp);
++	c = cc;
++      }
+ #endif
+       if (temp)
+ 	{
+-- 
+2.54.0
+
diff --git a/package/bash/0006-lib-glob-smatch.c-fix-build-failure-when-multibyte-s.patch b/package/bash/0006-lib-glob-smatch.c-fix-build-failure-when-multibyte-s.patch
new file mode 100644
index 0000000000..474e0f5846
--- /dev/null
+++ b/package/bash/0006-lib-glob-smatch.c-fix-build-failure-when-multibyte-s.patch
@@ -0,0 +1,70 @@
+From 1ced7e8a23808b232ee78c68c00a8815dcf1a72d Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 30 Apr 2026 16:47:15 +0530
+Subject: [PATCH] lib/glob/smatch.c: fix build failure when multibyte support
+ is disabled
+
+When multibyte support is disabled, locale_utf8locale and
+UTF8_SINGLEBYTE are not available. This causes a compilation error in
+lib/glob/smatch.c in functions like is_cclass, collseqcmp, and the FOLD
+macro.
+
+This fixes the following failure seen with br-arm-basic toolchain:
+
+strmatch.c:145:7: error: 'locale_utf8locale' undeclared (first use in this function)
+  145 |   if (locale_utf8locale && (UTF8_SINGLEBYTE (c) == 0 || UTF8_SINGLEBYTE (equiv) == 0))
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ lib/glob/smatch.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/lib/glob/smatch.c b/lib/glob/smatch.c
+index e42b8fc..b437062 100644
+--- a/lib/glob/smatch.c
++++ b/lib/glob/smatch.c
+@@ -141,9 +141,11 @@ rangecmp (int c1, int c2, int forcecoll)
+ static int
+ collseqcmp (int c, int equiv)
+ {
++#if HANDLE_MULTIBYTE
+   /* Make sure characters >= 0x80 are compared as bytes in a UTF-8 locale. */
+   if (locale_utf8locale && (UTF8_SINGLEBYTE (c) == 0 || UTF8_SINGLEBYTE (equiv) == 0))
+     return (c == equiv);
++#endif
+ 
+   if (charcmp (c, equiv, 1) == 0)
+     return 1;
+@@ -285,8 +287,10 @@ is_cclass (int c, const char *name)
+   enum char_class char_class;
+   int result;
+ 
++#if HANDLE_MULTIBYTE
+   if (locale_utf8locale && UTF8_SINGLEBYTE (c) == 0)
+     return -1;
++#endif
+ 
+   char_class = is_valid_cclass (name);
+   if (char_class == CC_NO_CLASS)
+@@ -298,10 +302,17 @@ is_cclass (int c, const char *name)
+ 
+ /* Now include `sm_loop.c' for single-byte characters. */
+ /* The result of FOLD is an `unsigned char' */
++#if HANDLE_MULTIBYTE
+ # define FOLD(c) \
+   (((flags & FNM_CASEFOLD) && (locale_utf8locale == 0 || UTF8_SINGLEBYTE (c))) \
+     ? TOLOWER ((unsigned char)c) \
+     : ((unsigned char)c))
++#else
++# define FOLD(c) \
++  ((flags & FNM_CASEFOLD) \
++    ? TOLOWER ((unsigned char)c) \
++    : ((unsigned char)c))
++#endif
+ 
+ #if !defined (__CYGWIN__)
+ #  define ISDIRSEP(c)	((c) == '/')
+-- 
+2.54.0
+
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index c2fb1d38d4..35475d5194 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/bash/bash-5.2.37.tar.gz.sig
-sha256  9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff  bash-5.2.37.tar.gz
+# https://ftp.gnu.org/gnu/bash/bash-5.3.tar.gz.sig
+sha256  0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba  bash-5.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 7fb43c52c0..4e0d112134 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.2.37
+BASH_VERSION = 5.3
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+
@@ -24,9 +24,11 @@ BASH_CONF_ENV = \
 	bash_cv_job_control_missing=present \
 	bash_cv_sys_named_pipes=present \
 	bash_cv_func_sigsetjmp=present \
-	bash_cv_printf_a_format=yes
+	bash_cv_printf_a_format=yes \
+	bash_cv_func_strchrnul_works=yes
 
-# Can be dropped when bash is bumped to 5.3 or newer.
+# Can be dropped when bash is bumped to 5.4 or newer.
+# Bash 5.3 still has some issues with C23 (the default in GCC 15).
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
 BASH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
 endif
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
