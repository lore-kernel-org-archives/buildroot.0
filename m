Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A5EC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D51A612A6;
	Tue, 15 Apr 2025 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaxo5Lz2yOcr; Tue, 15 Apr 2025 19:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7718D61299
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7718D61299;
	Tue, 15 Apr 2025 19:51:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A91B108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19751404BD
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUcf00XY4CVg for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45428405BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45428405BF
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FD5484925; Tue, 15 Apr 2025 19:51:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:34:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd02add21b4d79f1dc7ac03c6a804858de15774b
X-Git-Newrev: 7361a155ef420a58ebe1f8f360b141a926b6d8b2
X-Patchwork-Hint: ignore
Message-Id: <20250415195155.2FD5484925@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: drop dependency on tf-a for
 macchiatobin
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2759704226215024996=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2759704226215024996==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7361a155ef420a58ebe1f8f360b141a926b6d8b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building a firmware for the MACCHIATObin with edk2 and
arm-trusted-firmware, the build can randomly fail with the
following make error:

    make[1]: Circular output/build/edk2-edk2-stable202411/.stamp_configured <- arm-trusted-firmware dependency dropped.

The message appears also when the build is not failing, depending on
the number of parallel jobs and the build order.

The issue can be observed with the following commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
    BR2_TARGET_BINARIES_MARVELL=y
    BR2_TARGET_EDK2=y
    BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN=y
    BR2_TARGET_MV_DDR_MARVELL=y
    EOF
    make olddefconfig
    utils/brmake
    grep -FC5 'dependency dropped' br.log

The circular dependency happen due to [1] and [2].

In fact, only TF-A depends on EDK II (passed as BL33) for building and
not vice versa. See [3]. The EDK II "SolidRun MacchiatoBin" platform
build does not need any TF-A image, compared to some other platforms
such as "Socionext DeveloperBox" or "QEMU SBSA" which are referencing
TF-A images in a hook added in EDK2_PRE_BUILD_HOOKS.

Drop the false dependency on TF-A to fix the build.

This issue has been present since the EDK2 introduction in commit [4].

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02/boot/arm-trusted-firmware/arm-trusted-firmware.mk#L121
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02/boot/edk2/edk2.mk#L118
[3] https://github.com/Semihalf/edk2-platforms/wiki/Build_firmware
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/1074a37e783b023bd0491ba4f4f7acab7f289e1d

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/edk2/edk2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 3941d01883..bc4049b2de 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -115,7 +115,7 @@ endef
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
 EDK2_ARCH = AARCH64
-EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware edk2-non-osi
+EDK2_DEPENDENCIES += host-dtc edk2-non-osi
 EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
 EDK2_PLATFORM_NAME = Armada80x0McBin
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)

--===============2759704226215024996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2759704226215024996==--
