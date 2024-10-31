Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B135E67486
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC3E407E2;
	Thu, 31 Oct 2024 21:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJ-__MJRnsIv; Thu, 31 Oct 2024 21:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70EFC407E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EFC407E3;
	Thu, 31 Oct 2024 21:34:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BBF05B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CDFF80EAB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9GbCZLsA8Ax for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 045038169E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045038169E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 045038169E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AA8EEB0054E;
 Thu, 31 Oct 2024 22:34:18 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Oct 2024 22:33:40 +0100
Message-ID: <20241031213348.2057705-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410462;
 bh=vakmMF7HQ2D/Xx7dts9pG/ch23V8US2reS1CznBIOds=;
 h=From:To:Cc:Subject:Date:From;
 b=BVdICabg05qxRa0Zjb9h39MskUPl7X3CMtgqm09r/wg8tL88pW/CV3+Kgzcwskwlb
 EuJHXFpHcftlsQEozx3Z2byRPLZpU/NvmoNZhj7ZrjZs2xfpjxlDvU7AJOHCG85zol
 hNqPauTf7pcKOqOKZKFq52/JXAzo53SiSiAXB0AD8KN8Bu+CpAJPXUxQgOR9C39Jah
 xaIdaguHhpSoLLps0/1K8P6m85T44+hSFa5+v86ZBaW9tAQaZki993e0VMjlxLdQsT
 Cs5FDbsw+LPkc2DY0tt6kqnqVaM/oXZ6+iFSxk1ctE46KysSnCOrWpw+D9ovmIpYPs
 j879tWJ53qZ8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BVdICabg
Subject: [Buildroot] [PATCH v3 0/8] *** Fixes for
 qemu_aarch64_sbsa_defconfig ***
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This v3 of the series extends the v2 posted at:
https://patchwork.ozlabs.org/project/buildroot/list/?series=430015&state=*
by addding new patches to fix runtime tests.

I only added comments in the commit log in patch #3 and #4.

Note that the Buildroot mailing list may alter the edk2 package
patch by converting CR-LF newlines.

This patch series is also available at:
https://gitlab.com/jolivain/buildroot/-/commits/fix_edk2_tests/

This series was tested with commands:

    make qemu_aarch64_sbsa_defconfig
    make
    output/images/start-qemu.sh

    utils/docker-run make check-package

    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder \
        tests.boot.test_edk2

    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder \
        tests.boot.test_grub.TestGrubAArch64EFI

    utils/docker-run support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_fwts


Julien Olivain (5):
  support/testing: disable tests using edk2 on aarch64 architecture
  support/testing/infra/emulator.py: add build host dir to qemu search
    path
  support/testing: test_edk2: update and re-enable the test
  support/testing: test_fwts: update and re-enable the test
  support/testing: test_grub: update and re-enable the test

Romain Naour (3):
  configs/qemu_aarch64_sbsa_defconfig: update ATF to v2.11
  boot/edk2: bump to version edk2-stable202405
  configs/qemu_aarch64_sbsa_defconfig: switch to neoverse-n1 (armv8.2a)

 board/qemu/aarch64-sbsa/readme.txt            |   2 +-
 .../arm-trusted-firmware.hash                 |   1 +
 ...oDxe-add-feature-PCD-to-remap-frameb.patch | 129 ++++++++++++++++++
 boot/edk2/edk2.hash                           |   2 +-
 boot/edk2/edk2.mk                             |   2 +-
 configs/qemu_aarch64_sbsa_defconfig           |   7 +-
 package/edk2-platforms/edk2-platforms.hash    |   2 +-
 package/edk2-platforms/edk2-platforms.mk      |   2 +-
 support/testing/infra/emulator.py             |   6 +-
 support/testing/tests/boot/test_edk2.py       |   6 +-
 support/testing/tests/boot/test_grub.py       |   2 +
 support/testing/tests/package/test_fwts.py    |   4 +-
 12 files changed, 152 insertions(+), 13 deletions(-)
 create mode 100644 boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
