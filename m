Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E21CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 00:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C6960616;
	Wed, 22 Oct 2025 00:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xdG2uQXWBfh; Wed, 22 Oct 2025 00:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61CFC60661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61CFC60661;
	Wed, 22 Oct 2025 00:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BE043F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC8A404CE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wL4DxXgRerrn for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 00:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF4B0402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF4B0402E8
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF4B0402E8
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:37:40 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7a23208a0c2so2833294b3a.0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761093460; x=1761698260;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ulsjqm3lChu3ZpoIc6HwKFR2vwWwOCu57PbM8hKoLMQ=;
 b=CS5mpzeuzxW8mAW9rLGNBOCd4eb3eTEIBsvc4rYZ50KLnivYbV87n84Fr+ttAZvSIR
 WNMaWQSY+4qZJztjpWttjpsXotVXnhq328+xn4ka4ZUqTTdvR+eksF+nP37s75HgeVgN
 s/icq7nkqp/X+5WVDCqr9gHTyYgsUVlKpGBwqE9DLhvMLgJiOWKd2PX3yMSAflub5mWE
 1YlTVFuDlmGSjgF3wviywpb3IBHD6kqpmDkDyhegiyR+IoostiukiiycCAwliCq+KbJv
 bWt3Q6Q5t1Y5p0d6gI8uwqyWG9GwYXz/J40XWrMpWLUg7ojB/mQl4ZxK5pezsghK0dXd
 Z3zg==
X-Gm-Message-State: AOJu0YyPBiG0lJ5OmM1g8Y8zzGI0ti5rWVSrqVAw9orKC+A4whbAfMWl
 EZO/8ybkFIcvjom/Gih4whtLWxVPR5FPsslbEJbgpQfVoOTT5GoJIYwVpn45oHkQ
X-Gm-Gg: ASbGncuSiWEtLcakWcacsYV/FHOHQ8sMxSu8u0qcafGIOL48cNi4/FolECJQ9ZD6iIz
 reb2TOMtiQQ9zP5hNTFx7mmy+ioyicWz4cfBsVCwr8/EwseSDxh0dgHHaN4uavNLI4PATDb/Hxh
 e4bMtme4jAwKY34eoFC3TyXe8PwLJ2av/yIQYlLX8uknNQD28EjAue2Ty7roGdjMRyBFeavwivj
 oqLqmDvEtgZno/gXLCW9OAAiN/qEOIctnF6ko7KTzXDCAZeyGOhADNPnVxXB18V7YjQpbHqmQsJ
 Bl8AyDZHN6VgOYhJGM94yve7ni34XjQD/PenUj59ZuupHay0puDHNBYMSSEribm7c/SDikwju5e
 bnDRFPd4K8k6BMimW2ryRm8wlRWAJN2IOyFP/GUnF5ZBj2suv65bD/LFuBAlsV8ZqfatZRe2CL4
 Ec
X-Google-Smtp-Source: AGHT+IF5u0nCjiSZjqbxdMpyILGeq2ykX2/r8avzhXw24r2kWQK8gxI2728SL85QfwKCCXrvt8p1Aw==
X-Received: by 2002:a05:6a00:a589:b0:7a1:68b2:5341 with SMTP id
 d2e1a72fcca58-7a220a4abf3mr19685143b3a.11.1761093459896; 
 Tue, 21 Oct 2025 17:37:39 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2643d4b96sm1099745b3a.20.2025.10.21.17.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 17:37:39 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 21 Oct 2025 17:37:38 -0700
MIME-Version: 1.0
Message-Id: <20251021-bash-5-3-v1-1-b28c4c46a3a3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFEn+GgC/x3MQQqDMBBG4avIrDuQjGiLV5EukvjXzCYtiYgg3
 r3TLj94vJMaqqLR1J1UsWvTdzH4W0cph7KCdTGTOBm8E88xtMwD93zvF0nycMAYyfJPxUuP/2p
 +mi0ExxpKyr9BwbHRdX0BG9xxt3EAAAA=
X-Change-ID: 20251021-bash-5-3-73d2c280ee6b
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761093460; x=1761698260; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ulsjqm3lChu3ZpoIc6HwKFR2vwWwOCu57PbM8hKoLMQ=;
 b=S70jvqAChpKiQoYCpZXb4CkP7XyFGGphqJIXoCB/JiHlcieAOma339aahOfwjhm7oV
 Uvh9OL0Aad8MLBgUpGdSEJtWM3uo5ul+t2YhDohOUjQCEzY8dMNdkyGHOgYGDBml73eW
 FKGxsCFSVMuwdny1LjYhtTAjfMooViCaIhpODuHXxjDLfwaUah2GfWKf5K9aQJabBCWX
 Yn0uBhtkjSs1bsdsLNXYtihGhUsmpDy8aU8C0tNPeULmxTtCZxTJczGgvooUr+Ia4w/7
 KYcNqKxcq4n8DMpOk6mHBir/sosjrSmsx3+9BjbkXBPOipzjY5oAtTk1UffDrw7OXDNF
 4/dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S70jvqAC
Subject: [Buildroot] [PATCH] package/bash: bump to v5.3
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

Fixes:
- https://autobuild.buildroot.org/results/4d7/4d747e67e64020b4aafbc665eb0d158e2019df53
- https://autobuild.buildroot.org/results/cf5/cf54a49175531372f7988c10dd64411b85891088
- https://autobuild.buildroot.org/results/f13/f135a97fa8bd2750ffc9a10ae21524f6668888b8
- https://autobuild.buildroot.org/results/ed3/ed39befdd73f3c107d7ee251d88127d1d493fd5d
- https://autobuild.buildroot.org/results/95d/95d86fa81ac62ffce0411018281ec15c6a9b5e08
- https://autobuild.buildroot.org/results/6de/6de3e106d062252574ed31835acace62045797e2

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 ...01-input.h-add-missing-include-on-stdio.h.patch | 11 ++--
 ...-fix-compilation-for-non-multibyte-builds.patch | 63 ----------------------
 package/bash/bash.hash                             |  4 +-
 package/bash/bash.mk                               |  2 +-
 4 files changed, 9 insertions(+), 71 deletions(-)

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
index 84f581da79..870ad7e007 100644
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

---
base-commit: aa6b9c979dfb4a3a55109d819cac66924cde5913
change-id: 20251021-bash-5-3-73d2c280ee6b

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
