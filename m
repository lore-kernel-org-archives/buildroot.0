From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 16:05:14 +0200
Subject: [Buildroot] [git commit] support/testing: large timeout for login
	prompt
Message-ID: <20170701140852.698E38079F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bb306bd6411071cd07529923b825627502c794d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running multiple instances of emulator in parallel, the login
prompt can take some time to appear.

Use a large timeout when waiting for the prompt to avoid random
failures.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 0f925fc..a39d59b 100644
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
