From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 22:17:30 +0200
Subject: [Buildroot] [git commit] python3: fix termios build for xtensa
Message-ID: <20140806201756.198F59D3C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad4cbfe5f35120f2c4bba4e823551fa067b1cea3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forward port the patch from c821210b1bfa (python: fix termios build for
xtensa) to python3.

Fixes:
http://autobuild.buildroot.net/results/e7f/e7f71fbcb0796f315052947382fa39d85c5dc8fe/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python3-014-serial-ioctl-workaround.patch      |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3-014-serial-ioctl-workaround.patch b/package/python3/python3-014-serial-ioctl-workaround.patch
new file mode 100644
index 0000000..9786d03
--- /dev/null
+++ b/package/python3/python3-014-serial-ioctl-workaround.patch
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
+diff -Nuar Python-3.4.1-orig/Modules/termios.c Python-3.4.1/Modules/termios.c
+--- Python-3.4.1-orig/Modules/termios.c	2014-05-19 08:19:39.000000000 +0300
++++ Python-3.4.1/Modules/termios.c	2014-08-06 21:16:11.892362933 +0300
+@@ -9,7 +9,9 @@
+ #endif
+ 
+ #include <termios.h>
++#include <linux/serial.h>
+ #include <sys/ioctl.h>
++#undef TIOCTTYGSTRUCT
+ 
+ /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
+  * MDTR, MRI, and MRTS (appearantly used internally by some things
