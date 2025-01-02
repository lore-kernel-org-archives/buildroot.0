Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97BE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 11:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C6640353;
	Thu,  2 Jan 2025 11:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-M9knBYpmHm; Thu,  2 Jan 2025 11:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EDA40448
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EDA40448;
	Thu,  2 Jan 2025 11:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E93E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4783403E7
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzC_pFOCwfYp for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 11:00:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F22E8402F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22E8402F2
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F22E8402F2
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:00:37 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa659775dd5so145663566b.0
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 03:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735815636; x=1736420436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBZBY8sEJJ0ppIYW9K+ig0KUay6aQrVpaOmrEDXRSAU=;
 b=tN+ZS/XIOA4gk4mn2yjk2Zq/FXBp8o6xVVJb4tHljR/6DrcTVVfLhlhqvFcySIPvoV
 IwHjZeJc1b6So0IPxyOcMuRXXO8qgSUKIuFEo5VgYYoHG/ViRZs14J4HKRJItAgJvT3W
 TUjK+JP/1GyZoVfFhJQI8rpcJLgw4iujqv32wDqjlS/gZo5YMJCCAGiKkGWYDdsEC5/5
 D/e4npQ6U5SqpqlgxO9KWBuPux4TZ0U4sEMpd3dsh2WwhszjvoUwmVsY7hXuocVGNn9V
 6zoa/EfXqRNtiq+6N6PuH4LAEKw20wagW7cO14Phu5ys9ETOWrPaMsEpNKX97JHzWMLO
 u3/Q==
X-Gm-Message-State: AOJu0YxMpyEriIQ5qYKkPn4tMsZyFSA/1+oD5Xko8mpMNc7nea2hFd6a
 W3M3+EY7jkPouL85xjQ8lpHyyhlZEJlEFdVLsxI8TojoG9p/C7kOGggpvuCsjsoEC+90NgaX85e
 xUjc=
X-Gm-Gg: ASbGncuKAPN9fBhXdZJEn+6hVLDXs6i6fyQq30UanzdUS6MsIWhejDfcVmRUOH5dDmx
 NtZNiTMLp9ZLtzdvxjbdC+Pv0yGgteYr2V+HxKC2Jdq5Xqdv4pqrNH4tjtETbRpTlkJcHQHIKH4
 l2G9wdDsGfwp6XyLkUNtUIo0jivUsEzZVLQPKRFFd4B1e9/mrU/Kb7Jw99viWNWHAZwqDnz/gf0
 ZT6011LzekgKM5tK7nrDFK2sSe3Ip4DzHysr5RfgTLb2Kg/MavRZVRcLxsry8jsKSyHEWfc/88E
 s+G1+icUCgF+
X-Google-Smtp-Source: AGHT+IF3EagUfWILlTAjmGyijP1BAxiGjc2fR9+H+7G4zJT42YX8xMJB39uqyUt7IazwxKYHHTphfg==
X-Received: by 2002:a17:907:3e1c:b0:a9a:1a17:e1cc with SMTP id
 a640c23a62f3a-aac2698bd77mr1456611066b.0.1735815635444; 
 Thu, 02 Jan 2025 03:00:35 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f0652a7sm1773799466b.174.2025.01.02.03.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 03:00:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 12:00:24 +0100
Message-ID: <20250102110025.722992-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735815636; x=1736420436;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OBZBY8sEJJ0ppIYW9K+ig0KUay6aQrVpaOmrEDXRSAU=;
 b=gZDdwx33fM7DZ83lRmEw+utTRMIdz/bEXWi0oInzHmZz/X6ikrpDn70iwkluMw5rbp
 2Qsmi/sYLKaX/5Tr4RNvPq1FBXrHblFgqcnoCLm6jCkPpMgo5Z8G/Xg4j3QcZp+j3i5c
 tWoW2+oLCcXFR6ElCR5V+5BRByNciIOs1M3s0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gZDdwx33
Subject: [Buildroot] [PATCH 1/1] package/bash: bump to version 5.2.37
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

Other changes:
  - Refactor necessary patches
  - Remove upstream patch
    0003-configure-invert-condition-for-strtoimax-builtin.patch

run-tests tests.package.test_bash.TestBash.test_run passed

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...compilation-for-non-multibyte-builds.patch |  8 +--
 ...vert-condition-for-strtoimax-builtin.patch | 62 -------------------
 package/bash/bash.hash                        |  2 +-
 package/bash/bash.mk                          |  2 +-
 4 files changed, 6 insertions(+), 68 deletions(-)
 delete mode 100644 package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch

diff --git a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
index d330de5cd4..378ff0dfd3 100644
--- a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
+++ b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
@@ -22,7 +22,7 @@ diff --git a/parse.y b/parse.y
 index 1d12e639..8f1355c6 100644
 --- a/parse.y
 +++ b/parse.y
-@@ -2625,6 +2625,7 @@ next_alias_char:
+@@ -2640,6 +2640,7 @@ next_alias_char:
        parser_state |= PST_ENDALIAS;
        /* We need to do this to make sure last_shell_getc_is_singlebyte returns
  	 true, since we are returning a single-byte space. */
@@ -30,7 +30,7 @@ index 1d12e639..8f1355c6 100644
        if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
  	{
  #if 0
-@@ -2638,6 +2639,7 @@ next_alias_char:
+@@ -2653,6 +2654,7 @@ next_alias_char:
  	  shell_input_line_property[shell_input_line_index - 1] = 1;
  #endif
  	}
@@ -42,7 +42,7 @@ diff --git a/y.tab.c b/y.tab.c
 index 50c5845b..799f730f 100644
 --- a/y.tab.c
 +++ b/y.tab.c
-@@ -4936,6 +4936,7 @@ next_alias_char:
+@@ -4955,6 +4955,7 @@ next_alias_char:
        parser_state |= PST_ENDALIAS;
        /* We need to do this to make sure last_shell_getc_is_singlebyte returns
  	 true, since we are returning a single-byte space. */
@@ -50,7 +50,7 @@ index 50c5845b..799f730f 100644
        if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
  	{
  #if 0
-@@ -4949,6 +4950,7 @@ next_alias_char:
+@@ -4968,6 +4969,7 @@ next_alias_char:
  	  shell_input_line_property[shell_input_line_index - 1] = 1;
  #endif
  	}
diff --git a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
deleted file mode 100644
index c412dcfce2..0000000000
--- a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 754e0d1edc1c01b18f4890de7c58f7610e589d76 Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <vfazio@gmail.com>
-Date: Tue, 7 Feb 2023 03:55:28 -0600
-Subject: [PATCH] configure: invert condition for strtoimax builtin
-
-Previously, bash would attempt to build a replacement for strtoimax if
-it found that the C library had the function already declared.
-
-This caused build errors when linking against static libraries that did
-not define the function as a weak alias but, in reality, was a logic
-error since bash should only provide it's own implementation if one is
-not provided by the C library.
-
-Now, fix this by inverting the logic.
-
-Upstream:
-  https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9
-
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[yann.morin.1998@free.fr: patch configure after the m file]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure       | 6 +++++-
- m4/strtoimax.m4 | 5 ++++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/m4/strtoimax.m4 b/m4/strtoimax.m4
-index 30985723..fa43ac7b 100644
---- a/m4/strtoimax.m4
-+++ b/m4/strtoimax.m4
-@@ -29,7 +29,10 @@ AC_CACHE_VAL(bash_cv_func_strtoimax,
-   fi
- ])
- AC_MSG_RESULT($bash_cv_func_strtoimax)
--if test $bash_cv_func_strtoimax = yes; then
-+if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
-+AC_DEFINE([HAVE_DECL_STRTOIMAX], [1])
-+fi
-+if test $bash_cv_func_strtoimax = no; then
- AC_LIBOBJ(strtoimax)
- fi
- ])
-diff --git a/configure b/configure
-index 47313753..6039cee7 100755
---- a/configure
-+++ b/configure
-@@ -20443,7 +20443,11 @@ fi
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $bash_cv_func_strtoimax" >&5
- printf "%s\n" "$bash_cv_func_strtoimax" >&6; }
--if test $bash_cv_func_strtoimax = yes; then
-+if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
-+printf "%s\n" "#define HAVE_DECL_STRTOIMAX 1" >>confdefs.h
-+
-+fi
-+if test $bash_cv_func_strtoimax = no; then
- case " $LIBOBJS " in
-   *" strtoimax.$ac_objext "* ) ;;
-   *) LIBOBJS="$LIBOBJS strtoimax.$ac_objext"
--- 
-2.25.1
-
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 44c1c5ed50..d0a22e5baa 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
 # https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz.sig
-sha256  c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8  bash-5.2.21.tar.gz
+sha256  9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff  bash-5.2.37.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 9d173a5c7c..81f698f166 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.2.21
+BASH_VERSION = 5.2.37
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
