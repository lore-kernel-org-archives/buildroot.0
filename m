Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A5EEF3717
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 08:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B310683143;
	Mon,  9 Mar 2026 08:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2RhmTiAN-wt; Mon,  9 Mar 2026 08:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6261183022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773045073;
	bh=UR0sUMC/YI7kBMOUd79xiGEnQ3lernFpgeAJDJ5Umfc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OIOKu9NfdCWSUhPjypWvriVm50WywwbswkcS26HA7EnhlSWCzaur6mqzJVfv3USwz
	 aOS8s5+VafYQjD64E0JfzF3cUSfHCOtYB++fANLdJdSUW4sM1MKwsbHHsMiCaj+1h4
	 1twe/f5Qn0UzodYlDG3KKbDL+TT5PpHRQP2vONthefehsFwqaiEObqwi2+gZ3TW9Ia
	 WKrlesDOSoTxcHtCRlPU+8FiLxUrWxYWa15XKvxHSX4kf4vkUsnes5yXq+C6XKc9FS
	 mTLbLeddWRzFLvhV9GuuTRPfF3Ft3wmRKzNni1xTBt+bm/5HgoUk192z4UFrbw7PyF
	 UDgmQ7H4AaoyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6261183022;
	Mon,  9 Mar 2026 08:31:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 995A1158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 08:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EFDE40150
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 08:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE2mryASMTM5 for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 08:31:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 559694013E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 559694013E
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 559694013E
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 08:31:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id zW13vSGKFtpTfzW13vJA5l; Mon, 09 Mar 2026 09:31:05 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  9 Mar 2026 09:31:04 +0100
Message-ID: <20260309083104.3500964-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMhYEmfEobVx4XNXRTOqJg+HXh+d6BYC78X+0R9iQ8CD4N3HfEhMR9+NBCYqDD3g7eT0gWL1OqWZlFR33qgAXFL0HDafjR41kjjFmmgQ9OVbB6lY3aKi
 filDWiUKOJgL0Am/kIVLSMwRebnopkOlqdHUdaM3U3+hq8TKdzCdJZ+G8Xj5ynAIoC/3RNp74HVwgbnxeqxMWn1q4NMnCklsAafgte/krf8HYTaaKRnWNX2r
 4ZdGgiLgVclTA0HKnc169CUBw/U7GX0TkdmG0/GkdlN3bqI7O4PimykqdNK2+tgryD4nN4aT6ICT99J4RVRipQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773045066; bh=cYq28qp/QCVGS4iWmw2KE/VPBHcYIX+kP7gPP5C5EyM=;
 h=From:To:Subject:Date:MIME-Version;
 b=XD5rPEy6a300Z6fDSRNZDYux7aewbjhGmESdM42XL9mSrPseoa5CrHeHeS3pxjM4h
 +UsqtQZ+zgkNKnY9U8fK3469/tDawtm+3y0Rx3gmY24/WFLrRUmS2YAD1rHHSm5uqY
 YnKMedE9wrF4MYokb2n5utQ2oMzU98ou0EMPiRU9+7g7PkndZbp3gjcaBE8A6kVqRT
 mdxsPqBk9K1vLiM66boVGLOfNv7clmq7jYH74XND1xZjNzF1ToER46XubyxVLiDt1P
 Qs5Oahp65VbRR91XxEqyTPpj5cs4fkBNJhyUaB5T3rcW1VJSK9f/iIH1QFDBubc/jV
 ZIhzawRIfKgiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XD5rPEy6
Subject: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.6
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
https://lore.kernel.org/linux-nfs/4d58bf28-a3e0-4496-bae8-05387da27054@redhat.com/

This update fixes CVE-2025-12801.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 9aa9151ebb..bf7c4b61b6 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
-sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.6/sha256sums.asc
+sha256  2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550  nfs-utils-2.8.6.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ba87ef813e..7ac0b549cf 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.5
+NFS_UTILS_VERSION = 2.8.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
