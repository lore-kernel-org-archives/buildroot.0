From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:37:06 +0200
Subject: [Buildroot] [git commit] testing/infra/emulator: allow to specify
	pexpect timeout
Message-ID: <20170722203422.583947FD13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=255b8ab406cf6ce114b4d2c2e2c0dba6e4402f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some commands take more than 5 seconds to complete under QEMU, so add
provisions to allow individual unit-test to specify different duration
to avoid false negative test failures.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index a39d59b..9b079cb 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -89,11 +89,11 @@ class Emulator(object):
             raise SystemError("Cannot login")
         self.run("dmesg -n 1")
 
-    # Run the given 'cmd' on the target
+    # Run the given 'cmd' with a 'timeout' on the target
     # return a tuple (output, exit_code)
-    def run(self, cmd):
+    def run(self, cmd, timeout=-1):
         self.qemu.sendline(cmd)
-        self.qemu.expect("# ")
+        self.qemu.expect("# ", timeout=timeout)
         # Remove double carriage return from qemu stdout so str.splitlines()
         # works as expected.
         output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
