Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D32C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 19:24:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE83560EB8
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 19:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE83560EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93240401DB;
	Sat, 30 Oct 2021 19:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6IfocwIdV3K; Sat, 30 Oct 2021 19:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E90B401D8;
	Sat, 30 Oct 2021 19:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE471BF47A
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 19:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AA77401B1
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 19:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMit7EwpttVD for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 19:24:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD1EC40192
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 19:24:18 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gtxgmu0aEXRKtgtxgm5rYF; Sat, 30 Oct 2021 21:24:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635621857; bh=8cEX/8+2s2Exq4Z9gbYzOEUlKxq8iqYyPQsaSrhfsrg=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZPWzo7hLk8MPoclq+QQcHJil33Zs7RVilNJYGpFccXr5vrGKZQIWoCO3O3db9oFgw
 59yr7BHu+7ivp4yqqbDMRVFAAReplJYvZhBKf0KM6Ef/cj/avwQtcKd3XvowoK03tc
 sE/xG44k3Dg+DI2oISuSohHHsO9S8rkeCSa4fDJD8WIZix+EuzWmiDlciOF2ZLfP5C
 t/ivzBEPurL2z/apZ15sgExvsnPjDuRSs1X/qz3ut6I5ZV9K0nzHt+TiA2+uTfgroi
 Rw8Ue5BpKwe8mTrwwoFSlrELJ+cKkCONgnYbiCzTAuYXk51Vmo0dt3h1VDbO9tnQMl
 PUe0aUBY4lYpg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 21:24:15 +0200
Message-Id: <20211030192416.4012437-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHeeOoP5VNRUCgwaosQwVh/suMPp9Wqs+/+hvyqAnzRDhmISFh70/jiwT0zxo1HxJWdUBKfpCs8ANZKY4KSNRqeCTHCaLW7aKxYf83vpoIp3M8HbjUiX
 4Or3uSecoSCv7LuCsNXw9By/8kkAcXOjt/3yWBn8PA17wfTwAYhYGLLqwG3UzlUNsekeSjIMxMA0vnp9HzkHTycEQ34mCLkNfzyeaJLzIJpmDSRsXDMIMhuT
 gb5rnds/2WkiTLdiVb6c1HrRf42ljE+fcwFxPHOoQdW8BSu3jc2bj2N9G86GizWPcKAPDhV6J0YyaD8X/TX3hQ==
Subject: [Buildroot] [PATCH 1/2] configs/amarula_vyasa_rk3288: u-boot
 2021.10 needs python3
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using pylibfdt on u-boot 2021.10 we need also to enable
BR2_TARGET_UBOOT_NEEDS_PYTHON3. This fix CI failure:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729667

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 916a639387..ff96019e1e 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -13,6 +13,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
