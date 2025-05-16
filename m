Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D7BC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E3260A69;
	Fri, 16 May 2025 17:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcYPSAP6Cts8; Fri, 16 May 2025 17:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1812B606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1812B606BE;
	Fri, 16 May 2025 17:23:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54CDD1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4638E400D8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKySn4mmMfoC for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBFA0400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBFA0400AF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBFA0400AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:23:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7C45442B0;
 Fri, 16 May 2025 17:23:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uFyly-00BIV5-1l;
 Fri, 16 May 2025 19:23:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 19:22:58 +0200
Message-Id: <20250516172258.2692710-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeffeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeejvddufeduhfeltdekvdffheffueehiedtudettdeghfehhffgfffgteeuhfdujeenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] fs/erofs: unbreak custom compression handling
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

Fixes:
https://autobuild.buildroot.net/results/0f856def945b9a863f45f7a58553b62f6875720b/

Commit a02e43741719 ("fs/erofs: add custom compression option with optional
compress-hints file") added logic for custom compression, but in fact it did
not work.

BR2_TARGET_ROOTFS_EROFS_COMPRESSION_{ALGORITHMS,HINTS} are kconfig string
variables, so we need to use qstrip rather than strip.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/erofs/erofs.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 6543a364f1..881ecea053 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -11,9 +11,9 @@ ROOTFS_EROFS_ARGS += -zlz4hc,$(BR2_TARGET_ROOTFS_EROFS_LZ4HC_LEVEL)
 else ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZMA),y)
 ROOTFS_EROFS_ARGS += -zlzma,$(BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL)
 else ifeq ($(BR2_TARGET_ROOTFS_EROFS_CUSTOM_COMPRESSION),y)
-ROOTFS_EROFS_ARGS += -z$(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
-ROOTFS_EROFS_ARGS += --compress-hints $(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
+ROOTFS_EROFS_ARGS += -z$(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
+ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
+ROOTFS_EROFS_ARGS += --compress-hints $(call qstrip,$(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
 endif
 endif
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
