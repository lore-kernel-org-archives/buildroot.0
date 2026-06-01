Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70554CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38AE860760;
	Mon,  1 Jun 2026 20:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvxmPtQ9YpWc; Mon,  1 Jun 2026 20:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEEA6076D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346888;
	bh=yQSSnP5I6/z+l+xh+ynkZYOwimKemYTkYrfTJzBRZQo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EvYRtmoSCrHH37boEa1oCD0TlZ7rgdGcoI75XVupR/S3NeDIvHB+W/IkfEszwu4es
	 osNRkwWQEi/fpjV6a0veLc3XFi8dfUuDIEag8IXpxYeH9li0umVOg2oF1AZPs3Xmn9
	 VKxXvSTT3LHZOJp7x12hDS4Lm3PyroZ8jWpWhIbYpoNrl/Zr2rQMfaFyBqUmoXDJnS
	 P+21Ue45QamEKvn0hrfp5C4uNG7H5o+CFSltdlfsBY108n2K3KH0n2drFSGN3g514K
	 j+QegLml95KOKxw4tDYMRJ7G/HPmbMrlLOqmpeiR+QiB0ejxilNwwZyhWjPVyliWHX
	 PorKrm5aBtH3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AEEA6076D;
	Mon,  1 Jun 2026 20:48:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FDBF2F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF11A40A84
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_dagTUaqheb for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:48:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5CCE40A7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CCE40A7B
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5CCE40A7B
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:48:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-39677c434efso20564831fa.3
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346883; x=1780951683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sjDkf4fD1IIxS6MRuQ351V/E5DgWuRuWEy9vn1NMmrE=;
 b=nctiS5evkM21fz6y8golAnviIB5rVJv1xzZWo2uRzDRz3QQHj5j/va0IHb6fpMhTue
 +aS2G3SD8+eEOvZTQSMSDuVa852Jw1pUj2fU2behzTl33IWV2Y5rhmVnKcdRMgX05p71
 kgWNhVe5F4fbFVzz30gd/1E4hqYORD5C7ubBclSNRPftOExQO9b8pSvKCr6dvUWjPhzc
 F1hjXmfI8Xkyt1o+dIiIZw03gY9VaeuWVnP7sujTbG2zEXdTJA4ElYj72gOajMM1mWWj
 IyqT/LJ6wiRQqCVc/nPFXuQpwj2SZK0UZVni4/mEdPf64E7y7NQD0lQE2rGH91Z6DR1d
 4Nwg==
X-Gm-Message-State: AOJu0YyjQ7LcSNbmfgWN6xNMSbZRYn838hUONO7ReVEs9i88H9AJCHx6
 5HeWEbdOv+dP2PnCsgIFBsOtaTn8DElpv8GpHaOqzRjOsNHit7Z4SUMGBwTddHzex2pqmYk4lmb
 uln9yySBVjw==
X-Gm-Gg: Acq92OGi9zmiHtykTO6i4YUM4GIi/paEz3dqFuSR2TL/75aJCLoeTg1mgTPMv4HBtmi
 /D9kV/pGAuYFvOUKpkrA3t3t6p3JmJgHZc9qtChtCvTJE+IEhSmz5GTzreOEkpirDPa1oI0toaD
 CiicVt+phMHE3tr6Oieh+gv9vp3QZXXYzQAbShj7yFFrvLZXpEJABEbvLgs9Lxh/J/RFCBJZWKg
 0/NDX4oWPDky3PvI8tAcgIeVi2CJzUu8Zj4e09iJD5ThxwhakefNyMsa4Zlf24LpA40EHbbUegi
 95BTsRqxSQlOp4WfjgWO2jDogMyLHcFZ72ST1PocTIpCzEK6BthLORBSBNMe/0V9cHv5tA0mMOF
 +yRVtQWfNmACn1GnEMd9pTf6DGDC0Xd8BtrPHPuBDgbDL3c4wDcjg7culupamO3WeiM07rHOntk
 7eXur/Wa0vbIqQ2kn9dx36wQwZo2jCgmHlsvAx5sti9TdkMTPwBXXD5uwR4BKH+A==
X-Received: by 2002:a05:651c:2119:b0:396:6043:e882 with SMTP id
 38308e7fff4ca-39664ec5f88mr37734161fa.13.1780346883322; 
 Mon, 01 Jun 2026 13:48:03 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-396840dcfadsm10197161fa.41.2026.06.01.13.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:48:01 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Carlo Caione <carlo.caione@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon,  1 Jun 2026 22:47:33 +0200
Message-ID: <20260601204735.888967-8-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346883; x=1780951683;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjDkf4fD1IIxS6MRuQ351V/E5DgWuRuWEy9vn1NMmrE=;
 b=Q6ucmpt483qGGVFaCTB51nbqdS5vg4A/bhsZWrNgoiauE9Vt2QnU5W4wGvE8Jr3Q+m
 9iCDhVdncGmhQ9T18eUb+xsCwuT1TRpMKE7qBxUZeKxHLEJXVPJfO+onQWaZ7Hpl6tis
 gm1P+/6lXSNOq/9s6LC7ZLzMSBgOfpCMrgOVGWwpPIFOdp03ISvxVeBA+3U2KrRnBV/G
 lgSrIP+Zpdy0SMx5TjkkQ5WnOtn0pgXBBwXztjZ8h6fDBtv6pvBEwVVEXVt/+CL85ltG
 5wvX8VZ7Qq2NDrfhWmru8Cuokn56ZdytCLbQB5ZVCst4p5dfKvgdhRgMRNHf3ybbgJzt
 p7ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=Q6ucmpt4
Subject: [Buildroot] [RFC PATCH 7/9] package/jailhouse: Drop the package
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

Upstream has not seen any activity since 2022 [1], same for the mailing
list.

It does not compile with modern kernels. There has been no complaints or
fixes from users yet about this with modern kernels.

Fixes:
 - https://autobuild.buildroot.org/results/90f613a200dfa7b57a19ecddc26a935fadac4598/
 - https://autobuild.buildroot.org/results/c8a61a605ebac6fdb5efb7159fba36a76da59f56/

Link: https://github.com/siemens/jailhouse [1]
Cc: Carlo Caione <carlo.caione@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

RFC: Is this grounds enough for a removal, or should it kept around for
the CIP kernels or other older kernels users may be using?
---
 Config.in.legacy                              |  19 ++++
 DEVELOPERS                                    |   2 -
 package/Config.in                             |   1 -
 package/jailhouse/Config.in                   |  28 -----
 package/jailhouse/jailhouse.hash              |   3 -
 package/jailhouse/jailhouse.mk                |  71 ------------
 .../testing/tests/package/test_jailhouse.py   | 103 ------------------
 7 files changed, 19 insertions(+), 208 deletions(-)
 delete mode 100644 package/jailhouse/Config.in
 delete mode 100644 package/jailhouse/jailhouse.hash
 delete mode 100644 package/jailhouse/jailhouse.mk
 delete mode 100644 support/testing/tests/package/test_jailhouse.py

diff --git a/Config.in.legacy b/Config.in.legacy
index aa8437e28f..7fdb014c0b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,25 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.xx"
+
+config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
+	bool "jailhouse helper scripts removed"
+	select BR2_PACKAGE_JAILHOUSE
+	select BR2_LEGACY
+	help
+	  Jailhouse does not build with modern kernels.
+	  Last commit to the upstream repoistory took place in 2022.
+	  The upstream project is no longer maintained.
+
+config BR2_PACKAGE_JAILHOUSE
+	bool "jailhouse removed"
+	select BR2_LEGACY
+	help
+	  Jailhouse does not build with modern kernels.
+	  Last commit to the upstream repoistory took place in 2022.
+	  The upstream project is no longer maintained.
+
 comment "Legacy options removed in 2026.05"
 
 config BR2_PACKAGE_LIBHDHOMERUN
diff --git a/DEVELOPERS b/DEVELOPERS
index 9aaffa29a9..0308d1ef41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -589,7 +589,6 @@ F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
 N:	Carlo Caione <carlo.caione@gmail.com>
-F:	package/jailhouse/
 F:	package/sunxi-boards/
 
 N:	Carsten Schoenert <c.schoenert@gmail.com>
@@ -1912,7 +1911,6 @@ F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_iproute2.py
 F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_iputils.py
-F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
 F:	support/testing/tests/package/test_kexec.py
diff --git a/package/Config.in b/package/Config.in
index 7e69d025e0..b69782ec6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2817,7 +2817,6 @@ menu "System tools"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
-	source "package/jailhouse/Config.in"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kmon/Config.in"
diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
deleted file mode 100644
index 445414162f..0000000000
--- a/package/jailhouse/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_PACKAGE_JAILHOUSE
-	bool "jailhouse"
-	depends on BR2_aarch64 || BR2_x86_64
-	depends on BR2_LINUX_KERNEL
-	help
-	  The Jailhouse partitioning Hypervisor based on Linux.
-
-	  https://github.com/siemens/jailhouse
-
-if BR2_PACKAGE_JAILHOUSE
-
-config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
-	bool "helper scripts"
-	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_MAKO # runtime
-	help
-	  Python-based helpers for the Jailhouse Hypervisor.
-
-	  https://github.com/siemens/jailhouse
-
-comment "helper scripts require Python3"
-	depends on !BR2_PACKAGE_PYTHON3
-
-endif
-
-comment "jailhouse needs a Linux kernel to be built"
-	depends on BR2_aarch64 || BR2_x86_64
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
deleted file mode 100644
index 96d5819847..0000000000
--- a/package/jailhouse/jailhouse.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  38ea5d2d9672ce7f76fd0c163edaa8968711aca58f245aec3c8934f140e828b6  jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560.tar.gz
-sha256  3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
deleted file mode 100644
index a1c86f0e91..0000000000
--- a/package/jailhouse/jailhouse.mk
+++ /dev/null
@@ -1,71 +0,0 @@
-################################################################################
-#
-# jailhouse
-#
-################################################################################
-
-JAILHOUSE_VERSION = e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560
-JAILHOUSE_SITE = $(call github,siemens,jailhouse,$(JAILHOUSE_VERSION))
-JAILHOUSE_LICENSE = GPL-2.0
-JAILHOUSE_LICENSE_FILES = COPYING
-JAILHOUSE_DEPENDENCIES = \
-	linux
-
-JAILHOUSE_MAKE_OPTS = \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	ARCH="$(KERNEL_ARCH)" \
-	KDIR="$(LINUX_DIR)" \
-	DESTDIR="$(TARGET_DIR)" \
-	prefix=/usr
-
-ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
-JAILHOUSE_DEPENDENCIES += \
-	host-python-mako \
-	host-python-setuptools \
-	python3
-JAILHOUSE_MAKE_OPTS += \
-	HAS_PYTHON_MAKO="yes" \
-	PYTHON_PIP_USABLE="yes"
-else
-JAILHOUSE_MAKE_OPTS += \
-	HAS_PYTHON_MAKO="no" \
-	PYTHON_PIP_USABLE="no"
-endif
-
-ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
-define JAILHOUSE_BUILD_HELPER_SCRIPTS
-	cd $(@D) && \
-	$(PKG_PYTHON_SETUPTOOLS_ENV) \
-	$(HOST_DIR)/bin/python setup.py \
-		build
-endef
-define JAILHOUSE_INSTALL_HELPER_SCRIPTS
-	cd $(@D) && \
-	$(PKG_PYTHON_SETUPTOOLS_ENV) \
-	$(HOST_DIR)/bin/python setup.py \
-		install --no-compile \
-		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-		--root=$(TARGET_DIR)
-endef
-endif
-
-define JAILHOUSE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)
-
-	$(JAILHOUSE_BUILD_HELPER_SCRIPTS)
-endef
-
-define JAILHOUSE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D) modules_install firmware_install tool_inmates_install
-	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)/tools src=$(@D)/tools install
-
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/jailhouse
-	$(INSTALL) -D -m 0644 $(@D)/configs/*/*.cell $(TARGET_DIR)/etc/jailhouse
-
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/jailhouse/demos
-	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/libexec/jailhouse/demos
-
-	$(JAILHOUSE_INSTALL_HELPER_SCRIPTS)
-endef
-
-$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_jailhouse.py b/support/testing/tests/package/test_jailhouse.py
deleted file mode 100644
index 4634fc4de2..0000000000
--- a/support/testing/tests/package/test_jailhouse.py
+++ /dev/null
@@ -1,103 +0,0 @@
-import os
-import time
-
-import infra.basetest
-
-
-class TestJailhouse(infra.basetest.BRTest):
-    # This test uses a specific configuration, mainly for matching the
-    # requirements of the Jailhouse Qemu inmate demo. We also use the
-    # Linux kernel from Siemens, which includes patches for
-    # Jailhouse. Finally, we use the kernel config from
-    # board/qemu/aarch64-virt rather than the Kernel defconfig, for
-    # faster build (as it enable less components, but includes
-    # everything needed for this test).
-    kernel_ver = "eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce"
-    kernel_url = \
-        f"$(call github,siemens,linux,{kernel_ver})/linux-{kernel_ver}.tar.gz"
-    config = \
-        f"""
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-        BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="{kernel_url}"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_PACKAGE_JAILHOUSE=y
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_4=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
-        kern = os.path.join(self.builddir, "images", "Image")
-        # Qemu option and Kernel args are taken from Jailhouse demo. See:
-        # https://github.com/siemens/jailhouse/blob/master/README.md
-        # We also add oops=panic to improve the test coverage.
-        self.emulator.boot(arch="aarch64",
-                           kernel=kern,
-                           kernel_cmdline=["root=/dev/vda console=ttyAMA0 mem=768M oops=panic"],
-                           options=["-M", "virt,gic-version=3,virtualization=on,its=off",
-                                    "-cpu", "cortex-a57",
-                                    "-m", "1G",
-                                    "-smp", "16",
-                                    "-drive", f"file={drive},if=none,format=raw,id=hd0",
-                                    "-device", "virtio-blk-device,drive=hd0"])
-        self.emulator.login()
-
-        # Check the program can execute.
-        self.assertRunOk("jailhouse --version")
-
-        # Load the kernel module.
-        self.assertRunOk("modprobe jailhouse")
-
-        # Check the device is present.
-        self.assertRunOk("ls -al /dev/jailhouse")
-
-        # Load the cell config this this qemu test.
-        self.assertRunOk("jailhouse enable /etc/jailhouse/qemu-arm64.cell")
-
-        # Dump the jailhouse console, and check we see its
-        # initialization string.
-        out, ret = self.emulator.run("jailhouse console")
-        self.assertEqual(ret, 0)
-        self.assertIn("Initializing Jailhouse hypervisor", "\n".join(out))
-
-        # Create the cell.
-        cell_cfg = "/etc/jailhouse/qemu-arm64-inmate-demo.cell"
-        cmd = f"jailhouse cell create {cell_cfg}"
-        self.assertRunOk(cmd)
-
-        # Load the demo image.
-        cell_name = "inmate-demo"
-        img = "/usr/libexec/jailhouse/demos/gic-demo.bin"
-        cmd = f"jailhouse cell load {cell_name} {img}"
-        self.assertRunOk(cmd)
-
-        # List Jailhouse cells and check we see the one we loaded.
-        out, ret = self.emulator.run("jailhouse cell list")
-        self.assertEqual(ret, 0)
-        self.assertIn(cell_name, "\n".join(out))
-
-        # We should also see our cell in sysfs.
-        cmd = "cat /sys/devices/jailhouse/cells/1/name"
-        out, ret = self.emulator.run(cmd)
-        self.assertEqual(ret, 0)
-        self.assertEqual(out[0], cell_name)
-
-        # Start the cell.
-        self.assertRunOk(f"jailhouse cell start {cell_name}")
-
-        # Let the demo cell run for few seconds...
-        time.sleep(3)
-
-        # Stop and unload the cell.
-        self.assertRunOk(f"jailhouse cell shutdown {cell_name}")
-        self.assertRunOk(f"jailhouse cell destroy {cell_name}")
-
-        # Stop and unload jailhouse.
-        self.assertRunOk("jailhouse disable")
-        self.assertRunOk("modprobe -r jailhouse")
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
