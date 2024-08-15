Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9763EC52D7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CBFA60727;
	Thu, 15 Aug 2024 19:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWeDOe7IE48e; Thu, 15 Aug 2024 19:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF3B608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF3B608FB;
	Thu, 15 Aug 2024 19:59:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36EC01BF20B
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2483040C13
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcfEN9SLIyK6 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 19:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F24740C03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F24740C03
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0678185EDF; Thu, 15 Aug 2024 19:59:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 21:58:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2675686cdc4f2255084b86dd2195e42bac7af4b
X-Git-Newrev: b8160fb4643fb8ce123638b60692d76143994ed6
X-Patchwork-Hint: ignore
Message-Id: <20240815195917.0678185EDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_zcu10*_defconfig: add
 missing U-Boot build dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8160fb4643fb8ce123638b60692d76143994ed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled,
the following error occurs from U-Boot.

  tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: No such file or directory
     18 | #include <uuid/uuid.h>
        |          ^~~~~~~~~~~~~

The U-Boot defconfig these boards use 'xilinx_zynqmp_virt' enables
CONFIG_MKEFICAPSULE, which requires util-linux.

This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This
is because host-e2fsprogs requires host-util-linux, and
host-util-linux always builds before host-uboot when single-threaded.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/zynqmp_zcu102_defconfig | 1 +
 configs/zynqmp_zcu104_defconfig | 1 +
 configs/zynqmp_zcu106_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 3f1726a13f..df5eba7ca0 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index b6d943333f..793a677ab2 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu104-revC"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 970ed40d2c..fdf5e80795 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
