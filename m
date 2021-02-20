From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 22:44:29 +0100
Subject: [Buildroot] [git commit] support/scripts/boot-qemu-image.py:
 properly catch timeout
Message-ID: <20210220212421.EC362800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03c3fbd81c51c7b0cc236362b3afc73e01219170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on IRC by sephthir, the gitlab test of the defconfig
qemu_sparc_ss10_defconfig doesn't error out while the system
is not working properly.

This is because we explicitly wait for the timeout as an expected
condition, but do not check for it. Indeed, pexpect.expect() returns
the index of the matching condition in the list of expected conditions,
but we just ignore the return code, so we are not able to differentiate
between a successful login (or prompt) from a timeout.

By default, pexepect.expect() raises the pexpect.TIMEOUT exception on a
timeout, and we are already prepared to catch and handle that exception.
But because pexpect.TIMEOUT is passed as an expected condition, the
exception is not raised.

Remove pexpect.TIMEOUT from the list of expected conditions, so that the
exception is properly raised again, and so that we can catch it.

The qemu_sparc_ss10_defconfig is already fixed by
4d16e6f5324f0285f51bfbb5a3503584f3b3ad12.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
[yann.morin.1998 at free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/boot-qemu-image.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index 4066788c88..0d4ad825fc 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -36,7 +36,7 @@ def main():
     time.sleep(1)
 
     try:
-        child.expect(["buildroot login:", pexpect.TIMEOUT], timeout=60)
+        child.expect(["buildroot login:"], timeout=60)
     except pexpect.EOF as e:
         # Some emulations require a fork of qemu-system, which may be
         # missing on the system, and is not provided by Buildroot.
@@ -58,7 +58,7 @@ def main():
     child.sendline("root\r")
 
     try:
-        child.expect(["# ", pexpect.TIMEOUT], timeout=60)
+        child.expect(["# "], timeout=60)
     except pexpect.EOF:
         print("Cannot connect to shell")
         sys.exit(1)
@@ -69,7 +69,7 @@ def main():
     child.sendline("poweroff\r")
 
     try:
-        child.expect(["System halted", pexpect.TIMEOUT], timeout=60)
+        child.expect(["System halted"], timeout=60)
         child.expect(pexpect.EOF)
     except pexpect.EOF:
         pass
