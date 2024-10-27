Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D7D1357D
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 19:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F2AF405E8;
	Sun, 27 Oct 2024 19:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbiDJa7jq2Yi; Sun, 27 Oct 2024 19:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7451403C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7451403C4;
	Sun, 27 Oct 2024 19:43:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D252D971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCBA6400E5
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrEJMngTpleT for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 19:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BBEFA4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBEFA4004A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBEFA4004A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so35421085e9.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 12:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730058221; x=1730663021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMkY1dzeSddZEopw+iJOO/gHjxmzTsUJfxMHUAq0gAA=;
 b=evA5gp2r1TU8RCFQN8gx/H/LHCXlxNnJMQtlgAU6XwBAcfsYEAkCGDbw/ozaoVFwfo
 2rV+nXQ7LCpeYat9SA94GklF8pEw+NYJe/vVFkh5OCL/yYFKzw4PXilCt4dfd9oIqfws
 wdVlmdvYHojh6hrOGah8Ix+ChMDrNxtt8HIL3cHu/TC7p1altGHDfqb/B3mhVn7wCPM5
 01zqU9fAIhYM/IjInMDTr2kIaqFZ8ppzOqg2rLpJRBrb7SiPs/qmEBKm+Noprk46baEj
 +TEluk6J/YSKGvgevbjpWChsr/Mk8DM/SLg3bNjPaTBu8M9LN9rTH6dMwZr+szUGj+bH
 6BxA==
X-Gm-Message-State: AOJu0YyE8sNTkl9gFWmWx+lzfe2C44PhXu41bFYTdVK866iVvjWddNAY
 7jOQLAI6rh8QoCmvP/39p9hsEX55b2dxX5QIKuwefDyClSiMCJdLugwL/xtYQ/ZjG0urYh3SpRG
 o
X-Google-Smtp-Source: AGHT+IFhDVtEDPzGrpEuEKsUUVe+gJX+M1LDwfozo8RfmjsnVPJW7A+6e05BdWqUyy/tiA+URLgDsg==
X-Received: by 2002:a05:600c:4e8e:b0:431:3b53:105e with SMTP id
 5b1f17b1804b1-4319aca5995mr48030595e9.9.1730058221454; 
 Sun, 27 Oct 2024 12:43:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bb57sm7495010f8f.38.2024.10.27.12.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 12:43:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 20:43:36 +0100
Message-ID: <20241027194337.2444930-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241027194337.2444930-1-romain.naour@smile.fr>
References: <20241027194337.2444930-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730058221; x=1730663021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMkY1dzeSddZEopw+iJOO/gHjxmzTsUJfxMHUAq0gAA=;
 b=mNlcAv/xo05NcXaz02h5P+FmsDVvkAexZi91QrxKcAYJk7tCORq/EExt0FOxEmvUcJ
 fexdwyo87De7woQHXwdeEF/qFSBv85MhfBGY/KHXXg2Lk1fb+e2HfWpx+aJS/KyaXW+P
 2/xflr0TkV8XIr7afPLHEUN5C//eRL4YLxzXs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mNlcAv/x
Subject: [Buildroot] [PATCH v2 2/3] boot/edk2: bump to version
 edk2-stable202405
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:

  https://github.com/tianocore/edk2/releases/tag/edk2-stable202405

We can't bump to edk2-stable202408 yet due to a runtime issue while
testing qemu_aarch64_sbsa_defconfig following the switch generic
ArmPsciResetSystemLib [1]

  ERROR:   sbsa_sip_smc_handler: unhandled SMC (0xc20000ca) (function id: 202)

Qemu 9.0/9.1 is using a slightly older edk2 firmware based on
edk2-stable202405 release [2] that contains a commit [3] fixing a
bootloader crash produced with qemu_aarch64_sbsa_defconfig [4] since
Qemu 9.0.

From [5]:
"The version of the sbsa-ref EDK2 firmware we used to use in this test
had a bug where it might make an unaligned access to the framebuffer,
which causes a guest crash on newer versions of QEMU where we enforce
the architectural requirement that unaligned accesses to Device memory
should take an exception."

This commit [5] is backported to edk2-stable202405.

For the same reason, we have to update edk2-platforms to a specific
version [6]:

"QemuSbsa: enable WriteCombine for the FrameBuffer
QEMU no longer permits misaligned access to device memory, which breaks
QemuVideoDxe on SbsaQemu.

c1d1910be6e04a8b1a73090cf2881fb698947a6e commit in EDK2 fixed it by
enabling WriteCombine for Framebuffer memory. This change enables that
fix."

[1] https://github.com/tianocore/edk2-platforms/commit/2d0668d399708fc242336e310cc7e7bec0aec891
[2] https://gitlab.com/qemu-project/qemu/-/commit/24a7cd6a7c21f82f1ce9bd5ecf6fb54eb7bf4602
[3] https://github.com/tianocore/edk2/commit/c1d1910be6e04a8b1a73090cf2881fb698947a6e
[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/7764483764
[5] https://gitlab.com/qemu-project/qemu/-/commit/6c84daac58f0d75a908626faf89a832fc0532140
[6] https://github.com/tianocore/edk2-platforms/commit/3f08401365d67e10924c774e6c3f64be56bc15b6

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7764483764

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 ...oDxe-add-feature-PCD-to-remap-frameb.patch | 129 ++++++++++++++++++
 boot/edk2/edk2.hash                           |   2 +-
 boot/edk2/edk2.mk                             |   2 +-
 package/edk2-platforms/edk2-platforms.hash    |   2 +-
 package/edk2-platforms/edk2-platforms.mk      |   2 +-
 5 files changed, 133 insertions(+), 4 deletions(-)
 create mode 100644 boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch

diff --git a/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch b/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
new file mode 100644
index 0000000000..5f6ceb289d
--- /dev/null
+++ b/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
@@ -0,0 +1,129 @@
+From 921c78f57a16b00debd58899a48e7045015c374b Mon Sep 17 00:00:00 2001
+From: Ard Biesheuvel <ardb@kernel.org>
+Date: Mon, 17 Jun 2024 17:07:41 +0200
+Subject: [PATCH] OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer
+ W/C
+
+Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
+tolerate misaligned accesses to normal memory, and raise alignment
+faults on such accesses to device memory, which is the default for PCIe
+MMIO BARs.
+
+When emulating a PCIe graphics controller, the framebuffer is typically
+exposed via a MMIO BAR, while the disposition of the region is closer to
+memory (no side effects on reads or writes, except for the changing
+picture on the screen; direct random access to any pixel in the image).
+
+In order to permit the use of such controllers on platforms that only
+tolerate these types of accesses for normal memory, it is necessary to
+remap the memory. Use the DXE services to set the desired capabilities
+and attributes.
+
+Hide this behavior under a feature PCD so only platforms that really
+need it can enable it. (OVMF on x86 has no need for this)
+
+Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
+Upstream: https://github.com/tianocore/edk2/commit/c1d1910be6e04a8b1a73090cf2881fb698947a6e
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ OvmfPkg/OvmfPkg.dec                   |  5 +++++
+ OvmfPkg/QemuVideoDxe/Gop.c            | 19 +++++++++++++++++++
+ OvmfPkg/QemuVideoDxe/Qemu.h           |  2 +-
+ OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf |  4 ++++
+ 4 files changed, 29 insertions(+), 1 deletion(-)
+
+diff --git a/OvmfPkg/OvmfPkg.dec b/OvmfPkg/OvmfPkg.dec
+index 51be9a5959..2c40de8a13 100644
+--- a/OvmfPkg/OvmfPkg.dec
++++ b/OvmfPkg/OvmfPkg.dec
+@@ -444,3 +444,8 @@
+ 
+   ## This feature flag indicates the firmware build supports secure boot.
+   gUefiOvmfPkgTokenSpaceGuid.PcdSecureBootSupported|FALSE|BOOLEAN|0x6d
++
++  ## Whether QemuVideoDxe should perform a EFI_MEMORY_WC remap of the PCI
++  #  framebuffer. This might be required on platforms that do not tolerate
++  #  misaligned accesses otherwise.
++  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine|FALSE|BOOLEAN|0x75
+diff --git a/OvmfPkg/QemuVideoDxe/Gop.c b/OvmfPkg/QemuVideoDxe/Gop.c
+index b11eed7558..a29c025afd 100644
+--- a/OvmfPkg/QemuVideoDxe/Gop.c
++++ b/OvmfPkg/QemuVideoDxe/Gop.c
+@@ -9,6 +9,8 @@
+ 
+ #include "Qemu.h"
+ 
++#include <Library/DxeServicesTableLib.h>
++
+ STATIC
+ VOID
+ QemuVideoCompleteModeInfo (
+@@ -54,6 +56,7 @@ QemuVideoCompleteModeData (
+   EFI_GRAPHICS_OUTPUT_MODE_INFORMATION  *Info;
+   EFI_ACPI_ADDRESS_SPACE_DESCRIPTOR     *FrameBufDesc;
+   QEMU_VIDEO_MODE_DATA                  *ModeData;
++  EFI_STATUS                            Status;
+ 
+   ModeData = &Private->ModeData[Mode->Mode];
+   Info     = Mode->Info;
+@@ -79,6 +82,22 @@ QemuVideoCompleteModeData (
+     (UINT64)Mode->FrameBufferSize
+     ));
+ 
++  if (FeaturePcdGet (PcdRemapFrameBufferWriteCombine)) {
++    Status = gDS->SetMemorySpaceCapabilities (
++                    FrameBufDesc->AddrRangeMin,
++                    FrameBufDesc->AddrLen,
++                    EFI_MEMORY_UC | EFI_MEMORY_WC | EFI_MEMORY_XP
++                    );
++    ASSERT_EFI_ERROR (Status);
++
++    Status = gDS->SetMemorySpaceAttributes (
++                    FrameBufDesc->AddrRangeMin,
++                    FrameBufDesc->AddrLen,
++                    EFI_MEMORY_WC | EFI_MEMORY_XP
++                    );
++    ASSERT_EFI_ERROR (Status);
++  }
++
+   FreePool (FrameBufDesc);
+   return EFI_SUCCESS;
+ }
+diff --git a/OvmfPkg/QemuVideoDxe/Qemu.h b/OvmfPkg/QemuVideoDxe/Qemu.h
+index 57341a0bbf..a3da725fbf 100644
+--- a/OvmfPkg/QemuVideoDxe/Qemu.h
++++ b/OvmfPkg/QemuVideoDxe/Qemu.h
+@@ -13,7 +13,7 @@
+ #ifndef _QEMU_H_
+ #define _QEMU_H_
+ 
+-#include <Uefi.h>
++#include <PiDxe.h>
+ #include <Protocol/GraphicsOutput.h>
+ #include <Protocol/PciIo.h>
+ #include <Protocol/DriverSupportedEfiVersion.h>
+diff --git a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
+index 43a6e07faa..4c0870171b 100644
+--- a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
++++ b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
+@@ -44,6 +44,7 @@
+ 
+ [LibraryClasses]
+   BaseMemoryLib
++  DxeServicesTableLib
+   FrameBufferBltLib
+   DebugLib
+   DevicePathLib
+@@ -61,6 +62,9 @@
+   gEfiDevicePathProtocolGuid                    # PROTOCOL BY_START
+   gEfiPciIoProtocolGuid                         # PROTOCOL TO_START
+ 
++[FeaturePcd]
++  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine
++
+ [Pcd]
+   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId
+   gUefiOvmfPkgTokenSpaceGuid.PcdVideoResolutionSource
+-- 
+2.45.0
+
diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index f7daa8ddf3..abcf3c6b8e 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6bdfdffcc2235a117b3f9d4124da63103f19ff30157673f812e1093b20ebb7ad  edk2-edk2-stable202308-git4.tar.gz
+sha256  4595b9d9d14c06bd03f575e4b7623574a4a874ef465652ecdc224099a5b14fc7  edk2-edk2-stable202405-git4.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index e5816b353a..145a9a80ae 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202308
+EDK2_VERSION = edk2-stable202405
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent
diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 4c74c7dfb6..0095d4298d 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c240a8ec7816bc5963d881c84eb18d880e9269c117cfc46a3106b0c5e6e80c66  edk2-platforms-e509ac5a729ebe2a3bc905aed1df23226aca4dc9.tar.gz
+sha256  41fa720ac644ec0523c576ff28eba5e0308c9649111ce42f7d408b8d8b30eaf5  edk2-platforms-3f08401365d67e10924c774e6c3f64be56bc15b6.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 7bd86ff159..23d9221649 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = e509ac5a729ebe2a3bc905aed1df23226aca4dc9
+EDK2_PLATFORMS_VERSION = 3f08401365d67e10924c774e6c3f64be56bc15b6
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
