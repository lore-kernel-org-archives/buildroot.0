From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 16:05:14 +0200
Subject: [Buildroot] [git commit] support/testing: let pexpect write stdout
	to log
Message-ID: <20170701140851.D1C138079F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e664c5f71c9614b991b13225809772eaea4a3dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the parameter logfile is passed to spawn(), pexpect sends both
stdin and stdout to the logfile and it creates a double echo effect.

One way to avoid the double echo in the logfile would be to disable the
echo on the terminal just after login ("stty -echo"), but double echo of
user and password would remain.

Instead of that, send only the stdout to the logfile using the
logfile_read property.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index aa1e9e5..55110db 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -67,6 +67,8 @@ class Emulator(object):
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:])
+        # We want only stdout into the log to avoid double echo
+        self.qemu.logfile_read = self.logfile
 
     def __read_until(self, waitstr, timeout=5):
         index = self.qemu.expect([waitstr, pexpect.TIMEOUT], timeout=timeout)
@@ -74,7 +76,6 @@ class Emulator(object):
         if index == 0:
             data += self.qemu.after
         self.log += data
-        self.logfile.write(data)
         # Remove double carriage return from qemu stdout so str.splitlines()
         # works as expected.
         return data.replace("\r\r", "\r")
