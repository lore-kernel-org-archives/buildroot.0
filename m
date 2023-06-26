Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F5EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33594085D;
	Mon, 26 Jun 2023 16:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33594085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xim0cyvbs-l3; Mon, 26 Jun 2023 16:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBEB41902;
	Mon, 26 Jun 2023 16:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBEB41902
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D39601BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD17561324
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD17561324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eooi8ouVSFRw for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:00:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47518612EC
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47518612EC
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:00:38 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-666e916b880so1724280b3a.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795237; x=1690387237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aVg9GhVM1UwVUwPu9bvUx1TJZLWNRTvqSZqq+67iMK4=;
 b=CcnzlSSmks6zUJmAs0FUvYY20Bg6EtbCEnLzWqNoVUfcaAew6jghwZRac5kKq3cW+1
 ZqvmE0kzFwxhDbVgb/hck/cLhVbl/Dkjkhdk1osb23t1Vtq/u+HrUrxq/+1T8SyZBVy7
 VYYDn4uv6EfHT71i3aFs9CrNjphFR2qleaXsjG2f2DiuntfIS42EBFQIg/yWLyYaBOng
 TC2pUGuychwnIfqNN+yyeC5PCQcMgyV0eMJxFFo+JqAVspgpMPgJE6cXpNwjc/0w1/Jo
 BnnSx8vSpqbKcdMuI9ZneTnGkeLUlEtRuGCYuvPuUv/RQ3cfrG6eCoZ0BxF1hBjSCxTI
 u6eg==
X-Gm-Message-State: AC+VfDxyS2LvICtQ7sGETwk3KrsrAc92MgsaHRj5SOr0iZWQL8ZDQMuz
 QfHXqH5LVB+442Zsv1dhzpNALVXHPLG5mw==
X-Google-Smtp-Source: ACHHUZ5DL9BJ/tillsBGeX4rCp1FpyanYG1Ov11JgskX1LZQ9RlFt0keiw5CsE4A2ITYF1D4EDyRNw==
X-Received: by 2002:a05:6a20:4c9e:b0:126:99e7:6ca4 with SMTP id
 fq30-20020a056a204c9e00b0012699e76ca4mr3989030pzb.29.1687795237181; 
 Mon, 26 Jun 2023 09:00:37 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:00:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:20 +0800
Message-Id: <20230626160030.93063-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795237; x=1690387237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aVg9GhVM1UwVUwPu9bvUx1TJZLWNRTvqSZqq+67iMK4=;
 b=ARArW0Mdws7SFk6T2O04ahp3zp0HD4y1F2+BrSudxT9j0Q85cobsPzDZXr7A6rboS4
 joky9qgvaQHGTjx6a+hGwEPiYimxHyM2q7r4qKtoJ1nKhIxZBPttAf4Syi5r109UPFD4
 7uVSbZfSjkWbRoj2hRh3Hf8b64bXArCXzEI/I4WSUmXOi+/hja1LKre0t2Hz5jl3RwLf
 D1c6muW1bOT38fPnY+4KoBUXPNeo6itCbHCtxAXOVOG+/jAj+qierYEPliro//vEIgoQ
 jC2zuJxTjBYim1ivzLAnM7kMihbaDFxhJZljOXv65LNR+rl835WlmgqmmlCWvfufguMw
 fRPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ARArW0Md
Subject: [Buildroot] [PATCH 00/10] riscv: Various fixes and small
 enhancements
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A bug report [1] was filed recently against HiFive Unleashed board that
it did not build. Although I could not reproduce the build failure, it
does make sense to upgrade the OpenSBI version for this board, as
discussed in the bug report.

Now OpenSBI version is bumped up to 1.3 in this series for all RISC-V
boards. For HiFive Unleashed board I decided to use the latest U-Boot
release as well, which requires some new changes.

The Kconfig options of RISC-V boards have been cleaned up. Instructions
of using QEMU to test the HiFive Unleashed board images are added.

[1] https://bugs.busybox.net/show_bug.cgi?id=15658


Bin Meng (10):
  configs/hifive_unleashed: Update to use OpenSBI 1.2
  configs/hifive_unleashed: Update to use U-Boot v2023.04
  configs/hifive_unleashed: Enable BR2_RISCV_ISA_CUSTOM_RVA explicitly
  configs/beaglev_defconfig: Enable BR2_RISCV_ISA_CUSTOM_RVA explicitly
  arch/Config.in.riscv: Remove BR2_RISCV_ISA_CUSTOM_RVA from
    BR2_riscv_custom
  configs: riscv: Drop BR2_TARGET_OPENSBI_CUSTOM_VERSION
  boot/opensbi: Config.in: Cosmetic style fix
  boot/opensbi: Bump to version 1.3
  board/sifive: hifive-unleashed: Update rootfs offset
  board/sifive: hifive-unleashed: Include QEMU instructions in
    readme.txt

 arch/Config.in.riscv                            |  1 -
 .../sifive/hifive-unleashed/genimage_sdcard.cfg |  1 +
 board/sifive/hifive-unleashed/readme.txt        | 17 +++++++++++++++++
 boot/opensbi/Config.in                          |  6 +++---
 boot/opensbi/opensbi.hash                       |  2 +-
 configs/beaglev_defconfig                       |  1 +
 configs/hifive_unleashed_defconfig              | 10 +++++-----
 configs/nezha_defconfig                         |  2 --
 configs/qemu_riscv32_virt_defconfig             |  2 --
 configs/qemu_riscv64_virt_defconfig             |  2 --
 configs/sipeed_lichee_rv_defconfig              |  2 --
 configs/sipeed_lichee_rv_dock_defconfig         |  2 --
 configs/spike_riscv64_defconfig                 |  2 --
 13 files changed, 28 insertions(+), 22 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
