Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D8BC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 09:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA95416D9;
	Tue, 13 Dec 2022 09:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA95416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQOVGPBNuW6e; Tue, 13 Dec 2022 09:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BB5416ED;
	Tue, 13 Dec 2022 09:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BB5416ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7AD81BF27E
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 09:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1028408A3
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 09:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1028408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESpyMC0Ntimr for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 09:22:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4264140350
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4264140350
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 09:22:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id co23so14942867wrb.4
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+BTiZz718ni0k/Zj4oZnYvHlODmDvt4YNE47iImkJo=;
 b=objgbT+BIwF85wQpPJb0yuZfguNKfTg5aMPwywZG5jQuMg9XRh2eX+Hf+3gn++O/+Y
 NHz6X0hNge5/TcsjGFX9PLGDbfMNBofhpa3ZWxEAzfG5zbeQBCkaOvHY1+0q6Pwdjbot
 RQrzCGRNp6w4yS5PzPEyvHXSc2V/Er9zrL6O94Pb9dU/d0bNtpoBykFCfIR1W1VvEggz
 LNjAk5xXgnF9L/Vs8fEv0oRgsmdBZKVgJ4Fe0TKKEz/xnPdIlemjGh1JtZ4gcrg5aL5q
 KiqNuoDKDQ3Wgp3JaXK/mrwSqDIPXj9UsnRobMv65RFkCIG3AHlAfopucQvjcdW1OUdm
 CJIA==
X-Gm-Message-State: ANoB5pl37bwjnNLcqA23pW6ESTBCrnGgrF2eM6/8XhHkpt/uah56MoH8
 GGdnv2SFbpVtWu6UonS34iPgSan2BteBHRtb
X-Google-Smtp-Source: AA0mqf6KsjjcqCASCWE58WjuptJSZKsTr92l/XGlv3Ac/UMITTP/NMdxOedAivF0ly43J69qfI2idQ==
X-Received: by 2002:adf:d4c1:0:b0:242:6485:4cd7 with SMTP id
 w1-20020adfd4c1000000b0024264854cd7mr11900294wrk.1.1670923320167; 
 Tue, 13 Dec 2022 01:22:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-141-116.net.vodafone.it.
 [5.90.141.116]) by smtp.gmail.com with ESMTPSA id
 n3-20020a056000170300b002368f6b56desm13502281wrc.18.2022.12.13.01.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 01:21:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 10:21:54 +0100
Message-Id: <20221213092156.136389-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+BTiZz718ni0k/Zj4oZnYvHlODmDvt4YNE47iImkJo=;
 b=EZerQDGZ1+omF6eVZISOLNIogWebIuEpt7COvFJLiFw4ELYaVv3gx0Eq/ZuCCdrMRz
 YK6r6M42MqgaZGK8GNm8dlpEmY9CTqukLZlxCxfkHTHtUZB/Ie4TyatKkSinAcgzithG
 dkzQOwe5gZ3bCncFuVXB71Yr2vlFS8fKOQ80E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EZerQDGZ
Subject: [Buildroot] [PATCH v8 0/2] Add support for BSH smm s2 [pro] boards
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
 linux-amarula@amarulasolutions.com, thomas.petazzoni@bootlin.com,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series adds support to BSH smm s2 [pro] boards.

Changes in v8:
- Rebase on master and fix conflicts on DEVELOPERS file.
- Set BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y,

Changes in v7:
- Add Giulio Benetti Reviewed-by tag.
- Add Heiko Thiery Reviewed-by tag.

Changes in v6:
- Change offset in imx-boot partition of genimage.cfg from 33k to 32k.

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
 configs/imx8mn_bsh_smm_s2_defconfig           |  41 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  42 +
 17 files changed, 1491 insertions(+)
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
