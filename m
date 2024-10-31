Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E0E67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB086408BD;
	Thu, 31 Oct 2024 21:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAGQh08-In6m; Thu, 31 Oct 2024 21:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21285408AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21285408AF;
	Thu, 31 Oct 2024 21:34:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FBD45E46
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E96F8174A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CF3vpkzfe4l for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:34:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 081CC80EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081CC80EAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 081CC80EAB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BF1E6B0055A;
 Thu, 31 Oct 2024 22:34:35 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 22:33:43 +0100
Message-ID: <20241031213348.2057705-4-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410484;
 bh=QZwfRF1hrz0APwpKSDyoNL/QfccxajKcS35BCa5+o44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XkS55/VhaAF8ZkdHk7p1YiKCwPb8Yl2wD/G8r0/qWZaq00SfLwZG100ZpuPfRWNUT
 QYjJvzoW9ny9k2TwDpkAAABTYQyTtKqlMiSbMtMvCZ1wQfQ9+n824oBQJ/o5bQJ63V
 RGaI55hwMtId7U+0cSem6Ker0IY1huGeFmcfJFyskvlV7r8flmqlRCP/kpPuAqP9ZE
 k343twKX0Nhnla7egMsU32n3wb0D2mcE6usk3+NNofAKI4qjJ64iGj7VpsTHWlHAZn
 k5rU5izxe8IQWTl0L8RWNiOYD9VH5AcJ+rKSbLLm3ZQB+JCKMfpOA8jffXYKQcjY/h
 f7qXx8PMYuI1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XkS55/Vh
Subject: [Buildroot] [PATCH v3 3/8] boot/edk2: bump to version
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
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

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

As a side note, the edk2-non-osi package does not need to be updated, so
it is left untouched.

Finally, this EDK2 version requires a recent Qemu version. The version
included in the reference Docker image (5.2.0) is too old and will not
allow to start this EDK2 version. Therefore, this bump is known to be
incompatible with runtime tests which are using EDK2 on Aarch64
architecture. At the authoring time of this commit, broken tests are:
- tests.boot.test_edk2
- tests.boot.test_grub.TestGrubAArch64EFI
- tests.package.test_fwts

Note that the EDK2/Qemu incompatibility is only affecting Aarch64
tests. Other tests using EDK2 on i386 or x86_64 are not affected.

To prevent this commit introducing broken runtime tests, those have
been disabled in a previous commit.

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
[Julien: add comments in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
