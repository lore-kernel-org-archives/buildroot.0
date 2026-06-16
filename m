Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FBBCD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2EF409A5;
	Tue, 16 Jun 2026 16:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbQNnWKPA9kq; Tue, 16 Jun 2026 16:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADEC409C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781627661;
	bh=19D4XRZSSzQRUwvhE2+JSGp5+zyaMSmKwS7Gi1eocmI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d77TIpU7nnwFi5bnrf/U0ToLCl2rnJH+2HWTQriZlvO1PrWi1Pmj3Oj3foJtmi5XZ
	 5NEAMZ9SjdW07+4qEQl5kL6WUuzgh2cK2kNQn1SK33PYt07g3L+qMvXXFj+Q8YqhS2
	 /H0YJqCOV8/vVMTiS9UPPrQfl7tRvXaHN+WaesYWoNrD+bvjx6KiROBY0usuNJCbU5
	 XKqMGuILjeGo5aGStx8cYlYqGiE4a6bpqIr3VhRkOI6XqRST3SgnSrL0RvphCvrZxD
	 vrVp2hVR/D9wbnQGEDroszebrCyO/9AD9jgpkvdM4cAkCIXMogus46BQDNb7BY4Hw9
	 3UUCvkuir2doA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADEC409C6;
	Tue, 16 Jun 2026 16:34:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0115A169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6ED1409C6
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmgT9oq9ojCN for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F9E8409A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9E8409A5
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F9E8409A5
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:34:17 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZWjvw8nVnP2aDZWjvwnCOi; Tue, 16 Jun 2026 18:34:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 16 Jun 2026 18:34:14 +0200
Message-ID: <20260616163414.2771639-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJPJCCHsXDbkvvDmjZFc6xfxFbr7i5wNafx1RKE5eOre19VIyDyOoFYMhL9agtg3YLmZv435jjXIZi+//ncGDfQ2T6fk9OOkEJNA2qcM3JL08yqE1ZNY
 DPCKLrSJta2rC4jAiG6/r982oQdvkYvD0VlYkcCH0k6YJvQzl00xY+C0o9zRj8TTTbAUMbyflUTIPIqGQxY9B80UE2remMFb4rZw9BnlZtY1vxjLRjNBwDUd
 FBhAwqrX9rOFSjJOg549kKH4QH2x58pKQR3TxrOmdLo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781627656; bh=shCImFl5yvmjxJd4/MWhDwm61pZwtSYI/TnOMqKKpqU=;
 h=From:To:Subject:Date:MIME-Version;
 b=bMtMC7I0eQvqBlV2XWkkuNunv9ttMbW7liqpeDZoSVz+RCJbHil1FPnAJz7z+fNMX
 tjTI9FLWbN1f9aatpErynofX9lYGJdLIzqJiK3VUD50VeHqjcVnV0F8PXT/QDMDd7u
 a5zIPU17BsqJMPDMKlvBeCl35eTarKXY3XmI1/U7VJJFdLrJuACoLjIMbaVZj94YpZ
 GG75karsq/A31SkvAITgaO/T9uqYXBTOhifJ9PEUp5Low/e5YqPYEQc263USb4PX7B
 IHlU/jlKX6WuBxsUDHGq2t8dK8iWZH+DOlPBuq0H3YnHKFGwOci5OQkZLD5VLy7tAN
 /YM/hWsFVEj5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bMtMC7I0
Subject: [Buildroot] [PATCH] package/libnvme: bump version to 1.16.2
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
https://github.com/linux-nvme/libnvme/releases/tag/v1.16.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 29071da1bf..aa316fbf72 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  ce1d9d393feb84c4e82ca096db2bdb7dd4a5fd1997d711cc1904796944f2c579  libnvme-1.16.1.tar.gz
+sha256  1d850d5a871559abf641d6e6b63bb86047e4cb26f3ad144597c2c64b3cff7231  libnvme-1.16.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index f9bc0be371..55108cfc49 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.16.1
+LIBNVME_VERSION = 1.16.2
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
