Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A346ACD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 16:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B38060C1F;
	Thu, 14 May 2026 16:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvGCKZWEcbGN; Thu, 14 May 2026 16:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E12160F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778777102;
	bh=12csxA4C1qzyWz6uOHmY1omHDsiQ/RZ5xpKOhDJkUjo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LI21va5Oa0pBY3R0/Z0fEodIe7SfEO3bYW3JOwhMUGUeKhR6XqQJlaB+0US1yzM3a
	 QP7fAkOHB6uuy+uGyOpF+QDKMQ1yGPaWpOxZRY8oEmxo2oDpa5zghlu+uti1lesjCY
	 5d7UyPND5jmzYQvhSICMdyI/7Vlr5801XJyJel97vBANvIMy4xZtBvRjCrlrgSh1FR
	 ZWsG78k6tq0I14jhHJ1A83X0m9jtyN4Ug6WW8hqFyGJUEaFTh+1HD+XtUCMtBkAvuQ
	 KavNzZTfoZwtDPLYHbnRwN6n89a6L9uG1mPGTgy3b+lLxXPJplJMCl9r1K56vSnjo1
	 IHTKAmm7Wfhyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E12160F13;
	Thu, 14 May 2026 16:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A962236F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 16:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A699540767
 for <buildroot@buildroot.org>; Thu, 14 May 2026 16:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gU7ks-Bq0bQ for <buildroot@buildroot.org>;
 Thu, 14 May 2026 16:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 024DD40738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 024DD40738
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 024DD40738
 for <buildroot@buildroot.org>; Thu, 14 May 2026 16:45:00 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-366139223e4so5029653a91.0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 09:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778777100; x=1779381900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JADQay7f3GHOqgGFLhVexDrOZUrX5JpccD2+0PebL2Q=;
 b=WvD3EAuqjuYWctwgQXk5s+Nv4YyLQK3C7UonQD2ftwR6yIOrZaPVmuUjhA8b6Aks20
 1QPyjcPJ02izvVhaPfhsx27aY7dT+kYNjkIHQkCFMSzcJmpZRyeB58XWq4MdrAIXJRAU
 iDdnfeKKgzfrlAQAIB58EaebehUAAXQNhYANDa4c3EBvaBmWNg9CmM7eoSqBHKzVO9VD
 oE/0fSOTFsUNBo/7cLmJuq+zAaMFaVUz5kMmtrMKCpx6lM+MsSQxcN00q7K3w0ogbRYV
 cOO9f6Iin+l2M85lkpDXi9o+xWZwPRX21Y6CNMpM2Zr4fZ8tFIdk13MSwSX4wkLKspN9
 amfA==
X-Gm-Message-State: AOJu0Yy4aD7vOqOKqXjCG5LVaCb4kGB9cJje0EnrgWrlH5H9lXU8iM1q
 Tuxz2yk9dVS7PMJykanJx82ZmZy1W20eGZvJEL8aknxcMVbJFBaH4buRbXGs3jIDb7c=
X-Gm-Gg: Acq92OGq2IuiC+JFtCxEk0IPwJeexn///spVrSxUtk7HVKB3ucsAxxN9iW38u2YQI5M
 v1EK3foBV9tN7cBIwzC+uiP6AKArMcJYE+Y/chOcMb94+nwAmdX5pwavOcbt0ntnwzcIUlRRrK9
 Mxsu+SQuwDucmA0z3RoGlsnYCpJ0el8ENFHBz9vU5PoOl0amCQslpCfKK3Ewe6FXblfYd3+Xp2M
 XUlqMyGmOhFE7vMMxpNLM9i8h9yp79eugVdrczViZQPk3K/S4FqQaWQfqITcjUV5DWSdoxzJZxr
 SWM2sh+bfSmpEEk8iMdZjA4Z/ohDY5wtXCNHEVjA1gqr+oepLimdP14WBQvRyKDyoxef39HzqMT
 80tbcmEfHX0kbSBCD5DJuhDiwVIqifGW31zj75Ze7O2oGAR4SJGZXNdezbAiKCrkIfCYBxL49+w
 lz33ur/3nSfjJMnRWRbX1MCVX2zubUHHF378qP6VRj9tt+sgWGP9+UcDR0a87mtNHMDd8a
X-Received: by 2002:a17:90b:2fc4:b0:368:85fb:7b8b with SMTP id
 98e67ed59e1d1-36951cb936amr145566a91.22.1778777099620; 
 Thu, 14 May 2026 09:44:59 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369512424b2sm167148a91.3.2026.05.14.09.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 09:44:59 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Date: Thu, 14 May 2026 22:14:47 +0530
Message-ID: <20260514164448.92054-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778777100; x=1779381900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JADQay7f3GHOqgGFLhVexDrOZUrX5JpccD2+0PebL2Q=;
 b=Kzk3GS6i3908VeDryZv8//JfdFoiM6xaOyaYvZWi4dpiTr25x5wHrIN2mGAvDJega/
 EPfPx1ELvG0LumHCYnzvwnKtyU42fYxC3ZA63f+kJCyHMgCq8uJp8t7ZTJ4egcbA80bf
 NkPT994G3pJQ9CAvPwA0mwgFYjEo6nWFXM35nZ9kkziZZ8wdnHH+ow0/BN4Qcs3fN8r/
 H4X7CT6hd0NWznp8axhh6nIRrgOaHhTcdwHpNZV3D4CQGVRFaQnUx1rDS8sUOnVqyy/h
 0u8csyayiYg3jRpAaspR2Z9p+DRejiz9KdDZhsLn78/9Fr8+KA3NLsYwr1EyN3ZC2rpa
 C0yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Kzk3GS6i
Subject: [Buildroot] [PATCH] package/git: Fix build on older glibc
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

The build of the 'git' package fails on older Linux toolchains (like
bootlin-aarch64-glibc-old which uses glibc 2.24) with the following
error:
compat/posix.h:159:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>

This happens because Git recently made 'getrandom' the default
CSPRNG_METHOD on Linux, which unconditionally includes <sys/random.h>.
However, this header was only introduced in glibc 2.25.
Fix this by using __has_include to check for the header's existence.
If it's missing, undefine HAVE_GETRANDOM so Git falls back to its
/dev/urandom implementation.

Command to reproduce:
- ./utils/test-pkg -p git -c git-subtree.config -T bootlin-aarch64-glibc-old

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 .../git/0001-fix-build-on-older-glibc.patch   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/git/0001-fix-build-on-older-glibc.patch

diff --git a/package/git/0001-fix-build-on-older-glibc.patch b/package/git/0001-fix-build-on-older-glibc.patch
new file mode 100644
index 0000000000..b95ca94c23
--- /dev/null
+++ b/package/git/0001-fix-build-on-older-glibc.patch
@@ -0,0 +1,45 @@
+From c53f54a87503ae729640a6f12302778a980f84d9 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 14 May 2026 21:09:07 +0530
+Subject: [PATCH] compat/posix.h: fix build on older glibc (missing sys/random.h)
+
+The build of the 'git' package fails on older Linux toolchains (like
+bootlin-aarch64-glibc-old which uses glibc 2.24) with the following
+error:
+
+compat/posix.h:159:24: fatal error: sys/random.h: No such file or directory
+                        
+This happens because Git recently made 'getrandom' the default
+CSPRNG_METHOD on Linux, which unconditionally includes <sys/random.h>.
+However, this header was only introduced in glibc 2.25.
+
+Fix this by using __has_include to check for the header's existence.
+If it's missing, undefine HAVE_GETRANDOM so Git falls back to its
+/dev/urandom implementation.
+
+Upstream: N/A (Buildroot specific fallback)
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ compat/posix.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/compat/posix.h b/compat/posix.h
+index faaae1b..1632221 100644
+--- a/compat/posix.h
++++ b/compat/posix.h
+@@ -155,6 +155,13 @@
+ #ifdef HAVE_ARC4RANDOM_LIBBSD
+ #include <bsd/stdlib.h>
+ #endif
++#if defined(HAVE_GETRANDOM) && defined(__linux__)
++# if defined(__has_include)
++#  if !__has_include(<sys/random.h>)
++#   undef HAVE_GETRANDOM
++#  endif
++# endif
++#endif
+ #ifdef HAVE_GETRANDOM
+ #include <sys/random.h>
+ #endif
+-- 
+2.54.0
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
