From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 22 Aug 2018 15:52:34 +0200
Subject: [Buildroot] [PATCH next] libusbgx: fix build with glibc-2.28
Message-ID: <20180822135234.20670-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Without sys/sysmacros.h and with glibc-2.28 build fails with error like:
libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `minor'
libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `major'
libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `makedev'

backport and adapt pr #28 (https://github.com/libusbgx/libusbgx/pull/28)

fix:
http://autobuild.buildroot.net/results/872e2ab084c0c9bf466265d2f66140fbba692ee6/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * specify branch and glibc version (thomas)
---
 .../0001-Add-include-of-sys-sysmacro.h.patch       | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch

diff --git a/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch b/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
new file mode 100644
index 0000000000..997cbf9a12
--- /dev/null
+++ b/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
@@ -0,0 +1,94 @@
+Add include of sys/sysmacro.h.
+
+Without sys/sysmacros.h and with glibc build fails with error like:
+
+libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `minor'
+libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `major'
+libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `makedev'
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Signed-off-by: Sid Spry <R030t1@gmail.com>
+---
+ examples/gadget-acm-ecm.c              | 1 +
+ examples/gadget-import.c               | 1 +
+ examples/gadget-ms.c                   | 1 +
+ examples/show-gadgets.c                | 1 +
+ examples/show-udcs.c                   | 1 +
+ include/usbg/usbg_internal_libconfig.h | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/examples/gadget-acm-ecm.c b/examples/gadget-acm-ecm.c
+index 1c5e2ca..29360da 100644
+--- a/examples/gadget-acm-ecm.c
++++ b/examples/gadget-acm-ecm.c
+@@ -20,6 +20,7 @@
+ 
+ #include <errno.h>
+ #include <stdio.h>
++#include <sys/sysmacros.h>
+ #include <linux/usb/ch9.h>
+ #include <usbg/usbg.h>
+ 
+diff --git a/examples/gadget-import.c b/examples/gadget-import.c
+index e684fdb..63df449 100644
+--- a/examples/gadget-import.c
++++ b/examples/gadget-import.c
+@@ -25,6 +25,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <stdio.h>
++#include <sys/sysmacros.h>
+ #include <usbg/usbg.h>
+ 
+ int main(int argc, char **argv)
+diff --git a/examples/gadget-ms.c b/examples/gadget-ms.c
+index 478c370..a5c6681 100644
+--- a/examples/gadget-ms.c
++++ b/examples/gadget-ms.c
+@@ -23,6 +23,7 @@
+ 
+ #include <errno.h>
+ #include <stdio.h>
++#include <sys/sysmacros.h>
+ #include <linux/usb/ch9.h>
+ #include <usbg/usbg.h>
+ #include <usbg/function/ms.h>
+diff --git a/examples/show-gadgets.c b/examples/show-gadgets.c
+index 707d448..a2a21c8 100644
+--- a/examples/show-gadgets.c
++++ b/examples/show-gadgets.c
+@@ -21,6 +21,7 @@
+ #include <errno.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <sys/sysmacros.h>
+ #include <netinet/ether.h>
+ #include <usbg/usbg.h>
+ #include <usbg/function/ms.h>
+diff --git a/examples/show-udcs.c b/examples/show-udcs.c
+index 66e950f..2f5cc45 100644
+--- a/examples/show-udcs.c
++++ b/examples/show-udcs.c
+@@ -23,6 +23,7 @@
+ 
+ #include <errno.h>
+ #include <stdio.h>
++#include <sys/sysmacros.h>
+ #include <usbg/usbg.h>
+ 
+ int main(void)
+diff --git a/include/usbg/usbg_internal_libconfig.h b/include/usbg/usbg_internal_libconfig.h
+index ac51758..3fa55c0 100644
+--- a/include/usbg/usbg_internal_libconfig.h
++++ b/include/usbg/usbg_internal_libconfig.h
+@@ -12,6 +12,7 @@
+ #ifndef USBG_INTERNAL_LIBCONFIG_H
+ #define USBG_INTERNAL_LIBCONFIG_H
+ 
++#include <sys/sysmacros.h>
+ #include <libconfig.h>
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.16.4
+
-- 
2.16.4
