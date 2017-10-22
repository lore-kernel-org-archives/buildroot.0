From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 22 Oct 2017 15:54:25 +0200
Subject: [Buildroot] [PATCH v2 2/3] board/pc: add documentation for testing
	with qemu
In-Reply-To: <20171022135426.28901-1-nunes.erico@gmail.com>
References: <20171022135426.28901-1-nunes.erico@gmail.com>
Message-ID: <20171022135426.28901-2-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add some documentation about running the pc defconfigs in qemu.
In particular, document the use of the -bios parameter to use the OVMF
firmware to test the UEFI image.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
Changes v1 -> v2:
  - Made the images path relative to output/ to match in-tree Buildroot
  builds.
---
 board/pc/readme.txt | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 68ca21166f..5277ea5bc6 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -35,3 +35,45 @@ Bare PC sample config
   the setup as well.
 
 3. Enjoy
+
+
+Emulation in qemu (BIOS)
+========================
+
+1. Edit grub-bios.cfg
+
+  Since the driver will show up in the virtual machine as /dev/vda,
+  change board/pc/grub-bios.cfg to use root=/dev/vda2 instead of
+  root=/dev/sda2. Then rebuild grub2 and the image.
+
+2. Run the emulation with:
+
+qemu-system-x86_64 \
+	-M pc \
+	-drive file=output/images/disk.img,if=virtio,format=raw \
+	-net nic,model=virtio \
+	-net user
+
+
+Emulation in qemu (UEFI)
+========================
+
+1. Edit grub-efi.cfg
+
+  Since the driver will show up in the virtual machine as /dev/vda,
+  change board/pc/grub-efi.cfg to use root=/dev/vda2 instead of
+  root=/dev/sda2. Then rebuild grub2 and the image.
+
+2. Run the emulation with:
+
+qemu-system-x86_64 \
+	-M pc \
+	-bios </path/to/OVMF_CODE.fd> \
+	-drive file=output/images/disk.img,if=virtio,format=raw \
+	-net nic,model=virtio \
+	-net user
+
+Note that </path/to/QEMU_EFI.fd> needs to point to a valid x86_64 UEFI
+firmware image for qemu.
+It may be provided by your distribution as a edk2 or OVMF package, in
+path such as /usr/share/edk2/ovmf/OVMF_CODE.fd .
-- 
2.13.6
