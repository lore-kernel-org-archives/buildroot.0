From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 29 Apr 2019 18:32:25 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests for
 Qemu
In-Reply-To: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables to check various qemu architectures build states.
These scripts were inspired from toolchain builder :
https://github.com/bootlin/toolchains-builder/blob/master/build.sh
to test qemu's build process.
This allows to troubleshoot different issues that may be
associated with defective qemu builds by lanching a qemu machine,
sending root password, waiting for login shell and then perform
a shutdown.

The script expect.sh relies on expect package to automate
the tests.
We should mention that python-pexpect can be tweeked for the same
job but seems like it does hide the automation process as well
as any errors that may be encountered.

The script qemu-boot-defconfig_config.sh is required for
architectures that need special configuration before
starting compilation (like setting the correct tty).

On the other side, qemu-boot-checker.sh is used to read
the qemu command used to launch a qemu machine (by reading
board/qemu/qemu_architecture/readme.txt) as well as setting
the path to the qemu host and calling expect.sh.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 support/scripts/expect.sh                     | 22 +++++++++++++++++
 support/scripts/qemu-boot-checker.sh          | 35 +++++++++++++++++++++++++++
 support/scripts/qemu-boot-defconfig_config.sh | 11 +++++++++
 3 files changed, 68 insertions(+)
 create mode 100755 support/scripts/expect.sh
 create mode 100755 support/scripts/qemu-boot-checker.sh
 create mode 100755 support/scripts/qemu-boot-defconfig_config.sh

diff --git a/support/scripts/expect.sh b/support/scripts/expect.sh
new file mode 100755
index 0000000..6d65752
--- /dev/null
+++ b/support/scripts/expect.sh
@@ -0,0 +1,22 @@
+#!/usr/bin/expect
+#
+
+set timeout 400
+
+log_file /tmp/expect_session.log
+
+eval spawn $env(QEMU_COMMAND)
+
+expect {
+    eof {puts "Connection problem, exiting."; exit 1}
+    timeout {puts "System did not boot in time, exiting."; exit 1}
+    "buildroot login:"
+}
+send "root\r"
+expect {
+    eof {puts "Connection problem, exiting."; exit 1}
+    timeout {puts "No shell, exiting."; exit 1}
+    "# "
+}
+send "poweroff\r"
+expect "System halted"
diff --git a/support/scripts/qemu-boot-checker.sh b/support/scripts/qemu-boot-checker.sh
new file mode 100755
index 0000000..f036516
--- /dev/null
+++ b/support/scripts/qemu-boot-checker.sh
@@ -0,0 +1,35 @@
+#!/bin/bash
+
+if [[ $1 = qemu* ]]; then
+  device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g')
+  if [ $device_name == "x86-64" ]; then
+    device_name="x86_64"
+  elif [ $device_name == "xtensa-lx60" ] || [ $device_name == "xtensa-lx60-nommu" ]; then
+    echo "xtensa cannot be tested"
+    exit 0
+  elif [ $device_name == "m68k-q800" ] || [ $device_name == "ork1k" ]; then
+    archQemuNoSupport
+  fi
+
+  test_qemu_cmd="$(grep qemu-system $2/board/qemu/${device_name}/readme.txt)"
+  qemu_command="$(echo "${test_qemu_cmd}"|tr -d '\n')"
+
+  export QEMU_COMMAND="${qemu_command}"
+
+  export PATH="$2/output/host/bin:$PATH"
+  echo $PATH
+
+  function archQemuNoSupport {
+    echo "cannot boot under qemu, support out of tree!"
+    exit 0
+  }
+
+  function boot_test {
+    if ! expect expect.sh ; then
+      echo "  booting test system ... FAILED"
+      return 1
+    fi
+    echo "  booting test system ... SUCCESS"
+  }
+  boot_test
+fi
diff --git a/support/scripts/qemu-boot-defconfig_config.sh b/support/scripts/qemu-boot-defconfig_config.sh
new file mode 100755
index 0000000..526eee1
--- /dev/null
+++ b/support/scripts/qemu-boot-defconfig_config.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+if [[ $1 = qemu* ]]; then
+  device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g') 
+  if [ $device_name == "x86-64" ]; then
+    device_name="x86_64"
+    sed -i "s/tty1/ttyS0/" $2/configs/$1
+  elif [ $device_name == "x86" ]; then
+    sed -i "s/tty1/ttyS0/" $2/configs/$1
+  fi
+fi
-- 
2.7.4
