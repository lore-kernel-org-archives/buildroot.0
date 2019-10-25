From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 24 Oct 2019 21:21:24 -0300
Subject: [Buildroot] [PATCH] package/test-vm: a virtual machine image to
 test libvirt
Message-ID: <20191025002124.5004-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Builds and installs a virtual machine disk image to test libvirt. Only
x86_64 is supported at the moment. Refer to package/test-vm/readme.txt
for instructions.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Matthew Weber <matthew.weber@collins.com>
---
---
 package/Config.in                 |  1 +
 package/test-vm/Config.in         |  4 ++
 package/test-vm/grub-bios.cfg     | 10 +++++
 package/test-vm/post-build.sh     | 11 ++++++
 package/test-vm/readme.txt        | 63 +++++++++++++++++++++++++++++++
 package/test-vm/test-vm.mk        | 25 ++++++++++++
 package/test-vm/test-vm.xml       | 59 +++++++++++++++++++++++++++++
 package/test-vm/test_vm_defconfig | 28 ++++++++++++++
 8 files changed, 201 insertions(+)
 create mode 100644 package/test-vm/Config.in
 create mode 100644 package/test-vm/grub-bios.cfg
 create mode 100755 package/test-vm/post-build.sh
 create mode 100644 package/test-vm/readme.txt
 create mode 100644 package/test-vm/test-vm.mk
 create mode 100644 package/test-vm/test-vm.xml
 create mode 100644 package/test-vm/test_vm_defconfig

diff --git a/package/Config.in b/package/Config.in
index a3fb5af04b..d71582dafd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2290,6 +2290,7 @@ menu "System tools"
 	source "package/systemd-bootchart/Config.in"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
+	source "package/test-vm/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/test-vm/Config.in b/package/test-vm/Config.in
new file mode 100644
index 0000000000..efaa475e22
--- /dev/null
+++ b/package/test-vm/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_TEST_VM
+	bool "test-vm"
+	help
+	  A test VM for Libvirt.
diff --git a/package/test-vm/grub-bios.cfg b/package/test-vm/grub-bios.cfg
new file mode 100644
index 0000000000..e3cc13a269
--- /dev/null
+++ b/package/test-vm/grub-bios.cfg
@@ -0,0 +1,10 @@
+serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
+terminal_input serial
+terminal_output serial
+
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /boot/bzImage root=/dev/vda1 rootwait console=ttyS0,115200n8 locale.LANG=C net.ifnames=0
+}
diff --git a/package/test-vm/post-build.sh b/package/test-vm/post-build.sh
new file mode 100755
index 0000000000..5e4dc88a3d
--- /dev/null
+++ b/package/test-vm/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+# exit on any failure
+set -e
+
+MY_DIR=$(dirname "$0")
+
+cp -f "$MY_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
+
+# Copy grub 1st stage to binaries, required for genimage
+cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
diff --git a/package/test-vm/readme.txt b/package/test-vm/readme.txt
new file mode 100644
index 0000000000..ca04a749d6
--- /dev/null
+++ b/package/test-vm/readme.txt
@@ -0,0 +1,63 @@
+How to use this package
+
+1. Build an image with a defconfig containing
+
+BR2_x86_64=y
+
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+
+BR2_PACKAGE_QEMU=y
+BR2_PACKAGE_QEMU_CUSTOM_TARGETS="x86_64-softmmu"
+BR2_PACKAGE_QEMU_SLIRP=y
+
+BR2_PACKAGE_LIBVIRT=y
+BR2_PACKAGE_LIBVIRT_QEMU=y
+BR2_PACKAGE_TEST_VM=y
+
+For remote accesss you will need an SSH server
+
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
+
+Ensure that the kernel configuration has
+
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
+CONFIG_VFIO_MDEV=m
+CONFIG_VFIO_MDEV_DEVICE=m
+CONFIG_VHOST_NET=m
+CONFIG_VHOST_VSOCK=y
+CONFIG_TUN=m
+
+The rootfs size must be arount 100MB for a sysvinit/busybox init system and
+200MB for a systemd system.
+
+Configure the OS to obtain an IP address, either statically or via DHCP.
+
+2. Boot and log in as root, then run
+
+   # virsh define /etc/vm-templates/test-xm.xml 
+   # virsh start test-vm && virsh console test-vm
+
+Leave the vm console by hitting ^]
+
+Shutdown the vm
+
+   # virsh shutdown test-vm
+
+3. Access the vm remotely using virt-manager
+
+On a machine with virt-manager installed, open it and create a new connection.
+Supposing that the host IP address is 192.168.2.2:
+
+   File->Add Connection
+
+      Name: QEMU/KVM on 192.168.2.2
+      Libvirt URL: qemu+ssh://root at 192.168.2.2/system
+
+Double-click on the connection and provide the root user password. A "test-vm"
+item will appear (supposing that you wen through step 2, above). Double-click
+on it. Use the vm window to play with it.
+
+Have fun!
diff --git a/package/test-vm/test-vm.mk b/package/test-vm/test-vm.mk
new file mode 100644
index 0000000000..cc7f5b9240
--- /dev/null
+++ b/package/test-vm/test-vm.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# test-vm
+#
+################################################################################
+
+define TEST_VM_CONFIGURE_CMDS
+	$(MAKE) O=$(@D) \
+		BR2_DEFCONFIG=$(TEST_VM_PKGDIR)/test_vm_defconfig \
+		BR2_DL_DIR=$(BR2_DL_DIR) \
+		defconfig
+endef
+
+define TEST_VM_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define TEST_VM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 644 $(@D)/images/disk.img \
+		$(TARGET_DIR)/var/lib/libvirt/images/test-vm.img
+	$(INSTALL) -D -m 644 $(TEST_VM_PKGDIR)/test-vm.xml \
+		$(TARGET_DIR)/etc/vm-templates/test-xm.xml
+endef
+
+$(eval $(generic-package))
diff --git a/package/test-vm/test-vm.xml b/package/test-vm/test-vm.xml
new file mode 100644
index 0000000000..c0821f9f7d
--- /dev/null
+++ b/package/test-vm/test-vm.xml
@@ -0,0 +1,59 @@
+<domain type='kvm'>
+  <name>test-vm</name>
+  <memory unit='KiB'>1048576</memory>
+  <currentMemory unit='KiB'>1048576</currentMemory>
+  <vcpu placement='static'>2</vcpu>
+  <os>
+    <type arch='x86_64' machine='pc-i440fx-3.1'>hvm</type>
+    <boot dev='hd'/>
+  </os>
+  <features>
+    <acpi/>
+    <apic/>
+    <vmport state='off'/>
+  </features>
+  <cpu mode='host-model' check='partial'>
+    <model fallback='allow'/>
+  </cpu>
+  <clock offset='utc'>
+    <timer name='rtc' tickpolicy='catchup'/>
+    <timer name='pit' tickpolicy='delay'/>
+    <timer name='hpet' present='no'/>
+  </clock>
+  <on_poweroff>destroy</on_poweroff>
+  <on_reboot>restart</on_reboot>
+  <on_crash>destroy</on_crash>
+  <pm>
+    <suspend-to-mem enabled='no'/>
+    <suspend-to-disk enabled='no'/>
+  </pm>
+  <devices>
+    <emulator>/usr/bin/qemu-system-x86_64</emulator>
+    <disk type='file' device='disk'>
+      <driver name='qemu' type='raw'/>
+      <source file='/var/lib/libvirt/images/test-vm.img'/>
+      <target dev='vda' bus='virtio'/>
+      <address type='pci' domain='0x0000'/>
+    </disk>
+    <controller type='pci' index='0' model='pci-root'/>
+    <interface type='network'>
+      <source network='default'/>
+      <model type='virtio'/>
+      <address type='pci' domain='0x0000'/>
+    </interface>
+    <serial type='pty'>
+      <target type='isa-serial' port='0'>
+        <model name='isa-serial'/>
+      </target>
+    </serial>
+    <console type='pty'>
+      <target type='serial' port='0'/>
+    </console>
+    <input type='tablet' bus='usb'>
+      <address type='usb' bus='0' port='1'/>
+    </input>
+    <memballoon model='virtio'>
+      <address type='pci' domain='0x0000'/>
+    </memballoon>
+  </devices>
+</domain>
diff --git a/package/test-vm/test_vm_defconfig b/package/test-vm/test_vm_defconfig
new file mode 100644
index 0000000000..1c548eafd7
--- /dev/null
+++ b/package/test-vm/test_vm_defconfig
@@ -0,0 +1,28 @@
+BR2_x86_64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2018.11-1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="test-vm"
+BR2_TARGET_GENERIC_ISSUE="Welcome to test-vm"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="package/test-vm/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_ACPID=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk serial"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.18.1
