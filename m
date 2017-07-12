From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:04 -0700
Subject: [Buildroot] [PATCH v2 1/6] testing/infra/emulator: allow to specify
	pexpect timeout
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170712024009.2366-2-andrew.smirnov@gmail.com>
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
-- 
2.9.4
