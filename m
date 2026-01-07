Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AFACD5829
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 10:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E9B81C11;
	Wed,  7 Jan 2026 10:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkZkkbgTrY2l; Wed,  7 Jan 2026 10:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D4EB81B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767780261;
	bh=q677r6a6jt6G0c9eJ4yC1SemAllxFl55jsiZGzcTeR8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=I9t5Nk3Owl/RF22W6uk/3sPu3IcV6z17+A9dbLPmWk2ykkEwDMZMv/SWAdpjiCMxO
	 pElspnEvY2wGexhGJq/IXnrI+3rjvTweP96iptmPlyLlCH5DyX78E1SGVArR7TER0S
	 9Rb15dzb5LdQcw7eITXR3KXM8y52PMu/xa5uCLd06taJywV5nSuMcVIQQUQubeNRzG
	 TqYszHSLkwLXDkL8zUqvfFSLHRI8pvAkVeH/kwERyR8LSKnVRSXqDadZs3d4tlvD0B
	 xFFPyhKKriBWv7fgyEsffymNHgFoMw6qb14DklMg5IlOmkw7lWBQjsKXL6fXtk0uvp
	 sPp2fbjFICZ8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4EB81B70;
	Wed,  7 Jan 2026 10:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A070A436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92C0D401D8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXMLb28I2Ce1 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 10:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BED9240194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BED9240194
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BED9240194
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 10:04:17 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C1CBAB00576;
 Wed,  7 Jan 2026 11:04:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Wed,  7 Jan 2026 11:04:06 +0100
Message-ID: <20260107100406.2263334-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767780255;
 bh=aaO89l9gkiV2DxGAdqsXkeYBgd1yeuL1umDSai4nSig=;
 h=From:To:Cc:Subject:Date:From;
 b=F5L0OdYePRxxjCA8dRxQlYlI0OR5qppKHJiwbHCPKOPiXCB8tFKVmWq9uCK+IwDF6
 X78CBde3nOGNiXn0yiQ/Ue+wEe6qOrm1/vE0YB7/3CY6lotuXRBPn3xA8HQeEC9L+s
 IFdQ6i9DtaSoAPJdCCD336P9Mhd7OphMROFdGYGdBS1cau6BKSmlV1/YYzEAae8G5F
 70cEExjcdGMHmS0Fyh4W7WM+XoK2VYo9F+MPvA4CbMKeCSNp94zM/IiBEfNFKnVNgh
 JnNiTYoerOPBCul/URLbfXN/QBrvpT5EHKpCxq8xkFU99WRd5Xc3abZ06WAN1jAQAE
 vJ5yPPukdQKvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F5L0OdYe
Subject: [Buildroot] [PATCH] package/rdma_core: bump to version 61.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/linux-rdma/rdma-core/releases/tag/v61.0

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index fd538fc5a458..e2da879aa277 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aa9ca1f5a9e356f770441f52254ddc70ff0a4df76a25383e422075eb730efb4b  rdma-core-60.0.tar.gz
+sha256  c7db745c72fca8168503b73bb0c6f0ff110a865944b7f73f791480c2bff1ab87  rdma-core-61.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 99b77dc03c76..4ace1b8a3ddd 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 60.0
+RDMA_CORE_VERSION = 61.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
