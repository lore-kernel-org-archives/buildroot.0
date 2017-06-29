From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Jun 2017 23:45:49 -0300
Subject: [Buildroot] [PATCH 9/9] support/testing: large timeout for login
	prompt
In-Reply-To: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
References: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
Message-ID: <20170629024549.30484-10-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When running multiple instances of emulator in parallel, the login
prompt can take some time to appear.

Use a large timeout when waiting for the prompt to avoid random
failures.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
The issue can be reproduced easily by running the emulator of all
current tests in parallel, e.g. run 'run-tests -k --all' and then
'run-tests -k -t 99 --all'
---
 support/testing/infra/emulator.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 0f925fc9fb..a39d59b881 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -72,8 +72,10 @@ class Emulator(object):
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
     def login(self, password=None):
+        # The login prompt can take some time to appear when running multiple
+        # instances in parallel, so set the timeout to a large value
         index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
-                                 timeout=10)
+                                 timeout=60)
         if index != 0:
             self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
-- 
2.11.0
