Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8125CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8999B60F93
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 22:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8999B60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C41829AF;
	Thu, 21 Oct 2021 22:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ey9U3HPI6_2; Thu, 21 Oct 2021 22:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6EB82893;
	Thu, 21 Oct 2021 22:00:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2CEE1BF9C8
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B211B829AF
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Evcoy7jhpWn for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 22:00:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7417282861
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 22:00:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dg6pm7gvAXRKtdg6qmSRxp; Fri, 22 Oct 2021 00:00:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634853625; bh=Hoz0xT+GyEVAMDCYM9oLBwhKajL5Fs7ZCKCLfx1JS7c=;
 h=From:To:Subject:Date:MIME-Version;
 b=kykQA0rLbj9xiOo6ntVx3LphjnH1UFSGynSpMLVBJdHPAFtiDX3NOmL4dGMxp66nV
 0r9ynbWe2goELKTFp2jj5AaDlH6bXl1eowivuCtGXjo6JUMfpgEF28/2OjXsrJH8CK
 LhkgYI+0qmG4HVH1lU1FgF+/JNT8w6oJa9mCIBVs4yM662+TmUwfPnUl8wMKRwBh1u
 zFBOuXOreGNGGMy17CqfifHBzhPm/UuhCOb1NX8T9kWlZOn6O8WvX8HR5AV39nX06U
 qTr0Lwea9z+lEmh3hyKYAvqOHVeCg95GLzLTJyGv56BlyoA6YOQy/1BlfV26mldx0f
 LSHa988zKLfJA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 00:00:17 +0200
Message-Id: <20211021220023.68288-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB17ixjpCNTAegtZMFK48vKr6UGb81nyoNKr23zcak5pH++fFQxwC3lTFXroUykd1Fs79kPUbthgjt26gD5Sc5RjdKbhT6fBODffCqrrEiVm3kbaJD5V
 jdmc3aZa2vR98dvMSvwREye7ue5C+jTmziszTHVPqe/RCgLKHnaH83IRPxwdrv28qwEgPULm+KBmv13vzJ6voXMFiHzo3ysl5M1FR9W0zJ8TCou1dL8z+Aon
 ew6k9OG6sT4Hcr4Ydmmo2p2HALVt7MFoedNU/Xmd7kcDxk/INE8GPOvJsIdLIjOaaFDD+XWqDW+jo2ZAfkuw6p+2XYX/IJrDoa3hsQPUQNbksXSWusYzYWox
 hxPH11HJoGZJixX1V6AK/hv1dpGxujt3MmqubuH0Dh/KQwOGOAnH+1GhvzXZjKMVtvkHXMvr
Subject: [Buildroot] [PATCH 2/8] configs/olimex_a10_olinuxino: use FPU NEON
 strategy
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A10 supports NEON, so let's use it as NEON strategy.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a10_olinuxino_lime_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index c3b4f0161b..368cacecf3 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
+BR2_ARM_FPU_NEON=y
 
 # Linux headers same as kernel, a 5.14 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
