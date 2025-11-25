Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F249ED0E6C6
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FA08117A;
	Tue, 25 Nov 2025 14:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeQXaONEBZTo; Tue, 25 Nov 2025 14:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2CBE8117E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2CBE8117E;
	Tue, 25 Nov 2025 14:50:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B59D335C
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B34A44096E
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz1TULLz34DY for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 14:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89F8340956
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F8340956
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89F8340956
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 14:50:28 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id NuN6vt6nqdarQNuN7vTXJB; Tue, 25 Nov 2025 15:50:25 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 25 Nov 2025 15:50:24 +0100
Message-ID: <20251125145024.602672-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHRDCtR30Rt7Wv0DeAqKb5RLaelprw1pePCgQsWvGk97i35Mlvb2MQ8w8ZZFlly2wIykVD0+GXNV0SN6Yg8SSNgoYDJ7gdW3CLAGDkTXB06071clrYzi
 RZmBSX2sk91FOMQpC8iyZXMq0bA7tzRXjq207LEA5wqIhZLBkMqZ211gmqmvwbjjVKNzj3YeBXaW3pDqDtUZggm9jKKusBUJhFI+MzKEuhqpbpsOnYA1S8nr
 0Zo+SWcamYzhGr7Hdh8L1eIvwnHf07b9TcTNq4Rj7upQdV/C8gQIerweJXk3vnzG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764082225; bh=I/Va1fYtaFttQLOdF4gDohu/jNj62QDijnJw1pOX6/4=;
 h=From:To:Subject:Date:MIME-Version;
 b=hyAz/iOJUHUD8m9NwdspjDHoSzzi24c2aSrUaiO6vFngAyl3kg5q5fDaAygXWTVhj
 DeeeUjGrrSJ5bVB9TPKCaDInfj3IP/ncOlsOfvBUli0/l7AUC9arnh28AmgULgaGhL
 fHsO2QeQT+UYVzLKIJxpZqQka4Opuyj4tqhbz4ySDJQsLL9fK2xVXL3AGKXY/mtMFU
 m/6YcfgD8WtwL7xJ2lsqV5DrFzhTr5qdq0B2LMzkP8UcwPm1xMVoGofqSKBZP73RXE
 J/q8fbVesWU4aON9jKZp+mw2uxOdKVQq3AEqGipdUApBZ0/GW2eTLStHrN24/Ao6ck
 hO900jVNMlgLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hyAz/iOJ
Subject: [Buildroot] [PATCH] package/swupdate: fix build failure due to
 missing include
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

Add local patch upstreamed to fix build failure due to missing unistd.h
include.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...001-ipc-add-missing-unistd.h-include.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/swupdate/0001-ipc-add-missing-unistd.h-include.patch

diff --git a/package/swupdate/0001-ipc-add-missing-unistd.h-include.patch b/package/swupdate/0001-ipc-add-missing-unistd.h-include.patch
new file mode 100644
index 0000000000..58ceab24ea
--- /dev/null
+++ b/package/swupdate/0001-ipc-add-missing-unistd.h-include.patch
@@ -0,0 +1,38 @@
+From 0a936479ef45307cb92f020bbf74808754d07784 Mon Sep 17 00:00:00 2001
+From: AFIQE ANUAR <afiqe.anuar@atmark-techno.com>
+Date: Tue, 7 Jan 2025 11:20:07 +0900
+Subject: [PATCH] ipc: add missing unistd.h include
+
+musl requires unistd.h to be included for close() as specified by POSIX.
+
+This always printed a warning and has become and error since gcc 14:
+
+ipc/network_ipc-if.c: In function 'inst_wait_for_complete':
+ipc/network_ipc-if.c:74:17: error: implicit declaration of function 'close'; did you mean 'clone'? [-Wimplicit-function-declaration]
+   74 |                 close(*progressfd);
+      |                 ^~~~~
+      |                 clone
+
+Upstream: https://github.com/sbabic/swupdate/commit/0a936479ef45307cb92f020bbf74808754d07784
+Signed-off-by: AFIQE ANUAR <afiqe.anuar@atmark-techno.com>
+Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ipc/network_ipc-if.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ipc/network_ipc-if.c b/ipc/network_ipc-if.c
+index 51a99357..7740d1dc 100644
+--- a/ipc/network_ipc-if.c
++++ b/ipc/network_ipc-if.c
+@@ -12,6 +12,7 @@
+ #include <signal.h>
+ #include <pthread.h>
+ #include <inttypes.h>
++#include <unistd.h>
+ #include "network_ipc.h"
+ #include "progress_ipc.h"
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
