Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376DEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 21:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2C882778;
	Tue, 18 Jan 2022 21:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x05M4MZVc373; Tue, 18 Jan 2022 21:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C468276B;
	Tue, 18 Jan 2022 21:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 408421BF33E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D3BE414C1
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xC7ZuqLz1UCa for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EA1C4149F
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642540476;
 bh=f16fV5zdiISe4Ey7K8rPPCKDhjALlnZJsK+bndZ26y4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HPltwwDOZLQVkLPfAfVsZUWuSJe1xDxhkwTrmVXNayFNJjedZd6DDRdU3KtQlbGyM
 A5Rfx4geT74oDHVmj7ovmG7OU3zme9DFE14nu+tVYK363aTkpzprmBVwIIc3wR/I1d
 jesK4s2UhC0ttRwwpSsHxYZNR3XbdskWvLR2z5A8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MnJhO-1mQvsG2I5s-00jFht; Tue, 18 Jan 2022 22:14:36 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 22:14:30 +0100
Message-Id: <20220118211434.9854-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118211434.9854-1-ps.report@gmx.net>
References: <20220118211434.9854-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:38I/3KbHoJKCPPgJ/GWLcMpRjmkIkG5SOoRaR4p95wd5Wk0tuLo
 rhmrMgNgoN2l6GqPoYVxba22RtzqecJBO8tCmWldr005w/ArlI2eQxikKiGSKDfcGtAtbb7
 W+On14MDnKdOoKDZb8aiT67LB1WNvb7/AZXjiTONItLvpMYIx2fvoywfO5XR3h3g+AtM2XZ
 BG2RVln9/v2Ag8epC9NGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EAOFVGFzbVg=:yQ9pgl3TrKJ6o7USFadMx2
 fNAAyiRzo1MnIWLnvETnlBwq8fry22t4OMnzVBf6ok2YtEuS93oCTbFurJZ/jyeyQusIB34a4
 hoM247j8o+By84QihOqANI6PG/SKUXgufLD9ifBNZSS2A1y7jHKxQNjrcLItJG6mrHLbhk//u
 FfbeguA1tlJxRDYgKAGODc1XWC/wPXOZOCvZsK4XVF+iFHgBm3dUIBYjQpi2RyAGyMdC50bln
 /QCnoE/zuD9z8fn72tH2Eun+qQp5wga1paEdjWweZzXjFl1xi/UPh4USwFlm8WSErrEcAGq2J
 S0/ER544Emc0RTYX/hglN36tMBG+gM5a7hIrDF19z+NCB3fCuNFIPK4SB775AHRf6p4vmJ0Cf
 UjxbvFfRvvF+ZMQMqkQqQnSuPhCSZUOHUZ55Y+Uh5zUe8z1VSUirQwjZse2yxluIvOaAmanp5
 YjpAFnQ7irvg5Eln7dWtLvYSF0MHmt2B62JGiysHFafAgW5K8Zk2juA8fAYLWP+mGquOKlSSz
 T2oGsSdT7Q4ZElsBBUCR9Ewf0y4n5pg4b2SKHJQ4ANgWOWKkljofnCrLZiHwcv+qGMmkFYDmw
 WTJE1u9IZKikq9NURKGPWao61zSj4Xu27PX69tJTZro3eqhK+bP9Eqs1paBCc3MaWoyoouse7
 V28Hxl7iPlS8nZrImA0hfWW9ozNlVfYTMYH4CvkdNKGGAWoECX3vUfq2gEwzCv5WiYOyT27ep
 AbQ+Y36Tyc6PYvAq6RkGcWUTSySxpV2KrXFTh7i1iIFpPET/vRVMzbUGR1xJzaEiKl9zDloDb
 2dKEmRZBIOcuo13r7CkAIBPGNI1pzZkgdrpT2BJPs9rxVrcUxn9Te9G4UEEeerPwLE/AZtcOW
 cfKfEPHLMYeRO3r/v9xfH7CX23aDwQEAdfYTg425l0W3p5UMGgJ4Hovwl/0dKb+TIbRNhKwYF
 DM86sZqjj4q29pWD5YFo4iX4wPx49Uvwy5iHPhmvbLolJAoiGJK46WarUfp9oG7GPCHKWXp/q
 ttb5y7nLwdKie1A5Ge3cElIdZtPVc7eIeACaZKlKi8jgY9K89d6dHT+1QLkXIIQhTLQZzVMrk
 P3pygLdLUikjj0=
Subject: [Buildroot] [PATCH v1 2/6] package/rpi-firmware: bump version to
 3f20b83
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  095deea759 kernel: overlays: vc4-kms-v3d: Change composite handling
  2e9b609e53c kernel: Bump to 5.10.79
  12bc6e36773 firmware: dtoverlay: Rebase aliases in overlays like labels
  24d966d35bb kernel: Bump to 5.10.81
  ca52e7c1303 kernel: edt-ft5x06 touchscreen fixes
  1a0297bfbf7 kernel: Bump to 5.10.82
  0a1a871d04c kernel: Fix for IN Token of USB Endpoint 1 stopping occasionally on Pi 4
  303d0012cd7 kernel: Bump to 5.10.83
  bd8b6d5dc8e kernel: Bump to 5.10.85
  56f1b8bbc88 kernel: Bump to 5.10.87
  536baf33ae9 kernel: Bump to 5.10.88
  ce71e3e9b34 kernel: Bump to 5.10.89
  19b570d0d6a firmware: arm-loader: Fix kernel8.img selection on 2837 with arm_64bit=1
  fbbde90b709 kernel: drm/vc4: fix non-working audio on RPi3 and no video with DVI
  165bd7bc562 firmware: improve firmware camera detection
  318e3373496 kernel: Bump to 5.10.90
  175984a6dc4 kernel: drm/vc4: Add alpha_blend_mode property to each plane
  20c5829b0af kernel: Bump to 5.10.92
  3f20b832b27 firmware: arm_loader: Only clip min/max to the same value for turbo clocks

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7cbfd1b249..ec13115f3b 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a079a31fc80a23421589edcacef94faa713b12d3e77b92710ae2594c8d549477  rpi-firmware-fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25.tar.gz
+sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f773f83999..b46a7f5270 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25
+RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
