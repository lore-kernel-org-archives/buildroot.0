Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EECC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F3F60187
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11F3F60187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE59D60784;
	Sat, 30 Oct 2021 23:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfTI58U9mysi; Sat, 30 Oct 2021 23:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E3A60763;
	Sat, 30 Oct 2021 23:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6754C1BF956
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6185F60763
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLS8tamgJW2y for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:05:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60736605FE
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:05:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gxPvmoViVrIRlgxPvm6swm; Sun, 31 Oct 2021 01:05:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635635140; bh=LW9GE7JQGmgjZFbru+W9dCRFryQFgbFleA6yoOCdlWI=;
 h=From:To:Subject:Date:MIME-Version;
 b=HzuSF9RlEQfbXpiw7o3f1m8b9eqq9jQMrGpCXZfPUz4SBiDo5kpJfzuA+qXA6nqKt
 HFy0aoKs0IrlW1LJj8K9n8s8U20HPaQeyHMfeO1eoDub2isxvXdPFMfKRaxo7GUk5N
 mgR3RNb+xiXSodiB3HE8FgQv1QVdJ49KQFPlc3mqxbiqXqOf3P6uMfd8uXWyQcjJ0w
 Sb8WBYsymzzI3Iluhi8b6kmspYz6J83olftvZY2DxGci5ngZ4w7nHc08jAY8iyFZRy
 rNqpzUyN9JK+HYQw7YC+bk2IjmMLjbZ6pv5xe4bNCC6dIG7ULKJ2ZNJfG61KDAPttb
 woisPilN0ntug==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:05:38 +0200
Message-Id: <20211030230538.3494204-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030230538.3494204-1-giulio.benetti@benettiengineering.com>
References: <20211030192416.4012437-2-giulio.benetti@benettiengineering.com>
 <20211030230538.3494204-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHjMvyhjwChBmc9ENWVJBVEHelc6bFG4NxB0vLqza0/qsHxxND/FvmhZ3ukmemSQb/nKZQ8Nv+2/9pUad+gB1OpVDY24Ic1tlfw0CydtIEZTrLQIE8o8
 Damcu8QaLslGTzh+Y8rTelBCmpBSpzAt3bF05TYWimxGIGnyJOQ+VB+AO2UIioCHrxkJLNLvxY93NcbOMTBc8uV3I0rhL49S0CgVv1W5c0liAQrmB4nif+It
 5Lbz0PyDRAUQW8dvSn6LLgbIf2Qxlvi7O0/v9OuhAp6GD0aRaMR4PCrbcvggXo0AmP2Xzv753V/Fxgw7/+LSpg==
Subject: [Buildroot] [PATCH v2 2/2] configs/asus_tinker_rk3288_defconfig:
 u-boot 2021.10 needs python3 and pylibfdt
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

Uboot 2021.10 needs python3 and pylibfdt so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729725

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* reword commit log adding Fixes: tag
---
 configs/asus_tinker_rk3288_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 609d061b61..6963fa939f 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -13,6 +13,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
