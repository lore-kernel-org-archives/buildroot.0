Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE421C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 19:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACCB81755;
	Mon, 27 May 2024 19:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YK9_Dnpa3Vsp; Mon, 27 May 2024 19:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB6481762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB6481762;
	Mon, 27 May 2024 19:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25A821BF35C
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 19:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11F8681826
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 19:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crNv1cDZtwqG for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 19:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 226F381762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226F381762
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 226F381762
 for <buildroot@buildroot.org>; Mon, 27 May 2024 19:07:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BfgasSrbZ5tnXBfgbsVqgK; Mon, 27 May 2024 21:07:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 21:06:07 +0200
Message-Id: <20240527190607.61429-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOV6WAner7I47dlRqW28EMpngmubtHu3tHHDK/SNHHDAMB81WTknvnMoE6F5z+m14NynRgAmW/+unktVgdtBc/Efc8s6L+ytzjCctYQNpFgzCpOWdc6c
 S30fZmifC4BKMIlYPfgzunIix0uWQ9fJDEaul6yGR/F7tlHkRc5BEuZVUdilSzewQA5yIQPf5QQX/MkCw2lAzK81YVxrh3QATpLB/iha3MRMywxEh7HT6UST
 fbwEDuqI+jA7WsOrUaevWKoHk4SACIcVIJaZIla5bw922Eq8qQ2q6ASqI4ZrCdohLXKZHdEGlSb6SWlF16pHXA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716836829; bh=67o094JsySje4zVDDe/bKPvtx1e+8s8DFUMCdJG9oQ0=;
 h=From:To:Subject:Date:MIME-Version;
 b=KmO/tFBuKn78MHNV4TJrIyNdX3p3QBQHr4RkPqvzIWG1HefbogrWqc8PkaIlrbspb
 9pEmJtReBmVTA1ymZ9Ai7tLBEcDLHXf1y/U6hVoON4jpye9hE4qRC6VaqltfIDnOL7
 I27nfLjdC41DxZPbYV9P3SsT7+7cphHCJSxjcsR9YuluPtDfxS5aZrs/Jk8ch+e4Re
 QBVkDjqXsrIGQy/kVg/e8EEoZ84FCqCivSz01ItIFPFG5afnz2hI3K36hHstqUkW63
 tfGQDU7c+kogRabVlyFVEO3BBkS5ogACC9Ygkl5dBDYoP6MhndUp2ijSRHXkknJDi0
 i1FuYfQiO0uSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KmO/tFBu
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.14
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cesanta/mongoose/releases/tag/7.14

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 716833eeed..82eb593297 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5c9dc8d1d1762ef483b6d2fbf5234e421ca944b722225bb533d2d0507b118a0f  mongoose-7.13.tar.gz
-sha256  4ba646f5a7012d8b52f3a74398e446f56960dde0572f7241a2215430da5dd5a2  LICENSE
+sha256  7c4aecf92f7f27f1cbb2cbda3c185c385f2b7af84f6bd7c0ce31b84742b15691  mongoose-7.14.tar.gz
+sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  LICENSE
\ No newline at end of file
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index e2e3be790a..d2cd45451e 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.13
+MONGOOSE_VERSION = 7.14
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
