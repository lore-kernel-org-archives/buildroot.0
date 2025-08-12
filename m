Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB1ECA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA1F41D82;
	Tue, 12 Aug 2025 21:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_QiT7_nO7Dz; Tue, 12 Aug 2025 21:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCFE040C08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCFE040C08;
	Tue, 12 Aug 2025 21:58:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 412AF938
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B9B540A94
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5WFKtNeFxfl for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:58:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39525409F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39525409F3
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39525409F3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:58:26 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 90724E001D9;
 Tue, 12 Aug 2025 23:58:23 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
	Florian Larysch <fl@n621.de>
Date: Tue, 12 Aug 2025 23:57:37 +0200
Message-ID: <20250812215815.7252-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755035903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+tqK2r/c33auHhfqYM/gxkgI9s0SBk8/73fYZhilPEM=;
 b=SspYwVcVRJBWCXH4F+kilfPmrS0c2iDIzQ47IKyRtc2+g21JqYzgweSfep2z6c5dcEb99p
 XxQL4T3UyPlyXoQNMt1zWVs2Mqt1JSjzGR8CqSVlRP7VTrQCgKKATkVW3WytOZtRE0cHgA
 kgPnLABRp/HE+sFqljebiDbaxhtT9lo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=SspYwVcV
Subject: [Buildroot] [PATCH 1/1] package/tinyssh: fix build issues with GCC
 14
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

tinyssh 20240101 fails to build on GCC 14 because of a missing include
for a forward declaration. Import the upstream patch that fixes it.

Fixes: https://autobuild.buildroot.org/results/e45/e4563317371c90669f6417ee3d1c48a41cb59cb2/
Signed-off-by: Florian Larysch <fl@n621.de>
---
There have been a number of newer releases since 20240101 that also
include this fix, but there also have been some build system changes as
well as a license change. For this reason and for porting this to stable
it makes sense to fix this issue separately first.

 ...issing-bug.h-include-for-global_die-.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch

diff --git a/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch b/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
new file mode 100644
index 0000000000..99649d4690
--- /dev/null
+++ b/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
@@ -0,0 +1,33 @@
+From f863e60d93006019855a0431ea5cd71c8f1fc173 Mon Sep 17 00:00:00 2001
+From: Haelwenn Monnier <contact+github.com@hacktivis.me>
+Date: Tue, 9 Jan 2024 20:15:29 +0100
+Subject: [PATCH] packet_put: Add missing bug.h include for global_die (#84)
+
+```
+packet_put.c:53:9: error: call to undeclared function 'global_die'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+        global_die(111);
+        ^
+1 error generated.
+```
+
+Upstream: https://github.com/janmojzis/tinyssh/commit/f863e60d93006019855a0431ea5cd71c8f1fc173
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ tinyssh/packet_put.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tinyssh/packet_put.c b/tinyssh/packet_put.c
+index 17e8d84..7f46ff6 100644
+--- a/tinyssh/packet_put.c
++++ b/tinyssh/packet_put.c
+@@ -6,6 +6,7 @@ Public domain.
+ 
+ #include "uint32_pack_big.h"
+ #include "buf.h"
++#include "bug.h"
+ #include "sshcrypto.h"
+ #include "ssh.h"
+ #include "log.h"
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
