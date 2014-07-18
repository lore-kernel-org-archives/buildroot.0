From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 20:04:11 +0200
Subject: [Buildroot] [git commit] python: fix termios build for xtensa
Message-ID: <20140718180417.56DD29D27D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c821210b1bfa1d9c1dae23e6dd228726e4b45f67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xtensa ioctls.h header references struct serial_multiport_struct that is
not defined in this header or included headers. ioctls.h also references
tty_struct that is not exported to userspace at all. Add a patch fixing these
issues.

This is only a workaround as the real problem should be fixed in the kernel
(by removing all struct references like all other archs). But since we support
older kernel versions we'll have to carry this patch for some time.

Fixes:
http://autobuild.buildroot.net/results/12b/12b5612828d7f1fc7d1f69fc01341d5a6e628db5/

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-015-serial-ioctl-workaround.patch       |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/python/python-015-serial-ioctl-workaround.patch b/package/python/python-015-serial-ioctl-workaround.patch
new file mode 100644
index 0000000..9ff775f
--- /dev/null
+++ b/package/python/python-015-serial-ioctl-workaround.patch
@@ -0,0 +1,23 @@
+Serial ioctl() workaround
+
+The ioctls.h of some architectures (notably xtensa) references structs from
+linux/serial.h. Make sure to include this header as well.
+
+Also, undef TIOCTTYGSTRUCT that require reference to internal kernel tty_struct,
+but isn't actually referenced in modern kernels.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar Python-2.7.8-orig/Modules/termios.c Python-2.7.8/Modules/termios.c
+--- Python-2.7.8-orig/Modules/termios.c	2014-06-30 05:05:44.000000000 +0300
++++ Python-2.7.8/Modules/termios.c	2014-07-18 06:16:43.393010357 +0300
+@@ -16,7 +16,9 @@
+  * so this needs to be included first on that platform. */
+ #include <termio.h>
+ #endif
++#include <linux/serial.h>
+ #include <sys/ioctl.h>
++#undef TIOCTTYGSTRUCT
+ 
+ /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
+  * MDTR, MRI, and MRTS (appearantly used internally by some things
