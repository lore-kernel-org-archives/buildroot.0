Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C15BCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 11:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 108F2827D8;
	Thu, 28 Aug 2025 11:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-YUbQRcJj14; Thu, 28 Aug 2025 11:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C29827DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C29827DE;
	Thu, 28 Aug 2025 11:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFE81B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E0B827D8
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9p1Zt3pQuhLP for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 11:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19222827B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19222827B5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19222827B5
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D4C00C6B397
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:21:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21BD560303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 519671C22D2C9; 
 Thu, 28 Aug 2025 13:22:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 13:22:00 +0200
Message-ID: <20250828112203.136135-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756380130; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=6pablIFsrDWbWcDx+Z2GgHNfGDSov3rCWWlJUIURArw=;
 b=w7dYXCRmKxotZ3GcwGAGhG0i/NGhBcS+HGx9l3bnbHB9fJlzDoK9I6ipf7dfND5eTCzY5J
 To4tIyrk5MAPf4RzidU3w84skC428Vw+/4Q05LyJLrb9HOXoXRhT5PJuxU6nGkRpA1n7fJ
 cFC7EU8XVN38WNvbX4iOtT7uFxn6WafotJp44NXl5m7wiY3WWCXIamfaJENh8R1dAdhHkg
 /M4VvVAil2mwgF98CoxN3l/Eo3HzxjYeHf0WXu3k4B5nbps4yeJ2Qc7S/00SfBaCpKN+aa
 dQ8N4wHY5q1gUIYksSC3xXSs1bG3t5qSpNyUdVeXewaPA0mWWV5Pg9plVyDTRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=w7dYXCRm
Subject: [Buildroot] [PATCH 1/3] package/libsvgtiny: add patch to fix GCC
 15.x build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a small, easily backportable patch to fix GCC 15.x build
issue. The issue is also fixed upstream in later releases, but this
patch is a minimal fix that can be backported to LTS independently
from a version bump.

Fixes:

  https://autobuild.buildroot.org/results/c3d703663faabe40448d908afbdbb351a016aece/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ient-svgtiny_list-.c-add-missing-std.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch

diff --git a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
new file mode 100644
index 0000000000..17e63ba541
--- /dev/null
+++ b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
@@ -0,0 +1,42 @@
+From 1d86ce7e6ea9fae8285eed23d838f87ab3ac083c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 19 Aug 2025 23:28:35 +0200
+Subject: [PATCH] src/{svgtiny_gradient,svgtiny_list}.c: add missing <stdlib.h>
+
+Needed to get the prototype for malloc()/free().
+
+Upstream: N/A, already fixed upstream in a later release (but as part
+of a larger commit)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/svgtiny_gradient.c | 1 +
+ src/svgtiny_list.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/svgtiny_gradient.c b/src/svgtiny_gradient.c
+index 3a8db73..5172223 100644
+--- a/src/svgtiny_gradient.c
++++ b/src/svgtiny_gradient.c
+@@ -8,6 +8,7 @@
+ #include <assert.h>
+ #include <math.h>
+ #include <string.h>
++#include <stdlib.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+diff --git a/src/svgtiny_list.c b/src/svgtiny_list.c
+index 53cfb34..91e2c98 100644
+--- a/src/svgtiny_list.c
++++ b/src/svgtiny_list.c
+@@ -11,6 +11,7 @@
+  */
+ 
+ #include <assert.h>
++#include <stdlib.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
