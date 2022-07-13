Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381EBC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 06:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B298140242;
	Wed, 13 Jul 2022 06:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B298140242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEP9LdTwR8Vi; Wed, 13 Jul 2022 06:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1872640162;
	Wed, 13 Jul 2022 06:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1872640162
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7CD31BF4D6
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 06:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C091F400EA
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 06:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C091F400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iLIK3jXhSHY for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 06:31:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F1AD40162
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F1AD40162
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 06:31:01 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10be0d7476aso13003710fac.2
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 23:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BN2XJovqbAeYvwC/hW/CRmol4MH8WPLc9X8xcb8bNuQ=;
 b=DQlDcfLa2qJESAvHoN9m1TTJDPMkFXlI9XN+hWyKIj6aaiBv9LdTHPOY2lhHkeOg7w
 e9Q2tdbTLABobM+5hs9/KWD42PUA36feB+sNMsKTxV2g9M1971RXAqiW7dS4tTpnnrbf
 JynnGvoptSKPjVPYcUX+miGH9HEGu8CI7Km+YyWDlq277kvKi5ey6B4Dbd+GpOYhxcYR
 dMdnPsKH8yGEaEoBf0uiX/fAlQ1UbqPy5zK2OTK7b6qlh1yLTXYMUqISi/12q5+iiYvC
 7bu6iTBzI8HFVIF2877jH3dK4OyKvW8cLzUR93SMtVR0RSa8abbkLAb6vtdX8+kLdpnm
 4uJQ==
X-Gm-Message-State: AJIora88KuVQa48gyjhiGOlRfjwrMx0ovv3FxD+hTpKkvazk/GHdV78P
 QscO//O4dNbP1+IjB0A+3QqDyohg3SypEQ==
X-Google-Smtp-Source: AGRyM1t/sQIa+4DcAzqdPAmC5Pq3XupbAuziKZBaVQMa3PYgEdwXyI67wVAyE09VdAI6JCd392SJhA==
X-Received: by 2002:a05:6871:611:b0:10c:b18e:9f1a with SMTP id
 w17-20020a056871061100b0010cb18e9f1amr3784043oan.251.1657693860039; 
 Tue, 12 Jul 2022 23:31:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (mob-5-90-140-209.net.vodafone.it. [5.90.140.209])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a4ab30a000000b004354a4412edsm2335404ooo.29.2022.07.12.23.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 23:30:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 08:30:32 +0200
Message-Id: <20220713063034.14924-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BN2XJovqbAeYvwC/hW/CRmol4MH8WPLc9X8xcb8bNuQ=;
 b=dK8JccSdEy1yLA9boWMd6BHVxFT9/fDkRZROp5VECcCNhBK0rxXuUc6VkYxZGlBAhB
 puQIWWIEqJnoZp9/0KVWm6CYV1ZuMcijMtB50MA86YN+mvMLtCZJ6/7EQ3XjLtwzdjG1
 dILRZZh5Xnfc6thZPijiq7uGXEvEsj5nmALCE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dK8JccSd
Subject: [Buildroot] [PATCH v3 0/2] Add support for BSH smm s2 [pro] boards
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series applies the changes requested by Arnout Vandecappelle to the
V3 patch for adding support to BSH smm s2 pro board ([1]). It also adds
the support for the BSH smm s2 board and It builds the uuu package, used
for flashing the boards, as part of buildroot.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220131145555.2819020-1-michael@amarulasolutions.com/

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
