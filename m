From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Apr 2020 10:51:56 +0200
Subject: [Buildroot] [PATCH] support/testing: add a runtime test for the
 systemd unit tests
Message-ID: <20200420085156.2930014-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initial work by Jeremy Rosen [1].

In order to allow building the testsuite, add an BR2_external
to add new flags in SYSTEMD_CONF_OPTS:

"SYSTEMD_CONF_OPTS += -Dslow-tests=true -Dinstall-tests=true -Dtests=true"

This allow to install run-unit-tests.py on the target to execute
all tests installed to /lib/systemd/tests. While at it, enable usafe tests
since we are using a rootfs image built only to run these tests.

The run-integration-tests.sh script is not executed since it's intended
to run from the systemd build directory on the host machine.

The rootfsoverlay from [1] is removed since it contains some
customization not needed for the tests.

Some tests needs a high entropy level, otherwise they are stuck.
Install rng-tools and add -device virtio-rng-pci in qemu command line.

In order to run as many tests as possible, activate as many systemd
options as possible. cgroupv2 is enabled from the kernel command
line to pass test-bfp-device test.

Use the latest LTS kernel 5.4.

Some unit files used by the systemd testsuite are using some program
functionnality not implemented by the busybox variant (grep, find).

The stat command with custom format (-c) and display of filesystem status (-f)
used by exec-protecthome-tmpfs-vs-protectsystem-strict.service can be provided
by busybox or coreutils. Add a busybox config fragment to add "stat -fc" since
it's not enabled by the busybox defconfig used by Buildroot.

The ionice command used by exec-ioschedulingclass-none.service is provided by
util-linux schedutils.

libcap tools needed to provide capsh binary for test-execute.

Skipped tests:
test-barrier: This test requires a baremetal machine.
test-bus-chat: This test requires an user account.

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/pipelines/137689982

[1] https://github.com/boucman/buildroot-systemd

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: J?r?my Rosen <jeremy.rosen@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
On my machine, the runtime test is completed in 287.761s.

OK: 203 SKIP: 2 FAIL: 0
---
 .../testing/conf/busybox-stat-fragment.config |   3 +
 .../package/br2-external/systemd/Config.in    |   0
 .../br2-external/systemd/external.desc        |   2 +
 .../package/br2-external/systemd/external.mk  |   5 +
 support/testing/tests/package/test_systemd.py | 123 ++++++++++++++++++
 .../test_systemd/systemd-kernel.config        | 111 ++++++++++++++++
 6 files changed, 244 insertions(+)
 create mode 100644 support/testing/conf/busybox-stat-fragment.config
 create mode 100644 support/testing/tests/package/br2-external/systemd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/systemd/external.desc
 create mode 100644 support/testing/tests/package/br2-external/systemd/external.mk
 create mode 100644 support/testing/tests/package/test_systemd.py
 create mode 100644 support/testing/tests/package/test_systemd/systemd-kernel.config

diff --git a/support/testing/conf/busybox-stat-fragment.config b/support/testing/conf/busybox-stat-fragment.config
new file mode 100644
index 0000000000..55f64c761f
--- /dev/null
+++ b/support/testing/conf/busybox-stat-fragment.config
@@ -0,0 +1,3 @@
+CONFIG_STAT=y
+CONFIG_FEATURE_STAT_FORMAT=y
+CONFIG_FEATURE_STAT_FILESYSTEM=y
diff --git a/support/testing/tests/package/br2-external/systemd/Config.in b/support/testing/tests/package/br2-external/systemd/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/package/br2-external/systemd/external.desc b/support/testing/tests/package/br2-external/systemd/external.desc
new file mode 100644
index 0000000000..2c7317f301
--- /dev/null
+++ b/support/testing/tests/package/br2-external/systemd/external.desc
@@ -0,0 +1,2 @@
+name: BUILDROOT_SYSTEMD_TESTSUITE
+desc: Buildroot to easily test systemd changes or changes to the systemd recipe in buildroot
diff --git a/support/testing/tests/package/br2-external/systemd/external.mk b/support/testing/tests/package/br2-external/systemd/external.mk
new file mode 100644
index 0000000000..780d79153b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/systemd/external.mk
@@ -0,0 +1,5 @@
+# Append SYSTEMD_CONF_OPTS from this BR2_EXTERNAL due to include order in the Buildroot main Makefile:
+# -include $(PACKAGE_OVERRIDE_FILE)
+# -include $(sort $(wildcard package/*/*.mk))
+# include $(BR2_EXTERNAL_FILE)
+SYSTEMD_CONF_OPTS += -Dslow-tests=true -Dinstall-tests=true -Dtests=true
diff --git a/support/testing/tests/package/test_systemd.py b/support/testing/tests/package/test_systemd.py
new file mode 100644
index 0000000000..891c464652
--- /dev/null
+++ b/support/testing/tests/package/test_systemd.py
@@ -0,0 +1,123 @@
+import os
+
+import infra.basetest
+
+SYSTEMD_TIMEOUT = 400
+
+# https://www.freedesktop.org/wiki/Software/systemd/VirtualizedTesting/
+# Some unit files used by the systemd testsuite are using some program functionnality
+# not implemented by the busybox variant (grep, find).
+# The stat command with custom format (-c) and display of filesystem status (-f) used by
+# exec-protecthome-tmpfs-vs-protectsystem-strict.service can be provided by busybox or coreutils.
+# The ionice command used by exec-ioschedulingclass-none.service is provided by util-linux schedutils.
+# libcap tools needed to provide capsh binary for test-execute.
+
+# Skipped tests:
+# test-barrier: This test requires a baremetal machine.
+# test-bus-chat: This test requires an user account.
+
+
+class TestSystemd(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/systemd")]
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2020.02-2.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_INIT_SYSTEMD=y
+        BR2_SYSTEM_BIN_SH_BASH=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_ENABLE_LOCALE_WHITELIST="C en_US C_UTF8 fr_FR"
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.32"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_FINDUTILS=y
+        BR2_PACKAGE_GREP=y
+        BR2_PACKAGE_RNG_TOOLS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_GNUTLS=y
+        BR2_PACKAGE_LIBQRENCODE=y
+        BR2_PACKAGE_LIBXKBCOMMON=y
+        BR2_PACKAGE_LIBIDN2=y
+        BR2_PACKAGE_ELFUTILS=y
+        BR2_PACKAGE_ELFUTILS_PROGS=y
+        BR2_PACKAGE_LIBCAP_TOOLS=y
+        BR2_PACKAGE_LIBCGROUP=y
+        BR2_PACKAGE_LIBCGROUP_TOOLS=y
+        BR2_PACKAGE_LIBSECCOMP=y
+        BR2_PACKAGE_LINUX_PAM=y
+        BR2_PACKAGE_P11_KIT=y
+        BR2_PACKAGE_LIBSELINUX=y
+        BR2_PACKAGE_PCRE2=y
+        BR2_PACKAGE_IPTABLES=y
+        BR2_PACKAGE_BASH_COMPLETION=y
+        BR2_PACKAGE_ACL=y
+        BR2_PACKAGE_AUDIT=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
+        BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
+        BR2_PACKAGE_SYSTEMD_BINFMT=y
+        BR2_PACKAGE_SYSTEMD_COREDUMP=y
+        BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
+        BR2_PACKAGE_SYSTEMD_HIBERNATE=y
+        BR2_PACKAGE_SYSTEMD_HOMED=y
+        BR2_PACKAGE_SYSTEMD_IMPORTD=y
+        BR2_PACKAGE_SYSTEMD_LOCALED=y
+        BR2_PACKAGE_SYSTEMD_LOGIND=y
+        BR2_PACKAGE_SYSTEMD_MACHINED=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_PACKAGE_SYSTEMD_QUOTACHECK=y
+        BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
+        BR2_PACKAGE_SYSTEMD_REPART=y
+        BR2_PACKAGE_SYSTEMD_RFKILL=y
+        BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT=y
+        BR2_PACKAGE_SYSTEMD_SYSUSERS=y
+        BR2_PACKAGE_SYSTEMD_USERDB=y
+        BR2_PACKAGE_UTIL_LINUX_MINIX=y
+        BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT=y
+        BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS=y
+        BR2_PACKAGE_UTIL_LINUX_UNSHARE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1G"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+              infra.filepath("tests/package/test_systemd/systemd-kernel.config"),
+              infra.filepath("conf/busybox-stat-fragment.config"))
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+
+        # the complete boot with systemd takes more time than what the default multipler permits
+        self.emulator.timeout_multiplier *= 10
+
+        # systemd testsuite overallocate memory and the minimum that seemed to work was 1G
+        # systemd.unified_cgroup_hierarchy=1 for cgroup v2 and test-execute
+        self.emulator.boot(arch="i386",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda", "ro", "console=ttyS0",
+                                           "systemd.unified_cgroup_hierarchy=1",
+                                           "audit=0 cgroup_no_v1=\"all\""],
+                           options=["-M", "pc", "-m", "1G", "-device",
+                                    "virtio-rng-pci", "-drive",
+                                    "file={},if=virtio,format=raw".format(img)])
+        self.emulator.login()
+
+    def test_run(self):
+        timeout = SYSTEMD_TIMEOUT * self.emulator.timeout_multiplier
+
+        self.login()
+
+        cmd = "/usr/lib/systemd/tests/run-unit-tests.py --unsafe"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/package/test_systemd/systemd-kernel.config b/support/testing/tests/package/test_systemd/systemd-kernel.config
new file mode 100644
index 0000000000..0c4efed77f
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/systemd-kernel.config
@@ -0,0 +1,111 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_PSI=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_SWAP=y
+# CONFIG_MEMCG_SWAP_ENABLED is not set
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_RDMA=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_EXPERT=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_USERFAULTFD=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_DMI_SYSFS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_CGROUP_IOLATENCY=y
+CONFIG_BINFMT_MISC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_CLS_CGROUP=y
+CONFIG_CGROUP_NET_PRIO=y
+# CONFIG_WIRELESS is not set
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=m
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_BOCHS=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_HID_A4TECH=y
+CONFIG_HID_APPLE=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_LOGITECH=y
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_FANOTIFY=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SMACK=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_DEBUG_FS=y
+# CONFIG_FTRACE is not set
-- 
2.25.3
