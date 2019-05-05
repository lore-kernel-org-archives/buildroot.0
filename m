From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Sun,  5 May 2019 18:53:58 +0200
Subject: [Buildroot] [PATCH v2 6/7] support/scripts/qemu-boot-*: gitlab
 tests for Qemu
In-Reply-To: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557075239-30667-7-git-send-email-jugurtha.belkalem@smile.fr>
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

The script qemu-boot-expect.py is used
to automate the tests.

The script qemu-boot-chg-defconfig.sh is required for
architectures that need special configuration before
starting compilation (like setting the correct tty).

On the other side, qemu-boot-checker.sh is used to read
the qemu command used to launch a qemu machine (by reading
board/qemu/qemu_architecture/readme.txt) as well as setting
the path to the qemu host and calling expect.sh.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

---
Changes v1 => v2:
- qemu-boot-expect.py (based on python-pexpect)
replaces expect.sh (based on expect).
- qemu-boot-chg-defconfig.sh replaces
qemu-boot-defconfig_config.sh
---
 support/scripts/qemu-boot-checker.sh       | 25 ++++++++++++++
 support/scripts/qemu-boot-chg-defconfig.sh | 11 ++++++
 support/scripts/qemu-boot-expect.py        | 55 ++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100755 support/scripts/qemu-boot-checker.sh
 create mode 100755 support/scripts/qemu-boot-chg-defconfig.sh
 create mode 100755 support/scripts/qemu-boot-expect.py

diff --git a/support/scripts/qemu-boot-checker.sh b/support/scripts/qemu-boot-checker.sh
new file mode 100755
index 0000000..dc79dad
--- /dev/null
+++ b/support/scripts/qemu-boot-checker.sh
@@ -0,0 +1,25 @@
+#!/usr/bin/env bash
+
+function archQemuNoSupport {
+	echo "cannot boot under qemu, support out of tree!"
+	exit 0
+}
+
+if [[ $1 = qemu* ]]; then
+	device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g')
+	if [ "$device_name" = "x86-64" ]; then
+		device_name="x86_64"
+	elif [ "$device_name" = "m68k-q800" ] || [ "$device_name" = "ork1k" ]; then
+		archQemuNoSupport
+	fi
+
+	export PATH="$2/output/host/bin:$PATH"
+	qemu_command_launcher=$($2/board/qemu/${device_name}/launch.sh)
+	$2/support/scripts/qemu-boot-expect.py "${qemu_command_launcher}"
+
+	if [ $? -ne 0 ]; then
+		echo "  booting test system ... FAILED"
+		exit 1
+	fi
+	echo "  booting test system ... SUCCESS"
+fi
diff --git a/support/scripts/qemu-boot-chg-defconfig.sh b/support/scripts/qemu-boot-chg-defconfig.sh
new file mode 100755
index 0000000..868bc4e
--- /dev/null
+++ b/support/scripts/qemu-boot-chg-defconfig.sh
@@ -0,0 +1,11 @@
+#!/usr/bin/env bash
+
+if [[ $1 = qemu* ]]; then
+	device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g') 
+	if [ "$device_name" = "x86-64" ]; then
+		device_name="x86_64"
+		sed -i "s/tty1/ttyS0/" $2/configs/$1
+	elif [ "$device_name" = "x86" ]; then
+		sed -i "s/tty1/ttyS0/" $2/configs/$1
+	fi
+fi
diff --git a/support/scripts/qemu-boot-expect.py b/support/scripts/qemu-boot-expect.py
new file mode 100755
index 0000000..7cd92c1
--- /dev/null
+++ b/support/scripts/qemu-boot-expect.py
@@ -0,0 +1,55 @@
+#!/usr/bin/env python
+#
+
+import pexpect
+import sys
+import os
+
+def checkQemuExec():
+    qemu_exec_exists = False
+    for dir in os.getenv("PATH").split(':'):
+        if (os.path.exists(os.path.join(dir, sys.argv[1].split(" ")[0]))):
+            qemu_exec_exists = True
+            break
+    return qemu_exec_exists
+
+def main():
+    global child
+    if(checkQemuExec()):
+        try:
+            child.expect("buildroot login:")
+        except pexpect.EOF:
+            print("Connection problem, exiting.")
+            sys.exit(1)
+        except pexpect.TIMEOUT:
+            print("System did not boot in time, exiting.")
+            sys.exit(1)
+
+        child.sendline("root\r")
+
+        try:
+            child.expect("# ")
+        except pexpect.EOF:
+            print("Cannot connect to shell")
+            sys.exit(1)
+        except pexpect.TIMEOUT:
+            print("Timeout while waiting for shell")
+            sys.exit(1)
+        
+        child.sendline("poweroff\r")
+
+        try:
+            child.expect("System halted")
+            child.expect(pexpect.EOF)
+        except pexpect.EOF:
+            sys.exit(0)
+        except pexpect.TIMEOUT:
+            print("Cannot halt machine")
+            sys.exit(1)
+    else:
+        print("Cannot find Qemu executable")
+        sys.exit(1)
+
+child = pexpect.spawn(sys.argv[1])
+child.logfile=sys.stdout
+main()
-- 
2.7.4
