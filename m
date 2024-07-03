Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F999C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 10:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751E241A64;
	Wed,  3 Jul 2024 10:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYsvDq9PGCW8; Wed,  3 Jul 2024 10:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBEF840105
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBEF840105;
	Wed,  3 Jul 2024 10:25:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F15231BF308
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 10:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEB8B60E87
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 10:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTYJmwTeh-O7 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 10:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6718D60E86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6718D60E86
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6718D60E86
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 10:25:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7523f0870cso409148466b.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 03:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720002307; x=1720607107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QY6dUH+huwHh+BMDNXTkU4EpkohuTI/SwUqxVLtZIMs=;
 b=bDuBw3PbWdefjSph8bflVQyuRbdRPIwWgRZ6uLn960t3X9DmqI8wtJSmMqYVzBJpcG
 jnCpg/W1eYn4N+is1Gicnhd7FeBtihES6JhhY2JUIaG49/12q29Pq2g/Bm4LuVTDXpUU
 a2X61HUis9bNjl76smKVomJt8ogwS7HVV1D0yt5xf/SEhQGvret/KZRJKfnLr7o3ColI
 h7iNVeI7WxgbJk5csaTLEerzhhL9qVrcj7HK5TF87fr7yFoWsuFC+bPhIDtXLDq3UHoe
 +FUVGj0n5JEoWCa5V/cUag90XVqaF55PkP3f1FCvMG01o+kusG8UZu+JqBqJpzPDrn13
 L04A==
X-Gm-Message-State: AOJu0YzYWZvfmPH7y1c7pgp4luwmF9UNa/I+QiYhZoyFm2MCMTjaL6GZ
 L/8/ywkrEZ1pcysm6p9NLK/QAnWTcLbexcd0aIheH6E/kAatvDWtFqYAeAhIeR9pep3UJsvqVYf
 hdAE=
X-Google-Smtp-Source: AGHT+IHTc09O+v8HRnpF60PelzGtp/L2z/IZ6rod63OtSS5UcAXszAhIP47fOnXWa1LSEldeYcBAWA==
X-Received: by 2002:a17:906:4908:b0:a6f:adf7:b077 with SMTP id
 a640c23a62f3a-a751440e8e9mr631659566b.28.1720002307168; 
 Wed, 03 Jul 2024 03:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1a37:2bf3:7cf8:1941])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614d507d2sm6788970a12.64.2024.07.03.03.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:25:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 12:25:03 +0200
Message-ID: <20240703102503.2693749-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720002307; x=1720607107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QY6dUH+huwHh+BMDNXTkU4EpkohuTI/SwUqxVLtZIMs=;
 b=YluiXPYdmmYGpg2sHHXDeYZMCwouKFMhzs5AaViASyOOiOdDWiDmCIg2bIPSkEAKCD
 iyfIkMQTng6sfz9LK08fV60Cgespel4H9DHxdEwjJrnLI9hoDLlDZcpyM3ZcX6uwvV7q
 PTMIhRLs38391a8epXfTav85qFDeorYYKKaZw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YluiXPYd
Subject: [Buildroot] [PATCH 1/1] package/lxc: update the patches to be
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
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
