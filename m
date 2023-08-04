Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2EAC001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 20:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7073414C5;
	Fri,  4 Aug 2023 20:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7073414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PX8xgG2K-8d1; Fri,  4 Aug 2023 20:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE99841C03;
	Fri,  4 Aug 2023 20:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE99841C03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5AF51BF328
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08B0A82031
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B0A82031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2m64m5CHnb_J for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 20:16:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDEA821DA
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDEA821DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27CC2841F1; Fri,  4 Aug 2023 20:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Aug 2023 22:16:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdbe83166ff7b2bbc6d3c71e404be81df61ce431
X-Git-Newrev: 837ab4708cbfb8f44ec2da23ef23e0a0dfa8eb7c
X-Patchwork-Hint: ignore
Message-Id: <20230804201631.27CC2841F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc64*: remove binutils
 version from defconfigs
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
Content-Type: multipart/mixed; boundary="===============5066506720009144528=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5066506720009144528==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=837ab4708cbfb8f44ec2da23ef23e0a0dfa8eb7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot 2022.05 use binutils 2.37 by default, but the binutils
version was downgraded to the previous binutils version in qemu_ppc64*
defconfigs due to a bug in binutils 2.37 [1].

Later when binutils 2.36 has been removed the binutils version has
been updated to 2.38 (even though it was already the default version
selected by Buildroot at that time) [2].

Since then, several binutils release has been added and the binutils
version 2.38 has been removed recently [3].

Since the initial bug is gone with the removal of binutils 2.37,
we can safely remove the binutils version from qemu_ppc64 defconfigs.

[1] 1e2fe860f3a261fc877591c056808d6fb30e25d4
[2] e461c9adc82a889deb6e259ce811193cb8d00f36
[3] 1391c99d627d27c55bec99072b3ae4d78be02c74

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4798047373

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_ppc64_e5500_defconfig      | 1 -
 configs/qemu_ppc64_pseries_defconfig    | 1 -
 configs/qemu_ppc64le_powernv8_defconfig | 1 -
 configs/qemu_ppc64le_pseries_defconfig  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 0ab7e8e76f..6839f2f0ba 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc64=y
 BR2_powerpc_e5500=y
 
 # System
-BR2_BINUTILS_VERSION_2_38_X=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 92fe3a11f6..896d209675 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 
 # System
-BR2_BINUTILS_VERSION_2_38_X=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index cb086ba248..e23fcd4695 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 
 # System
-BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_SYSTEM_DHCP="eth0"
 
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 001d614c3b..fa8e2a09d3 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 
 # System
-BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_SYSTEM_DHCP="eth0"
 

--===============5066506720009144528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5066506720009144528==--
