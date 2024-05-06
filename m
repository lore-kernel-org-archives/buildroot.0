Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB1C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 15:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65F2608BA;
	Mon,  6 May 2024 15:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBinWMBvvRXq; Mon,  6 May 2024 15:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1271608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1271608BD;
	Mon,  6 May 2024 15:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6860A1BF471
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 15:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52EE640256
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 15:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Po6LftW7irhY for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 15:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A2DA40675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2DA40675
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A2DA40675
 for <buildroot@buildroot.org>; Mon,  6 May 2024 15:22:52 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 77D09BFC56;
 Mon,  6 May 2024 17:22:49 +0200 (CEST)
Message-ID: <51910310-86f7-43cf-8288-43c48c6ccd90@grenoble.cnrs.fr>
Date: Mon, 6 May 2024 17:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715008969;
 bh=rWrkfr6wCwDMkwppO7FZ14UZP0l28pcNGSpzx+uMBMY=;
 h=Date:To:Cc:From:Subject:From;
 b=b12HMpfpk44iqkX8FYrdYPA1goIKYYOPoN//8QC/aQaGnsBoIn8NiTbA86BGCzJMO
 pEiZmYNpWN4wKwwdbpXXbgLsyjeXRJDjVuA8z5R1zJd4+L5OEHkTwV/o9IO4VWtrXY
 1UhcwYT8r2ICkyTiNCzs82nmDHTq608jqvpNFOR1JNCWfFWoK8iF1G5/s05U6rB2bz
 3yQU5uPX9ndhmDsrBkKK8wETmVjOU28xSE77mY3oeOc6oWRpAkcAnuJNKjsU3/Qul/
 qmXMGzYC8XKLuj7m3HHgGXFMXc0u8ScZXnQMhTftCWK2jLW/LWEjTxcACvJTDdBQVg
 m27WxJCtIRrzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=b12HMpfp
Subject: [Buildroot] [PATCH 1/2] configs/acmesystems_acqua_a5_*: add hashes
 for Linux/at91bootstrap3
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .checkpackageignore                                             | 2 --
 .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash         | 2 ++
 .../acqua-a5/patches/linux-headers/linux-headers.hash           | 1 +
 board/acmesystems/acqua-a5/patches/linux/linux.hash             | 2 ++
 configs/acmesystems_acqua_a5_256mb_defconfig                    | 2 ++
 configs/acmesystems_acqua_a5_512mb_defconfig                    | 2 ++
 6 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
 create mode 120000 board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
 create mode 100644 board/acmesystems/acqua-a5/patches/linux/linux.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 870c286bcd..1135fa7175 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -117,8 +117,6 @@ boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_p
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/aarch64_efi_defconfig lib_defconfig.ForceCheckHash
-configs/acmesystems_acqua_a5_256mb_defconfig lib_defconfig.ForceCheckHash
-configs/acmesystems_acqua_a5_512mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_aria_g25_128mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 0000000000..06a63d449d
--- /dev/null
+++ b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdc04cca9e811043efdea43ad203d70d897e23a8bd46f01896ba45c8df50f6ec  at91bootstrap3-v3.10.3-br1.tar.gz
diff --git a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash b/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
new file mode 100644
index 0000000000..6dbbeca57f
--- /dev/null
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  1fd7ec8c3d9c4e4b3a41d11e2c6d151e5fbf875dd08b3577f73afd6ee6674605  linux-6.6.12.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index ef57734194..359b356cb4 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index a69e2a2251..194de0b530 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
