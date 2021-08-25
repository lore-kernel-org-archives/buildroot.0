Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C578C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 18:19:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE1F61075
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 18:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DE1F61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA32740105;
	Wed, 25 Aug 2021 18:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4WMAjz1dqLq; Wed, 25 Aug 2021 18:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 821584013C;
	Wed, 25 Aug 2021 18:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13C131BF39F
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 18:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00F92613BF
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 18:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUyeibMdYbix for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 18:19:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C25D5605EE
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 18:19:12 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id w4so187097ljh.13
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUt5/0P0h3YULbjIlEzu7+/qEpJaYOH5bmkZWIkyje0=;
 b=qc8Z2ZUuxDD4lOQAarL5LJsHjyJLkqrYU/GcI+RYvP6kxoEtON3yHCdFRYfSXJIT5O
 mwGa3toLJnGi1gTQgJtuHZtEATyrAJ0LVDs/pppSc5Y4Cs28UYJMN1vNeqCgB5z7nD1g
 vxS9kIHQnji0NmCrHoF1xMrIJhNfs1pLf+ZqAypi84k5kEabqJHZT9pPXBYGDVKzvDZ9
 0ouYELgV3rwcJSCicbLk8Bm3Z+8Us12patCi2WhxQ5QZ3fElKzxkkgpEmRk+tIcZa4M/
 o61K2G4loHTluFV461T3deQXvc1EFnVebfwVWgTO4hsRo+OOgnOyvQnthBolK+5GLzfB
 3qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUt5/0P0h3YULbjIlEzu7+/qEpJaYOH5bmkZWIkyje0=;
 b=VFZgq5iNtNtWBD5NevcJNC8AXi/OGyKeAnRwP4JteN4mJAlYDKmSYgZdLXZ+8kEUfe
 NqZTZNxXdsjGqPuT7vRGXfBisn31X0c8r8dT94MDDAAX49U6acC9yFNpU9CM6hI+n2bS
 +mU6mRd60lVVLMC0bxl+0/KJcufYL14b7+1+xgnpMHT1UA+zzevMvIqEAuYy4P0+Uch1
 SAuAhZ15M9oNDUjYp/iacLhEva6yELm74CUi6OT2vTjofw0vmcbG9nFYw562jL00NhPG
 0rOWTOE79zpGwxdmQisZDcEFxkLQbFkbh86TjMoZGXlvVzADRakscx7mIkOopmsex079
 jgsQ==
X-Gm-Message-State: AOAM533OY4wgYGQwnfX8A9GtwYp6RNQyzflk5dcRq2G+By7W+CLbHqid
 lldadCqStHEIsnX1jnwXnjRiAiVRRUjkXK2IuO0=
X-Google-Smtp-Source: ABdhPJxrie7FfTT4pLLnqi/qEajRd9djr07yDl6/EdVhPy7/zm2jqxi2mppmWUS9tKJ/+ndshHPPBg==
X-Received: by 2002:a2e:2406:: with SMTP id k6mr35767778ljk.258.1629915550589; 
 Wed, 25 Aug 2021 11:19:10 -0700 (PDT)
Received: from localhost.localdomain (m90-131-47-37.cust.tele2.lt.
 [90.131.47.37])
 by smtp.gmail.com with ESMTPSA id j20sm80125lji.41.2021.08.25.11.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 11:19:10 -0700 (PDT)
From: Yauheni Saldatsenka <eugentoo@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:18:58 +0300
Message-Id: <20210825181858.801574-3-eugentoo@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825181858.801574-1-eugentoo@gmail.com>
References: <20210825181858.801574-1-eugentoo@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] [PATCH v3 1/1]
 configs/stm32f469_disco_xip_defconfig: alternative defconfig for XIP
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Result of make tinyconfig was taken as a starting point to fit kernel
into flash memory.
Current setup kernel + rootfs fits in 1.6MB on-chip flash memory.

Fixes:
    - Move kernel to new flash bank due to growth of dtb size
    - Fix kernel start address in bootloader

For better binary size optimization gcc LTO is turned on.

Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>

----
v2 -> v3:
- Create separate readme.txt for xip configuration
- Create separate flash.sh script for xip configuration

Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
---
 .../stm32f469-disco/flash.sh                  | 45 ++++---------------
 .../stm32f469-disco/flash_xip.sh              | 20 +++++++++
 .../stm32f469-disco/readme.txt                | 26 +++--------
 .../stm32f469-disco/readme_xip.txt            | 22 +++++++++
 4 files changed, 57 insertions(+), 56 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f469-disco/flash_xip.sh
 create mode 100644 board/stmicroelectronics/stm32f469-disco/readme_xip.txt

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
index 0e130908aa..984d2b2599 100755
--- a/board/stmicroelectronics/stm32f469-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
@@ -1,45 +1,18 @@
 #!/bin/bash
 
 OUTPUT_DIR=$1
-BUILD_TYPE=$2
 
-if ! test -d "${OUTPUT_DIR}"; then
+if ! test -d "${OUTPUT_DIR}" ; then
     echo "ERROR: no output directory specified."
     echo "Usage: $0 OUTPUT_DIR"
     exit 1
 fi
 
-if  [[ -z "${BUILD_TYPE}" ]]; then
-    echo "ERROR: no build type specified, please select 'xip' or 'uboot'."
-    echo "Usage: $0 OUTPUT_DIR $1 BUILD_TYPE"
-    exit 1
-fi
-
-case "${BUILD_TYPE}" in
-	"xip")
-		${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
-					 -c "init" \
-					 -c "reset init" \
-					 -c "flash probe 0" \
-					 -c "flash info 0" \
-					 -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
-					 -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
-					 -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000" \
-					 -c "reset run" \
-					 -c "shutdown"
-		;;
-	"uboot")
-		FLASH_COMMAND=
-		${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
-					 -c "init" \
-					 -c "reset init" \
-					 -c "flash probe 0" \
-					 -c "flash info 0" \
-					 -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
-					 -c "reset run" \
-					 -c "shutdown"
-	    ;;
-	*)
-		echo "Wrong build type. Please select from: xip, uboot"
-		;;
-esac
+${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f469-disco/flash_xip.sh b/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
new file mode 100644
index 0000000000..b5a067cee5
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}"; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index 646f340382..c1e1d30e69 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -4,37 +4,23 @@ STM32F469 Discovery
 This tutorial describes how to use the predefined Buildroot
 configuration for the STM32F469 Discovery evaluation platform.
 
-There are two setups supported:
-1. Internal flash memory is fully occupied with u-boot bootloader which boots kernel with
-   root filesystem from MMC.
-2. Internal flash memory stores simple afboot-stm32 bootloader, device tree and
-   in place (XIP) kernel with built-in initramfs.
-   Kernel is based on tinyconfig.
-
 Building
 --------
-  Type
-  "make stm32f469_disco_defconfig"
-  to build u-boot setup
-  or
-  "make stm32f469_disco_xip_defconfig"
-  to build xip setup
-
-  Then
 
-  "make"
+  make stm32f469_disco_defconfig
+  make
 
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/ <BUILD_TYPE>
+  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
 
-  <BUILD_TYPE> can be "xip" or "uboot"
+It will flash the U-boot bootloader.
 
-Creating SD card for u-boot setup
+Creating SD card
 ----------------
 
-Buildroot prepares an "sdcard.img" image in the output/images/ directory,
+Buildroot prepares an"sdcard.img" image in the output/images/ directory,
 ready to be dumped on a SD card. Launch the following command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
diff --git a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
new file mode 100644
index 0000000000..c4c93cef6c
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
@@ -0,0 +1,22 @@
+STM32F469 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F469 Discovery evaluation platform.
+
+Internal flash memory stores simple afboot-stm32 bootloader, device tree and
+in place (XIP) kernel with built-in initramfs.
+Kernel is based on tinyconfig.
+
+Building
+--------
+
+  make stm32f469_disco_xip_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+
+It will flash binary to internal flash memory.
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
