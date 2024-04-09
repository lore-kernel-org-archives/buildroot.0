Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26132C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7EB81D16;
	Tue,  9 Apr 2024 21:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whi49o1qs7kr; Tue,  9 Apr 2024 21:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 681CD81DF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 681CD81DF0;
	Tue,  9 Apr 2024 21:28:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01DE01BF299
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3564402A7
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmsGXOTm-rA9 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:28:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8D98401B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D98401B2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8D98401B2
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:28:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9C8D2B0037C;
 Tue,  9 Apr 2024 23:28:14 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Apr 2024 23:27:58 +0200
Message-ID: <20240409212758.380547-2-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409212758.380547-1-ju.o@free.fr>
References: <20240409212758.380547-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712698097;
 bh=4CNUBUj/b+b56LgbVp4Y5PpLDAFaIPE6FnZoaEcWZLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hOcrLqP0mhNaoARGV7EnnCoiduePF1BiOwiywH5hPK1As/DMkcsh94Wuh4v13nhKN
 eottkxPoGX3N8qgjN4kJDDQsUqHCWXpBamvH2baXuV/KJlF8Oqpvll09m0We1B2eQE
 gggNhb0udYBUnWGqh3pFZtgNCZkbYQZs9IMG/Aqd0k/AhmNzWYC8ah6mk0m4FtcjjR
 CKXAqH2LY6QdUgC3DuZ6fQzO95W+1O1lRPrBstMgt2Vc31aFT0VvQ0NVYzToQSz0vE
 LceoykhDbBXpvbXf2wa6tV0B/Jm9cjRYz3gyQ6SdYnAhKDIQbb8+vM8oNXVf4KrYcI
 WJH1qqJZ+Ry1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hOcrLqP0
Subject: [Buildroot] [PATCH v2 2/2] package/rdma-core: bump to version v51.0
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

For change log, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v51.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- introduced this new patch for v51.0 bump.
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index 27fe7e208d8..f8b01e882dc 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ecb866caaec7ce13f40074c769860f9c36c3a37a70913c5218217e3293d7cb11  rdma-core-50.0.tar.gz
+sha256  a4065b0454249839dc75b61c6ee428e917d9cddf964ff7a33d479f00d1264ba0  rdma-core-51.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 7818b396a46..834d9ea3efe 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 50.0
+RDMA_CORE_VERSION = 51.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
