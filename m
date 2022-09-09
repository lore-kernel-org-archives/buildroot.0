Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD47ECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 14:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95A0B6FB54;
	Fri,  9 Sep 2022 14:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95A0B6FB54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HG4SZWLhOD5S; Fri,  9 Sep 2022 14:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966E56FB48;
	Fri,  9 Sep 2022 14:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966E56FB48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56FF81BF2BF
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 14:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF2D6FB46
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 14:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF2D6FB46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_vEBYQE7sSG for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 14:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52206FB35
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B52206FB35
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 14:02:55 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lz22so4242369ejb.3
 for <buildroot@buildroot.org>; Fri, 09 Sep 2022 07:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1S/kY154v1WuJ0YKV9+y0rsctPqgmQP4Tzgqji8ilT8=;
 b=zqG30tSyOzqyVsM/0OWfZip+qd5Q094fsRl0e4xR5TkO81yeqZvfSK8f9QNtz5PVpC
 4fq8/nRAucniVUpDihcvqk2W59rqIIkkIbAprZugyFWDCXB/VfjZoWHg5nvvkekKTPuC
 xhx8mzres/m6RKW4/c8Ntd7QiGNaj6o1eORr8zR//mK+3kLwlHDLVW+9Rl8US61Pp13U
 1DeXt+FjANnLgAJDGIw4LCDAF0rDjux5/T7Vvobg2K+0KK3vZ4kz/LStjc15dHQdrmUB
 Ju7PDL7dmD/RFQDXCnaX5y7mYWtj9+Zp3t7UEIPGF2riDNEpSHg1DvmX3zi863TTkMPZ
 a3JQ==
X-Gm-Message-State: ACgBeo2EkF8KDPmrmZb2YizEYFDeieo3g2xWDQQfyur3BUQA7kUVHm1X
 SrlHbdsuuGFutxQ1cyvI+UcWrEcnvV3Kvw==
X-Google-Smtp-Source: AA6agR5VTlhqLu77TBMh8cVHvzq2TNj/lPwelWie11NmkV8rQiDWFEubEYMS3Hs+lsGTHoF6dITTRw==
X-Received: by 2002:a17:906:c150:b0:745:f66d:a63c with SMTP id
 dp16-20020a170906c15000b00745f66da63cmr10038657ejc.761.1662732169998; 
 Fri, 09 Sep 2022 07:02:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906308d00b00742a4debae1sm346224ejv.6.2022.09.09.07.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 07:02:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  9 Sep 2022 16:02:39 +0200
Message-Id: <20220909140241.909074-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=1S/kY154v1WuJ0YKV9+y0rsctPqgmQP4Tzgqji8ilT8=;
 b=TmeegMOTkHhurt+lB0Mver2/AkoqEt+yO2gVLhnRDp9mhSEvl+u7S/FL8bVQG5wvLd
 OZNIhYnwaAbLUlCNiaO2yHX0OcZBZk2jl89WOAhb9gwxkVuYp36WEl+n54SQdHPRh7rG
 1R29j+WQzZiCi1lHjR+utACzMIqefOFcSyJwo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TmeegMOT
Subject: [Buildroot] [PATCH v7 0/2] Add support for BSH smm s2 [pro] boards
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
