Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0046FED9F6
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 18:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512BF60E1B;
	Tue, 17 Mar 2026 18:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziXwt7v7A1Bx; Tue, 17 Mar 2026 18:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D89760ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773773301;
	bh=ZKPonaCLTUqedJmZvwnL8c6uhcjxGXmTWsbh3sGn5AI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iBzPvMtfrpivf7K7+J2p/SPnkAXkGMCjZU7Fx8QWiyyx8ob1NpTu5c6so+Q+nv3td
	 jcc9vaz8UzR+Bi34sCSTMJiQi7wOb+xDuOSZMzQK8VzzuPqdl3qUpgoQE7+gRgidoz
	 ytjnh69bvhCWe42fd+wYL6M57Y2r3UyB8arKvNVpg2dB6N5bJknvCtTpeYfkCAvik7
	 bmfVmpIr+rkUMQ3uIm86yzN33pfu4uUare4pgAnMOjA2TdpOq7ZtQ9oyqUh+duKpWO
	 Lz4gbZw96tZ2b+cfRO8iwvZgvSk8dnE0zVdh7t0CYJFprHwY6f3QzsXVdVAsTvEkb1
	 6xBU4w1q3MVxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D89760ECA;
	Tue, 17 Mar 2026 18:48:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 406E2D3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 18:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31BD660EBF
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 18:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlZGdlD75gLB for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 18:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C687A60E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C687A60E1B
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C687A60E1B
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 18:48:14 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 2ZSdwsYLHP2aD2ZSdwSN4D; Tue, 17 Mar 2026 19:48:11 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Tue, 17 Mar 2026 19:48:10 +0100
Message-ID: <20260317184810.3143452-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG3t5FUC4miH5XcSy46KFmte9ORlA/iEVqsdMQ1Z6nwvpcTDAE7tKJIrZIf1ZqXV2p+m8vhesj2cD31fHwnip9Bnef3DGP4VZOBSKEyHR1EzyyutIwwA
 2uLnoagWR/QXwjvjWGlUVhJAelodx9OkEJYRInc/PfeAl/cmHwvkIUY+TcV0hApmBN/JMlFqeKPVNmkvyJ9xyBfuvgyCeoFH81CWgH+2wMLUpq5pMl0+xyy9
 KE54bXjJ0EgmfNhdFAckLfJMjTMUzn68rJafPOf7pizv6AcgQlsxV9TFUsf8nDlpFgt1m26lLkUPIGpYh3+crg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773773291; bh=VtNjA+xpypSPMCAc8XIbIpWHeIP1P+M7pRCgqPZ4Wr4=;
 h=From:To:Subject:Date:MIME-Version;
 b=mmXWFouwzBNC9CIV4FnTSphOFrLc1Oa20F3BT+E7I3WAbRQEtLmabxFF5yg9q+J/Y
 ECAMJPtFiw+frbvH3J7zhOMKCJBXmtaCzmOttkAzJScDrcmk4fT7RdmW5K0jlarcez
 Ww1LBi7oL3BMkbL4L7nva/TnU9crrb9pply7diagBZP0cWRQLY/tptllu57NDrl+pq
 uxg92u0TJEywaq3VFLTLkePTUgsDwzVqLhikZHQLnLl7hcWWMvS9qaLdHN+XiVCp+t
 zl1ygUSGWqQ8Fwa8Kw1jTsOHk6Thk79hwwDpWAT5QJ/YJhdgNYS7IKL8mwHQ4bPtOp
 6j3Y/lgtr74DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=mmXWFouw
Subject: [Buildroot] [PATCH v2] configs/imxrt1050-evk_defconfig: bump u-boot
 to fix the build and bump linux too
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

Python setuptools has removed the obsolete pkg_resources python module in
v82.0.0. This module is used by the binman command in U-Boot until
v2025.10.
Since the python-setuptools package has been updated to v82.0.0 in
Buildroot, the iot-gate-imx8_ebbr_defconfig (using U-Boot v2025.07 and
binman) fails to build with the following error [1]:

  ModuleNotFoundError: No module named 'pkg_resources'

Update the defconfig to use a more recent U-Boot v2026.01, to fix the
build and at the same time bump Linux to version 6.18.18.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922027

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* added missing imxrt1050-evk_defconfig changes
* fix commit log
---
 board/freescale/imxrt1050evk/patches/linux/linux.hash | 2 +-
 board/freescale/imxrt1050evk/patches/uboot/uboot.hash | 2 +-
 configs/imxrt1050-evk_defconfig                       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imxrt1050evk/patches/linux/linux.hash b/board/freescale/imxrt1050evk/patches/linux/linux.hash
index 216d9b9d39..020dc72386 100644
--- a/board/freescale/imxrt1050evk/patches/linux/linux.hash
+++ b/board/freescale/imxrt1050evk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
index 440526977b..b6a925ea4e 100644
--- a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
+++ b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 7a70c42afa..813be65e52 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
