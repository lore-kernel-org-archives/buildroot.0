From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Apr 2020 18:10:23 +0200
Subject: [Buildroot] [PATCHv2] support/scripts/boot-qemu-image.py: handle
 when pexpect.spawn() exit early
Message-ID: <20200418161023.1221799-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by a gitlab runtime test [1] and on the mailing list
[2], some runtime tests are failing on slow host machines when
the qemu-system-<arch> is missing on the host.

On such host machines, the "exitstatus:" can be "None" instead of
the qemu-system-<arch> return code value.

This can be reproduced more easily by adding "exit 1" in the
first line of start-qemu.sh (after the shebang).

Add a new condition in the exception handling to check
if exitstatus is not "None" before retrieving the exit code.
If exitstatus is "None", return 127 (command not found) as exit code.

Thanks to Yann for the help while investigating the issue.

Tested:
https://gitlab.com/kubu93/buildroot/pipelines/137465454

[1] https://gitlab.com/kubu93/buildroot/pipelines/135487475
[2] http://lists.busybox.net/pipermail/buildroot/2020-April/280037.html

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/509053135

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v2: Don't sleep(5) (ThomasP)
---
 support/scripts/boot-qemu-image.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index 2c1afba398..f2abaf83ed 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -34,7 +34,7 @@ def main():
         # In this case, spawn above will succeed at starting the wrapper
         # start-qemu.sh, but that one will fail (exit with 127) in such
         # a situation.
-        exit = [int(l.split(' ')[1])
+        exit = [int(l.split(' ')[1] if l is None else int(127))
                 for l in e.value.splitlines()
                 if l.startswith('exitstatus: ')]
         if len(exit) and exit[0] == 127:
-- 
2.25.2
