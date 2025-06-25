Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC739C7EE32
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 10:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E7B9613FD;
	Wed, 25 Jun 2025 10:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kti7o49c3Y1O; Wed, 25 Jun 2025 10:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939CB60DF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 939CB60DF7;
	Wed, 25 Jun 2025 10:01:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE32B154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B48DB83EA0
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O62P1teesFre for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 10:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B780683E68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B780683E68
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B780683E68
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:50 +0000 (UTC)
X-CSE-ConnectionGUID: OH7eQfbIRuuXocsoy4G2cg==
X-CSE-MsgGUID: X58NZRlYR6Cu+ZwLXi8m7g==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:01:50 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 12:01:51 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 25 Jun 2025 12:01:49 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 25 Jun 2025 12:01:48 +0200
X-CSE-ConnectionGUID: P6PRoPsIQdGyV8btokGBiA==
X-CSE-MsgGUID: fYIXzPS9QDiaYl9yvrQeQA==
X-IronPort-AV: E=Sophos;i="6.16,264,1744063200"; d="scan'208";a="301638246"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Wed, 25 Jun 2025 12:01:47 +0200
Message-ID: <1fa681c118f4041317be9836e2031c3f636af1d2.1750845702.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750845702.git.yann.morin@orange.com>
References: <cover.1750845702.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750845711; x=1782381711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qojyb8qAIjJaJG9l1yXMvWYpI+Y281YbkvVIQ7jA+oU=;
 b=doADLIpllGz1paBUbP+oUHV/oS99VATUXWbFUott2VdxbL/V9UxHq/Bh
 LC5az6D/uylcO5uLBPexJzdNGaRTTyl4z1IAogipD9vqE03DVEP6hq5GN
 7JTgpBw+HSx8sjJ9l9b2lJB7LtRlSbr+Oycj+DeGJRwuv5jfQhUQlfFxB
 qTWws0sjcEfeE73QQ/Bz/aRfWBVDU0QKOHO7+5Vx1WIf/rsI8SzTZDIsH
 ov7fi8RYUIcN1qzRDJE3wFhOPh9X+AUBSnwtDCxKkKW0VWBb1DE0O2BK4
 FXYxIGxfdyFNEdH2SLTtoDbUAMBVTW3N+J19gpXAAM33nq6p452W9k51r
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=doADLIpl
Subject: [Buildroot] [PATCH 2/2] boot/syslinux: add option to install
 pxelinux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

lpxelinux is like pxelinux, except it allows retrieving the files for
the kernel (with the KERNEL directive) and initrd (the path to initrd=
in the APPEND directive) from FTP or HTTP, rather than just from TFTP.
Using HTTP or FTP is musch faster than TFTP, so the boot time for big
kernels or big initrds is much shorter than with TFTP.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
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
 
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
