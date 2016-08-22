From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 22 Aug 2016 03:52:16 +0200
Subject: [Buildroot] [PATCH 2/2] configs/pc_x86_64_efi_defconfig: enable
	kernel EFI support
In-Reply-To: <20160822015216.425-1-nunes.erico@gmail.com>
References: <20160822015216.425-1-nunes.erico@gmail.com>
Message-ID: <20160822015216.425-2-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pc_x86_64_efi reference defconfig is targeted towards an EFI
environment but the kernel which comes with it does not enable EFI
support by default.

Booting this defconfig without kernel EFI support on a qemu virtual
machine with EFI firmware resulted in no output to tty1 or ttyS0.
Enabling EFI support in the kernel fixed this and seems saner for an EFI
reference Buildroot defconfig.

CONFIG_EFI was enabled in a separate kernel config fragment so that it
doesn't affect pc_x86_64_bios_defconfig needlessly.

This was tested with qemu 2.6.0 running with kvm enabled and firmware
EFI v2.60 by EDK II.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 board/pc/linux-efi.config       | 1 +
 configs/pc_x86_64_efi_defconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 board/pc/linux-efi.config

diff --git a/board/pc/linux-efi.config b/board/pc/linux-efi.config
new file mode 100644
index 0000000..7dcf296
--- /dev/null
+++ b/board/pc/linux-efi.config
@@ -0,0 +1 @@
+CONFIG_EFI=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 13194881..234f1d1 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.7.config"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config board/pc/linux-efi.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Firmware
-- 
2.9.3
