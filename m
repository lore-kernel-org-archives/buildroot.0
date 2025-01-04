Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA873E77199
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 18:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5FA407B1;
	Sat,  4 Jan 2025 18:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsiHO-R-J3sB; Sat,  4 Jan 2025 18:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B25E04077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25E04077D;
	Sat,  4 Jan 2025 18:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA209AF0
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C14A810C7
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy07bQyXHiJe for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50511810C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50511810C6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50511810C6
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f796586so135874545e9.3
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 09:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736013590; x=1736618390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzgdTq4draiffDw1rsCa60smsLBD7XnVtrCcP4bCUow=;
 b=DWASM2H2ITU1NuCXKCwuuxS9fJrktV8jgGxS7158HUCmnVVvugsDO426P8fm0LbHy9
 RVLKeU2orMX6cNxXw32cQuSyTfvBpEVDXlM9R+Yk2mcndgoPjMlQIjqObOIRveQvE15H
 LNVH4rngYQ/fdBhrSWvcz4aH1UsyqzDGWi+4tMwoh2uN5Z0dV5utCLVoVZthAQRZRpoU
 NSM4KS41Zk0OPjpMw/EUzUjvkoSuwQpZQ7ZKAsUs+wnxPWUa1NZ3Mx9+NH9cqjIHBp4T
 OdOjnKgmjHTkNT05TPWmsD39fnSoslt8lzccLm+btRAjwkjai6ixlpDWUC3cZyB0rVSG
 LCKA==
X-Gm-Message-State: AOJu0Yy3ixj6LB6Ksc9ObwnxKYN79Vv+NvDvBaWoFcAJLDzygLPE96dc
 cdw7rm5QR8XZsnW2kj1TSimk7kW/B7fMchLcW1qM8pQ7c8/NM7VZcgXmi9aU1xoc9ND0iG6840d
 +
X-Gm-Gg: ASbGnctPPPCklbcxFYz1C/u+P1mQfAJItQl2ZpOAwTK4n+06BRqgtLbYsX9YM4FmzPi
 rRShPmOpqxiUwbwTM6S+UvgXmjR/1/Ev8lyKglW5VFB6VWSQgolvN8xdrHHf7snls8KHuJ4LGM8
 0Vz0MsZInI9WbwQuIsfsXYUVWgO/dDKxqw1cQ+Bq/TrkQWH3B0kDuNUBg2+Q0pRUrpZxRYA7lza
 4QpeVrTXIv/J35DCLCx3+PLv6KHwh7uPnGfAltrYVDgXtlrxYzFtdWLbn5LJembVmY1kpLrxK20
 N08U3M8sYVyuldQ485Vgsfxx9aUXomRZ82PD0I2rSP9EuMNiBld5lA==
X-Google-Smtp-Source: AGHT+IHcOm6u8IyGUVajnJY1yrsx2qrNNWqbw/cIO28SBpCMw8pOoLhbXa5BQ+xZQdI3YlJFBcfu7w==
X-Received: by 2002:a05:600c:4f49:b0:436:6460:e67a with SMTP id
 5b1f17b1804b1-43668a3a334mr402575415e9.25.1736013590205; 
 Sat, 04 Jan 2025 09:59:50 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm43030487f8f.10.2025.01.04.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 09:59:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Jan 2025 18:59:44 +0100
Message-ID: <20250104175945.916723-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104175945.916723-1-romain.naour@smile.fr>
References: <20250104175945.916723-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736013590; x=1736618390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzgdTq4draiffDw1rsCa60smsLBD7XnVtrCcP4bCUow=;
 b=NzH3CEjmwXsKtMQiH9ucq7xKJqekN/TJmFXL38AeyHYC4y6lRdenXsLYmB5Cm+tv5o
 90w+QKHyRAM4MMJrKntiLC5YVS6OG17/19ig3bPQ9v1xoBiBgGGx1Lwun3xcQSxvlAN9
 1eLVM3FdfeHa4K3fXM+t8F5k1cda7syxztMZ4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=NzH3CEjm
Subject: [Buildroot] [PATCH 4/5] boot/edk2: bump to version edk2-stable202411
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sync edk2-platforms with the last commit merged at the edk2 release
date (2024-11-22).

See:
https://github.com/tianocore/edk2/releases/tag/edk2-stable202411

Runtime tested with tests using EDK2 package: TestFwts, TestEdk2,
TestIso9660Grub2EFI, TestIso9660Grub2Hybrid, TestGrubi386EFI,
TestGrubX8664EFI, TestGrubAArch64EFI, TestGrubRiscV64EFI.

Runtime tested with defconfig using EDK2 package:
qemu_aarch64_sbsa_defconfig, qemu_riscv64_virt_efi_defconfig.

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...oDxe-add-feature-PCD-to-remap-frameb.patch | 129 ------------------
 boot/edk2/edk2.hash                           |   2 +-
 boot/edk2/edk2.mk                             |   2 +-
 package/edk2-platforms/edk2-platforms.hash    |   2 +-
 package/edk2-platforms/edk2-platforms.mk      |   2 +-
 5 files changed, 4 insertions(+), 133 deletions(-)
 delete mode 100644 boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch

diff --git a/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch b/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
deleted file mode 100644
index 5f6ceb289d..0000000000
--- a/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 921c78f57a16b00debd58899a48e7045015c374b Mon Sep 17 00:00:00 2001
-From: Ard Biesheuvel <ardb@kernel.org>
-Date: Mon, 17 Jun 2024 17:07:41 +0200
-Subject: [PATCH] OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer
- W/C
-
-Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
-tolerate misaligned accesses to normal memory, and raise alignment
-faults on such accesses to device memory, which is the default for PCIe
-MMIO BARs.
-
-When emulating a PCIe graphics controller, the framebuffer is typically
-exposed via a MMIO BAR, while the disposition of the region is closer to
-memory (no side effects on reads or writes, except for the changing
-picture on the screen; direct random access to any pixel in the image).
-
-In order to permit the use of such controllers on platforms that only
-tolerate these types of accesses for normal memory, it is necessary to
-remap the memory. Use the DXE services to set the desired capabilities
-and attributes.
-
-Hide this behavior under a feature PCD so only platforms that really
-need it can enable it. (OVMF on x86 has no need for this)
-
-Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
-Upstream: https://github.com/tianocore/edk2/commit/c1d1910be6e04a8b1a73090cf2881fb698947a6e
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- OvmfPkg/OvmfPkg.dec                   |  5 +++++
- OvmfPkg/QemuVideoDxe/Gop.c            | 19 +++++++++++++++++++
- OvmfPkg/QemuVideoDxe/Qemu.h           |  2 +-
- OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf |  4 ++++
- 4 files changed, 29 insertions(+), 1 deletion(-)
-
-diff --git a/OvmfPkg/OvmfPkg.dec b/OvmfPkg/OvmfPkg.dec
-index 51be9a5959..2c40de8a13 100644
---- a/OvmfPkg/OvmfPkg.dec
-+++ b/OvmfPkg/OvmfPkg.dec
-@@ -444,3 +444,8 @@
- 
-   ## This feature flag indicates the firmware build supports secure boot.
-   gUefiOvmfPkgTokenSpaceGuid.PcdSecureBootSupported|FALSE|BOOLEAN|0x6d
-+
-+  ## Whether QemuVideoDxe should perform a EFI_MEMORY_WC remap of the PCI
-+  #  framebuffer. This might be required on platforms that do not tolerate
-+  #  misaligned accesses otherwise.
-+  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine|FALSE|BOOLEAN|0x75
-diff --git a/OvmfPkg/QemuVideoDxe/Gop.c b/OvmfPkg/QemuVideoDxe/Gop.c
-index b11eed7558..a29c025afd 100644
---- a/OvmfPkg/QemuVideoDxe/Gop.c
-+++ b/OvmfPkg/QemuVideoDxe/Gop.c
-@@ -9,6 +9,8 @@
- 
- #include "Qemu.h"
- 
-+#include <Library/DxeServicesTableLib.h>
-+
- STATIC
- VOID
- QemuVideoCompleteModeInfo (
-@@ -54,6 +56,7 @@ QemuVideoCompleteModeData (
-   EFI_GRAPHICS_OUTPUT_MODE_INFORMATION  *Info;
-   EFI_ACPI_ADDRESS_SPACE_DESCRIPTOR     *FrameBufDesc;
-   QEMU_VIDEO_MODE_DATA                  *ModeData;
-+  EFI_STATUS                            Status;
- 
-   ModeData = &Private->ModeData[Mode->Mode];
-   Info     = Mode->Info;
-@@ -79,6 +82,22 @@ QemuVideoCompleteModeData (
-     (UINT64)Mode->FrameBufferSize
-     ));
- 
-+  if (FeaturePcdGet (PcdRemapFrameBufferWriteCombine)) {
-+    Status = gDS->SetMemorySpaceCapabilities (
-+                    FrameBufDesc->AddrRangeMin,
-+                    FrameBufDesc->AddrLen,
-+                    EFI_MEMORY_UC | EFI_MEMORY_WC | EFI_MEMORY_XP
-+                    );
-+    ASSERT_EFI_ERROR (Status);
-+
-+    Status = gDS->SetMemorySpaceAttributes (
-+                    FrameBufDesc->AddrRangeMin,
-+                    FrameBufDesc->AddrLen,
-+                    EFI_MEMORY_WC | EFI_MEMORY_XP
-+                    );
-+    ASSERT_EFI_ERROR (Status);
-+  }
-+
-   FreePool (FrameBufDesc);
-   return EFI_SUCCESS;
- }
-diff --git a/OvmfPkg/QemuVideoDxe/Qemu.h b/OvmfPkg/QemuVideoDxe/Qemu.h
-index 57341a0bbf..a3da725fbf 100644
---- a/OvmfPkg/QemuVideoDxe/Qemu.h
-+++ b/OvmfPkg/QemuVideoDxe/Qemu.h
-@@ -13,7 +13,7 @@
- #ifndef _QEMU_H_
- #define _QEMU_H_
- 
--#include <Uefi.h>
-+#include <PiDxe.h>
- #include <Protocol/GraphicsOutput.h>
- #include <Protocol/PciIo.h>
- #include <Protocol/DriverSupportedEfiVersion.h>
-diff --git a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
-index 43a6e07faa..4c0870171b 100644
---- a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
-+++ b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
-@@ -44,6 +44,7 @@
- 
- [LibraryClasses]
-   BaseMemoryLib
-+  DxeServicesTableLib
-   FrameBufferBltLib
-   DebugLib
-   DevicePathLib
-@@ -61,6 +62,9 @@
-   gEfiDevicePathProtocolGuid                    # PROTOCOL BY_START
-   gEfiPciIoProtocolGuid                         # PROTOCOL TO_START
- 
-+[FeaturePcd]
-+  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine
-+
- [Pcd]
-   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId
-   gUefiOvmfPkgTokenSpaceGuid.PcdVideoResolutionSource
--- 
-2.45.0
-
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index abcf3c6b8e..3410b6edce 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4595b9d9d14c06bd03f575e4b7623574a4a874ef465652ecdc224099a5b14fc7  edk2-edk2-stable202405-git4.tar.gz
+sha256  e3e9ee3662335fac5df1f30f2027cf3c8d776bf2c52a77795a6d80766522e044  edk2-edk2-stable202411-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 145a9a80ae..3941d01883 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202405
+EDK2_VERSION = edk2-stable202411
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 0095d4298d..4a717a04d4 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41fa720ac644ec0523c576ff28eba5e0308c9649111ce42f7d408b8d8b30eaf5  edk2-platforms-3f08401365d67e10924c774e6c3f64be56bc15b6.tar.gz
+sha256  6185750107616c263ed43157094e6fe2c1bfc1b55a2c9d98b322418784264e73  edk2-platforms-f10cc760cf3f7eb693822de1347e71173944e44a.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 23d9221649..65fcf81a3c 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = 3f08401365d67e10924c774e6c3f64be56bc15b6
+EDK2_PLATFORMS_VERSION = f10cc760cf3f7eb693822de1347e71173944e44a
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
