Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A63EC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 19:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39E961010;
	Wed,  3 Jul 2024 19:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZwTbZ8NJciR; Wed,  3 Jul 2024 19:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B113A6100C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B113A6100C;
	Wed,  3 Jul 2024 19:12:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0E51BF2E3
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53123412F1
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BCmtN0KYR9R for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 19:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 517CD40544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 517CD40544
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 517CD40544
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 19:12:34 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso3287472a12.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 12:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720033952; x=1720638752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8FE+gFesMHae5XCGcBuuUFMKjhn8BhqAcTEi14n8AXM=;
 b=GXcG0I6yQf3sUTqwTWp5WazXxy8uBwea4Y6LRHFcKJKSo0tqwB95mmTbbx5IcZFV9m
 brPtIDPF3nVkXkSXR81CCmmK3z7LJNZGN0PaO89vOOa7AzLCPujdcv7aTPHeKl8xCcqw
 OUdpZtx5qgiBMjGPBpOGSO/fvvvIZfrsoMvfAN1NgOSIlUVt9zwzh2l71QOf4YaZ3s3X
 XGvfvQqDasgaqlKDcO4xfdpWTJKDB209+LdEcZaZN9n7hLp6Y8+3Y4GQ503lKSVa8s7u
 uUwA6sruqFGCCQWyKfj8x8cZuuTVNMKYZcjOIxPvadXomrgSp7BP2Jb3pt9RD6v5nTHV
 38RA==
X-Gm-Message-State: AOJu0YyghXiQ1paOgTuaQ71Be7lGw9MdzB23PsTkpeZUyuZyLOpXPuIN
 xpGCv7difmlbNZvDh6yW+o0m8ll1H41fTal/eKgsIt8FyYdp6YRgcI/PpJrxbjaOuxG0Z2LaMUD
 prfY=
X-Google-Smtp-Source: AGHT+IF5pBi3+2aNRnfxcHY1JTUrYrqxwB5MMw3yZzPkHICiQt/Cb83cuX4zHkTX3aMDSTGlL/eBtA==
X-Received: by 2002:a05:6402:354c:b0:57d:5c96:72aa with SMTP id
 4fb4d7f45d1cf-5879be9a1a7mr10230387a12.0.1720033952046; 
 Wed, 03 Jul 2024 12:12:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58d0bfeec43sm1087032a12.48.2024.07.03.12.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 12:12:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 21:12:28 +0200
Message-ID: <20240703191228.2799856-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720033952; x=1720638752;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8FE+gFesMHae5XCGcBuuUFMKjhn8BhqAcTEi14n8AXM=;
 b=Lj7x0epiE+Wu+19SgYFpDOZgaE9mq6xB+1Z3LYUuOjY3Cpw3q1fPy1tyOwZRwZjrXE
 ba2vuPfkwuzjRYFm5A9+QBrvBAMzyOS+aEq6JWCGTdTqaAdrRrrevgJvmOc9WOS05Xiy
 5uA+3tKfPa9cbC+Z1+1sGvq4v9Nf6NPAoawtA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Lj7x0epi
Subject: [Buildroot] [PATCH v2] package/lxc: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, lxc fails to build with output:

    Applying 0001-src-lxc-syscall_numbers.h-drop-define-1.patch using patch:
    patching file src/lxc/syscall_numbers.h
    Hunk #1 FAILED at 53.
    Hunk #2 FAILED at 92.
    Hunk #3 FAILED at 129.
    Hunk #4 FAILED at 166.
    Hunk #5 FAILED at 203.
    Hunk #6 FAILED at 272.
    Hunk #7 FAILED at 309.
    Hunk #8 FAILED at 346.
    Hunk #9 FAILED at 383.
    Hunk #10 FAILED at 440.
    Hunk #11 FAILED at 477.
    Hunk #12 FAILED at 518.
    Hunk #13 FAILED at 759.
    13 out of 13 hunks FAILED -- saving rejects to file src/lxc/syscall_numbers.h.rej

This commit refreshes the package patch on the current package version.

As you can see from [1], the patch was created for version v6.0.0 but
has been backported in Buildroot without being rebased on lxc v5.0.0,
where loongarch64 support was not yet merged. This is further evidence
of the importance of applying patches with fuzz 0.

[1] https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Improve commit message.

 ...-lxc-syscall_numbers.h-drop-define-1.patch | 87 ++++++++++---------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
index 4a944e35b12a..d6eb7476dc72 100644
--- a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
+++ b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
@@ -1,4 +1,4 @@
-From 82fe01821cd5cb8548598d7d93b07d6ef3f6b604 Mon Sep 17 00:00:00 2001
+From 964740d28c9a0da52a75d579d7fdfa53df67e925 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 30 Mar 2024 16:50:46 +0100
 Subject: [PATCH] src/lxc/syscall_numbers.h: drop define -1
@@ -19,115 +19,120 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/lxc/syscall_numbers.h | 13 -------------
  1 file changed, 13 deletions(-)
 
 diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
-index 58840a5981..5e659d1b81 100644
+index ae5fdd0641c6..5dc1259fef1c 100644
 --- a/src/lxc/syscall_numbers.h
 +++ b/src/lxc/syscall_numbers.h
-@@ -53,7 +53,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_keyctl 219
+@@ -51,7 +51,6 @@
+ 			#define __NR_keyctl 5241
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_keyctl not defined for your architecture"
  	#endif
  #endif
-@@ -92,7 +91,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_memfd_create 279
+@@ -88,7 +87,6 @@
+ 			#define __NR_memfd_create 5314
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_memfd_create not defined for your architecture"
  	#endif
  #endif
-@@ -129,7 +127,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_pivot_root 41
+@@ -123,7 +121,6 @@
+ 			#define __NR_pivot_root 5151
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_pivot_root not defined for your architecture"
  	#endif
  #endif
-@@ -166,7 +163,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_setns 268
+@@ -158,7 +155,6 @@
+ 			#define __NR_setns 5303
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_setns not defined for your architecture"
  	#endif
  #endif
-@@ -203,7 +199,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_sethostname 161
+@@ -193,7 +189,6 @@
+ 			#define __NR_sethostname 5165
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_sethostname not defined for your architecture"
  	#endif
  #endif
-@@ -272,7 +267,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_signalfd4 74
+@@ -260,7 +255,6 @@
+ 			#define __NR_signalfd4 5283
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_signalfd4 not defined for your architecture"
  	#endif
  #endif
-@@ -309,7 +303,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_unshare 97
+@@ -295,7 +289,6 @@
+ 			#define __NR_unshare 5262
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_unshare not defined for your architecture"
  	#endif
  #endif
-@@ -346,7 +339,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_bpf 280
+@@ -330,7 +323,6 @@
+ 			#define __NR_bpf 5315
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_bpf not defined for your architecture"
  	#endif
  #endif
-@@ -383,7 +375,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_faccessat 48
+@@ -365,7 +357,6 @@
+ 			#define __NR_faccessat 5259
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_faccessat not defined for your architecture"
  	#endif
  #endif
-@@ -440,7 +431,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_seccomp 277
+@@ -420,7 +411,6 @@
+ 			#define __NR_seccomp 5312
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_seccomp not defined for your architecture"
  	#endif
  #endif
-@@ -477,7 +467,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_gettid 178
+@@ -455,7 +445,6 @@
+ 			#define __NR_gettid 5178
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_gettid not defined for your architecture"
  	#endif
  #endif
-@@ -518,7 +507,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_execveat 281
+@@ -494,7 +483,6 @@
+ 			#define __NR_execveat 5316
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_execveat not defined for your architecture"
  	#endif
  #endif
-@@ -759,7 +747,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_personality 92
+@@ -733,7 +721,6 @@
+ 			#define __NR_personality (132 + 5000)
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_personality not defined for your architecture"
  	#endif
  #endif
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
