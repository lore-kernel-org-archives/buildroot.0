Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4057BD2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 16:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DCFA812CE;
	Sun, 11 Jan 2026 16:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmSolDGMkckB; Sun, 11 Jan 2026 16:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD983812B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768150221;
	bh=Dc7StAYOv0ELtgQ3silaRQSeToYUKZTWzb4eX6Y1x7Y=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ir3+/+Y8UDRapDmxqyiBGomN2gVSoUYM0rK18/xUtLvtNw/Hl+UpIHF+gflS4CnCQ
	 ONqAJ+q4rf56x8ycsNiCVPzy2Uu4mtc6Dc6NjqEDKFVITim0d42Y14fX7EooV30Ux/
	 uT7z8SlYwYp9jwds7mxSddD71mpPC9vL44P5jkwJsYV6xMnPPo7i5fFqoVbzpyOgH6
	 oVhV088Unv9HGq2LHCozoXt1cqgOmxqZPyNWuoG1B279CxOpzpS9435Xo+pjbsXMra
	 euXAnZjVqhM4Tn2BYrH87JacOqK8WjPUortaIYR35gfEgph2ZG2+JyVw74oArBlQ/v
	 9Bhw99xCmQCiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD983812B2;
	Sun, 11 Jan 2026 16:50:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3973D12E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B6144024A
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 16:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8ypZOnL3NNy for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 16:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=cnoize@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0D7F401EC
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0D7F401EC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 16:49:43 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 60BGnYdr043510
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 00:49:34 +0800 (+08)
 (envelope-from cnoize@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Jan
 2026 00:49:33 +0800
To: <buildroot@buildroot.org>
CC: Leo Yu-Chi Liang <ycliang@andestech.com>, Che-Wei Chuang
 <cnoize@andestech.com>
Date: Mon, 12 Jan 2026 00:49:21 +0800
Message-ID: <20260111164921.2087908-1-cnoize@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60BGnYdr043510
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH] board/andes/ae350: bump to AndeSight v5.4.x and
 add OP-TEE
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
From: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Reply-To: Che-Wei Chuang <cnoize@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the Andes AE350 board support to align with the AndeSight v5.4.x
software stack. This update includes the following changes:

- Bump Linux kernel to v6.6.49, and update U-Boot and OpenSBI to the
  corresponding AndeSight v5.4.x custom tarballs for the QEMU Andes
  AE350 machine.
- Add optional support for OP-TEE (Open Portable Trusted Execution
  Environment) via config fragments.
- Update genimage_sdcard.cfg to align the final SD card image size to a
  power of 2, which is required for correct QEMU emulation.
- Modify post-build.sh to install all generated DTBs rather than a single
  hardcoded DTB.
- Add a patch for optee-test to disable fragmentation calculation, fixing
  a build failure caused by struct mismatch between optee-test 4.6.0
  and the older optee-os 4.3.0.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
---
 board/andes/ae350/genimage_sdcard.cfg         |   8 +-
 board/andes/ae350/linux.config.fragment       |   1 +
 board/andes/ae350/patches/linux/linux.hash    |   3 +-
 .../andes/ae350/patches/opensbi/opensbi.hash  |   3 +-
 .../patches/optee-client/optee-client.hash    |   2 +
 .../optee-examples/optee-examples.hash        |   2 +
 .../ae350/patches/optee-os/optee-os.hash      |   2 +
 ...ble-fragmentation-calculation-for-ol.patch |  44 ++++++
 .../ae350/patches/optee-test/optee-test.hash  |   2 +
 board/andes/ae350/patches/uboot/uboot.hash    |   3 +-
 board/andes/ae350/post-build.sh               |  12 +-
 board/andes/ae350/readme.txt                  | 126 +++++++++++++++++-
 .../boot/extlinux/extlinux.conf               |   1 -
 board/andes/ae350/uboot-optee.config.fragment |   5 +
 board/andes/ae350/uboot.config.fragment       |   5 +
 configs/andes_ae350_45_defconfig              |  17 ++-
 16 files changed, 215 insertions(+), 21 deletions(-)
 create mode 100644 board/andes/ae350/linux.config.fragment
 create mode 100644 board/andes/ae350/patches/optee-client/optee-client.hash
 create mode 100644 board/andes/ae350/patches/optee-examples/optee-examples.hash
 create mode 100644 board/andes/ae350/patches/optee-os/optee-os.hash
 create mode 100644 board/andes/ae350/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
 create mode 100644 board/andes/ae350/patches/optee-test/optee-test.hash
 create mode 100644 board/andes/ae350/uboot-optee.config.fragment

diff --git a/board/andes/ae350/genimage_sdcard.cfg b/board/andes/ae350/genimage_sdcard.cfg
index 58c6f8f156..2b5b1ae0b7 100644
--- a/board/andes/ae350/genimage_sdcard.cfg
+++ b/board/andes/ae350/genimage_sdcard.cfg
@@ -3,10 +3,10 @@ image boot.vfat {
 		files = {
 			"u-boot-spl.bin",
 			"u-boot.itb",
-			"ae350_ax45mp.dtb",
+			"dtb",
 		}
 	}
-	size = 2M
+	size = 2040K
 }
 
 image sdcard.img {
@@ -16,11 +16,15 @@ image sdcard.img {
 	partition boot {
 		partition-type = 0xC
 		image = "boot.vfat"
+		offset = 8K
+		size = 2040K # 2MB - 8KB
 	}
 
 	partition rootfs {
 		partition-type = 0x83
 		bootable = true
 		image = "rootfs.ext4"
+		offset = 2M
+		size = 30M
 	}
 }
diff --git a/board/andes/ae350/linux.config.fragment b/board/andes/ae350/linux.config.fragment
new file mode 100644
index 0000000000..becad4d7ed
--- /dev/null
+++ b/board/andes/ae350/linux.config.fragment
@@ -0,0 +1 @@
+CONFIG_INITRAMFS_SOURCE=""
diff --git a/board/andes/ae350/patches/linux/linux.hash b/board/andes/ae350/patches/linux/linux.hash
index 1a6a136b71..16fc60fe1b 100644
--- a/board/andes/ae350/patches/linux/linux.hash
+++ b/board/andes/ae350/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  c71af3d2c86c0a0deca4f54b51d1c35217082b030052cc3513dc42e852652733  linux-v6.0.y-andes.tar.gz
+sha256  92564d3bb7643873232b19c605d77d0ab888f6a9142d1436a25d01239bceeed0  linux-ast-v5_4_1-release.tar.gz
+sha256  2a1dc278902473fed28fc40d4eecdbe0692b23c1282649db8281efcb8306e679  linux-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350/patches/opensbi/opensbi.hash b/board/andes/ae350/patches/opensbi/opensbi.hash
index d7893a1dee..67d9b2c562 100644
--- a/board/andes/ae350/patches/opensbi/opensbi.hash
+++ b/board/andes/ae350/patches/opensbi/opensbi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
+sha256  f53ee069cfee739d0dc22dc65006c9dde6b18f41044aac3b3eda236266bc7152  opensbi-ast-v5_4_1-release.tar.gz
+sha256  70a38b6d3c8c9c4eaeb6076480e567c7c5155f321e8989492ccc95ad87304185  opensbi-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350/patches/optee-client/optee-client.hash b/board/andes/ae350/patches/optee-client/optee-client.hash
new file mode 100644
index 0000000000..0154c2b2e9
--- /dev/null
+++ b/board/andes/ae350/patches/optee-client/optee-client.hash
@@ -0,0 +1,2 @@
+# From https://github.com/OP-TEE/optee_client/releases/tag/4.3.0
+sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee_client-4.3.0.tar.gz
diff --git a/board/andes/ae350/patches/optee-examples/optee-examples.hash b/board/andes/ae350/patches/optee-examples/optee-examples.hash
new file mode 100644
index 0000000000..bf831bbf9c
--- /dev/null
+++ b/board/andes/ae350/patches/optee-examples/optee-examples.hash
@@ -0,0 +1,2 @@
+# From https://github.com/linaro-swg/optee_examples/releases/tag/4.3.0
+sha256  ee1576617365b5fe9d20d72c16cf6b39159eb79b1401189bd37a91ef03371820  optee_examples-4.3.0.tar.gz
diff --git a/board/andes/ae350/patches/optee-os/optee-os.hash b/board/andes/ae350/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..0e1dacd925
--- /dev/null
+++ b/board/andes/ae350/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f56fa9636afe671f67b87b1bfcd546d124003a4817ad1b47d1a8c91d80a4043a  optee_os-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch b/board/andes/ae350/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
new file mode 100644
index 0000000000..1121e7865a
--- /dev/null
+++ b/board/andes/ae350/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
@@ -0,0 +1,44 @@
+From cc87f97d5b4b29cf13df14e475f31b4806e4eae7 Mon Sep 17 00:00:00 2001
+From: Che-Wei Chuang <cnoize@andestech.com>
+Date: Tue, 6 Jan 2026 11:19:31 +0800
+Subject: [PATCH] xtest: stats: Disable fragmentation calculation for older
+ OP-TEE OS
+
+optee-os versions prior to 4.6.0 do not provide the free2_sum field in
+struct pta_stats_alloc. xtest 4.6.0 unconditionally accesses this field,
+which breaks the build when used together with older OP-TEE OS releases
+such as 4.3.0.
+
+Disable the fragmentation calculation based on free2_sum to restore
+compatibility with older OP-TEE OS versions while keeping the remaining
+statistics intact.
+
+Upstream: Not applicable (Andes AE350 board-specific workaround)
+Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
+---
+ host/xtest/stats.c | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/host/xtest/stats.c b/host/xtest/stats.c
+index dc05d7b..212e5a5 100644
+--- a/host/xtest/stats.c
++++ b/host/xtest/stats.c
+@@ -155,15 +155,6 @@ static int stat_alloc(int argc, char *argv[])
+ 		       stats[n].desc);
+ 		printf("Bytes allocated:                       %"PRId32"\n",
+ 		       stats[n].allocated);
+-		if (stats[n].free2_sum && stats[n].size != stats[n].allocated) {
+-			double free2_sum = stats[n].free2_sum;
+-			double free_sum = stats[n].size - stats[n].allocated;
+-			double free_quote = sqrt(free2_sum) / free_sum;
+-			double fragmentation = 1.0 - free_quote * free_quote;
+-
+-			printf("Fragmentation:			       %u %%\n",
+-				(unsigned int)(fragmentation * 100.0));
+-		}
+ 		printf("Max bytes allocated:                   %"PRId32"\n",
+ 		       stats[n].max_allocated);
+ 		printf("Size of pool:                          %"PRId32"\n",
+-- 
+2.34.1
+
diff --git a/board/andes/ae350/patches/optee-test/optee-test.hash b/board/andes/ae350/patches/optee-test/optee-test.hash
new file mode 100644
index 0000000000..2b4fef8e2f
--- /dev/null
+++ b/board/andes/ae350/patches/optee-test/optee-test.hash
@@ -0,0 +1,2 @@
+# From https://github.com/OP-TEE/optee_test/releases/tag/4.3.0
+sha256  7bb181b74be88593df48321b816837acaad8e4d45e883f25a2e039978e5ec415  optee_test-4.3.0.tar.gz
diff --git a/board/andes/ae350/patches/uboot/uboot.hash b/board/andes/ae350/patches/uboot/uboot.hash
index 440526977b..5914d3cd78 100644
--- a/board/andes/ae350/patches/uboot/uboot.hash
+++ b/board/andes/ae350/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  c7726a52c9e626253962f6643fa9706a789b47acdf7ffb7f315f46d5ecf46d4d  uboot-ast-v5_4_1-release.tar.gz
+sha256  c6d9232e09ba1f318b6ff6c558c5847b8ac576eccfbeffb6d3c315dad3da4b49  uboot-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350/post-build.sh b/board/andes/ae350/post-build.sh
index e1669c2bcd..abfce537b4 100755
--- a/board/andes/ae350/post-build.sh
+++ b/board/andes/ae350/post-build.sh
@@ -1,3 +1,13 @@
 #!/bin/sh
+set -e
+
+mkdir -p "${BINARIES_DIR}"/dtb
+cd "${BUILD_DIR}"/linux-custom/arch/riscv/boot/dts/andes/ || exit 1
+
+for f in *.dtb; do
+	[ -e "$f" ] || continue
+	cp -a "$f" "${BINARIES_DIR}"/dtb
+done
+
 cp "$BINARIES_DIR"/Image "$TARGET_DIR"/boot
-cp "$BINARIES_DIR"/ae350_ax45mp.dtb "$TARGET_DIR"/boot
+cp -a "$BINARIES_DIR"/dtb "$TARGET_DIR"/boot
diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
index 36561fc777..9132869172 100644
--- a/board/andes/ae350/readme.txt
+++ b/board/andes/ae350/readme.txt
@@ -3,7 +3,7 @@ Intro
 
 Andestech AE350 Platform
 
-The AE350 prototype demonstrates the AE350 platform on the FPGA.
+The AE350 prototype demonstrates the AE350 platform on the FPGA and QEMU.
 
 How to build it
 ===============
@@ -30,7 +30,7 @@ Result of the build
 After building, you should obtain the following files:
 
   output/images/
-  |-- ae350_ax45mp.dtb
+  |-- dtb/*.dtb
   |-- boot.vfat
   |-- fw_dynamic.bin
   |-- fw_dynamic.elf
@@ -71,15 +71,16 @@ The Andes SPI_burn tool will be located in output/host/bin. Use
 the following commands to update the bootloader and device tree:
 
   $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x0     -i u-boot-spl.bin
-  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x10000 -i u-boot.itb
-  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0xf0000 -i ae350_ax45mp.dtb
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x20000 -i u-boot.itb
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x1e0000 \
+	-i dtb/ax45_c1_d_dsp_noncoherent_ae350_optee.dtb
 
 Note that the --addr option specifies the offset starting from
 the flash base address 0x80000000 and set by U-Boot configurations.
 e.g.
-u-boot-spl.bin  : CONFIG_SPL_TEXT_BASE=0x80000000
-u-boot.itb      : CONFIG_SPL_LOAD_FIT_ADDRESS=0x80010000
-ae350_ax45mp.dtb: CONFIG_SYS_FDT_BASE=0x800f0000
+u-boot-spl.bin: CONFIG_SPL_TEXT_BASE=0x80000000
+u-boot.itb:     CONFIG_SPL_LOAD_FIT_ADDRESS=0x80020000
+ax45_c1_d_dsp_noncoherent_ae350_optee.dtb: CONFIG_SYS_FDT_BASE=0x801E0000
 
 How to write the SD card
 ========================
@@ -104,3 +105,114 @@ Your SD card partition should be:
   /dev/sdb2  *     4097 126976  122880  60M 83 Linux
 
 Insert SD card and reset the board, it should boot Linux from mmc.
+
+QEMU (AE350 simulation) 
+=======================
+
+To run the andes_ae350 machine model, use the QEMU version:
+https://github.com/andestech/qemu
+
+Boot command example:
+  qemu-system-riscv64 \
+    -nographic \
+    -M andes_ae350 \
+    -cpu andes-ax45 \
+    -m 2G -smp 1 \
+    -bios none \
+    -device loader,file=u-boot-spl.bin,addr=0x80000000 \
+    -device loader,file=u-boot.itb,addr=0x80020000 \
+    -device loader,file=dtb/ax45_c1_d_dsp_noncoherent_ae350.dtb,addr=0x801E0000 \
+    -drive file=sdcard.img,format=raw,id=sd1 \
+    -device sd-card,drive=sd1 \
+    -net nic,model=atfmac100 \
+    -net user,net=192.168.96.0/24,dhcpstart=192.168.96.10,\
+domainname=andestech.com,hostfwd=tcp::9623-:23 \
+    -gdb tcp::9696
+
+OP-TEE OS (4.3.0)
+=================
+
+The file `tee.bin` is the OP-TEE OS secure world binary.
+It provides a Trusted Execution Environment (TEE) that runs alongside Linux in
+secure mode.
+
+The OP-TEE OS binary (`tee.bin`) is packaged inside the `u-boot.itb` image on
+the AE350 platform.
+
+OP-TEE provides the following core security services:
+
+- Secure execution of Trusted Applications (TAs)
+- Secure key storage and cryptographic operations
+- Hardware-backed isolation between Secure World and Normal World
+- Secure monitor call (SMC) interface for Linux communication
+
+Linux communicates with OP-TEE through the standard OP-TEE Linux driver using
+SMC calls. This allows normal world applications to access secure services
+without exposing sensitive data to the Linux kernel.
+
+For the single-core configuration, use ax45_c1_d_dsp_noncoherent_ae350_optee DTS.
+For the quad-core configuration, switch to ax45mp_c4_d_dsp_ae350_optee.
+
+To enable this feature, configure the following options in the Buildroot menuconfig:
+Bootloaders  --->
+[*] optee_os  --->
+OP-TEE OS version (Custom tarball)  --->
+URL of custom OP-TEE OS tarball:
+  $(call github,andestech,optee_os,optee_ast540_v4.3)/optee_os-optee_ast540_v4.3.tar.gz
+[*]   OP-TEE OS needs host-python-cryptography 
+Target platform (mandatory):
+  ae350
+Additional build variables:
+  ARCH=riscv CFG_TEE_CORE_NB_CORE=1 CFG_NUM_THREADS=2 CFG_UNWIND=y
+  CFG_IN_TREE_EARLY_TAS=trusted_keys/f04a0fe7-1f5d-4b9b-abf7-619b85b4ce8c
+  mem_usage CFG_CORE_HEAP_SIZE=524288 CFG_TEE_RAM_VA_SIZE=0x00800000
+  CFG_TDDRAM_SIZE=0x04000000 CFG_PKCS11_TA_HEAP_SIZE=131072
+Binary boot images:
+  tee.bin
+
+[*] opensbi  --->
+OpenSBI Version (Custom tarball)  --->
+URL of custom OpenSBI tarball:
+  $(call github,andestech,opensbi,optee_ast540_v4.3)/opensbi-optee_ast540_v4.3.tar.gz
+
+[*] U-Boot  --->
+U-Boot Version (Custom tarball)  --->
+URL of custom U-Boot tarball:
+  $(call github,andestech,uboot,optee_ast540_v4.3)/uboot-optee_ast540_v4.3.tar.gz
+Additional configuration fragment files:
+  board/andes/ae350/uboot.config.fragment board/andes/ae350/uboot-optee.config.fragment
+[*]   U-Boot needs OPTEE TEE
+U-Boot OPTEE TEE format (tee.bin)
+
+Kernel  --->
+Kernel version (Custom tarball)  --->
+URL of custom kernel tarball:
+  $(call github,andestech,linux,optee_ast540_v4.3)/linux-optee_ast540_v4.3.tar.gz
+In-tree Device Tree Source file names:
+  andes/ax45_c1_d_dsp_noncoherent_ae350_optee
+
+OP-TEE User-space Configuration (4.3.0)
+=======================================
+
+The OP-TEE user-space components are built from custom upstream
+tarballs and provide Linux support for OP-TEE OS.
+
+They can be enabled from Buildroot menuconfig:
+Target packages  --->
+  Security  --->
+
+-*- optee-client
+    optee-client version (Custom tarball)  --->
+      URL of custom optee-client tarball:
+        $(call github,OP-TEE,optee_client,4.3.0)/optee_client-4.3.0.tar.gz
+
+[*] optee-examples
+    optee-examples version (Custom tarball)  --->
+      URL of custom optee-examples tarball:
+        $(call github,linaro-swg,optee_examples,4.3.0)/optee_examples-4.3.0.tar.gz
+
+[*] optee-test
+    optee-test version (Custom tarball)  --->
+      URL of custom optee-test tarball:
+        $(call github,OP-TEE,optee_test,4.3.0)/optee_test-4.3.0.tar.gz
+
diff --git a/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf b/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
index be19e196a8..5506fab7c0 100644
--- a/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,3 @@
 label linux
    kernel /boot/Image
-   fdt /boot/ae350_ax45mp.dtb
    append earlycon=sbi root=/dev/mmcblk0p2 rootwait
diff --git a/board/andes/ae350/uboot-optee.config.fragment b/board/andes/ae350/uboot-optee.config.fragment
new file mode 100644
index 0000000000..b36776de17
--- /dev/null
+++ b/board/andes/ae350/uboot-optee.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_CMD_OPTEE=y
+CONFIG_OPTEE=y
+CONFIG_OPTEE_LIB=y
+CONFIG_OPTEE_TA_RPC_TEST=y
+CONFIG_TEE=y
diff --git a/board/andes/ae350/uboot.config.fragment b/board/andes/ae350/uboot.config.fragment
index 4497ed4c74..058e9f12d4 100644
--- a/board/andes/ae350/uboot.config.fragment
+++ b/board/andes/ae350/uboot.config.fragment
@@ -1,6 +1,11 @@
 CONFIG_SPL_FS_FAT=y
+CONFIG_SPL_LOAD_FIT_ADDRESS=0x80020000
 CONFIG_SPL_MMC=y
 CONFIG_SPL_OPENSBI_LOAD_ADDR=0x0
 CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
+CONFIG_SPL_RAM_DEVICE=y
+CONFIG_SPL_TEXT_BASE=0x80000000
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+CONFIG_SYS_FDT_BASE=0x801E0000
+CONFIG_TEXT_BASE=0x01800000
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 80b780b6e0..1845228ebb 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -11,22 +11,24 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y-andes)/linux-v6.0.y-andes.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,ast-v5_4_1-release)/linux-ast-v5_4_1-release.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae350/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ax45_c1_d_dsp_noncoherent_ae350"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="30M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,andestech,opensbi,ast-v5_4_1-release)/opensbi-ast-v5_4_1-release.tar.gz"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,andestech,uboot,ast-v5_4_1-release)/uboot-ast-v5_4_1-release.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -37,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SWDTB=1"
 BR2_PACKAGE_HOST_ANDES_SPI_BURN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
