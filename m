Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D0C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A47A2405C2;
	Fri, 29 Jul 2022 13:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47A2405C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LVNM_5sR_Rf; Fri, 29 Jul 2022 13:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5EF540412;
	Fri, 29 Jul 2022 13:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EF540412
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8551BF2C6
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 13:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0769A416C2
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 13:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0769A416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYWvUpsmtZFe for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 13:17:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07AC040977
 for <buildroot@uclibc.org>; Fri, 29 Jul 2022 13:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AC040977
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 470F5868F0; Fri, 29 Jul 2022 13:03:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 29 Jul 2022 13:17:29 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wg@grandegger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14926-163-JGjOw8QLNm@https.bugs.busybox.net/>
In-Reply-To: <bug-14926-163@https.bugs.busybox.net/>
References: <bug-14926-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14926] package/nodejs: build for host fails with
 GTEST errors
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

https://bugs.busybox.net/show_bug.cgi?id=14926

--- Comment #5 from wg@grandegger.com ---
I'm able to reproduce the issue with:

$ cd buildroot
$ git checkout -b test 60ff1d619db65d797147855b7c1163c327ef6c88
$ make pc_x86_64_efi_defconfig
$ make menuconfig
select glibc
select g++
select gtest and gtest gmock
select host-nodejs
$ make host-gtest
$ make host-nodejs
...

The issue also shows up with todays update to 2022.02.4
(9dd3bb1963bc906c72146d9872462bf493d512ac)!

Below is the defconfig used:

$ cat configs/pc_x86_64_efi_defconfig
BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_GTEST=y
BR2_PACKAGE_GTEST_GMOCK=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_WIFI=y
BR2_PACKAGE_CONNMAN_CLIENT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_NODEJS=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
