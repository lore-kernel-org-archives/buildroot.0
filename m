From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 22 Aug 2016 23:49:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] configs/pc_x86_64_efi_defconfig: enable
	kernel EFI support
Message-ID: <20160822214915.6640-1-nunes.erico@gmail.com>
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

Adding CONFIG_EFI to board/pc/linux-extras.config also affects
pc_x86_64_bios_defconfig which doesn't require it, however it was
observed that the extra overhead is small and so this is preferred
rather than having a separate config file.

This was tested with qemu 2.6.0 running with kvm enabled and firmware
EFI v2.60 by EDK II. Also built and verified bios defconfig on the same
setup but with BIOS firmware instead.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Changes v1 -> v2:
  - moved CONFIG_EFI to board/pc/linux-extras.config as the overhead is
    small and this is preferred rather than having a separate config
    file. (Suggested by Thomas Petazzoni and Gustavo Zacarias)
---
 board/pc/linux-extras.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/pc/linux-extras.config b/board/pc/linux-extras.config
index 3d8cc33..8c9c225 100644
--- a/board/pc/linux-extras.config
+++ b/board/pc/linux-extras.config
@@ -40,3 +40,6 @@ CONFIG_RT2800USB_RT53XX=y
 CONFIG_RT2800USB_RT55XX=y
 # CONFIG_RTL_CARDS is not set
 CONFIG_RTL8XXXU=m
+
+# EFI support
+CONFIG_EFI=y
-- 
2.9.3
