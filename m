Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A663CF531C2
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 18:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E67483C81;
	Mon, 13 Apr 2026 18:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rb7pmBk6TMC; Mon, 13 Apr 2026 18:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C76C83C6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776104194;
	bh=PfaLpTuem/N4eLeihLm6rE05d+80LGzotx0F5hSi3ik=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JijUlNdBLrL3oyfFgpLvWNSjM4Vz79Dii9I0PJ9QQUJVAU2ndClyx34cUZLdu7gxu
	 3j55bB+TCHziTGZsiCNco0ZhQuCTtsTT+vjrUZ+rGAUnpYKp10ajiZLuNr5N9dpgjr
	 qATBZeaOxu3mqmFGvJ25peqmyEUf7VjSYxjGNfw0FSsAWvrnpZIe0pAaLygh1BAN25
	 YYa9egm8jhcBvEP3hbQ6wj6vj5aGngX0+fN7bdsv4pElU4OFeD1OlzYzjMAO1q9WCD
	 5AYCjvwobw3qv7GucUNu2CnOj1DID8zSnempm0JKS/TjBv1N7ed9lZMJX4+0oC1KY6
	 VFxF5EeBIZQlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C76C83C6B;
	Mon, 13 Apr 2026 18:16:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 683CE196
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 18:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45EF583C6B
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 18:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbbI869cGlyN for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 18:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61FCE83C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61FCE83C61
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61FCE83C61
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 18:16:32 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-82f22f6b0feso992132b3a.0
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776104191; x=1776708991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBUXaaXeDL2c51LJACXkF81ExMqZanXohYi+0X/Qpqg=;
 b=fRmb4OG2i2jutpD6rIrQqd8vD721+G+8ZsFgI0y1crZoZ+4o0CrAVNODBseopWRWsK
 dsrCE8NfW5p0hKKBOei56kHStiIV3XYXtQw7/VJCSguLna7c6VDQ39ZuY+Ts5thOlaww
 zxU4QWwok/Fkeui3XNK5kRaEim1LexVnetT+y2SAJ/y1z8cm4kdTWEys/Wr0cbbJKEKr
 URhSvBeA1yQgqIodjixoR/CEt+kl9cOAZSaoX781tM7WB7CPiwgBvhI53Yxp/0ye0EDt
 ruuA8lxuNS3S5KfLzHyw3+Zim3p6BTs7sKigRLwMCUJcGc0E+KzYoYQ4mTGnYYotL3o2
 6yCA==
X-Gm-Message-State: AOJu0YxtO1eOl78FFTDTxh/a3hxFY00o821MdfuEGhG17vbKb3l8H+IC
 GQlqCNdUr0nGBLMZvTb8P9nsoDHO2qsQu2eII8GSmbGi63mCEJS6D4OMeb0BZiri
X-Gm-Gg: AeBDietP61Swh/+K2oLLagPPBJcgAX7RrgTYItNhOxYtWu3UzpJi2I2ES691tZ1QXvl
 mpT6iCIvmc6EQb9gBNyGoFOvuvjND3BoO9lRgFqgOZIaWK7jDjPfqqh8sr1LcE20RhoOtz1S9WY
 Nr0mF2smqd755KXjJJI8q66rLLaP99g7zPFpD3PxkhFkewZqRLUmMaXrr3nygPDFp8xxI38tkav
 tAtbrTze+7bSy5+VD97sBsOHBcYNiOxHpPIUe6iUm+kQlNUMGDfV8ocyxOz3ea5XqLjalU08R17
 /WWwB9XK9WENr/BzE+75YePPU/z7rc32CyqGyRGrI9qwtFX8vEqGzowk36reC1VdofUmJLpV+KV
 GMvOL+FsrvIEBwOdG2ZRa09EqX+m+7xJ3xATdPe5Jp6yjTD7T2owL38CS1+pVi90zJGrhzWLt40
 6bh+HxhwEZQRIdQWx0HjKuQNVbUcPTxl09
X-Received: by 2002:a05:6a00:13a9:b0:82f:4cc9:185f with SMTP id
 d2e1a72fcca58-82f4cc93775mr2111311b3a.52.1776104191084; 
 Mon, 13 Apr 2026 11:16:31 -0700 (PDT)
Received: from fedora ([2409:40e1:23:7139:6ccf:91d4:42c6:2e60])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f3de3e829sm4212524b3a.5.2026.04.13.11.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 11:16:30 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 13 Apr 2026 23:46:13 +0530
Message-ID: <20260413181614.371652-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776104191; x=1776708991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EBUXaaXeDL2c51LJACXkF81ExMqZanXohYi+0X/Qpqg=;
 b=owUY2qB3jR22mpNjnUkaDuqeMgROXnImxaJkoKp44x8iI9FvHX3M9Jb+wG5M++wDYc
 yiGVxqee1aBqdv48QzuwbiCWKdiE1WbAFZeguzmJWJ5Dnpt45+G6P4uURtzFjqitVc0H
 bkniCC5qWytn82BEyoqIWEHgjGWSBYC5OJINVKj+mWq4YZrSbilrxciVYpvNLC+HDAge
 /XKq98nliEGcL0jtAUWnNytG/qXBYZyuMYwX1ZqwOOB+6FBThlEMrGemUpvYHFL+ccTZ
 6q6Vtnzk7G7AAh3ZrrFoIyn31Rua+nQ6vvqzhnkWpHS2SyEw8pvORkE7xcR45WfH1pQQ
 YQBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=owUY2qB3
Subject: [Buildroot] [PATCH] package/dante: fix musl compatibility issues
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

Add patches to fix dante build on musl libc:
- Replace obsolete egrep with grep -E
- Include sched.h for cpu_set_t type
- Fix pselect inline declaration conflicts

Fixes build on musl.

Fixes:
 - https://autobuild.buildroot.org/results/d1b/d1b4933ee4f79d62a1c566c59172f38ca1311935/build-end.log

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/dante/0003-fix-egrep-warning.patch    | 25 ++++++++++++
 .../dante/0004-fix-cpu_set_t-on-musl.patch    | 27 +++++++++++++
 package/dante/0005-fix-pselect-inline.patch   | 39 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 package/dante/0003-fix-egrep-warning.patch
 create mode 100644 package/dante/0004-fix-cpu_set_t-on-musl.patch
 create mode 100644 package/dante/0005-fix-pselect-inline.patch

diff --git a/package/dante/0003-fix-egrep-warning.patch b/package/dante/0003-fix-egrep-warning.patch
new file mode 100644
index 0000000000..ff3765929f
--- /dev/null
+++ b/package/dante/0003-fix-egrep-warning.patch
@@ -0,0 +1,25 @@
+From b3f5366082aaff9f9d2cd8e74d9c79d604093aa7 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Mon, 13 Apr 2026 23:35:35 +0530
+Subject: [PATCH 1/3] fix egrep warning
+
+---
+ include/redefgen.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/redefgen.sh b/include/redefgen.sh
+index 89df63b..56bdafb 100755
+--- a/include/redefgen.sh
++++ b/include/redefgen.sh
+@@ -10,7 +10,7 @@ OUT=$1/redefac.h
+ 
+ echo "/* Do not modify, generated from ${IN} */" > ${OUT}
+ 
+-for define in `egrep '^#undef' < $IN | egrep 'HAVE|NEED|FALLBACK|BAREFOOT' | awk '{ print $2 }'`; do
++for define in `grep -E '^#undef' < $IN | grep -E 'HAVE|NEED|FALLBACK|BAREFOOT' | awk '{ print $2 }'`; do
+     echo "
+ #ifndef ${define}
+ #define ${define} 0
+-- 
+2.53.0
+
diff --git a/package/dante/0004-fix-cpu_set_t-on-musl.patch b/package/dante/0004-fix-cpu_set_t-on-musl.patch
new file mode 100644
index 0000000000..acc1c863d6
--- /dev/null
+++ b/package/dante/0004-fix-cpu_set_t-on-musl.patch
@@ -0,0 +1,27 @@
+From 7006202f603ffb38b56661a2c40fc69b05c4868e Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Mon, 13 Apr 2026 23:35:35 +0530
+Subject: [PATCH 2/3] fix cpu_set_t on musl
+
+---
+ include/common.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/common.h b/include/common.h
+index 1c23dc3..5378afa 100755
+--- a/include/common.h
++++ b/include/common.h
+@@ -47,6 +47,10 @@
+ 
+ #ifndef _COMMON_H_
+ #define _COMMON_H_
++ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
+ 
+ /* ifdef, not if, defined on command line */
+ #ifdef HAVE_CONFIG_H
+-- 
+2.53.0
+
diff --git a/package/dante/0005-fix-pselect-inline.patch b/package/dante/0005-fix-pselect-inline.patch
new file mode 100644
index 0000000000..be4a93d5a8
--- /dev/null
+++ b/package/dante/0005-fix-pselect-inline.patch
@@ -0,0 +1,39 @@
+From 37e89b8c17569e2ecefd35704b9508412d17715c Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Mon, 13 Apr 2026 23:35:35 +0530
+Subject: [PATCH 3/3] fix pselect inline
+
+---
+ include/osdep.h      | 2 +-
+ libscompat/pselect.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/osdep.h b/include/osdep.h
+index c3cd5b5..4f7827b 100644
+--- a/include/osdep.h
++++ b/include/osdep.h
+@@ -327,7 +327,7 @@ int issetugid(void);
+ #endif /* !HAVE_ISSETUGID */
+ 
+ #if !HAVE_PSELECT
+-inline int pselect(int nfds, fd_set *rset, fd_set *wset, fd_set *xset,
++int pselect(int nfds, fd_set *rset, fd_set *wset, fd_set *xset,
+     const struct timespec *ts, const sigset_t *sigmask);
+ #endif /* !HAVE_ISSETUGID */
+ 
+diff --git a/libscompat/pselect.c b/libscompat/pselect.c
+index 27d9268..2c4695e 100644
+--- a/libscompat/pselect.c
++++ b/libscompat/pselect.c
+@@ -57,7 +57,7 @@ int sockd_handledsignals(void); /* no sockd.h here. */
+ 
+ /* inspired by Stevens 'incorrect' implementation; best effort if no pselect */
+ 
+-inline int
++int
+ pselect(int nfds, fd_set *rset, fd_set *wset, fd_set *xset,
+     const struct timespec *ts, const sigset_t *sigmask)
+ {
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
