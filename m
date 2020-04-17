From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 17 Apr 2020 22:16:24 +0200
Subject: [Buildroot] [PATCH] support/scripts/boot-qemu-image.py: wait before
 using expect
Message-ID: <20200417201626.342738-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by a gitlab runtime test [1] and on the mailing list
[2], some runtime tests are failing on slow host machines when
the qemu-system-<arch> is missing on the host.

The boot-qemu-image.py script need to wait some time after
calling pexpect.spawn() in order to make sure that the qemu
process has been executed in start-qemu.sh.

If start-qemu.sh failed due to missing qemu-system binary
an exception will be thrown by child.expect() and catched
by the error handling (pexpect.EOF).

Thanks to Yann for the help while investigating the issue.

Tested:
https://gitlab.com/kubu93/buildroot/pipelines/136431059

[1] https://gitlab.com/kubu93/buildroot/pipelines/135487475
[2] http://lists.busybox.net/pipermail/buildroot/2020-April/280037.html

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/509053135

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/boot-qemu-image.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index 2c1afba398..721bc38ecc 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -5,6 +5,7 @@
 import pexpect
 import sys
 import os
+import time
 
 
 def main():
@@ -26,6 +27,10 @@ def main():
     # We want only stdout into the log to avoid double echo
     child.logfile = sys.stdout
 
+    # Let the spawn actually try to fork+exec to the wrapper, and then
+    # let the wrapper exec the qemu process.
+    time.sleep(5)
+
     try:
         child.expect(["buildroot login:", pexpect.TIMEOUT], timeout=60)
     except pexpect.EOF as e:
-- 
2.25.2
