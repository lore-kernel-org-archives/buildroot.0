Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB9BECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 23:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B86E60ADC;
	Sun, 30 Oct 2022 23:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B86E60ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uunlbXnzp_qZ; Sun, 30 Oct 2022 23:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FA060AB7;
	Sun, 30 Oct 2022 23:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FA060AB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 076D31BF427
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 23:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E34E14031B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 23:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34E14031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tC-DgtstQtdq for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 23:04:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03ABD402B9
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03ABD402B9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 23:04:22 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:04:10 +0000
Message-Id: <20221030230410.982946-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1667171059; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=tZ0rrEP1xH1NoYBjBizQEba147yUJTPotcSjc6v9U/I=;
 b=RBkTXr1SlXyxrqkZXdMLyOz9X3RF7FLteFWo0QAerZ4vpiETSRfRHswXcEGXynFhpEp7sD
 c1+N9w2smwDetDyNdhYGKKTrNWnQAKs5+EGRPv4be85t/Jz3cri1l7NsBKYWrg1esYnO4Y
 4ds7uztdw9weaybOX/DT5qjWH3092a0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=RBkTXr1S
Subject: [Buildroot] [PATCH 1/1] package/glmark2: add patch to fix GCC 12
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch cherry-picked from upstream to fix the build with GCC 12.

Upstream commit is d1ca3f53c96dc8a4048b17dc16147a8fac782d4a.
I don't know if it fixes any autobuilder errors, I noticed the bug when
building locally.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 ...ibmatrix-Add-missing-utility-include.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/glmark2/0002-libmatrix-Add-missing-utility-include.patch

diff --git a/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
new file mode 100644
index 0000000000..2a658393ae
--- /dev/null
+++ b/package/glmark2/0002-libmatrix-Add-missing-utility-include.patch
@@ -0,0 +1,29 @@
+From d1ca3f53c96dc8a4048b17dc16147a8fac782d4a Mon Sep 17 00:00:00 2001
+From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
+Date: Mon, 14 Feb 2022 13:54:09 +0200
+Subject: [PATCH] libmatrix: Add missing <utility> include
+
+Fixes compilation with GCC 12.
+
+Fixes #169
+---
+ Upstream commit: d1ca3f53c96dc8a4048b17dc16147a8fac782d4a
+
+ src/libmatrix/program.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libmatrix/program.h b/src/libmatrix/program.h
+index f95b470..1c9de08 100644
+--- a/src/libmatrix/program.h
++++ b/src/libmatrix/program.h
+@@ -15,6 +15,7 @@
+ #include <string>
+ #include <vector>
+ #include <map>
++#include <utility>
+ #include "mat.h"
+ 
+ // Simple shader container.  Abstracts all of the OpenGL bits, but leaves
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
