Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B6BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 08:15:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B08610D2
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 08:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12B08610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA49D60782;
	Fri, 15 Oct 2021 08:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZngHBsPwJVva; Fri, 15 Oct 2021 08:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4271360789;
	Fri, 15 Oct 2021 08:15:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9F61BF334
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 08:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56DD660789
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 08:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wq92mlMJYiv for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 08:15:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A12C60782
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 08:15:20 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bIN3mg0jYnxSqbIN3mS5uo; Fri, 15 Oct 2021 10:15:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634285719; bh=NaDAoQ48eJhKiWGMaauDsmHaFquyM3soMfzKlZJ6VPQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=ILakVtEfnM51EBYPwPVs0g0sr3iXs1LRknVTmG489+VJmAWArTbEEUI+BNEr06ZKc
 9PGaeR+xCv8OgssOyvznTb/4SjNZrEXhSk3TrwXNhXbvX63GWH1Gd/SP7fLunuwndT
 A1v3nKijRCgQkLkwU5VOmz8Oi4bS91cVEbnzzWvyrm7HXOjs7E+AQA/SQO2MhtWXzh
 +5E1ljUaFRq9bEFE1Fa+Nzbq3qIm1G6HEKdGs5sLLsfgVNt6+nccJwGLOzxrqf5zzH
 IhPqyAfq0bKsPahFsauYk5SAT05Y98HDW7a6UU1YKZX7tSA36+W3tnEa+ijdpFrwrn
 SAyn4PeSiq6mg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 10:15:14 +0200
Message-Id: <20211015081514.2472764-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e0aa4d38-ef32-8c57-7597-017e86d1ecf8@benettiengineering.com>
References: <e0aa4d38-ef32-8c57-7597-017e86d1ecf8@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfASkHvOtW0YbD7V7FnaAf24+kK6tg/dPMIVGMEuT/Iz0nNOa8kIrPXcvj0AnqIC24amQdDfyJxa8qyAJeJUbapfZVM+4/yhKqvFUY8Ik7ThHfcqp4rgw
 Ge0l7kQ8Vo92WY+/BWw4vg1m4eZZV3O+FJGc8pc0IUoD6YxbMKDtL1r/xwtTSpEaVb+m6HCtqcXogBg5tozv6tnZsZmWIp9WvZaBY8O4Bhg3GgtxHo9+TQwS
 7KHZevrKl1vc1W8INr8ziNZ8wVlDvtl3GL/FiYfeG6L4/6zRiz98aYW4EHEyNmErgJeTxo0wuD4MG11oEpuTi3Efg/8skqKWAlBlidOKYO8=
Subject: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino: fix mali not
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
need to override it with 1. Same goes for drm_fbdev_overalloc that
must be at least 200 for having a double buffer that is required by
Mali. This fixes both olimex_a20_olinuxino_lime and lime2 that use
extlinux.conf.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add double buffer setting too
---
 .../a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
index f754da3623..358bda056b 100644
--- a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label Olinuxino
     kernel /boot/zImage
     fdtdir /boot
-    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 drm_kms_helper.drm_leak_fbdev_smem=1 drm_kms_helper.drm_fbdev_overalloc=200 ${extra}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
