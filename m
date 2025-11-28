Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BEFD116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C77A44190F;
	Fri, 28 Nov 2025 17:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvQkbr2NBG0N; Fri, 28 Nov 2025 17:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D75FA4190C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75FA4190C;
	Fri, 28 Nov 2025 17:40:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0D01A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C41A781344
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSNC7Q1Gx1UC for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C848132E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C848132E
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:40:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0261F8600F; Fri, 28 Nov 2025 17:40:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 18:36:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 743bc22135cc47e91f7bbfcdea4aa74a66c5e034
X-Git-Newrev: be8dd9d0d26fa287768c82dbff6241b0c7e1e7c7
X-Patchwork-Hint: ignore
Message-Id: <20251128174013.0261F8600F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ledmon: fix musl build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be8dd9d0d26fa287768c82dbff6241b0c7e1e7c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/942/942cb2dcd061b8620211b63d4be34dc414251b62/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Include-libgen.h-to-fix-musl-builds.patch | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
