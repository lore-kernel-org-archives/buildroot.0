From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 17 Apr 2020 22:16:25 +0200
Subject: [Buildroot] [PATCH] support/testing: import rootfs-overlay for
 systemd testsuite
In-Reply-To: <20200417201626.342738-1-romain.naour@gmail.com>
References: <20200417201626.342738-1-romain.naour@gmail.com>
Message-ID: <20200417201626.342738-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

comment PS1 customization: the testsuite require a non customized PS1

 # /usr/lib/systemd/tests/run-unit-tests.py
 PASS: test-acl-util
 PASS: test-af-list

La testsuite Buildroot se lance de cette mani?re et seul le test systemd est test?:
./support/testing/run-tests -o testsuite/ -k -d dl/ tests.package.test_systemd.TestSystemd
16:12:42 TestSystemd                              Starting
16:13:04 TestSystemd                              Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 22.384s

OK

Pour l'instant la testsuite de systemd n'est pas lanc?e automatiquement.
Il faut lancer le script:
  /lib/systemd/tests/run-unit-tests.py

On a besoin d'un niveau d'entropie suffisant pour certain tests.
On test avec cgroupv2
On test avec un kernel 5.4 LTS.

SKIP: test-barrier
SKIP: test-bus-chat

FAIL: test-execute

OK: 197 SKIP: 2 FAIL: 1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../package/br2-external/systemd/Config.in    |   0
 .../br2-external/systemd/external.desc        |   2 +
 .../package/br2-external/systemd/external.mk  |   5 +
 support/testing/tests/package/test_systemd.py |  92 +++++++++++++++
 .../rootfs-overlay/etc/locale.conf            |   1 +
 .../rootfs-overlay/etc/nsswitch.conf          |  13 ++
 .../test_systemd/rootfs-overlay/etc/profile   |  20 ++++
 .../test_systemd/rootfs-overlay/etc/shells    |   1 +
 .../rootfs-overlay/etc/vconsole.conf          |   1 +
 .../test_systemd/rootfs-overlay/myinit.sh     |   3 +
 .../test_systemd/rootfs-overlay/root/.profile |  36 ++++++
 .../test_systemd/systemd-kernel.config        | 111 ++++++++++++++++++
 12 files changed, 285 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/systemd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/systemd/external.desc
 create mode 100644 support/testing/tests/package/br2-external/systemd/external.mk
 create mode 100644 support/testing/tests/package/test_systemd.py
 create mode 100644 support/testing/tests/package/test_systemd/rootfs-overlay/etc/locale.conf
 create mode 100644 support/testing/tests/package/test_systemd/rootfs-overlay/etc/nsswitch.conf
 create mode 100644 support/testing/tests/package/test_systemd/rootfs-overlay/etc/profile
 create mode 100644 support/testing/tests/package/test_systemd/rootfs-overlay/etc/shells
 create mode 100644 support/testing/tests/package/test_systemd/rootfs-overlay/etc/vconsole.conf
 create mode 100755 support/testing/tests/package/test_systemd/rootfs-overlay/myinit.sh
 create mode 100644 support/testing/tests/package/test_systemd/rootfs-overlay/root/.profile
 create mode 100644 support/testing/tests/package/test_systemd/systemd-kernel.config

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
index 0000000000..2d051c583e
--- /dev/null
+++ b/support/testing/tests/package/test_systemd.py
@@ -0,0 +1,92 @@
+import os
+
+import infra.basetest
+
+SYSTEMD_TIMEOUT = 120
+
+# TODO: Add BR2_PACKAGE_LIBSECCOMP=y
+class TestSystemd(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/systemd")]
+    config = \
+        """
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2018.11-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.32"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
+        BR2_INIT_SYSTEMD=y
+        BR2_SYSTEM_BIN_SH_BASH=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_ENABLE_LOCALE_WHITELIST="C en_US C_UTF8 fr_FR"
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_CRYPTSETUP=y
+        BR2_PACKAGE_KBD=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_LIBIDN2=y
+        BR2_PACKAGE_ELFUTILS=y
+        BR2_PACKAGE_ELFUTILS_PROGS=y
+        BR2_PACKAGE_LINUX_PAM=y
+        BR2_PACKAGE_PCRE2=y
+        BR2_PACKAGE_BASH_COMPLETION=y
+        BR2_PACKAGE_ACL=y
+        BR2_PACKAGE_RNG_TOOLS=y
+        BR2_PACKAGE_LIBCGROUP=y
+        BR2_PACKAGE_LIBCGROUP_TOOLS=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
+        BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
+        BR2_PACKAGE_SYSTEMD_BINFMT=y
+        BR2_PACKAGE_SYSTEMD_COREDUMP=y
+        BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
+        BR2_PACKAGE_SYSTEMD_HIBERNATE=y
+        BR2_PACKAGE_SYSTEMD_IMPORTD=y
+        BR2_PACKAGE_SYSTEMD_LOCALED=y
+        BR2_PACKAGE_SYSTEMD_LOGIND=y
+        BR2_PACKAGE_SYSTEMD_MACHINED=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_PACKAGE_SYSTEMD_QUOTACHECK=y
+        BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
+        BR2_PACKAGE_SYSTEMD_RFKILL=y
+        BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT=y
+        BR2_PACKAGE_SYSTEMD_SYSUSERS=y
+        BR2_PACKAGE_UTIL_LINUX_MINIX=y
+        BR2_PACKAGE_LESS=y
+        BR2_PACKAGE_VIM=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1G"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+              infra.filepath("tests/package/test_systemd/systemd-kernel.config"),
+              infra.filepath("tests/package/test_systemd/rootfs-overlay"))
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
+                           kernel_cmdline=["root=/dev/vda ro console=ttyS0 systemd.unified_cgroup_hierarchy=1 cgroup_no_v1=\"all\""],
+                           options=["-M", "pc", "-m", "1G", "-device", "virtio-rng-pci", "-drive", "file={},if=virtio,format=raw".format(img)])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/etc/locale.conf b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/locale.conf
new file mode 100644
index 0000000000..e4026ae2be
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/locale.conf
@@ -0,0 +1 @@
+LANG=fr_FR.utf8
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/etc/nsswitch.conf b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/nsswitch.conf
new file mode 100644
index 0000000000..48c6200f3d
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/nsswitch.conf
@@ -0,0 +1,13 @@
+# /etc/nsswitch.conf
+
+passwd:         files mymachines systemd
+group:          files mymachines systemd
+shadow:         files
+
+hosts:          files mymachines resolve [!UNAVAIL=return] dns myhostname
+networks:       files dns
+
+protocols:      files
+services:       files
+ethers:         files
+rpc:            files
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/etc/profile b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/profile
new file mode 100644
index 0000000000..ca7565fd5b
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/profile
@@ -0,0 +1,20 @@
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin
+
+if [ "$PS1" ]; then
+	if [ "`id -u`" -eq 0 ]; then
+		export PS1='# '
+	else
+		export PS1='$ '
+	fi
+fi
+
+#export PAGER='/bin/more '
+export EDITOR='/bin/vi'
+
+# Source configuration files from /etc/profile.d
+for i in /etc/profile.d/*.sh ; do
+	if [ -r "$i" ]; then
+		. $i
+	fi
+	unset i
+done
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/etc/shells b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/shells
new file mode 100644
index 0000000000..01dca2d74b
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/shells
@@ -0,0 +1 @@
+/bin/bash
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/etc/vconsole.conf b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/vconsole.conf
new file mode 100644
index 0000000000..dfbf4a6eba
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/etc/vconsole.conf
@@ -0,0 +1 @@
+KEYMAP=fr
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/myinit.sh b/support/testing/tests/package/test_systemd/rootfs-overlay/myinit.sh
new file mode 100755
index 0000000000..203a557743
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/myinit.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+mount -o rw /dev/vdb /var
+exec /usr/lib/systemd/systemd
diff --git a/support/testing/tests/package/test_systemd/rootfs-overlay/root/.profile b/support/testing/tests/package/test_systemd/rootfs-overlay/root/.profile
new file mode 100644
index 0000000000..1415d1062a
--- /dev/null
+++ b/support/testing/tests/package/test_systemd/rootfs-overlay/root/.profile
@@ -0,0 +1,36 @@
+# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
+# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
+
+if [ "`id -u`" -eq 0 ]; then
+  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
+else
+  PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
+fi
+export PATH
+
+if [ "${PS1-}" ]; then
+  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
+    # The file bash.bashrc already sets the default PS1.
+    # PS1='\h:\w\$ '
+    if [ -f /etc/bash.bashrc ]; then
+      . /etc/bash.bashrc
+    fi
+  else
+    if [ "`id -u`" -eq 0 ]; then
+      PS1='# '
+    else
+      PS1='$ '
+    fi
+  fi
+fi
+
+#PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
+if [ -d /etc/profile.d ]; then
+  for i in /etc/profile.d/*.sh; do
+    if [ -r $i ]; then
+      . $i
+    fi
+  done
+  unset i
+fi
+. /usr/share/bash-completion/bash_completion
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
2.25.2
