Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F594CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 19:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2595F80817;
	Tue, 21 Oct 2025 19:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kSDP9-CnWL2; Tue, 21 Oct 2025 19:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193EF8082B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193EF8082B;
	Tue, 21 Oct 2025 19:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CDF643F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72DC940565
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHvpJ70LQwJA for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 19:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B76DC40559
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76DC40559
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76DC40559
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:43:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1221CA4C3734
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 21:43:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36354)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vBIGs-000000006TO-0Oru
 for buildroot@buildroot.org; Tue, 21 Oct 2025 19:43:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 21:43:49 +0200
Message-ID: <20251021194349.56130-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761075830;
 bh=QtIcp+G+boqxehsd8T0QYa7duTCxm1ECAldnExAo/hk=;
 h=From:To:Subject:Date:From;
 b=tqYnmgJH968qGFmD2+jo76yNOcwKo+qQDN8q0oyUqKJfIkH/jXplGbM0LGMwjcgx6
 NVuYBCfMW8gZeEXFa8SlAlM2Ueawc2O1rYxZ5mkRUcHf6BESW8KDzRDuturL4bOg+W
 xhgnfboX2lQGHgunGDYvmRRXnqmfHMAMfquhzADwE8/s0QxCK4sQaPOMw+S+NIka6F
 2D/1t9/CSe9mxT0GMRmjrTN6Fc65s4w15LJpYo2ZsT08pCRyyJ9MvASB3R7q7Nx5XM
 jxmOW57G+Y92QcsjMQVQe8yrX2CX0SqlwnkdQB3YAbrDEo6t1dQmWKK+ZL+zKeLehW
 5tOhZwsf7YuJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=tqYnmgJH
Subject: [Buildroot] [PATCH 1/1] package/libshout: fix build with gcc >= 14.x
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
https://autobuild.buildroot.net/results/c53/c53b7b613269acddd3467865c11784f59062a943/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-icy-include-stdlib.h-and-stdio.h.patch | 31 +++++++++++++++++++
 .../0002-legacy-include-stdlib.h.patch        | 30 ++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
 create mode 100644 package/libshout/0002-legacy-include-stdlib.h.patch

diff --git a/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
new file mode 100644
index 0000000000..cf3f02bae9
--- /dev/null
+++ b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
@@ -0,0 +1,31 @@
+From 3ea67b511bdf4f12b3d5de4d7e133badf8c18d54 Mon Sep 17 00:00:00 2001
+From: Alexandre Janniaux <ajanni@videolabs.io>
+Date: Wed, 14 Sep 2022 16:29:22 +0200
+Subject: [PATCH] icy: include stdlib.h and stdio.h
+
+malloc, free, and snprintf had no valid previous declaration, making the
+build fail with clang.
+
+Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/icy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/icy.c b/src/icy.c
+index 8e83552..4de3c14 100644
+--- a/src/icy.c
++++ b/src/icy.c
+@@ -24,6 +24,8 @@
+ #endif
+ 
+ #include <stdbool.h>
++#include <stdlib.h> /* for free() and malloc() */
++#include <stdio.h> /* for snprintf() */
+ #include <string.h>
+ 
+ #include <shout/shout.h>
+-- 
+2.47.3
+
diff --git a/package/libshout/0002-legacy-include-stdlib.h.patch b/package/libshout/0002-legacy-include-stdlib.h.patch
new file mode 100644
index 0000000000..863d8095c8
--- /dev/null
+++ b/package/libshout/0002-legacy-include-stdlib.h.patch
@@ -0,0 +1,30 @@
+From 1742df325b52eef5af32c40893d821f895dc9d88 Mon Sep 17 00:00:00 2001
+From: Alexandre Janniaux <ajanni@videolabs.io>
+Date: Wed, 14 Sep 2022 16:30:03 +0200
+Subject: [PATCH] legacy: include stdlib.h
+
+free() had no previous declaration, making the build fail with clang.
+
+Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/legacy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/legacy.c b/src/legacy.c
+index 3e1d3d7..e0ed961 100644
+--- a/src/legacy.c
++++ b/src/legacy.c
+@@ -28,6 +28,8 @@
+ #include "shout_private.h"
+ #include "util.h"
+ 
++#include <stdlib.h> /* for free() */
++
+ int shout_set_format(shout_t *self, unsigned int format)
+ {
+     if (!self)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
