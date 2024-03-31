Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE13CD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 08:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56829403BF;
	Sun, 31 Mar 2024 08:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7Un1B04TLJy; Sun, 31 Mar 2024 08:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CC45400AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CC45400AB;
	Sun, 31 Mar 2024 08:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0591BF576
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3832681A6D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 08:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vu9Os2R8qjj for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 08:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7CBA81A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CBA81A3B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7CBA81A3B
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 08:53:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4155baa696eso4111015e9.2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 01:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711875207; x=1712480007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1xmQt8CqvKjHwB7SOrrr1az08ctxfIAo43jxNwUZzc0=;
 b=fVYDRbHVCHggEG6XIln4JT4sYexmCFtb8595EXwd8HDjukXqRfQLhauOGdht7yjRRm
 kxrBw5iRt7gXOCO4uSFGSDInosG2pZEmrAiXII0B7T42jPpk3+GjXA6M2Nuz38SNaMkm
 bXl3oubee/kvsJQAIYyduN5vnzgoLrlyYmnj9wi38Bows8S7aX8AlYsItzhZuz4bVaM0
 XUhbfEbYbQSiCl3FlhOechXC+C7aiKrrWwMnknxluONEK8ALot3FTNMovxauJymxr07Y
 5VInwSS2PNF46EYu9FCt4yN9lpUQRuLsWYGQKqlk+zZheuIPvP51aWySEH93rLgE8MBa
 AmfA==
X-Gm-Message-State: AOJu0Yyx19z1wqzVHIwy0+eShlGS4obfQkAyTT/LNodXUd72ieHlRqPk
 dq0CeN8AedILY8hccdAg/hVfgKBEDti83idYgs0S/06Q1CoYJB+0jIgyLX6t
X-Google-Smtp-Source: AGHT+IGvKOHGZ9ufTRIvPLXs1omwo9TVE8zj6zoJVwlhdFJ3wiIixxdFQ0SJ9fCAslHn7gLi14/Qnw==
X-Received: by 2002:a05:600c:4f0d:b0:414:9012:8553 with SMTP id
 l13-20020a05600c4f0d00b0041490128553mr4309318wmq.3.1711875206817; 
 Sun, 31 Mar 2024 01:53:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o10-20020a05600c510a00b004148a5e3188sm14112404wms.25.2024.03.31.01.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 01:53:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 10:53:19 +0200
Message-ID: <20240331085319.8585-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711875207; x=1712480007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1xmQt8CqvKjHwB7SOrrr1az08ctxfIAo43jxNwUZzc0=;
 b=cu5Hym6U6nr1hk7aWE5avMtn3BQvgN1rnPcrjmqQcqIqn79zdbmNcXsz4LTE0a2DVU
 BTPfx4s2k5sHGRZKoCKA8MZ5GNcjHSvLBiWMmCC3nqRBs+nziLbXlWM5S+Gn02wRvrh+
 39fUZje6KIELTvyXTo2jHGaLhEFA9JkTYAx0LAS8zKyy+lkNwTN/4rz3SqVIUaWP3ch5
 b8ig3enr8J1P+WMvY7PD2v+tldkP+wKJrR7iuRg3kAara7uDk4YVsqBZz3vGg/kkyxOo
 zz7dJOQSYLSPsgHieCR/Nzr0vFqV1po/DGxLcTBd0FvXJvM2mJa2ItrYaK0aRW3q7c56
 oaqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cu5Hym6U
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix m68k build with gcc 12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following m68k build failure with gcc 12:

In file included from ../src/lxc/syscall_wrappers.h:19,
                 from ../src/lxc/mount_utils.h:15,
                 from ../src/lxc/conf.h:24,
                 from ../src/lxc/log.h:19,
                 from ../src/lxc/storage/btrfs.c:20:
../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
  423 |                 #define -1
      |                         ^

Fixes:
 - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-lxc-syscall_numbers.h-drop-define-1.patch | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch

diff --git a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
new file mode 100644
index 0000000000..4a944e35b1
--- /dev/null
+++ b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
@@ -0,0 +1,133 @@
+From 82fe01821cd5cb8548598d7d93b07d6ef3f6b604 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Mar 2024 16:50:46 +0100
+Subject: [PATCH] src/lxc/syscall_numbers.h: drop define -1
+
+Drop "#define -1" to avoid the following m68k build failure with gcc 12:
+
+In file included from ../src/lxc/syscall_wrappers.h:19,
+                 from ../src/lxc/mount_utils.h:15,
+                 from ../src/lxc/conf.h:24,
+                 from ../src/lxc/log.h:19,
+                 from ../src/lxc/storage/btrfs.c:20:
+../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
+  423 |                 #define -1
+      |                         ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
+---
+ src/lxc/syscall_numbers.h | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
+index 58840a5981..5e659d1b81 100644
+--- a/src/lxc/syscall_numbers.h
++++ b/src/lxc/syscall_numbers.h
+@@ -53,7 +53,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_keyctl 219
+ 	#else
+-		#define -1
+ 		#warning "__NR_keyctl not defined for your architecture"
+ 	#endif
+ #endif
+@@ -92,7 +91,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_memfd_create 279
+ 	#else
+-		#define -1
+ 		#warning "__NR_memfd_create not defined for your architecture"
+ 	#endif
+ #endif
+@@ -129,7 +127,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_pivot_root 41
+ 	#else
+-		#define -1
+ 		#warning "__NR_pivot_root not defined for your architecture"
+ 	#endif
+ #endif
+@@ -166,7 +163,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_setns 268
+ 	#else
+-		#define -1
+ 		#warning "__NR_setns not defined for your architecture"
+ 	#endif
+ #endif
+@@ -203,7 +199,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_sethostname 161
+ 	#else
+-		#define -1
+ 		#warning "__NR_sethostname not defined for your architecture"
+ 	#endif
+ #endif
+@@ -272,7 +267,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_signalfd4 74
+ 	#else
+-		#define -1
+ 		#warning "__NR_signalfd4 not defined for your architecture"
+ 	#endif
+ #endif
+@@ -309,7 +303,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_unshare 97
+ 	#else
+-		#define -1
+ 		#warning "__NR_unshare not defined for your architecture"
+ 	#endif
+ #endif
+@@ -346,7 +339,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_bpf 280
+ 	#else
+-		#define -1
+ 		#warning "__NR_bpf not defined for your architecture"
+ 	#endif
+ #endif
+@@ -383,7 +375,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_faccessat 48
+ 	#else
+-		#define -1
+ 		#warning "__NR_faccessat not defined for your architecture"
+ 	#endif
+ #endif
+@@ -440,7 +431,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_seccomp 277
+ 	#else
+-		#define -1
+ 		#warning "__NR_seccomp not defined for your architecture"
+ 	#endif
+ #endif
+@@ -477,7 +467,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_gettid 178
+ 	#else
+-		#define -1
+ 		#warning "__NR_gettid not defined for your architecture"
+ 	#endif
+ #endif
+@@ -518,7 +507,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_execveat 281
+ 	#else
+-		#define -1
+ 		#warning "__NR_execveat not defined for your architecture"
+ 	#endif
+ #endif
+@@ -759,7 +747,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_personality 92
+ 	#else
+-		#define -1
+ 		#warning "__NR_personality not defined for your architecture"
+ 	#endif
+ #endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
