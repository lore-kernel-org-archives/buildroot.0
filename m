From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 16:05:14 +0200
Subject: [Buildroot] [git commit] support/testing: use pexpect in emulator
Message-ID: <20170701140851.98E4281E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb0fab80f6a89df903330a0f4f51623a1abed731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace subprocess + telnetlib with pexpect.

Use the telnet installed on the host machine instead of telnetlib, while
the serial from qemu is not yet redirected to stdio.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 2480b46..14a8bef 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,6 +1,4 @@
-import socket
-import subprocess
-import telnetlib
+import pexpect
 
 import infra
 import infra.basetest
@@ -71,25 +69,24 @@ class Emulator(object):
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-        self.qemu = subprocess.Popen(qemu_cmd, stdout=self.logfile, stderr=self.logfile)
+        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:])
 
         # Wait for the telnet port to appear and connect to it.
-        while True:
-            try:
-                self.__tn = telnetlib.Telnet("localhost", 1234)
-                if self.__tn:
-                    break
-            except socket.error:
-                continue
+        self.qemu.expect("waiting for connection")
+        telnet_cmd = ["telnet", "localhost", "1234"]
+        self.__tn = pexpect.spawn(telnet_cmd[0], telnet_cmd[1:])
 
     def __read_until(self, waitstr, timeout=5):
-        data = self.__tn.read_until(waitstr, timeout)
+        index = self.__tn.expect([waitstr, pexpect.TIMEOUT], timeout=timeout)
+        data = self.__tn.before
+        if index == 0:
+            data += self.__tn.after
         self.log += data
         self.logfile.write(data)
         return data
 
     def __write(self, wstr):
-        self.__tn.write(wstr)
+        self.__tn.send(wstr)
 
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
@@ -124,7 +121,8 @@ class Emulator(object):
         return output, exit_code
 
     def stop(self):
+        if self.__tn:
+            self.__tn.terminate(force=True)
         if self.qemu is None:
             return
-        self.qemu.terminate()
-        self.qemu.kill()
+        self.qemu.terminate(force=True)
