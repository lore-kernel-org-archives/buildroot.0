Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50702C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 10:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCAF981221;
	Sun,  8 Jun 2025 10:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c01vuk_rxVef; Sun,  8 Jun 2025 10:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D558120C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D558120C;
	Sun,  8 Jun 2025 10:14:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F56EC8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8153A60D74
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WWRUxfbJAFU for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 10:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D3E860D66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D3E860D66
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D3E860D66
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:14:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso149056f8f.1
 for <buildroot@buildroot.org>; Sun, 08 Jun 2025 03:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749377679; x=1749982479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ynklGk4uX+N1VSuO3GOTx1X9nZACJIUYcvAy2xb9rQ=;
 b=pwQGn7RKefEpGs+7UvyW6WLjc5E3fJ4Ua6kxL2p+Y66FDPRL0l61MzfCpt7TDxNAC6
 Zw4MKBYXBZQwbokIF6VvLgflwws9chpAHjfz/X7Wyq8kk1pmdIDEp+NyTkzV65VjbNh1
 cMndW9zA3dwr8HmLcYr4mZZmOsBwKo0MN/Cc82F14GjVcMPdwc3C9dK0YjS7M4ERs09/
 Pug8q28Vfn9HAKEsgm42Kcisse0jao+3ncTxPtawfyTrJ+zT1X2u7aEUdR04/D4O1Yk/
 CXASoFvJfkfR8Dz0M2lEQ1PE2J8M2UnrRWHbtIipZH/F56GA8uyiYLGd45w1yecMFtJV
 ir3A==
X-Gm-Message-State: AOJu0YzE3BXAPJQneEcDb2sxV+WoMZOTmoSynA/MsAhzEmXP75f6MfR6
 dgakiBMF19LB1B2auBTC8nmQd0kuZSiqA1gnS+3Dc0Ujxv7TL/gA+mvluGwJ4QF1IcjPHe8LjKg
 rXG6E
X-Gm-Gg: ASbGncvidGu+AKYEXd5DjgEU+qN/sdvh0tJSEU4+FvLUJJeyQ6NbN+AykbtkcnYIILq
 KO7Bf7H6yuDs2XCvDctD95xmA3gsSj1bikcRsf0qoL2F9uVtgKtjgwWaQhfV56caA9uR6BGLgx5
 yXERtXCyhVZWErbgrAwWDL3TbijFmCRnuiDqeulttPjOqmtb7kMh2e8XzQecRz9FHcI4MAiu9bE
 uyXg5uF7e3JUShQfvb1xHg078fadpCsErTn99K1160LobbVFj6UlNN+PdIWQRMDH7oOQ6gdD7a4
 ghu2mKrzY7eRtH0MAnJ5mOG+gCKfLwRSnRmBUtjbeZ764z9zA30fNE8PbZhXxLc3l03hn9H5zrg
 U
X-Google-Smtp-Source: AGHT+IHAWoJojQDwUY0o4uzmDoHhD1pse3S0uatVII8VkjIaYqEkq1OcEhLiBFJu0jhhFb0yeYbAyg==
X-Received: by 2002:a05:6000:178f:b0:3a4:f939:b53 with SMTP id
 ffacd0b85a97d-3a531cea4bfmr7788448f8f.38.1749377678759; 
 Sun, 08 Jun 2025 03:14:38 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e155500sm77248065e9.9.2025.06.08.03.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 03:14:38 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Sun,  8 Jun 2025 12:14:22 +0200
Message-ID: <20250608101422.883807-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749377679; x=1749982479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ynklGk4uX+N1VSuO3GOTx1X9nZACJIUYcvAy2xb9rQ=;
 b=EIJctVSnv9LbXbU/+jYwlpz44jBKfbohiuZm1MGeZkiiaK6EthljQA1ZykTc0NJna+
 W6VV0ojCB6EqcfomtzdkpJgjVJRO5M7P3lUtI57uwbf2RVjO610lYOgK8kWgLg+nyYNo
 CxvC+G1gRuI+yS+saiUfB6/wOuHgu1723vaXaaf8V1gQGf0vQ3OqeL90Jjz3kx+8Tgay
 bO8A9Pz8afcOHCLatlDtw7w/UE8WDQGR4wKcEgmqGx8tvxgmGU7bfbsMXurCULo8UxN9
 csA66ljKnDtgXhnLni29G79Dgj7HQShlNrFX17MsbSfrnW0JFmKBPN6ZXaPlfwG6EL8b
 ghpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EIJctVSn
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: fix build with host
 GCC 15
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

Fix the following autobuild error on configs with host GCC15.

```
/workdir/instance-0/output-1/host/bin/ccache /usr/bin/gcc   -O2 -DNDEBUG -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations -Wmissing-prototypes -Wwrite-strings -fno-strict-aliasing -Werror=declaration-after-statement -fno-builtin -fno-common -Werror=return-type -Wno-unused-local-typedefs -DHAVE_STDINT_H=1 -DHAVE_DIRENT_H=1 -DHAVE_SYS_DIR_H=1 -DHAVE_SYS_TIME_H=1 -DHAVE_SYS_TIMES_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_LIBDL=1 -DGX_COLOR_INDEX_TYPE="unsigned long long" -D__USE_UNIX98=1 -DHAVE_SNPRINTF  -O2 -I/workdir/instance-0/output-1/host/include -L/workdir/instance-0/output-1/host/lib -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DNOCONTRIB -DHAVE_RESTRICT=1 -DHAVE_LIMITS_H=1 -DHAVE_STRING_H=1 -fno-strict-aliasing -O2 -I/workdir/instance-0/output-1/host/include -L/workdir/instance-0/output-1/host/lib -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DHAVE_POPEN_PROTO=1  -I./base -o ./obj/aux/genconf ./base/genconf.c   -lz
In file included from ./base/genconf.c:18:
./base/stdpre.h:348:13: error: 'bool' cannot be defined via 'typedef'
  348 | typedef int bool;
      |             ^~~~
./base/stdpre.h:348:13: note: 'bool' is a keyword with '-std=c23' onwards
./base/stdpre.h:348:1: warning: useless type name in empty declaration
  348 | typedef int bool;
      | ^~~~~~~
```

This is due to the change in the default C language version in GCC15.

The patch included is not exactly the same as the upstream one, it only
picks the part that fix the `bool` definition and dropped the declaration
type changes.

Fixes: https://autobuild.buildroot.org/results/9c6/9c6cbff256635c6ab4be4c5b7bf18f9d3c4b46681

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Fix-compatibility-with-C23-compilers.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch

diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
new file mode 100644
index 0000000000..0dfca9cfa2
--- /dev/null
+++ b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
@@ -0,0 +1,36 @@
+From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
+From: Alex Cherepanov <alex@coscript.biz>
+Date: Thu, 3 Apr 2025 17:19:41 +0100
+Subject: Bug 708160: Fix compatibility with C23 compilers
+
+Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
+[thomas: Only backport the bool typedef condition]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ base/stdpre.h              |  6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/base/stdpre.h b/base/stdpre.h
+index dda30b6a4..2f9c84e0d 100644
+--- a/base/stdpre.h
++++ b/base/stdpre.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+
+    This software is provided AS-IS with no warranty, either express or
+@@ -341,7 +341,9 @@ typedef signed char schar;
+  * and the MetroWerks C++ compiler insists that bool be equivalent to
+  * unsigned char.
+  */
+-#ifndef __cplusplus
++
++/* C23 has bool as a builtin type. */
++#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
+ #ifdef __BEOS__
+ typedef unsigned char bool;
+ #else
+--
+cgit v1.2.3
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
