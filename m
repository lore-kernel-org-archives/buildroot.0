From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 22 Apr 2020 01:00:05 +0200
Subject: [Buildroot] [PATCHv3] support/scripts/boot-qemu-image.py: wait
 before using expect
Message-ID: <20200421230005.3348567-1-romain.naour@gmail.com>
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
an exception will be thrown by child.expect() and should be
catched by the error handling (pexpect.EOF).

After spending a lot of time to investigate with Yann E. MORIN
[3]. It seems that short-lived child processes are a corner-case
that is not very correctly handled...

Without adding a sleep(1), child.expect() can trigger an
exception before setting the exitstatus of the spawned
process. This issue can be reproduced on a gitlab runner or
by adding "exit 1" in the first line of start-qemu.sh
(after the shebang).

There is even the same workaround in some pexpect examples [4].

Thanks to Yann for the help while investigating the issue.

Tested:
https://gitlab.com/kubu93/buildroot/pipelines/138472925

[1] https://gitlab.com/kubu93/buildroot/pipelines/135487475
[2] http://lists.busybox.net/pipermail/buildroot/2020-April/280037.html
[3] http://patchwork.ozlabs.org/project/buildroot/patch/20200418161023.1221799-1-romain.naour at gmail.com/
[4] https://github.com/pexpect/pexpect/blob/master/examples/ssh_tunnel.py#L80

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/509053135

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v3: use sleep(1)
v2: Don't sleep(5), handle the case where pexpect retrun
    "None" as exitstatus (ThomasP)
---
 support/scripts/boot-qemu-image.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index 2c1afba398..f00eed0a2c 100755
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
+    time.sleep(1)
+
     try:
         child.expect(["buildroot login:", pexpect.TIMEOUT], timeout=60)
     except pexpect.EOF as e:
-- 
2.25.3
