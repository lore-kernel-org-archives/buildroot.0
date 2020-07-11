From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:52:23 +0200
Subject: [Buildroot] [git commit] board/qemu/aarch64-virt/linux.config:
 enable VIRTIO_GPU driver
Message-ID: <20200711135056.3BB8F81763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1ace6570d3d0c39cc253bcf6ee6b0e903ec96b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This driver is intended to be used by mesa virgl Gallium on the guest.
virtio-gpu is enabled by adding "-device virtio-gpu-pci" on the qemu
command line.

It's detected by lspci and dmesg log:

$ lspci
00:01.0 Display controller: Red Hat, Inc. Virtio GPU (rev 01)

$ dmesg
virtio-pci 0000:00:01.0: enabling device (0000 -> 0002)
[drm] pci: virtio-gpu-pci detected at 0000:00:01.0
[drm] virgl 3d acceleration not supported by host
[drm] EDID support available.
[TTM] Zone  kernel: Available graphics memory: 51876 KiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
[drm] number of scanouts: 1
[drm] number of cap sets: 0
[drm] Initialized virtio_gpu 0.1.0 0 for virtio2 on minor 0

The framebuffer interface fb0 is now present in /dev

$ ls /dev/fb*
/dev/fb0

See:
https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/
https://at.projects.genivi.org/wiki/display/WIK4/GENIVI+Technical+Summit+Session+Content+2018?preview=%2F28412356%2F28412481%2F2018-10-11_GeniviBangalorTechSummit_Virtio_GPU.pdf

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-virt/linux.config | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 295bf19a7c..129a200ab0 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -40,14 +40,16 @@ CONFIG_DUMMY=y
 CONFIG_MACVLAN=y
 CONFIG_VIRTIO_NET=y
 CONFIG_NLMON=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_MAILBOX=y
