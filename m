Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A594DC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7233E407B4;
	Wed,  7 Aug 2024 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgT63dyz1pkM; Wed,  7 Aug 2024 22:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2445B40772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2445B40772;
	Wed,  7 Aug 2024 22:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7151BF98E
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AFDA608CB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Jhqe1nEke8X for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E42E06077E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E42E06077E
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE9ED84705; Wed,  7 Aug 2024 22:07:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 23:10:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aed5bccfee20686c0ce8f076d998e36b63260729
X-Git-Newrev: e1aacc3049e03bd788fc58b9233bf5a93f2613a1
X-Patchwork-Hint: ignore
Message-Id: <20240807220741.DE9ED84705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: move to
 official source for tf-a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1aacc3049e03bd788fc58b9233bf5a93f2613a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARM_TRUSTED_FIRMWARE_SITE is currently pointing to the deprecated
ARM-software github read-only mirror[0] which is no longer publishing
new tags. They do have a newer github mirror under the TrustedFirmware-A
organization[1] which continues to receive tag updates we could use
however because of the way github generates tarballs changing the SITE
to point to TrustedFormware-A changes the pre-calculated hash values
for every version for everyone.

Without much way around changing all hash values if we want these latest
tags, lets drop the github mirrors and move to the official git
source[2] so we can download real tarballs which shouldn't change even
if the ARM_TRUSTED_FIRMWARE_SITE moves again and hopefully preventing
this from ever happening again.

[2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/
[1] https://github.com/TrustedFirmware-A/trusted-firmware-a
[0] https://github.com/ARM-software/arm-trusted-firmware

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 .../beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 2 +-
 .../stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 3 ++-
 12 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a0..6f02bfbb22 100644
--- a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a0..6f02bfbb22 100644
--- a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a0..6f02bfbb22 100644
--- a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a0..6f02bfbb22 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c9d043c46f..8b3df439a0 100644
--- a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 74fe35c9bc..0b99949745 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
+sha256  c9f0d0bf967d690edbf34b621728a6271856f2e26ed46081a285b6d627a358c5  arm-trusted-firmware-v2.7-git4.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b69a5a964..2bc5030cf2 100644
--- a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  06d32acf42808b682859008292f0591d2d872f19aa1a8021bfcd1c1c626285e6  arm-trusted-firmware-v2.9.tar.gz
+sha256  72df0928138de111bf5e75fae47f88a4d1b4930ad52b7902e2b53e117be650c8  arm-trusted-firmware-v2.9-git4.tar.gz
diff --git a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8f60864fbf..f0635a6652 100644
--- a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7494e04ead..d68ac4bd30 100644
--- a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7494e04ead..d68ac4bd30 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 73ab431b9f..660edb121e 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
-sha256  e55ae7105c996b60f748b2eb6adeaf5ac8946425e1d4294ecc1c56aebf435274  arm-trusted-firmware-lts-v2.8.13.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+sha256  695ae232fef6da931157e032b520f145b2c4cbe675d92b6a12222a332e960e89  arm-trusted-firmware-lts-v2.8.13-git4.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index abf917948e..1b2cc3a236 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -16,7 +16,8 @@ ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUST
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 else
 # Handle stable official ATF versions
-ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
+ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
