Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A8E77166
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 22:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04FDD8478D;
	Tue,  3 Dec 2024 22:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwyrGVySXYeB; Tue,  3 Dec 2024 22:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6F084782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6F084782;
	Tue,  3 Dec 2024 22:51:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34CD72073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2337B6118B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94QIvcTJMAcI for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 22:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E1336118C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1336118C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E1336118C
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:51:48 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 33027B0051B;
 Tue,  3 Dec 2024 23:51:43 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Dec 2024 23:51:31 +0100
Message-ID: <20241203225132.300296-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733266305;
 bh=5t8YYl/lxFcdVuXjYzTVYUVLDFiStxyXxRKLZWkA970=;
 h=From:To:Cc:Subject:Date:From;
 b=ce38bGLUlYQkcFZI6xHWslYw/pyPcutZCc5gdS12xHosySVdaDmonGHC7p+v0N/P9
 5vZXEmeck8fKJjh4mjXciASj5tMCasLcA7j5XWm0g8JI7Gku7GBrCh5mZa5pHJXfVL
 796A0l0qf8G5kZ0XU/CjejrWTszw++yUnelM8hjsgVerS6jjMPchoWIcxSMcVfvKjY
 xLacsuHG9llbWQWfkI/KNXZhmk/AHp0LKvIO8C6uRtxGP8lyR681n7xbZpVzmMvQJa
 aKxX3yBZIVZFLhBoP6L5M4xPvNNZD6fw03ETlcEhxquIBof7w9vXkmG6d9Fx0ALd8D
 xHhCESpi2Ubsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ce38bGLU
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: fix _SITE download url
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

Upstream moved old versions in an "older" directory. The current version
in Buildroot was moved to this directory and fail to download.

This commit simply updates the _SITE url to reflect this change.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189435

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8536372649
---
 package/rt-tests/rt-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 419260db3c..e048ee94d0 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
+RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 2.7
 RT_TESTS_LICENSE = GPL-2.0+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
