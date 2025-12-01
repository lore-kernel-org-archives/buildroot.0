Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E871D116F1
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 18:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2660610EF;
	Mon,  1 Dec 2025 18:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2jnToQgZXsL; Mon,  1 Dec 2025 18:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A9B6101E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A9B6101E;
	Mon,  1 Dec 2025 18:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 726881A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 18:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F86B6101E
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 18:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmAxxbFKYxAb for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 18:31:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45C0861007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C0861007
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45C0861007
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 18:31:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DCFDFA4C78B0;
 Mon,  1 Dec 2025 19:31:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44680)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQ8gY-000000004Uv-0Ovl;
 Mon, 01 Dec 2025 18:31:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>
Date: Mon,  1 Dec 2025 19:31:42 +0100
Message-ID: <20251201183142.2493628-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764613902;
 bh=X8avHpqk9cjsowSnUug/uRHNrBvp1SZGoHuwVhvi9L0=;
 h=From:To:Cc:Subject:Date:From;
 b=HA1R5n6VaKwn4FVCkn5/3sR/zn2e2zBhDJj4PXq/6h4PSprizBY14VrROuy956FX+
 obA/wPOw1GgXk8iVyH1698Datxz3OBCYMdgGizx4XgX1AwlpfX7DR8d2neF7wcCnIN
 sDh3G2e7qGFG0rP70KWidazxmLKAhFChjveIFehONzBs+To7FvK1+XykgTja5zw5yw
 LteAP0srhAaTsonN27VRpgtSYRw5+ywQRe6U3PA04/LjeBGBENdVzd+3d1GO9CX9qv
 SzlUDGKEOA3j1r3FMohGVUdEBTek8sOt7pNVL/xuH5EmTs2kSFIrk8LEALqxUCdPfS
 1JAr9ayHnz7Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HA1R5n6V
Subject: [Buildroot] [PATCH 1/1] package/ledmon: update patch to fix musl
 build
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

Updated patch following an upstream review:
https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Build-tested using this defconfig

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_LEDMON=y

35 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 ...-Include-libgen.h-to-fix-musl-builds.patch | 100 ------------------
 ...e-basename-if-GLIBC-is-not-avialable.patch |  42 ++++++++
 2 files changed, 42 insertions(+), 100 deletions(-)
 delete mode 100644 package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
 create mode 100644 package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch

diff --git a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch b/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
deleted file mode 100644
index 713aaee020..0000000000
--- a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 95adecd3cc8e94f9964c34fdf0354c209acce166 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Thu, 27 Nov 2025 21:17:22 +0100
-Subject: [PATCH] Include libgen.h to fix musl builds
-
-Fixes various build errors like
-
-block.c: In function 'block_set_devnode':
-block.c:226:22: error: implicit declaration of function 'basename'
- [-Wimplicit-function-declaration]
-  226 |         char *name = basename(device->sysfs_path);
-
-Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: backported upstream PR to v1.1.0]
----
- src/ledctl/ledctl.c | 1 +
- src/ledmon/ledmon.c | 1 +
- src/lib/block.c     | 1 +
- src/lib/npem.c      | 1 +
- src/lib/slot.c      | 1 +
- src/lib/vmdssd.c    | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
-index 30adc74..af2ea1b 100644
---- a/src/ledctl/ledctl.c
-+++ b/src/ledctl/ledctl.c
-@@ -5,6 +5,7 @@
- #include <ctype.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <linux/limits.h>
- #include <inttypes.h>
- #include <limits.h>
-diff --git a/src/ledmon/ledmon.c b/src/ledmon/ledmon.c
-index 37ef69a..4644492 100644
---- a/src/ledmon/ledmon.c
-+++ b/src/ledmon/ledmon.c
-@@ -5,6 +5,7 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <limits.h>
- #include <signal.h>
- #include <stdint.h>
-diff --git a/src/lib/block.c b/src/lib/block.c
-index 23dc34f..afa7d57 100644
---- a/src/lib/block.c
-+++ b/src/lib/block.c
-@@ -3,6 +3,7 @@
- 
- #include <dirent.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <limits.h>
- #include <stdint.h>
- #include <stdio.h>
-diff --git a/src/lib/npem.c b/src/lib/npem.c
-index bdceee3..f980ba8 100644
---- a/src/lib/npem.c
-+++ b/src/lib/npem.c
-@@ -2,6 +2,7 @@
- // Copyright (C) 2022 Intel Corporation.
- 
- #include <errno.h>
-+#include <libgen.h>
- #include <stdio.h>
- #include <string.h>
- #include <pci/pci.h>
-diff --git a/src/lib/slot.c b/src/lib/slot.c
-index 1044ddf..68e3009 100644
---- a/src/lib/slot.c
-+++ b/src/lib/slot.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: LGPL-2.1-or-later
- // Copyright (C) 2023 Intel Corporation.
- 
-+#include <libgen.h>
- #include <stdio.h>
- #include <string.h>
- 
-diff --git a/src/lib/vmdssd.c b/src/lib/vmdssd.c
-index 8a6e846..0270a7d 100644
---- a/src/lib/vmdssd.c
-+++ b/src/lib/vmdssd.c
-@@ -2,6 +2,7 @@
- // Copyright (C) 2022 Intel Corporation.
- 
- #include <errno.h>
-+#include <libgen.h>
- #include <limits.h>
- #include <stdlib.h>
- #include <stdint.h>
--- 
-2.47.3
-
diff --git a/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
new file mode 100644
index 0000000000..a205f41b6f
--- /dev/null
+++ b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
@@ -0,0 +1,42 @@
+From 4c0477bdaef56314eb4df4a432be54cc49238be0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 1 Dec 2025 19:07:42 +0100
+Subject: [PATCH] libled: provide basename if GLIBC is not avialable
+
+If GNU basename is not avilable, define it. It is safer to use that
+rather than include libgen.h with XPG basename() definition.
+
+Suggested in
+https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739
+
+Code copied from
+https://github.com/md-raid-utilities/mdadm/commit/9dbd11e091f84eb0bf9d717283774816c4c4453d
+
+Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/libled_internal.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/lib/libled_internal.h b/src/lib/libled_internal.h
+index 2355d30..2061fc2 100644
+--- a/src/lib/libled_internal.h
++++ b/src/lib/libled_internal.h
+@@ -70,4 +70,13 @@ led_status_t device_exclude_pattern_add(struct led_ctx *ctx, const char *path);
+  */
+ void lib_log(struct led_ctx *ctx, enum led_log_level_enum loglevel, const char *buf, ...)
+ 				__attribute__ ((format (printf, 3, 4)));
++
++/*
++ * Ensure GNU basename behavior on GLIBC less systems.
++ */
++#ifndef __GLIBC__
++#define basename(path) \
++       (strrchr((path), '/') ? strrchr((path),'/') + 1 : (path))
++#endif
++
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
