Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BECCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 20:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB89613D4;
	Wed, 22 Oct 2025 20:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhEaaKsFviZf; Wed, 22 Oct 2025 20:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF351613E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF351613E3;
	Wed, 22 Oct 2025 20:01:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F2143F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AE49613E3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2etXTUcr-uG for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 20:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B9FC613D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9FC613D4
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B9FC613D4
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:01:47 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-339d53f4960so27630a91.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 13:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761163306; x=1761768106;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0NigrOHMjiEDL3CCCa3YL3u1S5iUJSkSymwLWMNCI8=;
 b=HwodqlKr9xPXdCtKpdqYkRO9/t8DDmkq+JsgY6f6WEER96Q2MkPYvzegpl5e79GzY+
 iWKRn/yah0Lyfgccx2QvRRBLULk39vMLYqcPcZsjnzOglfdJ+YSTtWvc3EMnTEwusTru
 h6gKgewALbqywG2oBwxCr8Z57K21dJAwNYxFaXnf5oceipgxpxhBHH3YbjDBP2dDmaTn
 9K7wZHxJAjKgSWgip+5QOa0qYptunFwD135e78ImfD4VzdJpR69sDWjEFl/HmACxpZja
 rXFv+YOm8QyfbGcwegtPCOMzTvkGNzPh7n0Zzr3fJXT9BqY3WxlKxeCzAEXqDc9aGdXs
 hIXA==
X-Gm-Message-State: AOJu0Yx/WixVzR8wcRnIjhZS8NVtQuEmghTEHDTi50YFdtJG86XKehOC
 BhIXTrrO6xqAbTjc0EVrO92M9tGihzsyy7pdDhDsYgwYNHZsxZT8BjGK
X-Gm-Gg: ASbGncs27jCtZCFlkSNYcCTAKIpdj+CguvSfqdww6UUqbyZzhWumB6K1Nwfgcr19Euf
 1c7hAFUxW9sTA5jxkH3ep2tUr1WTYn+b84wcDREVJFgYibh/KUPvCXuxQxthK3Ff6cJFjog9Ano
 g1yeyqhr2dGvhVBehu7Mhuo68Ignm5LkNiytdR2LSvpa5yTq3ZVbrPOAeCIAAPl0UvP1tGc4/VB
 SflzEPsGYwUqqG2YsCzymsHEsSULsKraPE/saIgen2Nwn1PdNJW7dJsSr7dQp4VUxlWZnbKhMo/
 JPWUP+VJWDCt+3g3AxQ2ytRDm7VGO0+PcITgTIPZDYVFusShftS0wpUtQnv//Hz8ix+n80tEAcD
 76GC0sBWirO9uwrUZRdUUO3ddvCsIdd6AW4E+UAqlITI7Pp0w6FkOTIwX736nXRhUzXYHD02AsU
 AG
X-Google-Smtp-Source: AGHT+IEbnsIY0vf9pAFdqyfinUxmenFl/mLIas1mYaWnWD8ODNbwbg72/hTIQWTaS7C+/jsME2yEoA==
X-Received: by 2002:a17:90b:5105:b0:329:e2b1:def3 with SMTP id
 98e67ed59e1d1-33bcf87f412mr26817351a91.10.1761163306326; 
 Wed, 22 Oct 2025 13:01:46 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e224a2f28sm3370465a91.19.2025.10.22.13.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 13:01:45 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 22 Oct 2025 13:01:33 -0700
MIME-Version: 1.0
Message-Id: <20251022-bash-5-3-v2-1-adcf1223650f@gmail.com>
X-B4-Tracking: v=1; b=H4sIABw4+WgC/03MQQ6CMBCF4auQWTuGFqroynsYF0MZaBPbmikhJ
 oS7W9zo8k/e+1bILJ4zXKsVhBeffYol9KEC6yhOjH4oDbrWRtVaY0/ZocEG7aUnrk03ngcFZf4
 SHv37S90fpUdJAWcnTP+A+gGLwlK6s61tT9RQc5sC+efRprB7ZcfYC0Xr9n+gPLPAtn0Ac/pzK
 LMAAAA=
X-Change-ID: 20251022-bash-5-3-c9bae058f7d1
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761163305; l=7588;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=+egwBnA0OaBmOGprv1NeHh3b+1qciBztDqBcJofKxNY=;
 b=L9V8ftLdq2Y7dqilbeM9s2HomvR9s0B0y1sdDVTjPUv0EZ4zWbsrDKKDL+nfSrHqpKGNwKQDJ
 BXZhyk4rhrQBu5beQ4VrO1Ow8Xl0xTzB/qlG/qzpecFGpdugxSpCHsP
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761163306; x=1761768106; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L0NigrOHMjiEDL3CCCa3YL3u1S5iUJSkSymwLWMNCI8=;
 b=LRYfwszODyi+XYr6zRpBK+yTo1hzlBjG42rNf0z2/cRQ1D9Pr0lXVs4/FU+Zzkhbz6
 WqA2WOE5pJpUjct9GX0GlApzJwlLwN+tdyhkJ/dpvq24XpncEVSdZLqSGqQp8CcyHOvu
 uCNrGxeq0R6dLDIVKijxTXTcmezg8FvDfd5NGaqeUxDA9XMt1P5Qin2liJoZr5WDk5T6
 HADN7DAALrsPI8Jrm1g2f1ugaIPQ/Pk+Ex756c40hwjsiuWi1Dlfjy1676sIyRvabKU2
 ajTL4TU7g9NUe16VaH1L998KP2x0CXNXLl2wregDKOWr51c5NRNOk+/lkYNsDqW+bW36
 2Rwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LRYfwszO
Subject: [Buildroot] [PATCH v2] package/bash: bump to v5.3
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

See the relevant announcement:
https://lists.gnu.org/archive/html/bug-bash/2025-07/msg00005.html

Changes:
- Removed upstreamed multibyte compilation fix
- Rebased missing include patch that remains unmerged
  - Fixed Upstream: checkpackage warning
- Removed build failure workarounds enforcing older C standard

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Changes in v2:
- Removed Fixes: lines that are outdated [Julien]
- Removed build failure workaround [Julien]
- Removed outdated .checkpackageignore entries [Julien]
- Link to v1: https://lore.kernel.org/all/20251021-bash-5-3-v1-1-b28c4c46a3a3@gmail.com/
---
 .checkpackageignore                                |  2 -
 ...01-input.h-add-missing-include-on-stdio.h.patch | 11 ++--
 ...-fix-compilation-for-non-multibyte-builds.patch | 63 ----------------------
 package/bash/bash.hash                             |  4 +-
 package/bash/bash.mk                               | 11 +---
 5 files changed, 9 insertions(+), 82 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e8c97c2d63..7b56e4e6c1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -228,8 +228,6 @@ package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch lib_patch.Upstream
-package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstream
-package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch lib_patch.Upstream
 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch lib_patch.Upstream
 package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch lib_patch.Upstream
diff --git a/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch b/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
index fd008e9472..14d01c18b0 100644
--- a/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
+++ b/package/bash/0001-input.h-add-missing-include-on-stdio.h.patch
@@ -1,4 +1,4 @@
-From 4fa85c85b9a76afd3b19ed75bf17ccd2940f1f55 Mon Sep 17 00:00:00 2001
+From bb974701658ec88fe80357e58c44fd8df55aae77 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 16 Feb 2020 16:18:48 +0100
 Subject: [PATCH] input.h: add missing include on stdio.h
@@ -15,13 +15,14 @@ Fixes:
  - http://autobuild.buildroot.org/results/bfca306868df54c567215c45c8cdac838d02f567
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://savannah.gnu.org/support/?110196]
+Upstream: https://savannah.gnu.org/support/?110196
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
 ---
  input.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/input.h b/input.h
-index 6aef1269..08b0fdea 100644
+index 592b6cb9..21544df4 100644
 --- a/input.h
 +++ b/input.h
 @@ -21,6 +21,8 @@
@@ -32,7 +33,7 @@ index 6aef1269..08b0fdea 100644
 +
  #include "stdc.h"
  
- /* Function pointers can be declared as (Function *)foo. */
+ typedef int sh_cget_func_t (void);	/* sh_ivoidfunc_t */
 -- 
-2.24.1
+2.51.1
 
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
index 7fb43c52c0..ed99bbadb2 100644
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
@@ -26,15 +26,6 @@ BASH_CONF_ENV = \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
-# Can be dropped when bash is bumped to 5.3 or newer.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
-BASH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
-endif
-
-ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
-BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
-endif
-
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link

---
base-commit: e1ef4be70b601863949cccd4ec0d98ff19513cc3
change-id: 20251022-bash-5-3-c9bae058f7d1

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
