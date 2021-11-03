Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0310C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 04:57:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C751610E8
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 04:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C751610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BF04043F;
	Wed,  3 Nov 2021 04:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojtyi6-eNmh2; Wed,  3 Nov 2021 04:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0122A40452;
	Wed,  3 Nov 2021 04:56:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C304C1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 04:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD71F606D5
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 04:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_vr5iAcW5ob for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 04:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C9AF606A7
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 04:56:42 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u11so1707217plf.3
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 21:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewOzuQ8Bj/dl89m+Dv1jq14EcWO7bv3wyaxwSk3AeH0=;
 b=l0CH3hCcHWqxgueorMPFwgzgbR7Rv62Rz6HXxMyDxa03PKvUpGGqO2TYOdm9n5ItND
 Bt4YSwIyGTD0ssKfdL3Xlvl9p1gDlVmunWnP30EAJnMuUmSF/KfC7O1rEw7rwz88+n6s
 PiCxcCGjLj8zS9Sh4skh6+vBwZ2fr/6GH0BTjAowVaSFD29g2XvmYc+qn8Rw5JfHVTGG
 FpNaES+eh7vkw/1GwWFBMETaojWqhusdfh8DMXMFh9uXLImg3VMh1WL66syLOuw2Vcvi
 CM9i638i7FEwWxMfyqdhGzt6iwnNjwkY05PTqFJbt1p7ip+vZ0nrmUEj5K9fwm3O0fjm
 6tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ewOzuQ8Bj/dl89m+Dv1jq14EcWO7bv3wyaxwSk3AeH0=;
 b=GeZl80CB0MD/GUpZBJrXn6A01KvkSHTKe8vkVyn/lzvvrd1TDeJcsU4Wi9/Xu9BZOv
 eLRz57ix83Wgzm5uT5kGREEg2z5DC4WxAUOP3NLZqaWeIOdoP4f6trn4GBgthUtPgNyF
 27+6YTZMwyE+rOItNiYtbh6JGgUC3zn4Z7DOVnbUD3VOQ2t1eCEeM5jvy6z+UGH6KHz/
 Riqzw9nYCsuET97SW5B7cycolapZ+Z6qha72ONAFyEmQ2ngmahexrtN0omomCGF3eaM6
 bYY4XxKRnbdbePXk0CRIjItaXNbbiwuGbs4Cwrvjsfh9Vb/Ki53rYKwvu0uMu+8OUDey
 AE2w==
X-Gm-Message-State: AOAM531cdRnB36x1UJb+bkq7Kpj871mK/WNiatZqAygoM0mx2zLDmga/
 TyzsWKaaFsiBf0/w6tX958UTDe1K2M8=
X-Google-Smtp-Source: ABdhPJwdXJSlvQY8Q8oN5FSgqETnxqRWhsiJfC4R03djplOUk7uq16d8MRs3LHvdZ4xUJ4fSOFiecQ==
X-Received: by 2002:a17:90a:62c1:: with SMTP id
 k1mr11947278pjs.33.1635915401972; 
 Tue, 02 Nov 2021 21:56:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id b18sm605897pjo.31.2021.11.02.21.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:56:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 15:26:26 +1030
Message-Id: <20211103045627.1281356-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211103045627.1281356-1-joel@jms.id.au>
References: <20211103045627.1281356-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] board: g3beige: Update to Linux 5.15
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BLK_DEV_IDE_PMAC driver has been removed from the kernel, so use the
libata replacement PATA_MACIO. This requires enabling ATA and BLK_DEV_SD
for the disk to show up, and changing the command line to use /dev/sda.

YENTA depends on PCCARD, so enable it.

The UART does not show up in /dev without DEVTMPFS.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 board/qemu/ppc-g3beige/linux.config | 13 ++++++++-----
 board/qemu/ppc-g3beige/readme.txt   |  2 +-
 configs/qemu_ppc_g3beige_defconfig  |  6 +++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/board/qemu/ppc-g3beige/linux.config b/board/qemu/ppc-g3beige/linux.config
index 79945535442a..f94488424339 100644
--- a/board/qemu/ppc-g3beige/linux.config
+++ b/board/qemu/ppc-g3beige/linux.config
@@ -1,15 +1,18 @@
 CONFIG_ALTIVEC=y
 CONFIG_SYSVIPC=y
 CONFIG_HIGHMEM=y
-CONFIG_YENTA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_CMD64X=y
-CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_PCCARD=y
+CONFIG_YENTA=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_ATA=y
+CONFIG_PATA_MACIO=y
 CONFIG_ADB=y
 CONFIG_ADB_CUDA=y
 CONFIG_ADB_PMU=y
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index e6c9c2016e9e..e39579ade227 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/hda" -serial stdio -net nic,model=rtl8139 -net user # qemu_ppc_g3beige_defconfig
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "console=ttyS0 rootwait root=/dev/sda" -serial stdio -net nic,model=rtl8139 -net user # qemu_ppc_g3beige_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 6e41afe8d758..824fe648aba5 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
