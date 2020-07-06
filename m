From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  7 Jul 2020 01:41:46 +0200
Subject: [Buildroot] [PATCH 3/8] board/qemu/aarch64-virt/linux.config:
 enable PCIe and PCI host generic driver
In-Reply-To: <20200706234151.2940865-1-romain.naour@gmail.com>
References: <20200706234151.2940865-1-romain.naour@gmail.com>
Message-ID: <20200706234151.2940865-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the CONFIG_PCI symbol due a change in kernel 5.0 [1].
The option was previously enabled by default (default y).

"PCI: consolidate PCI config entry in drivers/pci

There is no good reason to duplicate the PCI menu in every architecture.
Instead provide a selectable HAVE_PCI symbol that indicates availability
of PCI support, and a FORCE_PCI symbol to for PCI on and the handle the
rest in drivers/pci."

Qemu aarch64 provide a PCIe Host bridge but it require CONFIG_PCI_HOST_GENERIC
enabled in the kernel.

With CONFIG_PCI_HOST_GENERIC enabled PCIe host bridge is detected:

$ dmesg
pci-host-generic 4010000000.pcie: host bridge /pcie at 10000000 ranges:
pci-host-generic 4010000000.pcie:    IO 0x3eff0000..0x3effffff -> 0x00000000
pci-host-generic 4010000000.pcie:   MEM 0x10000000..0x3efeffff -> 0x10000000
pci-host-generic 4010000000.pcie:   MEM 0x8000000000..0xffffffffff -> 0x8000000000
pci-host-generic 4010000000.pcie: ECAM at [mem 0x4010000000-0x401fffffff] for [bus 00-ff]
pci-host-generic 4010000000.pcie: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efeffff]
pci_bus 0000:00: root bus resource [mem 0x8000000000-0xffffffffff]
pci 0000:00:00.0: [1b36:0008] type 00 class 0x060000

$ lspci
00:00.0 Host bridge: Red Hat, Inc. QEMU PCIe Host bridge

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=eb01d42a77785ff96b6e66a2a2e7027fc6d78e4a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 49018efe95..295bf19a7c 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -23,6 +23,8 @@ CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_BRIDGE=m
 CONFIG_NET_SCHED=y
 CONFIG_VSOCKETS=y
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
-- 
2.25.4
