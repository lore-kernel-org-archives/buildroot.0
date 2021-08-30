Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63767C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C50060F5C
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C50060F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB5A4040B;
	Mon, 30 Aug 2021 04:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwnTxYbdlATu; Mon, 30 Aug 2021 04:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01A34041F;
	Mon, 30 Aug 2021 04:42:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43CAC1BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33E2560759
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6fDdMCaoOkD for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B46E860755
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298470; x=1661834470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxxPStFpFcDPqjslRQ2TN3IJIlYfX5i0LJmtynPLQuI=;
 b=IouD+UfDFkOZ2lJBxBnzAWOm1VPqFEQHvx/qpoQwlEJ2NQ4hiQHpeKPD
 759/4r194znOOClWei5db7IKLtFXB2nASJAwK82FKA8aMkegvISwg/qAV
 ebDkwkT1OvoxFW/GKa0/jB/F4dkSgef4R0gJHuUxYrpDIR4WHnyDQ6XIm
 GUy0WYBcUntV4ekXadlBA0Sw7StiC3YaA5SmjjEqbPzPgtd9MwoOo4sPg
 xtOYD/iJiatDdGheSH6OqnwadguY+4bLr/uwbMoPzjdIxcioePBSZSGU9
 jDYA+x48JdNBBnz7WEkGWKv1zzo8lX0yPsGczBGSTybBPRTTKNgIkHPzE Q==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842508"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:10 +0800
IronPort-SDR: IU/bkq2RybQFMqYJLhh/c8l8ppmbZbNJf+Tm7lm569udqJQ5FNBwEZ9ZGukB3AhJKBPoVw+/9m
 hmchNuUjZAnF/rKmsUYIosrGqlUrgoOlJzjL4kzoQ/Ngb3MpQOBxP7Hc3DNyph2HkfEpAIPEu6
 zzWrPZczjPxbzIxEq5KiiWDe6m0jdLVmX0fuKQX2AR2UJaztYh4QjwkRi5DJ5ubRdXGEqXKnu+
 C+0iMVylL1CFAquAQlOVbDkQ5i3qv3mFiASMVKO7AmLI4e8QsZ3RaZEytEvPSBC3vRE2hCi0Uj
 NNfMzy/Irm1HB3DezCe80Q5q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:18:01 -0700
IronPort-SDR: Fhf08WSW6QdFdHKGtDfmD9uXLL7TXNHRmb5aj2v/KwCFxrv1KcUdczaSDGlLim6WI+/7VJJGLk
 pTO4O4gPz+nJn6smLoYAgnhDcwEWGvkYGv6u8OK1BqDloe0EIGuFqAE/McngdbSvSG1cibKlLs
 FFLpiJpEM/ZcM3miAG9DMnZuJ5b64gNXUWLu1KbSkXoD7su0GjuWxqE3V5OriCOIBhOtYRXznn
 k8uanEdH+2P+HHocX3aiHNEY15iyffumFex2ZMXS9SVKHffytRIChOXjo1BtE9WXBzEJn9ZV44
 Wc4=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:09 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:58 +0900
Message-Id: <20210830044100.260173-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 7/9] board: Add Sipeed MAIX-Dock support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add two configuration files to support the dual-core RV64 Canaan K210
SoC based Sipeed MAIX-Dock board. These configurations are similar to
the Sipeed MAIX-bit board configurations, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/sipeed/maix-dock/linux-dtb.config   |  2 ++
 configs/sipeed_maix_dock_defconfig        | 15 +++++++++++++++
 configs/sipeed_maix_dock_sdcard_defconfig | 14 ++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 board/sipeed/maix-dock/linux-dtb.config
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig

diff --git a/board/sipeed/maix-dock/linux-dtb.config b/board/sipeed/maix-dock/linux-dtb.config
new file mode 100644
index 0000000000..b1ca3166f8
--- /dev/null
+++ b/board/sipeed/maix-dock/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_dock"
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
new file mode 100644
index 0000000000..253ba2690d
--- /dev/null
+++ b/configs/sipeed_maix_dock_defconfig
@@ -0,0 +1,15 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-common/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
new file mode 100644
index 0000000000..3e6b9b1026
--- /dev/null
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
