Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224A9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5058F6115A
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5058F6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F54833A3;
	Tue, 21 Sep 2021 13:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbpjDdzn36DG; Tue, 21 Sep 2021 13:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6636E83372;
	Tue, 21 Sep 2021 13:28:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58D851BF2F5
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4A5401B7
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lOdnQdK0rpV for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:28:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EFDF4018E
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:28:31 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 066F7240012;
 Tue, 21 Sep 2021 13:28:29 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:28:23 +0200
Message-Id: <20210921132829.56405-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/6] Add support for ISO9660 image compatible
 with Legacy and EFI BIOS
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This series of patches aims to support the generation of an ISO9660 hybrid
image compatible with Legacy BIOS and EFI BIOS. To implement this, we need
to improve the grub2 package and modify the ISO9660 image support

Grub2 was written to build only one configuration at a time. For the hybrid
image we need to have several configuration of Grub2 in the same image.
For example we might want to have Grub2 built for BIOS, EFI 32 bits and EFI
64 bits in the same image. To support this, we chose to fill a list of
configuration name tuples, and then build each Grub2 configuration in a
separate build-$(tuple) folder. It seems simpler than having multiple
duplicated grub2 packages for each possible configuration.

The generation of ISO9660 image was only supporting bootloaders based on
Legacy BIOS boot. We first change the ISO9660 image generation to use
xorriso instead of genimageiso, in order to be able to build an image
compatible with both legacy and EFI BIOS. Then we add the generation of an
EFI System Partition in iso9660 so that we can install the EFI-compatible
bootloader."

In detail:

 - PATCH 1 implements simultaneous build of GRUB for different configurations
 - PATCH 2 implements the generation of ISO9660 image booting on a EFI BIOS
 - PATCH 3 implements the generation of hybrid image compatible with Legacy
   and EFI BIOS
 - PATCH 4 updates the encoding of the text return from testing emulator
 - PATCH 5 add support to i386 architecture to edk2 package
 - PATCH 6 updates iso9660 tests and implements a test for EFI image and
   hybrid image.

Changes in v2:
- Update the typo of Grub2 configuration tuples to make more legible code
- Expand explanation in few commit messages.
- Fix typos.
- Fix Grub2 Legacy builtin configurations.
- Add mkfs and mcopy parameters in iso9660 package to build reproducible
  images.
- Remove the implementation of host-efi-bios package.
- Add support for i386 architecture to edk2 package.


Thanks in advance for your review and feedback

Kory Maincent (6):
  boot/grub2: add support to build multiple Grub2 configurations in the
    same build
  fs/iso9660: add support to Grub EFI bootloader in the image
  fs/iso9660: add support for hybrid image using Grub bootloader on BIOS
    and EFI
  support/testing/infra/emulator.py: update encoding when calling qemu
  boot/edk2: add support to i386 architecture
  support/testing/tests/fs/test_iso9660.py: add support to test using
    EFI BIOS

 Config.in.legacy                         |  24 ++++
 boot/edk2/Config.in                      |  12 +-
 boot/edk2/edk2.mk                        |  12 +-
 boot/grub2/Config.in                     |  53 ++++++--
 boot/grub2/grub2.mk                      | 165 +++++++++++++----------
 fs/iso9660/Config.in                     |  30 ++++-
 fs/iso9660/iso9660.mk                    |  60 ++++++++-
 support/testing/conf/grub2-efi.cfg       |   2 +
 support/testing/infra/emulator.py        |   2 +-
 support/testing/tests/fs/test_iso9660.py |  80 ++++++++++-
 10 files changed, 337 insertions(+), 103 deletions(-)
 create mode 100644 support/testing/conf/grub2-efi.cfg

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
