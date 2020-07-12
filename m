From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 12 Jul 2020 18:34:22 +0200
Subject: [Buildroot] [PATCH 4/4] board/qemu/aarch64-virt/linux.config:
 enable memory hotplug
In-Reply-To: <20200712163422.1162187-1-romain.naour@gmail.com>
References: <20200712163422.1162187-1-romain.naour@gmail.com>
Message-ID: <20200712163422.1162187-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To test memory hotplug [1], add -m 1G,slots=3,maxmem=4G to the qemu command
line, boot the system and enter the following command in the Qemu monitor
to add another 1GB to the guest:
(use ctrl+a c to switch from the serial port and Qemu monitor):

   (qemu) object_add memory-backend-ram,id=mem1,size=1G
   (qemu) device_add pc-dimm,id=dimm1,memdev=mem1

[1] https://git.qemu.org/?p=qemu.git;a=blob;f=docs/memory-hotplug.txt;h=6aa5e17e26090f619787de7b71888093fb9d0117;hb=fdd76fecdde1ad444ff4deb7f1c4f7e4a1ef97d6#l9

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 657acaf04f..b81d78349b 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -10,10 +10,13 @@ CONFIG_COMPAT=y
 CONFIG_FW_CFG_SYSFS=y
 CONFIG_FW_CFG_SYSFS_CMDLINE=y
 CONFIG_ACPI=y
+CONFIG_ACPI_HOTPLUG_MEMORY=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
 CONFIG_BINFMT_MISC=y
+CONFIG_MEMORY_HOTPLUG=y
+CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -27,6 +30,8 @@ CONFIG_BRIDGE=m
 CONFIG_NET_SCHED=y
 CONFIG_VSOCKETS=y
 CONFIG_PCI=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-- 
2.25.4
