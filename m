Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37DCC54E71
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ABA1414B4;
	Tue, 19 Mar 2024 21:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OskcaQIrawDl; Tue, 19 Mar 2024 21:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86A8414B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C86A8414B6;
	Tue, 19 Mar 2024 21:37:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A16E1BF95D
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 474A360B55
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDCOf7kg6ImE for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D73D60B45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D73D60B45
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:37:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A147835FC; Tue, 19 Mar 2024 21:37:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 22:15:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f68c45f73334b9c83c44e5bbb3d505050f8b720e
X-Git-Newrev: fde806f8220720b95cb3973fe9d7e55057a1bee7
X-Patchwork-Hint: ignore
Message-Id: <20240319213722.5A147835FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am64x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fde806f8220720b95cb3973fe9d7e55057a1bee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using PLATFORM=k3 can leads to a runtime boot crash on some K3 SoC (e.g.
j721e) because the optee flavor is missing.

We could use BR2_TARGET_OPTEE_OS_PLATFORM=k3 and
BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=am64x but we actually can use
BR2_TARGET_OPTEE_OS_PLATFORM=k3-am64x as explained in the optee-os
Makefile [1]:

  # If $(PLATFORM) is defined and contains a hyphen, parse it as
  # $(PLATFORM)-$(PLATFORM_FLAVOR) for convenience

This is how meta-ti set the optee-os platform:

  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

  meta-ti uses the OPTEEMACHINE to set optee-os platform [2].

[1] https://github.com/OP-TEE/optee_os/blob/4.0.0/Makefile#L37
[2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/ti_am64x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 4bfd31f0c8..097175bd8f 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
