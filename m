Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6F4C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 16:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3343418F2;
	Sat, 10 Jun 2023 16:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3343418F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jZ2MBUiOL3g; Sat, 10 Jun 2023 16:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C51417CB;
	Sat, 10 Jun 2023 16:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C51417CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 181BD1BF867
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EAC40217
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EAC40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYdrf4sCCMxn for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 16:58:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B88040190
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B88040190
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 16:58:26 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.92.5])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1D06F5FFBA;
 Sat, 10 Jun 2023 18:58:22 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 18:58:13 +0200
Message-ID: <20230610165813.357109-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230610165813.357109-1-ju.o@free.fr>
References: <20230610165813.357109-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686416304;
 bh=cuv1vuA3bDnfByUnpKfuzpBFaK/mxHW102MHVobJzXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cPi+H21cZd5bxyF/ijzbq0gFSt/lmKo1N0+SFNclSybcQEdo4ybKbZZp+hhM8mCm5
 VILms0Zx2kZ6uA9YUf55oNmF6RbR49SqYfdcSheQlWRG19rSwziPVBK9mHKfkVYHH2
 SnwnxUNQW7+r6itfZK1t2R0gWpalqD+Apww6hoIVZ+R5E6H8ezZagVxgO12t8U9ihs
 KqE5ynDZV4EA4sxPhsw72HdbtvB6xTY+W+s6am4ozw9cY5+06yVJToopJS0d6LCzC3
 JBoli2fZHE3j6uhkjWvdoOw4GVSc9NAGesVZM0zrQi5yxYTcGnssgoiO5Ojh9ZNnv+
 XXMCkjEwujZeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cPi+H21c
Subject: [Buildroot] [PATCH 2/2] support/testing: test_perftest: update test
 kernel to 6.1.33
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_perftest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_perftest.py b/support/testing/tests/package/test_perftest.py
index 680b70d784..08089456c2 100644
--- a/support/testing/tests/package/test_perftest.py
+++ b/support/testing/tests/package/test_perftest.py
@@ -12,7 +12,7 @@ class TestPerftest(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.91"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.33"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
