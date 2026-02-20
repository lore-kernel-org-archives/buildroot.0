Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908DCC54FD2
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 13:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 194D04079D;
	Fri, 20 Feb 2026 13:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKlTJix5ckHv; Fri, 20 Feb 2026 13:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16C540587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771594591;
	bh=dZCQkuDcngBwknV2lDsvgL24mpIpdFZE5oEggORNNxI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gxwc6nr8HQIsP2SnExq+72Owfk/9KU+kxlDU3LhCQXeXBt95qk8m3OagVLDFA7lHY
	 8NFpila3emouD8oJ8HNUGYX2a15pdJGUq/SgZorC3nErU/sZu34FH9xiiEJIEhjQOG
	 CDDkv9HO48ZUQf/3Apyw8ZfMjeIrULs8nZ9G54w83+it0+Q4dM86e/9QaXVh3P303N
	 nlYxUWU5CH4ld3oUBjlk5cgd2QPRKXvhzFJGUgOWEZKgjuA4zcLQmoh+dS2Pi6ZM60
	 Z5g045OLOFkVYK5k9dYAAFTfAllFS1h0CkvtHmKT/yUlO0/FMc7DPzRdZjvtlFYWGZ
	 vt5t+N/pHXkCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16C540587;
	Fri, 20 Feb 2026 13:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB11F183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 13:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB15B40595
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 13:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zitunuir3I8O for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 13:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3170D4051D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3170D4051D
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3170D4051D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 13:36:25 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id tQgAvrt0E3rWitQgAvv9Aq; Fri, 20 Feb 2026 14:36:23 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 20 Feb 2026 14:36:21 +0100
Message-ID: <20260220133622.2271059-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP2/NEGkd+Knezj427hyVtSVfWm8ico7FvRcJwq15IOxUlnHGNZejs5eEmY/j43WLRCmNqKZ26IK08JzAfqopmbucCGk1mCfVfvMJWo4H+wy+p53DKda
 RFmO2UylXrLrMrtPjRwJ/iwswcVs1FEoTT1ngAiRJrZZ1Efhw88MTjQD7kp8S4BO/BQdzmZwoPHxdZIw+8tXEMVM7l/VmeSFJyKtzgpY/z4YAvWJT/Ynagt4
 6FhAzRwp53ehTokfRVl+ZZfG8rUco8w+k/hmEJjm0xxjtT4UBFVHfreGntnFup5aQEkGaGl1O52JxjWr17Dkpw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771594583; bh=BgLgUpE6kfH5UWH/Wte4EZjyUHhDmgYD0GxLN7YG0eE=;
 h=From:To:Subject:Date:MIME-Version;
 b=HegCBp4jYI78gCu0QNLEkP857V9AjUtkyqtCNTWtb4YE2lsZxwFHMq3BE81Ltdtam
 gBUD3jqq5viEI9tRqd0fRMGlKPRZh3qlRYo7R2X7ueZgVElgbmKKbFDW4jfIYV2axy
 f1W124cSviO1sVgTbrXjfYs7YY6vs0WjR+XVR24N+2I9ukvO8i6dJ7EbKESN+adbXa
 m6eDjuPZ9Xdo2d13AcTo+xGb/N+hUXaxnVFKu19kUTSFuk0zopwGDlH8ASbjVzGMrD
 E5cnKBEtppwH2nRyfQv7AiATATmcZqRW4eI5NO+9IOMk8zbka4jwh4yVga3WJNpVF9
 SMLc8TibQVo8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=HegCBp4j
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.5
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
https://lore.kernel.org/linux-nfs/fdf3631f-e924-4e4c-bd9f-db5b40a90bfe@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index fb5c03d917..9aa9151ebb 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.4/sha256sums.asc
-sha256  11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5  nfs-utils-2.8.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
+sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index e7d82b10ba..6540962988 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.4
+NFS_UTILS_VERSION = 2.8.5
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
