Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD62C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 21:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3BD61131
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 21:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F3BD61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0277B40159;
	Fri,  3 Sep 2021 21:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdZ1TMvM1Aki; Fri,  3 Sep 2021 21:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A6A7400F4;
	Fri,  3 Sep 2021 21:15:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2BDC1BF389
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E20C74265C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 21:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JE9aXUddxsoM for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 21:15:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13156.aruba.it (smtpcmd13156.aruba.it [62.149.156.156])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E8C942632
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 21:15:32 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.161.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MGX1mJ8KoiqGsMGX2mbFyw; Fri, 03 Sep 2021 23:15:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630703731; bh=I3YNYJyI+PfVtbgWAcSCh2X6x2r8JOyLEZZLRvS5OyA=;
 h=From:To:Subject:Date:MIME-Version;
 b=QL79c2cGJzysCKj3zoew7XZkdMC7ivrRPFw8j2SBk5KrcZYJdpqgnlNeb6N8ButQy
 MGPi9bWvUCGRlGvjm4gmNfqErKherlhq6lkp4X/8Fz7v/khdmxAq5pvpf4ISfV1zAK
 iYsXbGb/BQztJkYklXXChGkACF3c4eb0l+bcOg9mBbldsbkktdF+ZYQCQpdLVbrxyW
 u/m/2PoOqPh5ZoZRa+AJGAUnAOjKGGXJ4FL4PIFI3lPNrFNRSXsoMYqpuI7LUnepCe
 22OMnpJfPoB0OZmoYYWecrTqlNsRN9alVQKk0ctTK2SBgMS4UiXNFTHdvaM5jpME0x
 gPuXbpdMfnUBg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 23:15:26 +0200
Message-Id: <20210903211526.59492-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLoWdU8Sco5s2Dyr4d6za98uU746O/SKI0UxiaZ1q/xMX1ye4wS5p2wTs5kY0FHD9WNIuaQjvqlMV7AvnJFPcpJrHjrgMuICwbJbN77neSIVD5GeVNUe
 1Z3QgkBoYvvbfTFddlj6WThiWh4U2CYR0neciNGPXjPnhCAhSWcdwPFhA7pavYgENOCOikS64zgC0xkotxcIIZeR9lfQWpWaIvKNU3TwED6Tg/mMMvlGvuXw
 pkLxUdNI86NeBBtzsRwYJRhc/AuBloGnL5bqgr4ERTXmBJWPu4rIUqXaD/J1TaE6v+hlGz9BpJFyvdFWPlqpcQ==
Subject: [Buildroot] [PATCH] package/udisks: bump to version 2.9.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Bump to version 2.9.3:
This is a small bugfix release focusing on exfat and dosfstools upstream
changes, along with a couple of test fixes.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 303a0aae01..c2d69ae799 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bda6f9d7edc632c57e55862731a8ffeff2413fa4346708a22bf31ed72b0fe058  udisks-2.9.2.tar.bz2
+sha256  6c398f5fc453e687d8633aeda4477d6a82f3d4bf54cd00c8b09b1e9a6fe56c11  udisks-2.9.3.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index aa1a73aff5..e73cfcf1d3 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.9.2
+UDISKS_VERSION = 2.9.3
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
