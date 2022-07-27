Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9CBC19F2C
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E2FE403B4;
	Wed, 27 Jul 2022 10:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E2FE403B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbvttX7oW8qj; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F254E40335;
	Wed, 27 Jul 2022 10:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F254E40335
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE10B1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8810E40335
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8810E40335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejC-_myzgUHW for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:58:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5E84020A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA5E84020A
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:58:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v5so10286315wmj.0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=711tRMzvTwaiVTdOCyzgb75ZVFkqJh/qQaI9SnOoiQM=;
 b=Ve57BOLnqlgDtolQuOzqHgUk1XxtBoeqnurRh/f3pqNnp+MX2kctnO2NLz/o7nOL0r
 y7BGW+gXpKBB1AyRKoMIFqvm/PrKv0e+e/T1vNNSYS1vVjKyV8WwgXSx8N3RW0n/+bJ7
 0Fmr7VlAXLJRv4EKKHX/OZh6qzNgD4mZQIy1lpMldPjZ2XoqfTmHS7mtll0VtVZDQRNr
 1X7+8ZS6qLt2rruBrC2M5ciJhNIcb5cabhiZ8MAWRnYbozOSCAO/3S5gUZ1flZ87xSxy
 79t3/Ljz7nHPsKWf8SicwIvHIJgIFJqMRNTYVrJ+V5zUXjrmbz3YEqwgcKEGwtmzIBR3
 bceQ==
X-Gm-Message-State: AJIora8n24Oc4QM4aZ2wmvhs6YdryliJxyTo78K+qREJbKyDFmYtkLb+
 EpnhMCCgJq+s12DlP7UIQePfaDI0yGA=
X-Google-Smtp-Source: AGRyM1sEorLyxGaQoQquTjNq1nPwu+pYREN7NeXmZiYI/S3DHxwQ41EczOOA4ryV27/rzyUqmh9H9g==
X-Received: by 2002:a7b:c4cc:0:b0:3a3:2123:8c1b with SMTP id
 g12-20020a7bc4cc000000b003a321238c1bmr2618483wmk.180.1658919486898; 
 Wed, 27 Jul 2022 03:58:06 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c4f1000b003a2e27fc275sm2189919wmq.12.2022.07.27.03.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:58:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:58:05 +0200
Message-Id: <cover.1658919469.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=711tRMzvTwaiVTdOCyzgb75ZVFkqJh/qQaI9SnOoiQM=;
 b=M5t0xcjxLzhfK5VMwsInjClGTj7q+/ujZguS0IeIQL7orUs9ytmDdMXUxEVDGgNXLD
 reRBemB8kPJa19w7MdZkQobjF0pswizV1/AkB+g+jAQhZydZlDQlAZpwZjnQmjAU6N47
 YOdPZ8FG+pE0HlKRUae5eVvd3tpYP4PSM6eBj8x8KomNvy1blKQzXbWKQyJq1wSQXCGp
 F9tGIaDWvq8yxScILwFjBMcs0BDWEjyC84JpkpLB5f/9js+77SHm8tBL5sVW2p+2M//N
 1huJ1ZO0dISkqZ7ZMDlIGkOOwHDCOwWwQDgEEpCnhCAVeKmi5S4eteUzDDleqSdzbYr1
 036w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M5t0xcjx
Subject: [Buildroot] [PATCH 0/5] arch/cskey: remove (branch csky-in-the-sky)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Guo Ren <ren_guo@c-sky.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series removes support for the csky architecture in Buildroot.

We haven't had a toolchain for csky for a long time, so it means csky
is, for all practical concerns, unbuildable:

  - support for the internal toolchain was dropped in 2021-10-17 with
    commit 547d681b45ed (package/gcc: remove csky version);

  - we have no external, pre-built toolchain for csky.

So, drop the support for csky altogether.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (5):
      arch/csky: drop architecture
      configs: drop csky defconfig
      package: drop csky support in toolchain-related packages
      package/pkg-meson: drop csky reference in ackage infra
      package: drop csky conditionals

 Config.in.legacy                     |   7 ++
 DEVELOPERS                           |   5 --
 arch/Config.in                       |  14 ----
 arch/Config.in.csky                  |  52 ------------
 arch/arch.mk.csky                    |  26 ------
 board/csky/gx6605s/gdbinit           |  25 ------
 board/csky/gx6605s/gx6605s.dts       | 155 -----------------------------------
 board/csky/readme.txt                |  88 --------------------
 configs/csky_gx6605s_defconfig       |  19 -----
 package/Makefile.in                  |   9 --
 package/binutils/Config.in.host      |   3 +-
 package/gcc/Config.in.host           |   4 -
 package/gdb/Config.in                |   1 -
 package/gdb/Config.in.host           |   2 -
 package/gdb/gdb.hash                 |   3 -
 package/gdb/gdb.mk                   |   6 --
 package/glibc/Config.in              |   1 -
 package/linux-headers/Config.in.host |   3 -
 package/pkg-meson.mk                 |   2 -
 package/python-greenlet/Config.in    |   1 -
 package/sedutil/Config.in            |   2 +-
 21 files changed, 9 insertions(+), 419 deletions(-)
 delete mode 100644 arch/Config.in.csky
 delete mode 100644 arch/arch.mk.csky
 delete mode 100644 board/csky/gx6605s/gdbinit
 delete mode 100644 board/csky/gx6605s/gx6605s.dts
 delete mode 100644 board/csky/readme.txt
 delete mode 100644 configs/csky_gx6605s_defconfig

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
