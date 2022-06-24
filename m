Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16ADC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Jun 2022 14:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3011D83EF8;
	Fri, 24 Jun 2022 14:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3011D83EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mINk6EFCg3ia; Fri, 24 Jun 2022 14:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1071B8006F;
	Fri, 24 Jun 2022 14:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1071B8006F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5952F1BF40F
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43D3408D2
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43D3408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eneejo0eHFOy for <buildroot@lists.busybox.net>;
 Fri, 24 Jun 2022 14:47:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98FE40157
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A98FE40157
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 14:47:18 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id fd6so3806422edb.5
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 07:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsrlWgQEOQ5sRj1J7fsQZfcrl5/8f1fmcDVnLgkosyk=;
 b=HehOzG7OXZADdkS+rLFTCzQgX1HJSOcG07Q4gP4Z5iJL+Voy+NmvcKipwmXS9IqwtO
 0Ngqd2Y8FWWXgEgbdhCiduOzQYtlDSC28eZ6HHa6i+wtZvLYiIHFpH37soWB+UgMYRaf
 0b0vJ2eG3UuOiS9E/kp9d++lvqcZs83VS4ViLlEubj2STGLskCwxOXq/TTZBKl+0AWYU
 eYSqrqj4Dt3oHK2bFcGEzJpGbi9KlRZLbyX7ijPDxzx3510yBV0gP04YhVE34yZhP54K
 xOpng5BkLwTiRVZrgHIQmUB/t0BqfANWLcVbUqZTTEbRlXupSG+6g1dzhxmjg6sR6e4D
 UunA==
X-Gm-Message-State: AJIora+/QL7pg+UbUdhsgoihTy+TMv/9vFHsFn7SS9Smlh5siu2oXqWq
 dYu/l7bADVr8sSuDXmmUKtQZA3sP0ZmSkw==
X-Google-Smtp-Source: AGRyM1sqKSMh3dYn+5KhufPaaz+89enLmHp9qH2kEnsdSy9QRleBlZs+zAKRfELJJmeo93WNmoMyyA==
X-Received: by 2002:aa7:c857:0:b0:433:5c62:ddbc with SMTP id
 g23-20020aa7c857000000b004335c62ddbcmr18117706edt.218.1656082036643; 
 Fri, 24 Jun 2022 07:47:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-80-116-90-174.retail.telecomitalia.it. [80.116.90.174])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a1709061ed000b006fe8ac6bc69sm1254274ejj.140.2022.06.24.07.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 07:47:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jun 2022 16:46:59 +0200
Message-Id: <20220624144701.1404198-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsrlWgQEOQ5sRj1J7fsQZfcrl5/8f1fmcDVnLgkosyk=;
 b=PxRADSjZIGEUNynXiiHkpvcAU+8Daui1HXC5lvgWFAcsCh2SybZPAcMJxw2CB1+tNy
 bIaeFDGhuZoS+nlmI7Fe5bu2/ahQwpNaYWnZ4iG1O4OvWY15mmardvuwkeLA8IIwgKzJ
 NQ3LyCbLL21oU4Fj9ZiPIODWLpfmlhp1WagR8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PxRADSjZ
Subject: [Buildroot] [PATCH v2 0/2] Add support for BSH smm s2 [pro] boards
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
 Dario Binacchi <dario.binacchi@amarula.solutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series applies the changes requested by Arnout Vandecappelle to the
V3 patch for adding support to BSH smm s2 pro board ([1]). It also adds
the support for the BSH smm s2 board and It builds the uuu package, used
for flashing the boards, as part of buildroot.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220131145555.2819020-1-michael@amarulasolutions.com/

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
 .../common/imx8mn-bsh-smm-s2/linux.fragment   | 931 ++++++++++++++++++
 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |   4 +
 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      |  23 +
 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  |  17 +
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |   7 +
 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |   3 +
 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    |  73 ++
 board/bsh/imx8mn-bsh-smm-s2/flash.sh          |  26 +
 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst     |  29 +
 ...dmaengine-mxs-fix-driver-registering.patch |  69 ++
 ..._nand-Fix-specific-hook-registration.patch |  78 ++
 ...-mxs_nand_spl-Fix-bad-block-skipping.patch | 165 ++++
 ...x-cmd_nandbcb-fix-bad-block-handling.patch |  95 ++
 ...d-Fix-bad-block-handling-in-fitImage.patch |  42 +
 ...h-to-nand-spl-load-instead-of-romapi.patch |  30 +
 ...Remove-rootwait-1-to-all-the-affecte.patch | 159 +++
 ...gs-imx8mn_bsh_smm_s2-add-NAND-driver.patch |  42 +
 ...s-imx8mn_bsh_smm_s2-add-UBI-commands.patch |  29 +
 ...sh_smm_s2-remove-console-from-bootar.patch |  32 +
 ..._bsh_smm_s2-add-mtdparts-to-bootargs.patch |  30 +
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh     |   4 +
 board/bsh/imx8mn-bsh-smm-s2/readme.txt        |  75 ++
 configs/imx8mn_bsh_smm_s2_defconfig           |  40 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  41 +
 25 files changed, 2052 insertions(+)
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-fix-driver-registering.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-nand-raw-mxs_nand-Fix-specific-hook-registration.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0002-mtd-nand-mxs_nand_spl-Fix-bad-block-skipping.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0003-arm-mach-imx-cmd_nandbcb-fix-bad-block-handling.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0004-spl-spl_nand-Fix-bad-block-handling-in-fitImage.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0005-board-bsh-Switch-to-nand-spl-load-instead-of-romapi.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0006-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0007-configs-imx8mn_bsh_smm_s2-add-NAND-driver.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0008-configs-imx8mn_bsh_smm_s2-add-UBI-commands.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0009-configs-imx8mn_bsh_smm_s2-remove-console-from-bootar.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0010-configs-imx8mn_bsh_smm_s2-add-mtdparts-to-bootargs.patch
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
