From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  4 Jul 2017 11:58:05 -0700
Subject: [Buildroot] [PATCH 1/3] testing/infra/emulator: allow to specify
	pexpect timeout
Message-ID: <20170704185807.27189-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some commands take more than 5 seconds to complete under QEMU, so add
provisions to allow individual unit-test to specify different duration
to avoid false negative test failures.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/infra/emulator.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index a39d59b..4e988a4 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -26,7 +26,10 @@ class Emulator(object):
     #
     # options: array of command line options to pass to Qemu
     #
-    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
+    # timeout: timeout to wait for when excuting commands
+    #
+    def boot(self, arch, kernel=None, kernel_cmdline=None,
+             options=None, timeout=5):
         if arch in ["armv7", "armv5"]:
             qemu_arch = "arm"
         else:
@@ -65,7 +68,7 @@ class Emulator(object):
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:], timeout=5)
+        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:], timeout=timeout)
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
 
-- 
2.9.4
