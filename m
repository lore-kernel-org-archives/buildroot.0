From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 23:28:05 +0200
Subject: [Buildroot] [PATCH] minnowboard_max_defconfig: grub2 needs WCHAR
Message-ID: <20170810212805.27808-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 5ffafd2353f5d67 (grub2: bump up version), grub2 needs a
toolchain with WCHAR support. However, the defconfigs that use grub2
were not updated at the time.

Add BR2_TOOLCHAIN_BUILDROOT_WCHAR=y to minnowboard_max_defconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Vincent Stehl? <vincent.stehle@intel.com>
---
The following other defconfigs also use grub2.

galileo_defconfig: Needs to be updated, but is anyway failing to build
 the kernel and I expect it will be removed.

minnowboard_max-graphical_defconfig: Already selects LOCALE which
 implies WCHAR.

pc_x86_64_bios_defconfig, pc_x86_64_efi_defconfig: already select
 WCHAR because it is needed for eudev.
---
 configs/minnowboard_max_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 674b144de8..db6e595779 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -9,6 +9,9 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 
 # Linux headers same as kernel, a 4.12 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Needed for grub2
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.13.3
