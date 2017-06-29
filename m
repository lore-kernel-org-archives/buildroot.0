From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Jun 2017 23:45:42 -0300
Subject: [Buildroot] [PATCH 2/9] support/testing: use qemu stdio in emulator
In-Reply-To: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
References: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
Message-ID: <20170629024549.30484-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of redirecting qemu serial to telnet, redirect it to stdio.

It allows to run testcases in parallel without random failing caused by
two emulators trying to use the same telnet port (1234).

'qemu -serial stdio' returns some extra <CR> characters, so remove them
from the log.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Using this patch, one can happily change the config file
'support/testing/conf/unittest.cfg' to use
[multiprocess]
processes = 2

To go further than 2, I needed the last patch of this series. This limit
certainly depends on the host machine.
---
 support/testing/infra/emulator.py | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 14a8bef890..aa1e9e5b2c 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -3,13 +3,10 @@ import pexpect
 import infra
 import infra.basetest
 
-# TODO: Most of the telnet stuff need to be replaced by stdio/pexpect to discuss
-# with the qemu machine.
 class Emulator(object):
 
     def __init__(self, builddir, downloaddir, logtofile):
         self.qemu = None
-        self.__tn = None
         self.downloaddir = downloaddir
         self.log = ""
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
@@ -37,7 +34,7 @@ class Emulator(object):
             qemu_arch = arch
 
         qemu_cmd = ["qemu-system-{}".format(qemu_arch),
-                    "-serial", "telnet::1234,server",
+                    "-serial", "stdio",
                     "-display", "none"]
 
         if options:
@@ -71,22 +68,19 @@ class Emulator(object):
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:])
 
-        # Wait for the telnet port to appear and connect to it.
-        self.qemu.expect("waiting for connection")
-        telnet_cmd = ["telnet", "localhost", "1234"]
-        self.__tn = pexpect.spawn(telnet_cmd[0], telnet_cmd[1:])
-
     def __read_until(self, waitstr, timeout=5):
-        index = self.__tn.expect([waitstr, pexpect.TIMEOUT], timeout=timeout)
-        data = self.__tn.before
+        index = self.qemu.expect([waitstr, pexpect.TIMEOUT], timeout=timeout)
+        data = self.qemu.before
         if index == 0:
-            data += self.__tn.after
+            data += self.qemu.after
         self.log += data
         self.logfile.write(data)
-        return data
+        # Remove double carriage return from qemu stdout so str.splitlines()
+        # works as expected.
+        return data.replace("\r\r", "\r")
 
     def __write(self, wstr):
-        self.__tn.send(wstr)
+        self.qemu.send(wstr)
 
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
@@ -121,8 +115,6 @@ class Emulator(object):
         return output, exit_code
 
     def stop(self):
-        if self.__tn:
-            self.__tn.terminate(force=True)
         if self.qemu is None:
             return
         self.qemu.terminate(force=True)
-- 
2.11.0
