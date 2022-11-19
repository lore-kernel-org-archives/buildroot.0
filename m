Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E4C433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 17:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E1C408FB;
	Sat, 19 Nov 2022 17:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E1C408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXAMe1s9qT5r; Sat, 19 Nov 2022 17:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7B340898;
	Sat, 19 Nov 2022 17:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED7B340898
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11F751BF292
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE933813AA
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE933813AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEghMhVPHqjZ for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 17:16:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72F5E8132A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72F5E8132A
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 17:16:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i64-20020a1c3b43000000b003d016c21100so271440wma.3
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 09:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pN6VkqjnaaMTaRUNV1GYLSz45eBw158LVZVq3mZuFrg=;
 b=syI5YI2Ysd8NJVJ65DQLT3AbqLVTVvmhC/GXMC28ksF1kKNJ+/f5NZ4+GPtNIzmdd0
 SVCR5YZqWDeM2V4EmmZiuvOAC+l0/RIxksNsuqVFKPCOyhzAQBNZ5IqAc9e+dSPJWDN6
 fPlvoG5P6pZYKeBpZ1p7sWSm3YGUsiXvsaduGZ3S7g8WbvKfVhm4TAdYF8R81aK8VdbK
 kymoAVS7JaZrvAp44Gw3pEQiaabJUor9pwwWXuAOpyMYOYq5Y9VwuPMgvvKXT0/XlGXp
 4rZ+i3ki2FPXv3WIHYlYCyTs8OJPsUaFkpASkagBEMyp9NlJsXw4NWUgL80sK3hrGn/1
 +Hkw==
X-Gm-Message-State: ANoB5pmtwhz3IkQ7NB2AYKqsTj9jdLUn01hqej7EMRFj/OdJvljpKG5A
 O9y9iwedDAfURAm8cL+UsYjUjTynE2g=
X-Google-Smtp-Source: AA0mqf5IVzZMq/j6uX50K8268ABwc1NWA0hLUv8Zq8eauCE3/mAE38mbH86MEVxrbGGKb5BpV+MZIA==
X-Received: by 2002:a05:600c:54cd:b0:3cf:67ae:3a4a with SMTP id
 iw13-20020a05600c54cd00b003cf67ae3a4amr11762333wmb.22.1668878171551; 
 Sat, 19 Nov 2022 09:16:11 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b003cf4ec90938sm8854383wmo.21.2022.11.19.09.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 09:16:11 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 19 Nov 2022 18:15:46 +0100
Message-Id: <20221119171549.26487-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pN6VkqjnaaMTaRUNV1GYLSz45eBw158LVZVq3mZuFrg=;
 b=cXGP+R+4IwSJSSVR3eDw62tdkI+Rf2InMH7uAU+3AyaaKTPIfXKkO61Qb1Wnr5iVDy
 Su9fNouR7N5QK/jSmARaUyEP3tJ7/BJz31Yxy+EIp5ZTd0FTLkLM7L7l4JTxFRqHyGEC
 pYl+CbgcBx0xMBfveXRgvZekkfSsrBdspPjVBBCdDvrSablSPRu59e7u7obCIfIJ5b3C
 NDLlksVEvCW4O5iIfkfA6BpOBvufwxXYiyKc6j4Q0ULJV3Bs7JuVz28i2Rt3yN8pCA+H
 o3NFMF937QZFOGkEgIPNPI+iklNz5oloIe7cPwWGorb4xjT1SQXygsozOKzF65J+v66k
 e6SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cXGP+R+4
Subject: [Buildroot] [PATCH 0/3] LS1028ARDB improvements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package qoriq-cadence-dp-firmware is dedicated to the NXP LS1028 SoC.
It was introduced since BR 2022.02 from a Changming Huang's serie (5 versions between 2019-Nov and 2020-Feb).
This serie tried to introduce the board NXP LS1028ARDB with a partition boot.vfat containing
the kernel image, the dtb and the cadence DP firmware.

The board NXP LS1028ARDB was introduced on 2022-Aug from my own serie.
This serie uses a single rootfs partition and a extlinux.conf file.
The patch concerning the cadence DP firmware has been set aside at this time (between v3 and v4).

Now, this current serie finalizes the support of the board NXP LS1028ARDB,
especially the point concerning the cadence DP firmware.

Francois Perrad (3):
  package/qoriq-cadence-dp-firmware: add install in target
  configs/ls1028ardb: add video with Cadence DP firmware
  board/freescale/ls1028ardb: more documentation

 board/freescale/ls1028ardb/readme.txt         | 27 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  2 +-
 configs/ls1028ardb_defconfig                  |  3 +++
 .../qoriq-cadence-dp-firmware.mk              |  6 +++++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
