Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A36C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 22:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C07740DE1;
	Sat, 29 Mar 2025 22:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8qHor1SNYOs; Sat, 29 Mar 2025 22:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A826940D88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A826940D88;
	Sat, 29 Mar 2025 22:18:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B74619C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 22:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61FC640575
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 22:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMhdTtviW3Tp for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 22:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E11640252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E11640252
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E11640252
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 22:18:19 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id yeVMtNPxV6z5ZyeVMtMuNi; Sat, 29 Mar 2025 23:18:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 29 Mar 2025 23:18:14 +0100
Message-Id: <20250329221815.573118-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNQv/lKZrvcmV1K0CCzD+Oh3IxNX+m14TiDNAb2SARKJr88zhMznBVesbB1xKFJ7hW8jN1A71exW3AQbGZbExzlNRgNz2fftrXcnab2URVUrSGoXZ5x5
 Z5ma6ydop1igPY71ducpf0h9tCDxd5mucEFMdxVt2fu1LSrGYiSQoDo4a2oyxIZTREnoQX1gNyjSMaJE3cvVMB+K++MYWED/RkvQ7sq6A4yRq7v20TUHIlVG
 uzkiyf664JbTvzn+huCd+cxWYIDv9iN5wJsKRSBYwwo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743286696; bh=nRs/StttNCIGyxwtu+h31mk4eyJtM9b5cb6yBCFTFh4=;
 h=From:To:Subject:Date:MIME-Version;
 b=LuBEWTINn+zObmf2sq1Y0BlnwtHHosSSeMB/tSFsjV3lolIxz77mM1aVxBLFaadtd
 DjXKS+BWEQlq1xT+Wav8YT1/Nh++R+sDlzvaXz72hYpLrxhKJ4b+eEEXjQ94b+hhsa
 LL56OfOzlavSDbxW/qOuu2KZIJjV914Ls0opFsBGx4/kHs77oTtsmjfyhDSRjVrcsH
 ngbaJIiVxA231oaJp4OmemLLQ7FtDcZ6HXpui5cQAwSttsVeqOtPUUsPNl6B/BRGi4
 Yf3RM5rbVDUP7k1ZwSc+6SesFIbAKYEcP0VE2fnzAP7SmEOc2ZEF9bEaUvDAk8juNP
 CmrkR1CrunwrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LuBEWTIN
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.17.1
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

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 6f3b3ce122..b6e919d56b 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  1bc306be1a1f4f6c8965fbdd79c9ccca021fdc4b277d501483a711cbd7dbcd6c  libfuse3-3.16.2.tar.gz
+sha256  b81027fc8f444fb574de7f13edf0cf9810643d2935670c4fe19f140354241208  libfuse3-3.17.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index f5c9dae8f7..2fba6792cb 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.16.2
+LIBFUSE3_VERSION = 3.17.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
