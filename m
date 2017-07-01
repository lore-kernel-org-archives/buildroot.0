From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 16:05:14 +0200
Subject: [Buildroot] [git commit] support/testing: use pexpect.expect
	directly
Message-ID: <20170701140852.01E178079F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a622fe4b6aeca8758156c24e89713d214fa2aa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using pexpect there is no need for a helper function. Just use
expect() directly everywhere.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index e488d8a..7407309 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -8,7 +8,6 @@ class Emulator(object):
     def __init__(self, builddir, downloaddir, logtofile):
         self.qemu = None
         self.downloaddir = downloaddir
-        self.log = ""
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
 
     # Start Qemu to boot the system
@@ -66,34 +65,25 @@ class Emulator(object):
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:])
+        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:], timeout=5)
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
 
-    def __read_until(self, waitstr, timeout=5):
-        index = self.qemu.expect([waitstr, pexpect.TIMEOUT], timeout=timeout)
-        data = self.qemu.before
-        if index == 0:
-            data += self.qemu.after
-        self.log += data
-        # Remove double carriage return from qemu stdout so str.splitlines()
-        # works as expected.
-        return data.replace("\r\r", "\r")
-
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
     def login(self, password=None):
-        self.__read_until("buildroot login:", 10)
-        if "buildroot login:" not in self.log:
+        index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
+                                 timeout=10)
+        if index != 0:
             self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
 
         self.qemu.sendline("root")
         if password:
-            self.__read_until("Password:")
+            self.qemu.expect("Password:")
             self.qemu.sendline(password)
-        self.__read_until("# ")
-        if "# " not in self.log:
+        index = self.qemu.expect(["# ", pexpect.TIMEOUT])
+        if index != 0:
             raise SystemError("Cannot login")
         self.run("dmesg -n 1")
 
@@ -101,13 +91,14 @@ class Emulator(object):
     # return a tuple (output, exit_code)
     def run(self, cmd):
         self.qemu.sendline(cmd)
-        output = self.__read_until("# ")
-        output = output.strip().splitlines()
-        output = output[1:len(output)-1]
+        self.qemu.expect("# ")
+        # Remove double carriage return from qemu stdout so str.splitlines()
+        # works as expected.
+        output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
 
         self.qemu.sendline("echo $?")
-        exit_code = self.__read_until("# ")
-        exit_code = exit_code.strip().splitlines()[1]
+        self.qemu.expect("# ")
+        exit_code = self.qemu.before.splitlines()[2]
         exit_code = int(exit_code)
 
         return output, exit_code
