From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 23:46:45 +0200
Subject: [Buildroot] [git commit] configs/pc_x86_64_efi_defconfig: enable
	kernel EFI support
Message-ID: <20160822214721.7CA8681EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51e35be7cb99fdc09c47828061b98e72b06869db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
