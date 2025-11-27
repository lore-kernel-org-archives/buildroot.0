Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE5DCFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A94F40BC9;
	Thu, 27 Nov 2025 20:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZxOG8XsFngy; Thu, 27 Nov 2025 20:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F121F40BB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F121F40BB5;
	Thu, 27 Nov 2025 20:27:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 873F92A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5EE84412
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_FLvpf_6P1d for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A61EA84410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61EA84410
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A61EA84410
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:27:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75F2BA4C7526;
 Thu, 27 Nov 2025 21:27:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38424)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vOiab-000000002Zn-0OE2;
 Thu, 27 Nov 2025 20:27:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>
Date: Thu, 27 Nov 2025 21:27:41 +0100
Message-ID: <20251127202741.2781998-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764275261;
 bh=OO74FhEwGTJGVKRwK5of519/sPBgwhYKKvA+JzfYb/E=;
 h=From:To:Cc:Subject:Date:From;
 b=PI2xlJ073Sily3JPQx4V7F5rAmbQWjwJD4bDjysgw/porKJQMmV+BEamyjk82o/tj
 9joy9UMXvtxcq9o+9+fAIMRHt5Dr8I5SGsbbOZhwCsdlBn3cpyr0mQ85T/YQ6mVb9I
 SkRpBjLttBJ7lkGNA42c+a22O6VoNeIOsKe+y8fq2lu2Z9JzDKX7pVWcGG0LWV0pPj
 jNf1nkB804KnrB7F/FxBejWBJq07cUJ0Xzadh5z5ElJDdhdXHZFZeb3e34l7xZ+UAi
 UtEZqoNwmGdeZrh4Y/AW5+6oNW3PSu424SPqk4kKSECRUrh6koWn9ivCmp8gR5qeAy
 VAtzmMdApjxlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=PI2xlJ07
Subject: [Buildroot] [PATCH 1/1] package/ledmon: fix musl build
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

Fixes:
https://autobuild.buildroot.net/results/942/942cb2dcd061b8620211b63d4be34dc414251b62/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Include-libgen.h-to-fix-musl-builds.patch | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch

diff --git a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch b/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
new file mode 100644
index 0000000000..713aaee020
--- /dev/null
+++ b/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
@@ -0,0 +1,100 @@
+From 95adecd3cc8e94f9964c34fdf0354c209acce166 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 27 Nov 2025 21:17:22 +0100
+Subject: [PATCH] Include libgen.h to fix musl builds
+
+Fixes various build errors like
+
+block.c: In function 'block_set_devnode':
+block.c:226:22: error: implicit declaration of function 'basename'
+ [-Wimplicit-function-declaration]
+  226 |         char *name = basename(device->sysfs_path);
+
+Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported upstream PR to v1.1.0]
+---
+ src/ledctl/ledctl.c | 1 +
+ src/ledmon/ledmon.c | 1 +
+ src/lib/block.c     | 1 +
+ src/lib/npem.c      | 1 +
+ src/lib/slot.c      | 1 +
+ src/lib/vmdssd.c    | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
+index 30adc74..af2ea1b 100644
+--- a/src/ledctl/ledctl.c
++++ b/src/ledctl/ledctl.c
+@@ -5,6 +5,7 @@
+ #include <ctype.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <linux/limits.h>
+ #include <inttypes.h>
+ #include <limits.h>
+diff --git a/src/ledmon/ledmon.c b/src/ledmon/ledmon.c
+index 37ef69a..4644492 100644
+--- a/src/ledmon/ledmon.c
++++ b/src/ledmon/ledmon.c
+@@ -5,6 +5,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <limits.h>
+ #include <signal.h>
+ #include <stdint.h>
+diff --git a/src/lib/block.c b/src/lib/block.c
+index 23dc34f..afa7d57 100644
+--- a/src/lib/block.c
++++ b/src/lib/block.c
+@@ -3,6 +3,7 @@
+ 
+ #include <dirent.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <limits.h>
+ #include <stdint.h>
+ #include <stdio.h>
+diff --git a/src/lib/npem.c b/src/lib/npem.c
+index bdceee3..f980ba8 100644
+--- a/src/lib/npem.c
++++ b/src/lib/npem.c
+@@ -2,6 +2,7 @@
+ // Copyright (C) 2022 Intel Corporation.
+ 
+ #include <errno.h>
++#include <libgen.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <pci/pci.h>
+diff --git a/src/lib/slot.c b/src/lib/slot.c
+index 1044ddf..68e3009 100644
+--- a/src/lib/slot.c
++++ b/src/lib/slot.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: LGPL-2.1-or-later
+ // Copyright (C) 2023 Intel Corporation.
+ 
++#include <libgen.h>
+ #include <stdio.h>
+ #include <string.h>
+ 
+diff --git a/src/lib/vmdssd.c b/src/lib/vmdssd.c
+index 8a6e846..0270a7d 100644
+--- a/src/lib/vmdssd.c
++++ b/src/lib/vmdssd.c
+@@ -2,6 +2,7 @@
+ // Copyright (C) 2022 Intel Corporation.
+ 
+ #include <errno.h>
++#include <libgen.h>
+ #include <limits.h>
+ #include <stdlib.h>
+ #include <stdint.h>
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
