From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 14:01:23 +0200
Subject: [Buildroot] [git commit] package/freerdp: fix missing define
Message-ID: <20151004120515.688137FB93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78cd32631e959e04b1a2f18be7b0757e21482438
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRDP uses CMSPAR, which is defined by glibc in bits/termios.h .

glibc has two flavours of bits/termios.h: a genmeric one and an
architecture-specific one. When installing, glibc will install the
architecture-specific file if it exists, otherwise it installs the
generic file. Only Alpha, MIPS, PPC and Sparc have their own
bits/termios.h.

The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
do define CMSPAR. However, the MIPS flavour does not define it.

We add a patch to FreeRDP that defines CMSPAR to the value from the
generic value, which is also the value known to the Linux kernel for
MIPS.

Fixes:
    http://autobuild.buildroot.org/results/0b4/0b4793f0bf9f4c57933897f3480054a4e06528ad/
    http://autobuild.buildroot.org/results/7a2/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
    http://autobuild.buildroot.org/results/387/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/0003-add-missing-define.patch |   44 +++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/0003-add-missing-define.patch b/package/freerdp/0003-add-missing-define.patch
new file mode 100644
index 0000000..a8f669e
--- /dev/null
+++ b/package/freerdp/0003-add-missing-define.patch
@@ -0,0 +1,44 @@
+libwinpr/comm_seria: fix missing define
+
+FreeRDP uses CMSPAR, which is defined by glibc in bits/termios.h .
+
+glibc has two flavours of bits/termios.h: a genmeric one and an
+architecture-specific one. When installing, glibc will install the
+architecture-specific file if it exists, otherwise it installs the
+generic file. Only Alpha, MIPS, PPC and Sparc have their own
+bits/termios.h.
+
+The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
+do define CMSPAR. However, the MIPS flavour does not define it.
+
+Define CMSPAR to the value from the generic value, which is also the
+value known to the Linux kernel for MIPS.
+
+Fixes:
+    http://autobuild.buildroot.org/results/0b4/0b4793f0bf9f4c57933897f3480054a4e06528ad/
+    http://autobuild.buildroot.org/results/7a2/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
+    http://autobuild.buildroot.org/results/387/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
+    ...
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Peter Korsgaard <jacmet@uclibc.org>
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -durN freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c
+--- freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c	2015-09-04 16:20:17.000000000 +0100
++++ freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c	2015-10-04 11:07:41.868513726 +0100
+@@ -27,6 +27,14 @@
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <termios.h>
++
++/* glibc for MIPS has its own bits/termios.h which does not define
++ * CMSPAR, so we vampirise the value from the generic bits/termios.h
++ */
++#ifndef CMSPAR
++#define CMSPAR 010000000000
++#endif
++
+ #include <unistd.h>
+ 
+ #include "comm_serial_sys.h"
