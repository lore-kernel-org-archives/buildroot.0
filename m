Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0417C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7638461108
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7638461108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3198280EB3;
	Tue, 14 Sep 2021 09:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBvLQcIsQoAI; Tue, 14 Sep 2021 09:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43EFD80EA3;
	Tue, 14 Sep 2021 09:35:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A928C1BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 893D340222
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfKm1S-ky20p for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 777A840211
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 53B6EFF806;
 Tue, 14 Sep 2021 09:34:57 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 11:34:49 +0200
Message-Id: <20210914093457.1389174-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/8] Add support for ISO9660 image compatible
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
Cc: thomas.petazzoni@bootlin.com
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
 - PATCH 2 enables zlib to host-xorriso package
 - PATCH 3 updates the generation of ISO9660 image to use xorriso
 - PATCH 4 implements the generation of ISO9660 image booting on a EFI BIOS
 - PATCH 5 implements the generation of hybrid image compatible with Legacy
   and EFI BIOS
 - PATCH 6 updates the encoding of the text return from testing emulator
 - PATCH 7 implements host-efi-bios package to download the EFI binaries
 - PATCH 8 updates iso9660 tests and implements a test for EFI image and
   hybrid image.

Thanks in advance for your review and feedback

Kory Maincent (8):
  boot/grub2: add support to build multiple Grub2 configurations in the
    same build
  package/xorriso: build host variant with zlib support
  fs/iso9660: switch from cdrkit to xorriso to build ISO9660 images
  fs/iso9660: add support to Grub EFI bootloader in the image
  fs/iso9660: add support for hybrid image using Grub bootloader on BIOS
    and EFI
  support/testing/infra/emulator.py: update encoding when calling qemu
  package/edk2-images: new package
  support/testing/tests/fs/test_iso9660.py: add support to test using
    EFI BIOS

 Config.in.legacy                         |  16 +++
 DEVELOPERS                               |   3 +
 boot/grub2/Config.in                     |  40 ++++--
 boot/grub2/grub2.mk                      | 165 +++++++++++++----------
 fs/iso9660/Config.in                     |  30 ++++-
 fs/iso9660/iso9660.mk                    |  59 ++++++--
 package/Config.in.host                   |   1 +
 package/edk2-images/Config.in.host       |  26 ++++
 package/edk2-images/edk2-images.mk       |  32 +++++
 package/edk2-images/rpm2cpio.sh          |  58 ++++++++
 package/xorriso/xorriso.mk               |   4 +-
 support/testing/conf/grub2-efi.cfg       |   2 +
 support/testing/infra/emulator.py        |   2 +-
 support/testing/tests/fs/test_iso9660.py |  83 +++++++++++-
 14 files changed, 417 insertions(+), 104 deletions(-)
 create mode 100644 package/edk2-images/Config.in.host
 create mode 100644 package/edk2-images/edk2-images.mk
 create mode 100755 package/edk2-images/rpm2cpio.sh
 create mode 100644 support/testing/conf/grub2-efi.cfg

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
