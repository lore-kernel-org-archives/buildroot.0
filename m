Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E49F99C88
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C6980E79;
	Sat, 18 Apr 2026 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a24Z531HSifQ; Sat, 18 Apr 2026 16:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562A180E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776529938;
	bh=16rcnzDEHQh1i56ubfLEgjEFnuZOGzwLtUZ5x/PDNYE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kt6FJvAy4RJdT/WVGrUcmUGMaQpnXYqTTEf2ehNgdCUbgjJM6Z5KYVxCuQJMwBKbG
	 lIB1WnEa43/u4KVnegL4wnKf62G52UTMCtmFCMKxJQsgiy3I1/ycRG/924MAX68AaN
	 525GmeVIqLPka2ty7T3QA87tX88xOvZA3mbG96WlbSqsiwW2Dc6m9SggTmXymfLUwq
	 zOpf9JTu36J8mndj+fwnKYgi37D2H1TtzQ8w3Wnkp1Ktf6TOaJmY4s6ztyj8kfJS1f
	 kpBuHEQbOggF9UCOeAXhaUjCcdCKRO+KAo682euI/w7ik6Y4t4OcrafkCzLZWtDT3G
	 EDUXn8GrmV9Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 562A180E81;
	Sat, 18 Apr 2026 16:32:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A4CC35B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5028440DE2
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpHZMGDIKxhu for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 16:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7498B40DDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7498B40DDE
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7498B40DDE
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:32:15 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82fa8d6425bso23056b3a.0
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 09:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776529934; x=1777134734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XY2SunvGo7NNiOElWPEQzcpBnxZBgwy6hfTxm7CNFVQ=;
 b=O9zzQIbU0EiBzgU5iQgrhakSGiiCrAMDFv2OzQIlFKs6eyy5tduXAv2F5teUzkucru
 6Xz8eaWqrB58zTk1d80B/BIPOkyQn/MropSi9wctR16pmhdmd4rIbWE7udka6VysEhnZ
 PyW4ty7fOn6Jl0d1BZwAZnY8SIl4KaWadNLceQPst+s0fJXL8NZW0jnSkQ8rosuvKZa+
 FEEiGsTwxY76xX1/k/sw6Urk3blNhw8tVlNojpu8Yqr6AOdFq2sqGm5UJlPSjCdeBktf
 EZjqLe27BsrWwKav+1UsKfEw23NBjxzbeaIDVTMwoKTqmZyQXHkxtPyzcEOQsRdEXQo8
 3bMw==
X-Gm-Message-State: AOJu0YxtTPBkHCeDcOK1RQYJjq1VWtF2ypbToU4njaf9q6WDMAx5Kj5G
 JFXCPzry5CLNgPCTizQj4GcBNXIPNFFlUhwTY7qZ7U/WmqX73mm5KlLWRqCVIl1u
X-Gm-Gg: AeBDieuftaXHeaCNbikYMveH7uvrK5mi8FZbKuysp7joBfjeye/trJtPHdCLWtTWKxx
 wUFX6rqfXPCBclrUW4EPIgi7s8ZbME7n7OVucPaYgtpa8X2eCmsL499zKZLv98TCUeH2sbe+fq0
 AWnBXyZvPBGlIIVY2wlCudv1/Mw6wnS5v9ibxAFloUtpzPi0nIneD4t+6Ge4B1Rdiwdc3zmhm38
 sqQ3hzsUvjNVRRUMAaskmgVaLAL8/iYC7vyuwznBklxgNBo44uegC1ZOYB74tbDjLZ98sk6SaEa
 IEjB0TNfk0lSx7QaamzMeaSxcNBYo+qGRiFOqdNYtNZfuksGp9louCU/B3mvBQZFpKNWuP5n40l
 0dUM7taPljeQysQ37Pm/kGvJyNrSi28e3F6jb8f8Ggd7EQhEcanwgaD04L2K9ig69Vy/zAQV30I
 saW2zyJMCuxO3UipQBwQn/vCHmaaONoFXy9SI3NGJGTgwQMA==
X-Received: by 2002:a05:6a20:9187:b0:39b:f026:6f64 with SMTP id
 adf61e73a8af0-3a08d8a9d26mr8448941637.32.1776529934071; 
 Sat, 18 Apr 2026 09:32:14 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c797701d9bfsm3968700a12.16.2026.04.18.09.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 09:32:13 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 22:01:53 +0530
Message-ID: <20260418163153.17519-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776529934; x=1777134734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XY2SunvGo7NNiOElWPEQzcpBnxZBgwy6hfTxm7CNFVQ=;
 b=cLjvm2gcCKVrSDazmoIwX52PFIEKffGDRLtCLE23hFx6ZXCy8WWkEgTu5FGnL/T9Uo
 T9hSpupd4W4hG84vdP6iJKHlN0Sx+N3QeHpK2I6YrOOFMS8X2LrRxxSn9YVzj2QrmidR
 COsFcxNOVvuT0E0A076QulqNr38WXyMybSBMXLxUXpvfXmSNvjhZ0fS8BVhDuA15b6gP
 pWUDAzbzYXVnJp8Z3l2HjoL3+2jPxn9c6rbXDOBLGp1F/KashOesEuhtMLA938yUs7oU
 0sZyBH9rZT7APikKm/uJF6sIaxibBusywTofdnGt7gPiXj005h4Wl5o4mKyXWjTP8HQs
 NVAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cLjvm2gc
Subject: [Buildroot] [PATCH v3] package/make: fix conflicting prototypes for
 getenv and getopt
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

GCC 15 defaults to C23, which rejects old-style K&R empty parameter
list declarations that conflict with typed prototypes in system headers.
This is particularly visible when using non-glibc C libraries (e.g. musl).

Fixes:
lib/fnmatch.c:124:14: error: conflicting types for 'getenv'; have 'char *(void)'
|   124 | extern char *getenv ();
|       |              ^~~~~~

Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
fix getopt() declarations in src/getopt.h to match the prototypes
in <stdlib.h> and <unistd.h>.

Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
v2 -> v3:
  - Fix whitespace and indentation (check-package)
v1 -> v2:
  - Add Upstream: tag with link to bug-make mailing list (Marcus)
  - Include specific GCC 15 error log in commit message
  - Improve commit description with more technical context
  - Update patch headers to standard format
---
 ...ing-prototypes-for-getenv-and-getopt.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch

diff --git a/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
new file mode 100644
index 0000000000..ba0132bcb4
--- /dev/null
+++ b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
@@ -0,0 +1,70 @@
+From b64b62d00cb64b62d00cb64b62d00cb64b62d00c Mon Sep 17 00:00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sat, 21 Feb 2026 12:00:00 +0000
+Subject: [PATCH] fix conflicting prototypes for getenv and getopt
+
+GCC 15 defaults to C23, which rejects old-style K&R empty parameter
+list declarations that conflict with typed prototypes in system headers.
+
+Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
+fix getopt() declarations in src/getopt.h to match the prototypes
+in <stdlib.h> and <unistd.h>.
+
+This fixes build errors like:
+error: conflicting types for 'getenv'; have 'char *(void)'
+
+Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ lib/fnmatch.c | 2 +-
+ src/getopt.c  | 2 +-
+ src/getopt.h  | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fnmatch.c b/lib/fnmatch.c
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@
+    whose names are inconsistent.  */
+
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char *__name);
+ # endif
+
+ # ifndef errno
+diff --git a/src/getopt.c b/src/getopt.c
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@
+    whose names are inconsistent.  */
+
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *__name);
+ #endif
+
+ static char *
+diff --git a/src/getopt.h b/src/getopt.h
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -102,7 +102,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+		        const struct option *longopts, int *longind);
+@@ -116,7 +116,7 @@
+		             const struct option *longopts, int *longind,
+			     int long_only);
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int argc, char *const *argv, const char *shortopts);
+ extern int getopt_long ();
+ extern int getopt_long_only ();
+
+--
+2.43.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
