Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F30C7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 10:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A48CE61037;
	Sun, 29 Jun 2025 10:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErQ0gjWCpPhX; Sun, 29 Jun 2025 10:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2C261016
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2C261016;
	Sun, 29 Jun 2025 10:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3628B211
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2886440106
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mD44GLafQGAZ for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 10:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45E174009F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45E174009F
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40CA6847B7; Sun, 29 Jun 2025 10:14:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 11:52:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90e76818a135417d97869b6292cf0590452c3686
X-Git-Newrev: 48639f074c31a53d30002ca7273d9c60c0e9490e
X-Patchwork-Hint: ignore
Message-Id: <20250629101453.40CA6847B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: add option to install
 lpxelinux
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48639f074c31a53d30002ca7273d9c60c0e9490e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lpxelinux is like pxelinux, except it allows retrieving the files for
the kernel (with the KERNEL directive) and initrd (the path to initrd=
in the APPEND directive) from FTP or HTTP, rather than just from TFTP.
Using HTTP or FTP is musch faster than TFTP, so the boot time for big
kernels or big initrds is much shorter than with TFTP.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: fix typo in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/syslinux/Config.in   | 16 ++++++++++++++--
 boot/syslinux/syslinux.mk |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 2891eae013..66baf921d3 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_TARGET_SYSLINUX
 	# Make sure at least one of the flavors is installed
 	select BR2_TARGET_SYSLINUX_ISOLINUX \
 		if !BR2_TARGET_SYSLINUX_PXELINUX && \
+		   !BR2_TARGET_SYSLINUX_LPXELINUX && \
 		   !BR2_TARGET_SYSLINUX_MBR && \
 		   !BR2_TARGET_SYSLINUX_EFI
 	select BR2_PACKAGE_UTIL_LINUX
@@ -27,11 +28,22 @@ config BR2_TARGET_SYSLINUX_ISOLINUX
 	  optical media (CDROM, DVD.)
 
 config BR2_TARGET_SYSLINUX_PXELINUX
-	bool "install pxelinux"
+	bool "install pxelinux (TFTP-only)"
 	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'pxelinux' image, to boot off
-	  the network using PXE.
+	  the network using PXE and TFTP.
+
+config BR2_TARGET_SYSLINUX_LPXELINUX
+	bool "install lpxelinux (TFTP, HTTP, FTP)"
+	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
+	help
+	  Install the legacy-BIOS 'lpxelinux' image, to boot off
+	  the network using PXE, and TFTP, HTTP, or FTP.
+
+	  Note: a TFTP server is still required to serve the
+	  lpxelinux boot image; HTTP or FTP can only be used
+	  by lpxelinux to retrieve the kernel (and initrd...)
 
 config BR2_TARGET_SYSLINUX_MBR
 	bool "install mbr"
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 084acc398e..127f6b3cc1 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -105,6 +105,7 @@ SYSLINUX_POST_INSTALL_TARGET_HOOKS += SYSLINUX_POST_INSTALL_CLEANUP
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_LPXELINUX) += bios/core/lpxelinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_MBR) += bios/mbr/mbr.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.efi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
