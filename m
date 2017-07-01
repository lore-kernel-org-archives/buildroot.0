From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 16:05:14 +0200
Subject: [Buildroot] [git commit] support/testing: use pexpect.sendline
	directly
Message-ID: <20170701140851.E71D28079F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77b4b948fc0309a1cf3eef55f44bec260319e5f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using pexpect there is no need for a helper function. Just use
sendline() directly everywhere.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 55110db..e488d8a 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -80,9 +80,6 @@ class Emulator(object):
         # works as expected.
         return data.replace("\r\r", "\r")
 
-    def __write(self, wstr):
-        self.qemu.send(wstr)
-
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
     def login(self, password=None):
@@ -91,10 +88,10 @@ class Emulator(object):
             self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
 
-        self.__write("root\n")
+        self.qemu.sendline("root")
         if password:
             self.__read_until("Password:")
-            self.__write(password + "\n")
+            self.qemu.sendline(password)
         self.__read_until("# ")
         if "# " not in self.log:
             raise SystemError("Cannot login")
@@ -103,12 +100,12 @@ class Emulator(object):
     # Run the given 'cmd' on the target
     # return a tuple (output, exit_code)
     def run(self, cmd):
-        self.__write(cmd + "\n")
+        self.qemu.sendline(cmd)
         output = self.__read_until("# ")
         output = output.strip().splitlines()
         output = output[1:len(output)-1]
 
-        self.__write("echo $?\n")
+        self.qemu.sendline("echo $?")
         exit_code = self.__read_until("# ")
         exit_code = exit_code.strip().splitlines()[1]
         exit_code = int(exit_code)
