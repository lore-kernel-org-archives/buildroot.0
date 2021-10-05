Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B0DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 01:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB203613CF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 01:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB203613CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35C54063C;
	Tue,  5 Oct 2021 01:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNVLnAbEQFo6; Tue,  5 Oct 2021 01:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 074E14063A;
	Tue,  5 Oct 2021 01:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C42861BF989
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B339660775
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3-2JJAAsHJc for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC4E360766
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 01:00:50 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XYiIm8WvNiqGsXYiKmX30e; Tue, 05 Oct 2021 02:53:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633395228; bh=howjckpgWFqxpcBtOjYNdGzEPomvOTNToUfpFdk9GWM=;
 h=From:To:Subject:Date:MIME-Version;
 b=JbTzUCuQgOYt1Sj8ZjVyjD7g5sfw8ZhB+T0K8pkQh9A1VhjgSgfOXVAPifgQHR44v
 Yc2vIiZkL74//x2FcK82Z8L/du9TAUTdU0ROwrQLy897h/bBwJTLFLAdrYD6YNTZUC
 wnAI0/wogEoBHHEzXAwWS3deWVv7cqUfKkPZqlFHl35ifAHRbqu28YvxU8x+ksdihH
 CORANOIf1GMZ4dYmfUvf6TwsQi7xcAh2OAdYnNRpU9bOrdob5O2P/0APO7B2sOioXc
 z3gKXQ13BaMIJTlBpXIIb6tKnzoL5rCK90gqIOjypi+LaAGNmIzadXiCtLycoHUyIn
 4s4+qHftSn3NA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 02:53:45 +0200
Message-Id: <20211005005346.955339-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
References: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPK4vsz9twZCpILrPSex1jdaIxMuDgD5kS12Rbp1fPamykiepUzGyKZFlPIbNIneHSHS8em+xGwC6w47gzGZplWKvETicz3cUmKnWqnd3DyynDQQ8Do7
 El+uUv8pu+SkQUN4hiOVZ+THibLAyzZhFzB6l1cisTOXNlUjVT21R6XGgho3nhF38/nP/V+QnJU23ekL9HGHSl0u9PK92324mxXVvU5Vg3rld++x4cUWcVJe
 pHpmzl9C16WLQHt891SRBAYH9RLWC7h7osNPBsBCnB3cs9maVfL28ScdDbG0iCt6WDiVZwQA+mFGI1SBikcDGDYPVRfEWgDXlVGi4Rh8i5bFAeYxIdiSttub
 RXED7JZstRWXj+hOGEbPnVV1GJAoKQ==
Subject: [Buildroot] [PATCH 3/4] configs/olimex_a20_olinuxino_lime2: use
 NEON+VFPv4 as FPU strategy
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allwinner A20 supports NEON+VFPv4 so let's enable instead of the default
VFPv4-D16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index dca6123c18..84f2661184 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -2,6 +2,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
