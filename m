From: Dick Olsson <hi@senzilla.io>
Date: Fri, 18 Dec 2020 20:27:38 +0000
Subject: [Buildroot] [PATCH v3 06/11] configs/pc_x86_64_defconfig: build the
 EDK2 firmware from source
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201218202646.1060123-7-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to this, you had to manually download a pre-built EDK2 flash
device image (OVMF_CODE.fd) in order to boot this configuration with
QEMU. Now, the configuration is building EDK2 from source.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/pc/readme.txt             | 9 ++++-----
 configs/pc_x86_64_efi_defconfig | 2 ++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 41aec50d36..c06ffb0a51 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -61,12 +61,11 @@ Run the emulation with:
 
 qemu-system-x86_64 \
 	-M pc \
-	-bios </path/to/OVMF_CODE.fd> \
+	-drive file=output/images/OVMF_CODE.fd,if=pflash,format=raw \
+	-drive file=output/images/OVMF_VARS.fd,if=pflash,format=raw \
 	-drive file=output/images/disk.img,if=virtio,format=raw \
 	-net nic,model=virtio \
 	-net user
 
-Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
-firmware image for qemu. It may be provided by your distribution as a
-edk2 or OVMF package, in path such as
-/usr/share/edk2/ovmf/OVMF_CODE.fd .
+Note that output/images/OVMF_*.fd are the flash device files built by
+the EDK2 package.
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 984fc8f92f..1680cda9bb 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -14,6 +14,8 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Bootloader
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_OVMF_X64=y
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_X86_64_EFI=y
 
-- 
2.25.1
