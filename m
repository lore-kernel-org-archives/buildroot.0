Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D1107BCE8
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6751940E81;
	Fri, 13 Mar 2026 21:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1_60sch8AXO; Fri, 13 Mar 2026 21:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9857740E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773436572;
	bh=EoJDRenwGdRd/b+zkygpNEzHAUYeDjAWBeBo9M4GF48=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WJR7obpje5qhsIowV1/CkTy461n0CiLDVrOGwhAZ1WAC078amfOKCfcnmG32wGzF8
	 28BMVCS9E04UsDZ/uJGlaGu9+MtgaNXi1nwj6999441X/Ol4fybqpKY7SDMFaIVW63
	 H6KKuvVdTFBcowRlGegEhlYaKOJh7KEUbGqfXt5th4XLDtNUA8RTgRWbJtua5bWHuD
	 lybeRXlx7cwjjgZ9Gtx3sq5DIoOEPOXYlm2YLNxeZPLk4A7B6NFKXN0DafRJ07qDVq
	 pReIEFdYCDNktEISnpGLQeoH9OUk5K0AO2zZTcq7+xJ9Js6bdMyUJ0xasFa7jQLEc5
	 oaZdkyepEDBvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9857740E8B;
	Fri, 13 Mar 2026 21:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A021AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00964005E
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YIZM2tXfueS for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB9ED4005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB9ED4005A
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB9ED4005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:16:09 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 19rbw5EtFwf0D19rbwhMYg; Fri, 13 Mar 2026 22:16:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 13 Mar 2026 22:10:15 +0100
Message-ID: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF+wJe7eNrTAKlVqNAvIqao7R31Sg0xFxzyF32cKk1sQv2KWwGbRGdgpuT7xkIHJVw2cdH2GEAUveB+WoydewO1HWsX1IsI7HOeZ0U/rbO7qfQyhUOs7
 9ir6OtfBRQlb4trDm2fpA28xnScpkSWTs3QsAnIdQLzNg5qhliI/WRLw7bGcFYj0d1zuEl9q8fNzDbuwIBMRo6THEcj90OgsuFiFRyKv6/rDqHeBEz+HLMTj
 +5OdXU7l4fF544QUnoVP0Tdixc0E6I6iN7XmhSlFfwrHhRYOjZNfOCfZiVR2sRIY8Jz2+MJz3rurJsakANt9kw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773436567; bh=N/yDOeVstLnJqt+Y5z+zwtq0f4P8cHEfNlJRTF/ZOig=;
 h=From:To:Subject:Date:MIME-Version;
 b=FifZttCvAwZRm6UpRsiAZR6zmfIzuxkk0WjncQxfm8H9lPho7BsntCdAOemJbH+03
 /3JQUQAx54FENynceVQAIoWHTq3IAjRbfUFvXyhSVNj4pMUIZ0wWsnD+UVYWE63cZS
 CdGBrVPlP3gBif6hoDz2GZU3HMgHjDgviAzYa/Wwkx6ne7880ZpP+1xDbulHmBIuSN
 aswZuNWkVdKbqL9yZ4iD1COne/N7seqwooNGYp1PtwOor7PgxckkeUR6Co+cbWjPce
 hTtNBEtO/dhE6O+2qbAKo/3hr7A8sXhVCEObc1YfjPyjBqVKjE4qH+EP68CbgeS/Vy
 JC0Ez+yn0ucng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FifZttCv
Subject: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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

Release announce:
https://lore.kernel.org/linux-nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index bf7c4b61b6..1e3f63d419 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.6/sha256sums.asc
-sha256  2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550  nfs-utils-2.8.6.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.7/sha256sums.asc
+sha256  59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae  nfs-utils-2.8.7.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 7ac0b549cf..3d391c1804 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.6
+NFS_UTILS_VERSION = 2.8.7
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
