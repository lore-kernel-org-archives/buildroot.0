Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A7AC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD47A40E19;
	Thu, 28 Aug 2025 13:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcColHPMKxuY; Thu, 28 Aug 2025 13:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E165E40E09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E165E40E09;
	Thu, 28 Aug 2025 13:05:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E187617D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8B3260D78
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KvN2T6scZLo for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5A236070F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A236070F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5A236070F
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D12C71A0E38
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A096960303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8FDC1C22C45A; 
 Thu, 28 Aug 2025 15:05:22 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 15:05:09 +0200
Message-ID: <20250828130513.146485-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756386323; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=tewswkT3rO59AgUYS+TZpanP+i5bow7Jnrip9xFWFUQ=;
 b=XNO4ZspC5pVCox6ldHOu1pvJpuwufeXiZc7F8Y1u08JH1HZaj2VsUsDIk9HNCJnHCNTViD
 vdmrGGBCL/uQhpiQiofkwTyvKJEsrUuaQCMRmD5Nq0eLmCbWMxc3/d19ucytnvWAUQ09aI
 D8w4o56akf0EEOtQg5wVfhB5rybF30vLP5gh8vDTMCkFwR4DddbZ6Is/rlOwshwqp24l6f
 7Qh7zMp7l69PtysHyWmZwd7y8G/586xURANlmuIYL1a62C4ydUNvou3C9HoQUCq9jbrCsg
 MgUhSmhW0+U5dRwu6Uu1wD5uakujdp2zY6Qq6pBQgCylwLMlHxn46SaqG77jZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XNO4ZspC
Subject: [Buildroot] [PATCH v2 1/3] package/libsvgtiny: add patch to fix GCC
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
v1 -> v2: no changes

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
