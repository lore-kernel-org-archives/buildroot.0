From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Wed, 20 Nov 2019 14:39:52 +0100
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add lxc test
In-Reply-To: <20191120133952.22978-1-patrick.havelange@essensium.com>
References: <20191120133952.22978-1-patrick.havelange@essensium.com>
Message-ID: <20191120133952.22978-2-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test starts a simple container with an iperf3 server.
The container is using the tini init system, with a shared rootfs.
An iperf3 client is started from the host to check that the container
is really up and running.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes
v1 -> v2
[Thomas
 - Moved the assertRunOk function to the BRTest class
---
 .gitlab-ci.yml                                |  1 +
 support/testing/tests/package/test_lxc.py     | 56 +++++++++++++++++++
 .../tests/package/test_lxc/kernel_config_frag | 20 +++++++
 .../test_lxc_rootfs_overlay/usr/bin/iperf3.sh |  2 +
 .../usr/share/lxc/config/minimal-iperf3.conf  |  4 ++
 .../usr/share/lxc/config/minimal.conf         |  6 ++
 6 files changed, 89 insertions(+)
 create mode 100644 support/testing/tests/package/test_lxc.py
 create mode 100644 support/testing/tests/package/test_lxc/kernel_config_frag
 create mode 100755 support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/bin/iperf3.sh
 create mode 100644 support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal-iperf3.conf
 create mode 100644 support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1d71257a20..9ef93130a1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -410,6 +410,7 @@ tests.package.test_luasocket.TestLuajitLuaSocket: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuaLuasyslog: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
 tests.package.test_luvi.TestLuvi: { extends: .runtime_test }
+tests.package.test_lxc.TestLxc: { extends: .runtime_test }
 tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
new file mode 100644
index 0000000000..2447f5c4e3
--- /dev/null
+++ b/support/testing/tests/package/test_lxc.py
@@ -0,0 +1,56 @@
+import os
+
+import infra.basetest
+import pexpect
+
+class TestLxc(infra.basetest.BRTest):
+    config = \
+            """
+            BR2_arm=y
+            BR2_TOOLCHAIN_EXTERNAL=y
+            BR2_LINUX_KERNEL=y
+            BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.79"
+            BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+            BR2_LINUX_KERNEL_DTS_SUPPORT=y
+            BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+            BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+            BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+            BR2_INIT_SYSTEMD=y
+            BR2_PACKAGE_LXC=y
+            BR2_PACKAGE_TINI=y
+            BR2_PACKAGE_IPERF3=y
+            BR2_ROOTFS_OVERLAY="{}"
+            BR2_TARGET_ROOTFS_CPIO=y
+            """.format(
+            infra.filepath("tests/package/test_lxc/kernel_config_frag"),
+            infra.filepath("tests/package/test_lxc/test_lxc_rootfs_overlay"))
+
+    def run_ok(self, cmd):
+        self.assertRunOk(cmd, 120)
+
+    def wait_boot(self):
+        #the complete boot with systemd takes more time than what the default multipler permits
+        self.emulator.timeout_multiplier *= 10
+        self.emulator.login()
+
+    def setup_run_test_container(self):
+        self.run_ok("lxc-create -n lxc_iperf3 -t none -f /usr/share/lxc/config/minimal-iperf3.conf")
+        self.run_ok("lxc-start -l trace -n lxc_iperf3 -o /tmp/lxc.log -L /tmp/lxc.console.log")
+        #need to wait for the container to be fully started
+        self.run_ok("sleep 2")
+        self.run_ok("iperf3 -c 192.168.1.2 -t 2")
+        #if the test fails, just cat /tmp/*.log
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel_file = os.path.join(self.builddir, "images", "zImage")
+        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
+        self.emulator.boot(arch="armv7", kernel=kernel_file,
+                           kernel_cmdline=[
+                                        "console=ttyAMA0,115200"],
+                           options=["-initrd", cpio_file,
+                                        "-dtb", dtb_file,
+                                        "-M", "vexpress-a9"])
+        self.wait_boot()
+        self.setup_run_test_container()
diff --git a/support/testing/tests/package/test_lxc/kernel_config_frag b/support/testing/tests/package/test_lxc/kernel_config_frag
new file mode 100644
index 0000000000..32f8bdd65e
--- /dev/null
+++ b/support/testing/tests/package/test_lxc/kernel_config_frag
@@ -0,0 +1,20 @@
+CONFIG_FIX_EARLYCON_MEM=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_DEBUG=y
+CONFIG_NETFILTER_XT_MATCH_CGROUP=y
+CONFIG_SOCK_CGROUP_DATA=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CGROUP_NET_CLASSID=y
+CONFIG_NAMESPACES=y
+CONFIG_IPC_NS=y
+CONFIG_PID_NS=y
+CONFIG_UTS_NS=y
+CONFIG_USER_NS=y
+CONFIG_NET_NS=y
+CONFIG_BRIDGE=y
+CONFIG_VETH=y
diff --git a/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/bin/iperf3.sh b/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/bin/iperf3.sh
new file mode 100755
index 0000000000..7045ca4806
--- /dev/null
+++ b/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/bin/iperf3.sh
@@ -0,0 +1,2 @@
+#!/bin/sh
+iperf3 -s -1 > /tmp/iperf3.serv.log 2>&1
diff --git a/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal-iperf3.conf b/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal-iperf3.conf
new file mode 100644
index 0000000000..41cc5311d6
--- /dev/null
+++ b/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal-iperf3.conf
@@ -0,0 +1,4 @@
+lxc.include = /usr/share/lxc/config/minimal.conf
+lxc.hook.version = 1
+lxc.hook.start-host = ip a add 192.168.1.1/24 dev lxc0
+lxc.init.cmd = tini -g iperf3.sh
diff --git a/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal.conf b/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal.conf
new file mode 100644
index 0000000000..7319821506
--- /dev/null
+++ b/support/testing/tests/package/test_lxc/test_lxc_rootfs_overlay/usr/share/lxc/config/minimal.conf
@@ -0,0 +1,6 @@
+lxc.autodev = 0
+lxc.net.0.type = veth
+lxc.net.0.veth.pair = lxc0
+lxc.net.0.name = eth0
+lxc.net.0.flags = up
+lxc.net.0.ipv4.address = 192.168.1.2/24
-- 
2.17.1
