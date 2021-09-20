Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A51C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:14:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF31461184
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF31461184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E14E404DA;
	Mon, 20 Sep 2021 21:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIFT1Am3JhiI; Mon, 20 Sep 2021 21:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 795BC404CC;
	Mon, 20 Sep 2021 21:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD4E41BF3C6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A867A60AF0
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01PbXFQW22Xv for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 21:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C9A360AFB
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632172410;
 bh=KWCoWS8h2razUevaTcn6Vpr9mQ7avrrZxN8jjxb5XG8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=UKlXV0jJxQA9umerNRiZLi4Wb7xnIpwbkM83CwTXpSgxNBx8hghiTDOBc/D9P0s5u
 yzvdgkTkB2bNqM9WnsEWKZNCnvYa5H+j2LuBdJ6/qtLvr8d/70ieOA3SfKIMKQmHTw
 TyDnVByuAjOKlFQyQB3X7EVjnXc07O8X1I6GARAQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MBUm7-1maumL2CT9-00D13o; Mon, 20 Sep 2021 23:13:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 23:13:26 +0200
Message-Id: <20210920211328.17526-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920211328.17526-1-ps.report@gmx.net>
References: <20210920211328.17526-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VGRYsNJLiqxzG42pKr9LR5aKaJwkyDSc5TjcVs/biy/9S2r7Bca
 2NaBLTTFc64lfnCTYQhTxf/lA6oEyYtWG3Grr5pHRx0u6JtcautWgMHorR8v44bYTAG+13j
 eKtMMpTkW/N/AFLgvqc8LZvNeB443jc8xL5rsPddbNLHKQSF61QkjzQlRn/h0EwWxVAVEmC
 2k5DGja4RmQtJ231sPCww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yHfKwl//xkg=:SNZSkOgsxP9TdOZxHkdyHn
 iO8y1dB8W79Lo9aSAA0iMGFFowkBS+4MnTfLJ2O9LmsC/x+7gPDVnnG1ub2oObu+vRbR19z0B
 G04s1zU5sk7YXN1VkkLyhVRvd+kHpY/piE4ZCCCUbfM423Q8cjJZECe8/nenoe5df5usZvWei
 2dgC1YTVknj1jIBtsOwKSXECKafiN0YoJdi+UbhHcaHs+wDvepwJKrxBXA8FsGr/OVJEggOTN
 m8PRus7ZFOEeIRwROZD6J2WSV4O85Yxx3MTIOF/Rbn5DH6f9Qzl4kVks/0obDgfFGQ70X/aZL
 kOWg00DvNyAjncSGH4emWizmuHpB5H0Ztv162dU8GKRZm82oTFfDjrtIE9hrvjf+mZuGzj12B
 OWSKUHs3eHMr8SRTaGPSPC3ZMLjO0IUNlAQWCvMjMyJsoQjcPkPRm/uKchAYXCWw9vTVMryn1
 9t29DGWFKn88nVn51+3Fs02Kozvt6zMIdvnYpaQkQI0vEx++dRKruQUwbiFXFPE17wT1INDnJ
 DpcgtVdEbZeFbZnS9hAzQ/aYqdVjJBcnnMOwDMK4/UbLOlVemdhGf06VxCdrtetcP3ngDSYu3
 3pGFVuUDcPAlgrkSw9yqg+nXyWPDAuRaWErjYxeBcE8TbSyHXYexMcmmbMJotkuuYosNeseUQ
 VBBONtJxL6YaGuwj8TYEAf1rQi+L08E0JR4Iy61BWzO692VbdslS1mCLwWDjvzREHcKzaIdZp
 utZYON3pMg9SYy95aw0HzklTzqNkLf4HxbSmBPfAHThZhawGGbpnZU5alKwfhy1SwBMBJrLtn
 Hr6We7XsdIYu+KNjN1h9W7zu8jYJjdf+FUkMa8H7HS4jVjow4cBIKVG+sBVAC5xX++yjutUr9
 dg9+z0fQlUJq0VLQheL70AgpAXIDag/4ulTVZ8rvnlYZA5erdxmtkZ1A5HsRDEyzro8Vlc6E0
 YL86aJ2lx1E9IbGijr23YnSZ5JWaGAL4QhIr9hs8VNuPFgRPYq6RRrH9uoOGuUSPTAi7h4/41
 30FVtDenYCmA77w1nVO4lNpzntA0nJTMfijGGlKxA85CuCQJ8fUcefsEPhwUflLIB/ZEGXj5n
 91fyRg6gniYaGw=
Subject: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version to
 9f97081
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7127b2d824..d6243cb54c 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
+sha256  60be376238b08b928f98a25ecf90172067c17ad1db543d813409ee6c54b13b07  rpi-firmware-9f9708199f8809ecf16119d0716375bee7b7d8d4.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 181650fa08..6a2bf05248 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
+RPI_FIRMWARE_VERSION = 9f9708199f8809ecf16119d0716375bee7b7d8d4
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
