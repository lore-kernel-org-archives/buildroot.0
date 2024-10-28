Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A14D5B149
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EEFE80AE7;
	Mon, 28 Oct 2024 20:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFmYECU0NYfv; Mon, 28 Oct 2024 20:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7531B80B1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7531B80B1C;
	Mon, 28 Oct 2024 20:27:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05463112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA8B740BF3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTaHk-pohAcG for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:27:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD02640BE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD02640BE7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD02640BE7
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:27:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 884E1B0055E;
 Mon, 28 Oct 2024 21:27:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59798])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Oct 2024 21:27:30 +0100
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 21:27:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241027194337.2444930-2-romain.naour@smile.fr>
References: <20241027194337.2444930-1-romain.naour@smile.fr>
 <20241027194337.2444930-2-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <cefe2b8e2bcf392b1db0eddc3a38b2bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730147251;
 bh=IRQ/K0hFcmW6gjfUf5IcLRXlx1WZ4+aXiZtAqnmjE/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W8LjTlNRI4kzKdHWup1OcUMwgYjdSQu1i2S65ZdbQu/dXcgIPuVKA6a3fztPwDUae
 WkO0mPLyfMKz87Q/ES8GP4nCZcOtdHa7mHE60TkL/UTYE//ORpNhuDHn38F5zyMb4q
 LvrHha+kiobn2Eb5WP7vODoe0zlttBpm6FQNsGbvgoDahwyc7Dv8wpM8n5Wsy9XDR9
 5BKNcPzL+jkPTEQrj0CpTVMMt8ZT0FPHu1EIZ+70mO1g27P3s+eJ560UywwZKXn3do
 S6IEBpxqwhkchVLiyNILBj1ypYbUZC9syagu+/wmRdTb8w+nmANCTDjnM7VVkW7c1T
 CvK77Zfz3fO9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W8LjTlNR
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/edk2: bump to version
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

Thank you for the patch!

On 27/10/2024 20:43, Romain Naour via buildroot wrote:
> Release notes:
> 
>   https://github.com/tianocore/edk2/releases/tag/edk2-stable202405
> 
> We can't bump to edk2-stable202408 yet due to a runtime issue while
> testing qemu_aarch64_sbsa_defconfig following the switch generic
> ArmPsciResetSystemLib [1]
> 
>   ERROR:   sbsa_sip_smc_handler: unhandled SMC (0xc20000ca) (function 
> id: 202)
> 
> Qemu 9.0/9.1 is using a slightly older edk2 firmware based on
> edk2-stable202405 release [2] that contains a commit [3] fixing a
> bootloader crash produced with qemu_aarch64_sbsa_defconfig [4] since
> Qemu 9.0.
> 
> From [5]:
> "The version of the sbsa-ref EDK2 firmware we used to use in this test
> had a bug where it might make an unaligned access to the framebuffer,
> which causes a guest crash on newer versions of QEMU where we enforce
> the architectural requirement that unaligned accesses to Device memory
> should take an exception."
> 
> This commit [5] is backported to edk2-stable202405.
> 
> For the same reason, we have to update edk2-platforms to a specific
> version [6]:
> 
> "QemuSbsa: enable WriteCombine for the FrameBuffer
> QEMU no longer permits misaligned access to device memory, which breaks
> QemuVideoDxe on SbsaQemu.
> 
> c1d1910be6e04a8b1a73090cf2881fb698947a6e commit in EDK2 fixed it by
> enabling WriteCombine for Framebuffer memory. This change enables that
> fix."
> 
> [1] 
> https://github.com/tianocore/edk2-platforms/commit/2d0668d399708fc242336e310cc7e7bec0aec891
> [2] 
> https://gitlab.com/qemu-project/qemu/-/commit/24a7cd6a7c21f82f1ce9bd5ecf6fb54eb7bf4602
> [3] 
> https://github.com/tianocore/edk2/commit/c1d1910be6e04a8b1a73090cf2881fb698947a6e
> [4] https://gitlab.com/buildroot.org/buildroot/-/jobs/7764483764
> [5] 
> https://gitlab.com/qemu-project/qemu/-/commit/6c84daac58f0d75a908626faf89a832fc0532140
> [6] 
> https://github.com/tianocore/edk2-platforms/commit/3f08401365d67e10924c774e6c3f64be56bc15b6
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7764483764
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...oDxe-add-feature-PCD-to-remap-frameb.patch | 129 ++++++++++++++++++
>  boot/edk2/edk2.hash                           |   2 +-
>  boot/edk2/edk2.mk                             |   2 +-
>  package/edk2-platforms/edk2-platforms.hash    |   2 +-
>  package/edk2-platforms/edk2-platforms.mk      |   2 +-
>  5 files changed, 133 insertions(+), 4 deletions(-)
>  create mode 100644 
> boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
> 
> diff --git 
> a/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch 
> b/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
> new file mode 100644
> index 0000000000..5f6ceb289d
> --- /dev/null
> +++ 
> b/boot/edk2/0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch
> @@ -0,0 +1,129 @@
> +From 921c78f57a16b00debd58899a48e7045015c374b Mon Sep 17 00:00:00 2001
> +From: Ard Biesheuvel <ardb@kernel.org>
> +Date: Mon, 17 Jun 2024 17:07:41 +0200
> +Subject: [PATCH] OvmfPkg/QemuVideoDxe: add feature PCD to remap 
> framebuffer
> + W/C
> +
> +Some platforms (such as SBSA-QEMU on recent builds of the emulator) 
> only
> +tolerate misaligned accesses to normal memory, and raise alignment
> +faults on such accesses to device memory, which is the default for 
> PCIe
> +MMIO BARs.
> +
> +When emulating a PCIe graphics controller, the framebuffer is 
> typically
> +exposed via a MMIO BAR, while the disposition of the region is closer 
> to
> +memory (no side effects on reads or writes, except for the changing
> +picture on the screen; direct random access to any pixel in the 
> image).
> +
> +In order to permit the use of such controllers on platforms that only
> +tolerate these types of accesses for normal memory, it is necessary to
> +remap the memory. Use the DXE services to set the desired capabilities
> +and attributes.
> +
> +Hide this behavior under a feature PCD so only platforms that really
> +need it can enable it. (OVMF on x86 has no need for this)
> +
> +Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> +Upstream: 
> https://github.com/tianocore/edk2/commit/c1d1910be6e04a8b1a73090cf2881fb698947a6e
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>

On my side (this series applied on top of branch master at 81e7806),
this patch does not apply. This can be reproduced with:

     make qemu_aarch64_sbsa_defconfig
     make edk2-patch

Which fails with output:

     Applying 
0001-OvmfPkg-QemuVideoDxe-add-feature-PCD-to-remap-frameb.patch using 
patch:
     patching file OvmfPkg/OvmfPkg.dec
     Hunk #1 FAILED at 444 (different line endings).
     1 out of 1 hunk FAILED -- saving rejects to file 
OvmfPkg/OvmfPkg.dec.rej
     patching file OvmfPkg/QemuVideoDxe/Gop.c
     Hunk #1 FAILED at 9 (different line endings).
     Hunk #2 FAILED at 54 (different line endings).
     Hunk #3 FAILED at 79 (different line endings).
     3 out of 3 hunks FAILED -- saving rejects to file 
OvmfPkg/QemuVideoDxe/Gop.c.rej
     patching file OvmfPkg/QemuVideoDxe/Qemu.h
     Hunk #1 FAILED at 13 (different line endings).
     1 out of 1 hunk FAILED -- saving rejects to file 
OvmfPkg/QemuVideoDxe/Qemu.h.rej
     patching file OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
     Hunk #1 FAILED at 44 (different line endings).
     Hunk #2 FAILED at 61 (different line endings).
     2 out of 2 hunks FAILED -- saving rejects to file 
OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf.rej

Could you have a look please?

> +---
> + OvmfPkg/OvmfPkg.dec                   |  5 +++++
> + OvmfPkg/QemuVideoDxe/Gop.c            | 19 +++++++++++++++++++
> + OvmfPkg/QemuVideoDxe/Qemu.h           |  2 +-
> + OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf |  4 ++++
> + 4 files changed, 29 insertions(+), 1 deletion(-)
> +
> +diff --git a/OvmfPkg/OvmfPkg.dec b/OvmfPkg/OvmfPkg.dec
> +index 51be9a5959..2c40de8a13 100644
> +--- a/OvmfPkg/OvmfPkg.dec
> ++++ b/OvmfPkg/OvmfPkg.dec
> +@@ -444,3 +444,8 @@
> +
> +   ## This feature flag indicates the firmware build supports secure 
> boot.
> +   
> gUefiOvmfPkgTokenSpaceGuid.PcdSecureBootSupported|FALSE|BOOLEAN|0x6d
> ++
> ++  ## Whether QemuVideoDxe should perform a EFI_MEMORY_WC remap of the 
> PCI
> ++  #  framebuffer. This might be required on platforms that do not 
> tolerate
> ++  #  misaligned accesses otherwise.
> ++  
> gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine|FALSE|BOOLEAN|0x75
> +diff --git a/OvmfPkg/QemuVideoDxe/Gop.c b/OvmfPkg/QemuVideoDxe/Gop.c
> +index b11eed7558..a29c025afd 100644
> +--- a/OvmfPkg/QemuVideoDxe/Gop.c
> ++++ b/OvmfPkg/QemuVideoDxe/Gop.c
> +@@ -9,6 +9,8 @@
> +
> + #include "Qemu.h"
> +
> ++#include <Library/DxeServicesTableLib.h>
> ++
> + STATIC
> + VOID
> + QemuVideoCompleteModeInfo (
> +@@ -54,6 +56,7 @@ QemuVideoCompleteModeData (
> +   EFI_GRAPHICS_OUTPUT_MODE_INFORMATION  *Info;
> +   EFI_ACPI_ADDRESS_SPACE_DESCRIPTOR     *FrameBufDesc;
> +   QEMU_VIDEO_MODE_DATA                  *ModeData;
> ++  EFI_STATUS                            Status;
> +
> +   ModeData = &Private->ModeData[Mode->Mode];
> +   Info     = Mode->Info;
> +@@ -79,6 +82,22 @@ QemuVideoCompleteModeData (
> +     (UINT64)Mode->FrameBufferSize
> +     ));
> +
> ++  if (FeaturePcdGet (PcdRemapFrameBufferWriteCombine)) {
> ++    Status = gDS->SetMemorySpaceCapabilities (
> ++                    FrameBufDesc->AddrRangeMin,
> ++                    FrameBufDesc->AddrLen,
> ++                    EFI_MEMORY_UC | EFI_MEMORY_WC | EFI_MEMORY_XP
> ++                    );
> ++    ASSERT_EFI_ERROR (Status);
> ++
> ++    Status = gDS->SetMemorySpaceAttributes (
> ++                    FrameBufDesc->AddrRangeMin,
> ++                    FrameBufDesc->AddrLen,
> ++                    EFI_MEMORY_WC | EFI_MEMORY_XP
> ++                    );
> ++    ASSERT_EFI_ERROR (Status);
> ++  }
> ++
> +   FreePool (FrameBufDesc);
> +   return EFI_SUCCESS;
> + }
> +diff --git a/OvmfPkg/QemuVideoDxe/Qemu.h b/OvmfPkg/QemuVideoDxe/Qemu.h
> +index 57341a0bbf..a3da725fbf 100644
> +--- a/OvmfPkg/QemuVideoDxe/Qemu.h
> ++++ b/OvmfPkg/QemuVideoDxe/Qemu.h
> +@@ -13,7 +13,7 @@
> + #ifndef _QEMU_H_
> + #define _QEMU_H_
> +
> +-#include <Uefi.h>
> ++#include <PiDxe.h>
> + #include <Protocol/GraphicsOutput.h>
> + #include <Protocol/PciIo.h>
> + #include <Protocol/DriverSupportedEfiVersion.h>
> +diff --git a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf 
> b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
> +index 43a6e07faa..4c0870171b 100644
> +--- a/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
> ++++ b/OvmfPkg/QemuVideoDxe/QemuVideoDxe.inf
> +@@ -44,6 +44,7 @@
> +
> + [LibraryClasses]
> +   BaseMemoryLib
> ++  DxeServicesTableLib
> +   FrameBufferBltLib
> +   DebugLib
> +   DevicePathLib
> +@@ -61,6 +62,9 @@
> +   gEfiDevicePathProtocolGuid                    # PROTOCOL BY_START
> +   gEfiPciIoProtocolGuid                         # PROTOCOL TO_START
> +
> ++[FeaturePcd]
> ++  gUefiOvmfPkgTokenSpaceGuid.PcdRemapFrameBufferWriteCombine
> ++
> + [Pcd]
> +   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId
> +   gUefiOvmfPkgTokenSpaceGuid.PcdVideoResolutionSource
> +--
> +2.45.0
> +
> diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
> index f7daa8ddf3..abcf3c6b8e 100644
> --- a/boot/edk2/edk2.hash
> +++ b/boot/edk2/edk2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 6bdfdffcc2235a117b3f9d4124da63103f19ff30157673f812e1093b20ebb7ad  
> edk2-edk2-stable202308-git4.tar.gz
> +sha256  
> 4595b9d9d14c06bd03f575e4b7623574a4a874ef465652ecdc224099a5b14fc7  
> edk2-edk2-stable202405-git4.tar.gz
>  sha256  
> 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  
> License.txt
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index e5816b353a..145a9a80ae 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -EDK2_VERSION = edk2-stable202308
> +EDK2_VERSION = edk2-stable202405

When we bumping boot/edk2, we usually also bump edk2-non-osi.
See:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/edk2-non-osi/edk2-non-osi.mk?ref_type=heads#L7

Even if it is not needed to fix the qemu_aarch64_sbsa_defconfig of
this series, it would be better to keep all those components aligned.

Could you check if edk2-non-osi needs to be updated too?
If yes, could you update it?
If no, could you add a mention that it does not need to?

Maybe we could add a comment in boot/edk2/edk2.mk, before EDK2_VERSION.
Something like:

# When updating version, make sure to also update the edk2-platforms
# and edk2-non-osi packages to their respective commit ID nearest to
# the edk2 release.

>  EDK2_SITE = https://github.com/tianocore/edk2
>  EDK2_SITE_METHOD = git
>  EDK2_LICENSE = BSD-2-Clause-Patent
> diff --git a/package/edk2-platforms/edk2-platforms.hash 
> b/package/edk2-platforms/edk2-platforms.hash
> index 4c74c7dfb6..0095d4298d 100644
> --- a/package/edk2-platforms/edk2-platforms.hash
> +++ b/package/edk2-platforms/edk2-platforms.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> c240a8ec7816bc5963d881c84eb18d880e9269c117cfc46a3106b0c5e6e80c66  
> edk2-platforms-e509ac5a729ebe2a3bc905aed1df23226aca4dc9.tar.gz
> +sha256  
> 41fa720ac644ec0523c576ff28eba5e0308c9649111ce42f7d408b8d8b30eaf5  
> edk2-platforms-3f08401365d67e10924c774e6c3f64be56bc15b6.tar.gz
>  sha256  
> 50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  
> License.txt
> diff --git a/package/edk2-platforms/edk2-platforms.mk 
> b/package/edk2-platforms/edk2-platforms.mk
> index 7bd86ff159..23d9221649 100644
> --- a/package/edk2-platforms/edk2-platforms.mk
> +++ b/package/edk2-platforms/edk2-platforms.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  # Keep in sync with latest commit as of the release date for boot/edk2
> -EDK2_PLATFORMS_VERSION = e509ac5a729ebe2a3bc905aed1df23226aca4dc9
> +EDK2_PLATFORMS_VERSION = 3f08401365d67e10924c774e6c3f64be56bc15b6
>  EDK2_PLATFORMS_SITE = $(call 
> github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
>  EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
>  EDK2_PLATFORMS_LICENSE_FILES = License.txt
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
