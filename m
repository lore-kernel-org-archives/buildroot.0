Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D30C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 21:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAA460B99;
	Mon, 16 Jan 2023 21:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EAA460B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPdoSPge0xcn; Mon, 16 Jan 2023 21:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C55D60E64;
	Mon, 16 Jan 2023 21:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C55D60E64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6C2D1BF20D
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E26404F9
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E26404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qbqTO5soc2i for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 21:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34BBF404F5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34BBF404F5
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 21:55:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id tz11so6653455ejc.0
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 13:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B6NdMeeIC69c5WQqlR+Rd1vX2frQ14XBmA8PK404bOo=;
 b=0Sc+kOaShpmJnsJ3jeuaH27yRS0Z6ZAbjLATA87v4ubHtatja2le7yq72Bj8p8ZShU
 NiHsms5DHAB16Bl4P2HsOKYRXYXpLgypcjHikdKS0DwxFSeslU8/L77LMHb+NkVdvYdb
 MWdITxoy81d3HUViyDTfa45t2ZyNnizLVfamitsgy5xbvfNE1qafC6x8C9nen53pULjP
 KnoVq9rHGCy9nkg3xY6ChIRIe1bVEcMEs3ne56TLoDaEGjQDfs85K50pv+GSkyWzVVNw
 MFEhI51MKAF8MDTTeuleYpNBJby1MlqpCE7u5wWjsJ9QRMnwBIJfCKkuimfjadBd+z8T
 pstg==
X-Gm-Message-State: AFqh2koUHoucS1GRzWUZbyy3g2SWfKElCKkzZVGPZ3x8cj0mTybLPMub
 yF0yKoFqHNhLMRmEISdUJlLPCRZbViMMNHXP
X-Google-Smtp-Source: AMrXdXscniUnfbEkqvwmZz9GamsDjprTclmCTqpDgueW8ErQ7O/xJ9yJ9UgEn8IB1BR9f9gr763npw==
X-Received: by 2002:a17:907:6746:b0:84d:1c67:97d7 with SMTP id
 qm6-20020a170907674600b0084d1c6797d7mr553656ejc.30.1673906120268; 
 Mon, 16 Jan 2023 13:55:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-75-145.net.vodafone.it.
 [5.90.75.145]) by smtp.gmail.com with ESMTPSA id
 vw22-20020a170907059600b0084d43def70esm764255ejb.25.2023.01.16.13.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 13:55:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 22:55:14 +0100
Message-Id: <20230116215516.264468-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B6NdMeeIC69c5WQqlR+Rd1vX2frQ14XBmA8PK404bOo=;
 b=nVYOLcEkv9Y5fx973ejju53kpO1pp3yAv8NTcNbui6An1eEdRzuXmPH94cpUy1uZN5
 qt04DAyvcscyfl+2akqRYCJJYWq1QXhaO6QijD7Cb0HeLWPhW8mfNfTH6eA79JEjV3Qk
 Li61go56w0+cup2/rXIehI/uMdnoZAsci/BjQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nVYOLcEk
Subject: [Buildroot] [PATCH v9 0/2] Add support for BSH smm s2 [pro] boards
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 thomas.petazzoni@bootlin.com, Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series adds support to BSH smm s2 [pro] boards.

Changes in v9:
- Bump Linux kernel to version 6.1.6.
- Remove the Linux kernel patches because they have been merged into
  the used version.

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
 ...Remove-rootwait-1-to-all-the-affecte.patch | 160 ++++
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh     |   4 +
 board/bsh/imx8mn-bsh-smm-s2/readme.txt        |  75 ++
 configs/imx8mn_bsh_smm_s2_defconfig           |  41 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  42 +
 15 files changed, 1407 insertions(+)
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
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
