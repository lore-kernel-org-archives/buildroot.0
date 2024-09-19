Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51D7CE8D46
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 04:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBBC8496D;
	Thu, 19 Sep 2024 03:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys9kXUjoxfE7; Thu, 19 Sep 2024 03:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F003A8495F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F003A8495F;
	Thu, 19 Sep 2024 03:59:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9E21BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0688440142
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXnw4PWiMqcA for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
X-Greylist: delayed 369 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Sep 2024 03:59:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81B2440109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81B2440109
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81B2440109
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6CAB7353746C; Thu, 19 Sep 2024 05:53:36 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:52:59 +0200
Message-Id: <20240919035308.2622723-1-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718016; bh=Dale3D3s9Xw3scHoqP8OuYX4lNLj0X8OoERVBwdoPxU=;
 h=From:To:Cc:Subject:Date:From;
 b=C73XC32Civ62ylqDiHvbAcgFm02mYH6e9vmaYvYWo6JIixkB/LxJaWB77MGuvmm2/
 t8BBe0++yjfSxQZWAoQTtev8D98l6YWGQUEJD1+/eqRK7tXxTOyp+Vkb9UZDBUFVcw
 bxzfguZmdErnCqUIOU+4FCV9LfdcX1VQHADHUuEYmfVvo2Ln8LbSxwQPaD4Kg++2Hs
 G7FoNQThszsN395T65ud7eDahZnmGjsU6f8nZ7pkIDrcUNAk9rhvncY9OWnzJjGxL/
 7m9v0lp23SVxRL6bCirQvgy+gdUZyBdzkwsBmFzXJ6mpCRUpJnuYQu42q2qwldIhzH
 8SQl9J27wwiIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=C73XC32C
Subject: [Buildroot] [PATCH 0/9] add ARM FDPIC support
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

This series adds support for ARM FDPIC for noMMU boards.
This is a combination of Ben Wolsieffer, Dario Binacchi
and my work. 
Tested on a STM32F746 Disco board without stability issues.

Ben Wolsieffer (7):
  Revert: "arch: drop now useless support for FDPIC"
  arch: don't enable FDPIC binaries by default
  arch: make FDPIC dependent on toolchain support
  arch/arm: add support for FDPIC
  boot/uboot: pass -mno-fdpic if FDPIC is enabled
  linux: pass -mno-fdpic if FDPIC is enabled
  package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC

Dario Binacchi (1):
  configs/stm32f746_disco_sd: new defconfig

Waldemar Brodkorb (1):
  package/busybox: remove STATIC from busybox-minimal.config

 arch/Config.in                                | 15 +++++++++
 .../stm32f746-disco/extlinux.conf             |  4 +++
 .../stm32f746-disco/flash_sd.sh               | 22 +++++++++++++
 .../stm32f746-disco/genimage.cfg              | 27 ++++++++++++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32f746-disco/post-build.sh             |  4 +++
 .../stm32f746-disco/readme.txt                | 31 ++++++++++++++++++
 boot/uboot/uboot.mk                           |  5 +++
 configs/stm32f746_disco_sd_defconfig          | 32 +++++++++++++++++++
 linux/linux.mk                                |  8 ++++-
 package/Makefile.in                           |  6 ++++
 package/busybox/busybox-minimal.config        |  2 +-
 package/uclibc/Config.in                      |  2 +-
 package/uclibc/uclibc.mk                      |  7 ++++
 toolchain/Config.in                           |  4 +++
 18 files changed, 184 insertions(+), 3 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f746-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746-disco/linux.fragment
 create mode 120000 board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32f746-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/readme.txt
 create mode 100644 configs/stm32f746_disco_sd_defconfig

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
