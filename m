Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC36C48BEB
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C21841BB6;
	Thu, 22 Feb 2024 10:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfS8OcpyA69U; Thu, 22 Feb 2024 10:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C7A141D69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7A141D69;
	Thu, 22 Feb 2024 10:17:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 430391BF98E
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34253825B9
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRTdYSI_cBZk for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A95A8258D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A95A8258D
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A95A8258D
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:17:07 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512d5744290so1557500e87.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597025; x=1709201825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UB41AUXvaGhDcsrRjnlJ5oUqMj0Ky371rSQ71EMXePU=;
 b=bTZnGShQJe7R0xx+9PHfmMqRYQLR5cn0fq5ABOMm6Jvt7BPHYFe6MBFv/1r/DNNLDv
 k32zbvOHk29uj2MnELbi08wrcvRTpfXPasIwmp48hsWYydHZ9juQHAudcDR47wsMc+W7
 SDnTbMhDveaMlTNZi8z0sCOLgzp2FmRr2RLEX1c1HVVsPmPaFDdCd6zqSWtLOhC55Dcd
 fUUyWb7dcRjT/NDNyEYCkbrbbj3uzv12GOw2SJZFl8eT6K9vSXcw/x0SHNtB+MA5pQzs
 68mYFAz1/6qMUepbKES6ZyhSWaW/yLcgHXRO5eHdP0dHpfJbYg1q7oBm+7bEtRiHlY6Z
 aR3A==
X-Gm-Message-State: AOJu0YwlAZqlhdLQAq/kW+z2Xhbg0fMN2mjr5qDrIa3yUA71MLs1LaLe
 knqKO9//Ua9mDEf6yGg5VBluYT1dncIk0FUda9Ob3KDJiawE+sJjGjY0MMFz7+LKiLLMuLE1OHO
 gLqg=
X-Google-Smtp-Source: AGHT+IFn9yrkY9wkPqi3NeOFNhbomisu2HjJ159T/AqZfqtELzAST3IxcMF1Mtu5zexRvl7HuV7jJA==
X-Received: by 2002:ac2:48a9:0:b0:512:ceae:93d3 with SMTP id
 u9-20020ac248a9000000b00512ceae93d3mr3375009lfg.31.1708597025637; 
 Thu, 22 Feb 2024 02:17:05 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:17:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:16 +0100
Message-ID: <20240222101617.18422-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597025; x=1709201825;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UB41AUXvaGhDcsrRjnlJ5oUqMj0Ky371rSQ71EMXePU=;
 b=l4XlDgtooRx+sTrRIunmfpntdvqxOcP/LGn1P6QBkg5nc3pFkAFoCnWbyeO7C+L8KH
 lqhixNf2D9spOgUAHBh91Yc9B5N4kUHY18+eGu3Xosl6FMGCNJmJgWY8xQ29ZremPIrw
 FR+1w8Z6Bgiou9Xitjwi5CCjVP11aROEdVHDI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=l4XlDgto
Subject: [Buildroot] [PATCH v5 15/16] configs/ti_am62x_sk_defconfig: bump
 U-Boot version to 2024.01
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 2024.01 version of U-Boot for the am62x-sk board has introduced two
major changes:
- The device tree k3-am625-sk.dtb is no longer searched in /boot, but in
  /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
  and the use of extlinux.conf for the proper loading of the device tree.
  Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
  auto-generate the extlinux.conf file so that developers can change the
  kernel loading options by modifying the .config.
- U-Boot is capable of building tiboot3.bin using Binman. So it's no longer
  necessary to use custom tools like ti-k3-image-gen.

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Update commit message.

Changes in v4:
- bump to 204.01 instead of 2023.10
- Update the commit message
- Replace 'PARTUUID=00000000-02' with '/dev/mmcblk1p2' where to get rootfs
  in the BR2_ROOTFS_POST_SCRIPT_ARGS insided the ti_am62x_sk_defconfig.

Changes in v2:
- Update the commit message
- Drop Python options required by binman.
- Enable BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN. This option automatically
  selects the Python modules required by binman.

 board/ti/am62x-sk/genimage.cfg  |  7 ++++-
 board/ti/am62x-sk/post-build.sh | 49 +++++++++++++++++++++++++++++++++
 board/ti/am62x-sk/post-image.sh |  5 ++++
 configs/ti_am62x_sk_defconfig   | 13 +++++----
 4 files changed, 67 insertions(+), 7 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh

diff --git a/board/ti/am62x-sk/genimage.cfg b/board/ti/am62x-sk/genimage.cfg
index 26304fe98f99..398209f4d831 100644
--- a/board/ti/am62x-sk/genimage.cfg
+++ b/board/ti/am62x-sk/genimage.cfg
@@ -4,10 +4,15 @@ image boot.vfat {
 			"tiboot3.bin",
 			"tispl.bin",
 			"u-boot.img",
+			"k3-am625-sk.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
-	size = 16M
+	size = 64M
 }
 
 image sdcard.img {
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
new file mode 100755
index 000000000000..0f1f98ef217a
--- /dev/null
+++ b/board/ti/am62x-sk/post-build.sh
@@ -0,0 +1,49 @@
+#!/bin/sh -x
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+die() {
+  cat <<EOF >&2
+Error: $@
+
+Usage: ${0} -c <console> -r <root> [-x <extra-args>]
+EOF
+  exit 1
+}
+
+o='c:r:x:'
+O='console:,root:,extra-args:'
+opts="$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
+eval set -- "${opts}"
+while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    (-c|--console)
+        CONSOLE="${2}"; shift 2
+        ;;
+    (-r|--root)
+        ROOT="${2}"; shift 2
+        ;;
+    (-x|--extra-args)
+        EXTRA_ARGS="${2}"; shift 2
+        ;;
+    (--)
+        shift 1; break
+        ;;
+    esac
+done
+
+[ -n "${CONSOLE}" ] || die "Missing argument"
+[ -n "${ROOT}" ] || die "Missing argument"
+append="console=${CONSOLE} root=${ROOT} rw rootfstype=ext4 rootwait"
+if [ -n "${EXTRA_ARGS}" ]; then
+    append="${append} ${EXTRA_ARGS}"
+fi
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label am62x-sk-buildroot
+	  kernel /Image
+	  fdtdir /
+	  append ${append}
+	__HEADER_EOF
diff --git a/board/ti/am62x-sk/post-image.sh b/board/ti/am62x-sk/post-image.sh
new file mode 100755
index 000000000000..34f732c091ad
--- /dev/null
+++ b/board/ti/am62x-sk/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh -x
+
+BOARD_DIR="$(dirname "$0")"
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 2835404a57df..be01c696b170 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,14 +1,14 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_PACKAGE_TI_K3=y
@@ -24,17 +24,18 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
