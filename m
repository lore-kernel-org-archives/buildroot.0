Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEB6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5316361A65
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5316361A65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A668415E;
	Thu, 30 Sep 2021 23:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIdfevRFbEW0; Thu, 30 Sep 2021 23:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58ECD83FFE;
	Thu, 30 Sep 2021 23:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1704D1BF352
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0505940367
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Kj86S7omvw0 for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 23:12:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A3374026E
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 23:12:21 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id W5Dvm4urBrIRlW5DvmKqqN; Fri, 01 Oct 2021 01:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633043540; bh=0zS6wk+4Reo7XIWIEGKW2dqEiodUlfpE2uZxJjuJVIA=;
 h=From:To:Subject:Date:MIME-Version;
 b=HtnlCAEizEs6ao82IA0r1zOthCim8M/E84BvuQJ44Pi3bbUcZEelSSSd8WSjHQOVx
 /M0FRZICPkUqNTOSOjc667d87bPjbJtJ43IBZV0kvEhEEbKe/ZRRROVrcxHmTIU2KX
 OaRxDvLuKMxzgD2PwYg/3qke/mkUDHFo+WGQliflkV3plQmpKDCA7G2+8eWk6hVEoh
 PIeKx6xAAkCAXtRdGN++sdum0nEJ+NwHZ/hTP65HJaRy4v/PIDJWrfimAgWpogWMJ5
 MC7ShGwyNzsyfxfIpoiW2wttA18JDq6z4ogiK2dqUU6WvCCMT+9iuN46d4jE72lr9w
 i2My4m8BMLgyg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 01:12:18 +0200
Message-Id: <20210930231218.237991-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930231218.237991-1-giulio.benetti@benettiengineering.com>
References: <20210930231218.237991-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKnJqsY+YOPA1ZmJHlnu6oqQ4dmjUNFRLpGisbPOmPhs+Zu1kL5pfQYqFuGJvLEz+l6rBTNwSNQZkwuLNHLmdw5vsk62k6ruvNBzpRCNu2JHyxyrDsGT
 Ny7ytkwATbKoRR0XihrsJOAObjbwje/TvWbVc3FpvZKPVXo0aPN26OkZCWpOSDtBjlzjOhnyCEWzb1R82zieOgSAj9Y4Tl9UogoOP6mcQSnGPu2nrKQnr/j9
 Yq54ipKYpQCswEU8aLdy0SNoDuTm84yemgPmWt5Jz6n7A88BdZ9ayNOJGLqmz9biOtfjlAJqrlT2l+26RV7g8QtH9uZZh6v7HQZFrngRaGU=
Subject: [Buildroot] [PATCH 2/2] package/udisks: bump version to 2.9.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
```
This release was focused on stability and hardening, notably fixing some
long-standing race conditions and memory leaks. Default mount options got
tweaked towards data safety.

All users are strongly advised to upgrade.
```

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index c2d69ae799..ade4982a0b 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6c398f5fc453e687d8633aeda4477d6a82f3d4bf54cd00c8b09b1e9a6fe56c11  udisks-2.9.3.tar.bz2
+sha256  b6b60ebab0d5e09624120c5d158882e87d8c2473db60783b63deeba74cb18d1c  udisks-2.9.4.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index e73cfcf1d3..2bf519a2cc 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.9.3
+UDISKS_VERSION = 2.9.4
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
