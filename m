Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59CFC64ED6
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 08:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7288D40CA1;
	Wed,  1 Mar 2023 08:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7288D40CA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4D6bIpKwUu89; Wed,  1 Mar 2023 08:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA7B540C9E;
	Wed,  1 Mar 2023 08:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA7B540C9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9364D1BF859
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 08:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799EA4194A
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 08:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799EA4194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hD8tHDaZxogY for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 08:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C2F4198C
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31C2F4198C
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 08:36:11 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so16443632pjb.3
 for <buildroot@buildroot.org>; Wed, 01 Mar 2023 00:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bD8NWYw1V969SN8zqMye5+ead5Cybqhvu3aXN7uH2fE=;
 b=ODgJlOwpiP6i2QcPyvqoaEn10dJ7SudEAWgJvJdEIazLaX6BNQ0w4hlBijr1MI2U3i
 b+H5OlxJnbNZIpbO99PlrQjDbGgf4TU7Fgg8y+GoPGJNSpgPQ2MNFzGFmav6vYyYF1Ic
 7htpS6bkPROdHdCM0k2w4e03cQVs8Xt5zNiuyi/RP5CXdg8tjKpfpTnZ0YxHk8CBUeDf
 mg9mgzRO2JPAYJnvkE2OKAxAjJyHp6QLFtOC+zEHJBhVAt9jJuQtONehZ2wvI+QnCo0f
 zxfbKSX24mkeRpS3S517lJ0lccQRoX0iereBYEu/clRApXIQPlvvFwTmfG61au8khLQ7
 ulaw==
X-Gm-Message-State: AO0yUKWSGSpa9tCMNE6k2gCMuwGjK2UTenmzbBl5n/dnm34l4qkSDsCC
 JsU/7IYmrv/wapkT5JBrI/1TZ1oxsx2sqk2kxpE=
X-Google-Smtp-Source: AK7set86vlyZQhNuml/V1ikWfVznQeEGEPS2/nMJYeXREmQ1a+o8Pa++MQH/UjBwexntXn8IFTfX0w==
X-Received: by 2002:a17:903:1245:b0:19c:be03:d18b with SMTP id
 u5-20020a170903124500b0019cbe03d18bmr5832469plh.22.1677659769751; 
 Wed, 01 Mar 2023 00:36:09 -0800 (PST)
Received: from localhost.localdomain ([23.26.222.100])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7885199plb.105.2023.03.01.00.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 00:36:09 -0800 (PST)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 12:05:56 +0330
Message-Id: <20230301083556.2408221-1-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bD8NWYw1V969SN8zqMye5+ead5Cybqhvu3aXN7uH2fE=;
 b=fJhdylj6PNecxaiu6CvST6LvtYWUwY6GhbWVEzELqsXOxxtHxPbd9CQ2hjSd3hqMSd
 cEg+lQa65Nc5K4pWHvR0oJwBdef3Ndc70z8fa0vEybNZSpvnBJlT5UuSMuAg6+6a2Qtj
 47FbAabBqMq6saCDZqp5b90ZoTokPDVoKCCdqpftWUM6hLD/CaLw9GMwXV+oi7wkTcxs
 aiUlC7lF5U7oVS7B4o/NQDAP0MUmLRpzoBhRWblfrThuWs7WC36ID5LFHIoJvt74t4p/
 SornhEUr0arJVKnvN0Sjcd6Y7hgK8akuIdGOh7xEV3idGOAsOy4/WOXhlGiZMxt5gVOR
 VmMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fJhdylj6
Subject: [Buildroot] [PATCH 1/1] configs/orangepi_pc2: add board support
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
Cc: javad321javad@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add board support for orangepi pc2

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 configs/orangepi_pc2_defconfig | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 configs/orangepi_pc2_defconfig

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
new file mode 100644
index 0000000000..63ee554caf
--- /dev/null
+++ b/configs/orangepi_pc2_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LIBNL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
