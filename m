Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23519E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 22:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCADC80B15;
	Wed,  1 Jan 2025 22:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2_Ad_PL6NVM; Wed,  1 Jan 2025 22:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90BE80B2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90BE80B2F;
	Wed,  1 Jan 2025 22:37:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 423B4F24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 312F880B9A
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPxG-brmDmUt for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 22:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 113AD80B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 113AD80B15
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 113AD80B15
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:37:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8F6B11BF205;
 Wed,  1 Jan 2025 22:37:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  1 Jan 2025 23:37:25 +0100
Message-ID: <20250101223727.2348482-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
References: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735771049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqczAJfOZVpzkToDDdZp+9Q7VT9wyy58UAsqTZDhdds=;
 b=eozO8UNwg/cUP/w+d0OtryYr3anQy00ln5p4ywdzmck2EHTTctYTmJSa5Ehk+5eFLzMPdO
 NcLLPN00BG3h577mG+XA2EAr0IjO4w9gidXe9l2JiXdy6ARuBDIFGKU90VYNLNEgBPdRfy
 pWSRbYBXYs6EOHMfxyIyZxvRwQ6AB4x90YOWIkIZCqAhnYJGw8RrUp4gMCA2Qcj0PzjG4p
 54qLZ5ENqI7z4j/gfHsgObAwlbp23n0veAL4aXI7ZwNq/AnHsw7LR8BV4UT6Si7PpUDZg0
 zeRmvLGuP96llnenktS9LnuTkV/nq7EXO2HWn+CiUwf/p1LEDdpB6t2S4hc4Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eozO8UNw
Subject: [Buildroot] [PATCH 2/2] package/c-icap: backport patch fixing
 missing <stdio.h> include
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

This commit backports an upstream patch that fixes a missing <stdio.h>
include, causing build failures with toolchains based on GCC 14.x.

Fixes:

  http://autobuild.buildroot.net/results/a99a9999fd417aa5edcd6302e674a72a99d89675466/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ing-about-missing-stdio.h-include-fi.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch

diff --git a/package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch b/package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch
new file mode 100644
index 0000000000..986ed43355
--- /dev/null
+++ b/package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch
@@ -0,0 +1,25 @@
+From ae8a1bc4979c797bb1f152fc92cfe6bc05a44594 Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Tue, 20 Nov 2018 17:10:16 +0200
+Subject: [PATCH] Fix compile warning about missing stdio.h include file
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/c-icap/c-icap-server/commit/ae8a1bc4979c797bb1f152fc92cfe6bc05a44594
+---
+ tests/test_base64.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_base64.c b/tests/test_base64.c
+index 8a4a76c..7692197 100644
+--- a/tests/test_base64.c
++++ b/tests/test_base64.c
+@@ -1,5 +1,6 @@
+ #include "common.h"
+ #include "simple_api.h"
++#include <stdio.h>
+ 
+ 
+ int main(int argc, char *argv[])
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
