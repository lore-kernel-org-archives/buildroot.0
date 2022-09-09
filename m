Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2F2ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 12:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD9640053;
	Fri,  9 Sep 2022 12:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD9640053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9CQexabHA_H; Fri,  9 Sep 2022 12:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A286E4058C;
	Fri,  9 Sep 2022 12:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A286E4058C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE9F1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 12:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26B784104E
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 12:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B784104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evOak5k2L1jq for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 12:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 271DA4102F
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 271DA4102F
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 12:55:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id lc7so3869318ejb.0
 for <buildroot@buildroot.org>; Fri, 09 Sep 2022 05:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8pn7tR8d0MXAzi7JcA16P1gUj16jqe2Y4+SNI2xuPxI=;
 b=3MMnx9iN4Zxz8LFNXheyDGAsWE7K+t4jrou1TbXPObczihQ93ZX0GuT8MDafaZzC9U
 m2Bs//lrrofWxEtFCBRToQOnnQG7ny6JvYHT686VCD1tRChUnG31ReBBxyGz6s0BqDn/
 PyS5M+dbHxCmbaQ3ruByK/2QLS8mfRBcykt9lwPF+TZZAQuGfUCPd1Vu8iq5K8kNDPnL
 Nashu5wdNKJKfOvA34TeulL0ocMF2V6RBi3tf3KkpmQ4PqcCp14QwyKNhCelYSX5aY15
 HDBCyaJ4h4Tr05RUpJkfaTn74eWFgXlU+f0KGQvhNZ+56pt6sYr9OmACg9lSAoJmvnCb
 51fQ==
X-Gm-Message-State: ACgBeo18iN2PTz2GCUUQlK/3Irb097TyA9W14v7p7SKwjU5FZGB9AOjO
 kc9P/94sI13kytsQsWnycZAWwi3YjHHPUQ==
X-Google-Smtp-Source: AA6agR65KmRvf7mtwgdS8Dfdgr8Gf+XjOKX1XOoe/zp+e210CBIUt91Aq1PActMWIBp0xikPOX5GQQ==
X-Received: by 2002:a17:907:2e0b:b0:730:8aee:d674 with SMTP id
 ig11-20020a1709072e0b00b007308aeed674mr10059012ejc.104.1662728140383; 
 Fri, 09 Sep 2022 05:55:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a170906315800b0073d15dfdc09sm277577eje.11.2022.09.09.05.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 05:55:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  9 Sep 2022 14:55:26 +0200
Message-Id: <20220909125528.897612-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8pn7tR8d0MXAzi7JcA16P1gUj16jqe2Y4+SNI2xuPxI=;
 b=iz9vp+UPVrWuoLDNnWE7V1fVe7KVi3gm8EAaw25buwQYyoywZ/RuXWgQYnWJ2VBrCj
 RWIIVXW/iNqqAcvkdyfjS1xuZrNQCjRDT5bruCyqT9PPEVVf1IxagxcVYcO83BFMTfzj
 iXyK4VeL2/0jG/mVV2MQN7M+iCFd1SJAfUpjE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iz9vp+UP
Subject: [Buildroot] [PATCH v6 PATCH 0/2] Add support for BSH smm s2 [pro]
 boards
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
 linux-amarula@amarulasolutions.com, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series adds support to BSH smm s2 [pro] boards.

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
