From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:03:12 +0100
Subject: [Buildroot] [PATCH 4/4] vpnc: add patches to fix build with the
	musl C library
In-Reply-To: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1455145392-2355-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds hree patches that are needed to fix build issues on
musl:

 - <error.h> not available on musl
 - structure redefinitions due to direct inclusion of kernel headers
 - missing <sys/ttydefaults.h> inclusion

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...n-t-assume-error.h-is-available-on-all-Li.patch | 54 +++++++++++++++++++++
 ...p.c-don-t-include-linux-if_tun.h-on-Linux.patch | 56 ++++++++++++++++++++++
 ...g.c-add-missing-sys-ttydefaults.h-include.patch | 38 +++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 package/vpnc/0007-sysdep.h-don-t-assume-error.h-is-available-on-all-Li.patch
 create mode 100644 package/vpnc/0008-sysdep.c-don-t-include-linux-if_tun.h-on-Linux.patch
 create mode 100644 package/vpnc/0009-config.c-add-missing-sys-ttydefaults.h-include.patch

diff --git a/package/vpnc/0007-sysdep.h-don-t-assume-error.h-is-available-on-all-Li.patch b/package/vpnc/0007-sysdep.h-don-t-assume-error.h-is-available-on-all-Li.patch
new file mode 100644
index 0000000..b08eedc
--- /dev/null
+++ b/package/vpnc/0007-sysdep.h-don-t-assume-error.h-is-available-on-all-Li.patch
@@ -0,0 +1,54 @@
+From 7f41ef32c8c887ee23ca83da4dfd7a4f27e01186 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 10 Feb 2016 23:09:51 +0100
+Subject: [PATCH] sysdep.h: don't assume <error.h> is available on all Linux
+ platforms
+
+The current logic in sysdep.h assumes that whenever you have __linux__
+or __GLIBC__ defined, then <error.h> functionality is
+available. However, the <error.h> functionality is a glibc-ism, not
+available in more standard-conformant C libraries such as the musl C
+library. With musl, __linux__ is defined (but of course not
+__GLIBC__). With the current logic, sysdep.h assumes that <error.h> is
+available, which isn't the case.
+
+This patch therefore changes the logic to only use <error.h> when
+__GLIBC__ is defined. It fixes the following build error:
+
+In file included from tunip.c:87:0:
+sysdep.h:41:19: fatal error: error.h: No such file or directory
+ #include <error.h>
+
+Original patch from
+http://git.alpinelinux.org/cgit/aports/tree/testing/vpnc/working.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ sysdep.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/sysdep.h b/sysdep.h
+index 137bf6d..fb65b31 100644
+--- a/sysdep.h
++++ b/sysdep.h
+@@ -38,11 +38,14 @@ int tun_get_hwaddr(int fd, char *dev, uint8_t *hwaddr);
+ 
+ /***************************************************************************/
+ #if defined(__linux__) || defined(__GLIBC__)
++
++#ifdef __GLIBC__
+ #include <error.h>
++#define HAVE_ERROR     1
++#endif
+ 
+ #define HAVE_VASPRINTF 1
+ #define HAVE_ASPRINTF  1
+-#define HAVE_ERROR     1
+ #define HAVE_UNSETENV  1
+ #define HAVE_SETENV    1
+ #endif
+-- 
+2.6.4
+
diff --git a/package/vpnc/0008-sysdep.c-don-t-include-linux-if_tun.h-on-Linux.patch b/package/vpnc/0008-sysdep.c-don-t-include-linux-if_tun.h-on-Linux.patch
new file mode 100644
index 0000000..a8b9e04
--- /dev/null
+++ b/package/vpnc/0008-sysdep.c-don-t-include-linux-if_tun.h-on-Linux.patch
@@ -0,0 +1,56 @@
+From 2e2eab070384834036c1458c669070ed17d81dbe Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 10 Feb 2016 23:15:36 +0100
+Subject: [PATCH] sysdep.c: don't include <linux/if_tun.h> on Linux
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Including <linux/if_tun.h> in sysdep.c is not necessary since sysdep.h
+already includes <netinet/if_ether.h>. And this is actually
+potentially harmful since both files redefine the same 'struct
+ethhdr', causing the following build failure with the musl C library:
+
+In file included from sysdep.h:28:0,
+                 from sysdep.c:71:
+.../buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/netinet/if_ether.h:96:8: error: redefinition of ?struct ethhdr?
+ struct ethhdr {
+        ^
+In file included from .../buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if_tun.h:20:0,
+                 from sysdep.c:62:
+.../buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if_ether.h:138:8: note: originally defined here
+ struct ethhdr {
+        ^
+
+Original patch from:
+http://git.alpinelinux.org/cgit/aports/tree/testing/vpnc/working.patch
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ sysdep.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/sysdep.c b/sysdep.c
+index d8f181d..f83543d 100644
+--- a/sysdep.c
++++ b/sysdep.c
+@@ -58,13 +58,11 @@
+ 
+ #if defined(__DragonFly__)
+ #include <net/tun/if_tun.h>
+-#elif defined(__linux__)
+-#include <linux/if_tun.h>
+ #elif defined(__APPLE__)
+ /* no header for tun */
+ #elif defined(__CYGWIN__)
+ #include "tap-win32.h"
+-#else
++#elif !defined(__linux__)
+ #include <net/if_tun.h>
+ #endif
+ 
+-- 
+2.6.4
+
diff --git a/package/vpnc/0009-config.c-add-missing-sys-ttydefaults.h-include.patch b/package/vpnc/0009-config.c-add-missing-sys-ttydefaults.h-include.patch
new file mode 100644
index 0000000..2b87c9a
--- /dev/null
+++ b/package/vpnc/0009-config.c-add-missing-sys-ttydefaults.h-include.patch
@@ -0,0 +1,38 @@
+From 17277915af703a4767de791916621d8f59aef516 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 10 Feb 2016 23:21:26 +0100
+Subject: [PATCH] config.c: add missing <sys/ttydefaults.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This include is needed to get the definition of CEOT, otherwise the
+build fails with:
+
+config.c: In function ?vpnc_getline?:
+config.c:145:25: error: ?CEOT? undeclared (first use in this function)
+   if (llen == 0 && c == CEOT)
+                         ^
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6
+
+ config.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config.c b/config.c
+index 11b363b..f47a534 100644
+--- a/config.c
++++ b/config.c
+@@ -31,6 +31,7 @@
+ #include <sys/types.h>
+ #include <sys/utsname.h>
+ #include <sys/wait.h>
++#include <sys/ttydefaults.h>
+ 
+ #include <gcrypt.h>
+ 
+-- 
+2.6.4
+
-- 
2.6.4
