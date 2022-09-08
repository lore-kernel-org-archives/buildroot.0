Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5DFC54EE9
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B2A84048D;
	Thu,  8 Sep 2022 19:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B2A84048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiLTus1HOWBx; Thu,  8 Sep 2022 19:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250D34032B;
	Thu,  8 Sep 2022 19:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 250D34032B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE7E11BF4D8
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 19:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 973C180B06
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 19:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973C180B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3h5yU_GS0Wss for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 19:20:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F0280AF6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44F0280AF6
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 19:20:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id l14so16869185eja.7
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 12:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=TuCHvNcoqWntR59xww2ZnzmZB5/rfj64ZSDJHG3a9Sk=;
 b=bmE1yEepoEFh8OZa4GQkldGJUcTrL+ERS1aq28kn3fYzrffP45uTOeZy28dJAuxYT3
 DYXX0HZLz34oR3SJd5XjKunQplz6mdsntTuLmslLbmv1+TyAAuvp9iasUd141d40/yEY
 PrncUvvqWXpvn5kKw4BcMZiq4sqb5yjYvSz5SSReMb07vvEn/NPP4SUAvDnCrMAVam3F
 fJfQR28frqHOS2zL2D+ybXfGMCatm5ly/KMUt5xAjw9V3F2bwDdfRy0fabPpiispVG5A
 aztR2ktsZXVlRr7D1ZCtqaPlnpfMjh3yu6aqlIFRQM1oUS8a7rDpknFJTr/O5GNLhavM
 paMA==
X-Gm-Message-State: ACgBeo0ce6fPABMvbOMnEJqWY3sUt/NO5Wf/ZW7r/1ukjtMmmdE31WYH
 8lGrXENFArAD4mDubJ2vBnpIMoTDEiWwEQ==
X-Google-Smtp-Source: AA6agR7OAWMlIQKTB5Zo+7kg7uQiLQFLRzkVqPWmUod3sznLoLDcBScfVxbHkx5ZHDh+9VmVbKL0LA==
X-Received: by 2002:a17:907:8686:b0:773:6f77:f110 with SMTP id
 qa6-20020a170907868600b007736f77f110mr3989292ejc.547.1662664800777; 
 Thu, 08 Sep 2022 12:20:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 ke23-20020a17090798f700b007417041fb2bsm1567514ejc.116.2022.09.08.12.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:20:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Sep 2022 21:19:02 +0200
Message-Id: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=TuCHvNcoqWntR59xww2ZnzmZB5/rfj64ZSDJHG3a9Sk=;
 b=AjPfR+S8wR2ULpjjgVtKRRdHKw6I42TcAX4MepampZX8ODYYA0zSYHy73/8CK84m0N
 g5+1gLSWGXiBMQ9giicn6h2xyq8p6iUdsdmEWejP5sOiXM7bkv0GhXlXgwm3+uiN+a6u
 aE1Y8Z/EceZvYjHrNcHIopL56MNZ8CMWEhgIQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AjPfR+S8
Subject: [Buildroot] [PATCH v5 0/2] Add support for BSH smm s2 [pro] boards
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series applies the changes requested by Giulio Benetti to the v4 patch
for adding support to BSH smm s2 pro board ([1]). It also adds
the support for the BSH smm s2 board.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220131145555.2819020-1-michael@amarulasolutions.com/

Changes in v5:
- Update the commit description.
- Bump the kernel version to 5.19.7.
- Remove the 0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
  patch.
- Regenerate all added patches (Linux kernel and U-boot) so that they contain
  the [PATCH] header without numbering.
- Add patchwork link to U-boot patch.

Changes in v4:
- Update the commit description.
- Bump the kernel version to 5.18.19.
- Shrink the Linux configuration.
- Add 3 dashes to the kernel patches to avoid having the version history
  to fall into the final commit log.
- Add lore.kernel.org links to the submitted patches.
- Apply the 0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
  to the kernel.

Changes in v3:
- Update the commit description.
- Bump U-Boot to version 2022-07.
- Remove U-Boot patches merged in version 2022-07.
- Update the Linux patches.

Changes in v2:
- Drop the patch that added the 'uuu' package. It has been merged.
- Patch 1/2: "configs/imx8mn_bsh_smm_s2_defconfig: new defconfig":
  - Change commit subject and description.
  - Update linux patch to version 4. It hasn't been merged yet but has
    been reviewed. This is the most up-to-date version.
  - Replace `Co-developed-by:' tag with `Co-authored-by'.
  - Use the buildroot's output directory if the binaries directory is
    not passed as a parameter to the `flash.sh' script.
  - Replace the linux.config file with an architectural defconfig and
    a config fragment for the changes.
  - Remove useless and deprecated statements in nand-full.lst.
  - Remove the buildroot configurations for ext2/ext4 filesystem creation.
- Patch 2/2: "configs/imx8mn_bsh_smm_s2_pro_defconfig: new defconfig":
  - Change commit subject line.
  - Use the buildroot's output directory if the binaries directory is
    not passed as a parameter to the `flash.sh' script.
  - Replace the linux.config file with an architectural defconfig and
    a config fragment for the changes.

Dario Binacchi (1):
  configs/imx8mn_bsh_smm_s2_defconfig: new defconfig

Michael Trimarchi (1):
  configs/imx8mn_bsh_smm_s2_pro_defconfig: new defconfig

 DEVELOPERS                                    |   8 +
 .../common/imx8mn-bsh-smm-s2/linux.fragment   | 895 ++++++++++++++++++
 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |   4 +
 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      |  23 +
 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  |  17 +
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |   7 +
 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |   3 +
 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    |  73 ++
 board/bsh/imx8mn-bsh-smm-s2/flash.sh          |  26 +
 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst     |  29 +
 ...ine-mxs-use-platform_driver_register.patch |  45 +
 ...2-dmaengine-mxs-fix-section-mismatch.patch |  39 +
 ...Remove-rootwait-1-to-all-the-affecte.patch | 160 ++++
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh     |   4 +
 board/bsh/imx8mn-bsh-smm-s2/readme.txt        |  75 ++
 configs/imx8mn_bsh_smm_s2_defconfig           |  40 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  41 +
 17 files changed, 1489 insertions(+)
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/linux/0002-dmaengine-mxs-fix-section-mismatch.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2/post-build.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/readme.txt
 create mode 100644 configs/imx8mn_bsh_smm_s2_defconfig
 create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
