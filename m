Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02547C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 13:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2906100B;
	Sun,  3 Aug 2025 13:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvUogcTYXDNW; Sun,  3 Aug 2025 13:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D74E61014
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D74E61014;
	Sun,  3 Aug 2025 13:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E636C233
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 13:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1348407A9
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 13:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVUE1HAMPKYF for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 13:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FDAB40167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDAB40167
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FDAB40167
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 13:34:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45994a72356so4337215e9.0
 for <buildroot@buildroot.org>; Sun, 03 Aug 2025 06:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754228042; x=1754832842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95CtcaTso/ws4p4QNpEsWn2l4pcpiObgXlLZDny+xDU=;
 b=ofvpvCsaCbIgT5PNXR7G9RqbBzb8hxHQoqabngZtoEIMOQGqR+hoA83eOEiA5xJHr1
 CarBZPEnkMSECuQ6YQZRIOYHckTM34fBuN0iOQM4HgIX7knrITvtXS9f8Ut3JxO/TRck
 XN6D4RszeoXl5x5Q9QM9KZOFcE9vyCvs9I+Va88qsYuN+XSbZbVQdeVhZ4AoNYN+A4J/
 TuVkIbPzC16HT0kg79+HrLTPiXm+FYTlzo7yu71J2FJNZKQQ2PWaM/n/KsSZzy+iued2
 MuqBtfsK9c7QMDgJR2fio1MxS2gA3kLfom+Kvvd33+409yTfGjDFPlryF6tLWyFf2oO2
 shOw==
X-Gm-Message-State: AOJu0YyLfIYEFsftiqSVUpzbvkeULgpyqfmS6IFIq6TDZnFupFfVHjTg
 4Ys0W1cER2Z8KfTd/nxRAphgx0+Q70iNPtguHevJSpgwqFdKuXpRgAx2116WSnIfMKq7fYa1XtR
 UwV1b
X-Gm-Gg: ASbGncsHH/rI8ntJUu866OfQHcOGAHr4ji08VqAFttUggI+Ls4rWqXsf8aUVuh3IaQV
 Chys0mPPmDNUCcefUNtxYCyZD6WLjT6aByMMXbx1GOTW/562shHtPNumQRn5qDaVoG6ixsXQt3D
 t0f6GsAchHxaxoFGxtC4C5A+8E+GZ6BsIV0bxWasYBZ3sFwJ8rJy1awRz1KbuoG+ucFeFk4uY1+
 jQnn6ocbsRdoZOUZ+LSC0C93zIhiHnrNFrEH+WSSxFoSDQ9/FK4JurQ0ECjE0ahzBqpTpeLzIec
 cj9Pna0+ZCN7gfU6WedzdIpdg77vVYWVrhWk0gDfI9SGgHIXl8ic0qD0oOcdM7b5lfa5Lck9EhQ
 hX2mxlQIAftvjfrUJAyRpyOha
X-Google-Smtp-Source: AGHT+IHDiR1AdMaBWPmYQIWhZsYm3yvTPsEG4kQFOdrqPEltcxerj+EZRTFLOB8A+ry4z1e3/o3d3Q==
X-Received: by 2002:a05:600c:c16f:b0:456:1122:8342 with SMTP id
 5b1f17b1804b1-458a2004610mr118654985e9.5.1754228041800; 
 Sun, 03 Aug 2025 06:34:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4a6635asm71251345e9.29.2025.08.03.06.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 06:34:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Sun,  3 Aug 2025 15:34:00 +0200
Message-ID: <20250803133400.2759380-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754228042; x=1754832842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=95CtcaTso/ws4p4QNpEsWn2l4pcpiObgXlLZDny+xDU=;
 b=JIywswDMYGZn1Lm4HzxlEF/7eSyMjzKdKXNE4zZLiL5DM9QGFxxboQoOLK1ZVETfyt
 WRdejxEpdjMOvVcphSj3QaaF9ecMNU2PYsDWu8gguVEdeLRtV5Bn10Y5VBK4T3rqTUXV
 fzAU+d9dU/w6x2TN8QjPyQyBxiK2rCghrGmclVBx7uwq2mkrjDM0RHGingJokseEWqd0
 fhwrSEOJ2s0YQb8RZm6JY1wRnQmYvE+a0bOVJQopeVC/7qus5ry1kk3N6941mDk6s5pL
 Ib/j7+2s64cZ6DnKjLKcJZIRTxbauVY3O2AFmoQfLurJUVZ6gK395BWodDaiMdO6HYkR
 desg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JIywswDM
Subject: [Buildroot] [PATCH] package/snooze: fix build w/ uclibc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following error occur on the autobuilder for static build using
buildroot toolchain and uclibc:

```
/usr/bin/make -j17 -C /home/buildroot/instance-0/output-1/build/snooze-0.5/ PREFIX=/usr CC=/home/buildroot/instance-0/output-1/host/bin/arc-buildroot-linux-uclibc-gcc CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -static"
make[1]: Entering directory '/home/buildroot/instance-0/output-1/build/snooze-0.5'
/home/buildroot/instance-0/output-1/host/bin/arc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -static    snooze.c   -o snooze
snooze.c:22:10: fatal error: sys/auxv.h: No such file or directory
   22 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~
compilation terminated.
make[1]: *** [<builtin>: snooze] Error 1
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_STATIC_LIBS=y
BR2_PACKAGE_SNOOZE=y
EOF
make olddefconfig
make snooze
```

The error doesn't occur on external toolchains.

The `#include <sys/auxv.h>` was orinally included in the initial commit
(see [1]) to use the `getauxval` function declaration. This function
usage has since been removed in commit [2].

This patch removes the include that is no longer needed.

[1] https://github.com/leahneukirchen/snooze/commit/56480881978a4cb5813746232de9950d46cb3369
[2] https://github.com/leahneukirchen/snooze/commit/610e6b35ec614764770d47b5974b30fd90dce6fe

Fixes: https://autobuild.buildroot.org/results/aec/aec463f87094a47ee059113f08e8ee3604dcea9b
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Hi,

Not sure why the error only happens on the specific combination of
buildroot toolchain and static build. The `__linux__` definition is
present on other toolchain as well so it should fail in other
scenario.

Regards,
Thomas
---
 .../0002-snooze-remove-unused-include.patch   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/snooze/0002-snooze-remove-unused-include.patch

diff --git a/package/snooze/0002-snooze-remove-unused-include.patch b/package/snooze/0002-snooze-remove-unused-include.patch
new file mode 100644
index 0000000000..fba92cd6b5
--- /dev/null
+++ b/package/snooze/0002-snooze-remove-unused-include.patch
@@ -0,0 +1,36 @@
+From 2eebd33c10d5a0f1a9831e3e49215857ab41ec03 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <perale.thomas@gmail.com>
+Date: Sat, 2 Aug 2025 23:09:31 +0200
+Subject: [PATCH] snooze: remove unused include
+
+The `#include <sys/auxv.h>` was orinally included in the initial commit
+(see [1]) to use the `getauxval` function declaration.
+
+This function usage has since been removed in commit [2].
+
+This commit removes the include that is no longer needed.
+
+[1] https://github.com/leahneukirchen/snooze/commit/56480881978a4cb5813746232de9950d46cb3369
+[2] https://github.com/leahneukirchen/snooze/commit/610e6b35ec614764770d47b5974b30fd90dce6fe
+
+Upstream: https://github.com/leahneukirchen/snooze/pull/24
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ snooze.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/snooze.c b/snooze.c
+index e47ad11..11925ca 100644
+--- a/snooze.c
++++ b/snooze.c
+@@ -18,10 +18,6 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
+-#ifdef __linux__
+-#include <sys/auxv.h>
+-#endif
+-
+ static long slack = 60;
+ #define SLEEP_PHASE 300
+ static int nflag, vflag;
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
