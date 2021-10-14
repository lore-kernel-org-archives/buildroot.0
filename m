Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99145C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:36:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0854761041
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0854761041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A296740534;
	Thu, 14 Oct 2021 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYUeeJvYrhPl; Thu, 14 Oct 2021 21:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C49A404B7;
	Thu, 14 Oct 2021 21:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6FA1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9657F82F80
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4t_l8qPIESHk for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:36:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4CDA82F50
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:36:32 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8Osmwrs0XRKtb8OtmFfCN; Thu, 14 Oct 2021 23:36:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634247391; bh=ImjT1Pcz/ep5P4WY6n+r5FlQmlSU09lFGhFh9SzL14I=;
 h=From:To:Subject:Date:MIME-Version;
 b=EcEffivVJI4JWdqdTanjWKLPU6KK0XgR6lC5w6opI3kwtg8LJPuClpnGunZ2kRz5S
 IQFYxDQTzen7onTdBMNCBnM1kaAfMwR2sdkvyLJ5sXnHslZhQ8rH/pplMAPIFfKW6X
 t8PE8y/JL++TJso27cJI5VzVPG+YCh/KUSYfnmFZELO7Hl5xi3B9Yey89Af7zzsWYX
 atdBfq6LrLsA2pm72PAP9FyTEeJAV5UjFk21VvOPTyJSffQRoZx21tcUeRV0TRQcce
 yBoKp+LZPYXL1FOMUAj8MXgVmZUMSSFlKJUOIuKRURH1zacBqRHFwybbo2/VaJWL0M
 pYgjvXmh+XD2g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:36:30 +0200
Message-Id: <20211014213630.2436055-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMx6sOVHzGt4Vejt/5PBfbn3IOgjW9YYLAnqHN6GUcNzllPnxeAM39wGhEAYyb0OlkOrBgL5XQZbgCmZgUKLvrQ/vIT9sry5ixkN2TV8Uf3+2tiD/wz6
 cbKLgSHi0ihqQlfB00Si//GvIkuzdYY63p0ipwt9+xzTQoROaY0SW7vcvbmORGAPk1kXGvCMBjkB7etjVCKwhB4sBGONFO9lCPrvRsAoRJODcDWZ4goVpXBP
 WjebB3VMVkdRJ/C4z71L44/gc5Hj8fXYtJTR47BIplTe6GeZtRtM4r3whime3jrNx/BUH3Fr6YdXzComx677BZTBQ/nyQtPl65PlBhVaCBA=
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino: fix mali not
 working because Linux version >= 4.20
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since on olinuxino_lime/lime2 we have a Linux version >= 4.20 we need to
pass drm_kms_helper.drm_leak_fbdev_smem=1 to kernel command-line that
really enables DRM_FBDEV_LEAK_PHYS_SMEM. CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
only adds the code for this, but drm_leak_fbdev_smem is 0 by default, so we
need to override it. This fixes both olimex_a20_olinuxino_lime and lime2
that use extlinux.conf.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
index f754da3623..25ee0c349c 100644
--- a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label Olinuxino
     kernel /boot/zImage
     fdtdir /boot
-    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 drm_kms_helper.drm_leak_fbdev_smem=1 ${extra}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
