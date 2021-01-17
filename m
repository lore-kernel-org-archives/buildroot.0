From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 15:32:45 +0100
Subject: [Buildroot] [git commit] package/ell: drop first patch
Message-ID: <20210117141350.A619D870BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cedd24fc1503e76cef5b077a04e1dde23cccd51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

First patch is not needed since commit
7b3ac6d24db08b241df4687f22f757837ddcb5ce which adds a dependency on
headers >= 4.12

It should also be noted that upstream didn't merge it either

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...=> 0001-build-Add-rawmemchr-to-missing.h.patch} |  0
 ...ll-rtnl-fix-compile-with-older-toolchains.patch | 70 ----------------------
 ...2-ell-add-missing-include-in-dhcp-server.patch} |  0
 3 files changed, 70 deletions(-)

diff --git a/package/ell/0002-build-Add-rawmemchr-to-missing.h.patch b/package/ell/0001-build-Add-rawmemchr-to-missing.h.patch
similarity index 100%
rename from package/ell/0002-build-Add-rawmemchr-to-missing.h.patch
rename to package/ell/0001-build-Add-rawmemchr-to-missing.h.patch
diff --git a/package/ell/0001-ell-rtnl-fix-compile-with-older-toolchains.patch b/package/ell/0001-ell-rtnl-fix-compile-with-older-toolchains.patch
deleted file mode 100644
index 0375be854c..0000000000
--- a/package/ell/0001-ell-rtnl-fix-compile-with-older-toolchains.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From c4218f71352ae5e39692e030d9af2c665dbb2eee Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 9 Apr 2020 22:21:36 +0200
-Subject: [PATCH] ell/rtnl: fix compile with older toolchains
-
-Older toolchains need to include sys/types.h and sys/socket.h before
-linux/if.h, RTA_PREF was introduces with linux-4.1.x.
-
-Fixes:
-
-  In file included from ell/rtnl.c:28:0:
-  .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:185:19: error: field 'ifru_addr' has incomplete type
-  .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:186:19: error: field 'ifru_dstaddr' has incomplete type
-  .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:187:19: error: field 'ifru_broadaddr' has incomplete type
-  .../host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:188:19: error: field 'ifru_netmask' has incomplete type
-  .../arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:189:20: error: field 'ifru_hwaddr' has incomplete type
-  ell/rtnl.c: In function 'l_rtnl_route_extract':
-  ell/rtnl.c:120:8: error: 'RTA_PREF' undeclared (first use in this function)
-
-[Upstream: https://lists.ofono.org/hyperkitty/list/ell at lists.01.org/thread/TOJ5XEY7X6WMOMJHX4KWI5LFEOX2QTBQ]
-[Rebased for ell-0.35]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 2 ++
- ell/rtnl.c   | 7 ++++++-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1e5ead9..bec472d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -110,6 +110,8 @@ AC_CHECK_FUNC(epoll_create, dummy=yes,
- 
- AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
- 
-+AC_CHECK_DECLS([RTA_PREF], [], [], [[#include <linux/rtnetlink.h>]])
-+
- AC_ARG_ENABLE(glib, AC_HELP_STRING([--enable-glib],
- 				[enable ell/glib main loop example]),
- 					[enable_glib=${enableval}])
-diff --git a/ell/rtnl.c b/ell/rtnl.c
-index c115573..ccfa6fe 100644
---- a/ell/rtnl.c
-+++ b/ell/rtnl.c
-@@ -25,9 +25,10 @@
- #endif
- 
- #define _GNU_SOURCE
--#include <linux/if.h>
-+#include <sys/types.h>
- #include <linux/icmpv6.h>
- #include <sys/socket.h>
-+#include <linux/if.h>
- #include <arpa/inet.h>
- 
- #include "util.h"
-@@ -524,6 +525,10 @@ LIB_EXPORT bool l_rtnl_route_set_scope(struct l_rtnl_route *rt, uint8_t scope)
- 	return true;
- }
- 
-+#if defined HAVE_DECL_RTA_PREF && !HAVE_DECL_RTA_PREF
-+#define RTA_PREF 20
-+#endif
-+
- static size_t rta_add_u8(void *rta_buf, unsigned short type, uint8_t value)
- {
- 	struct rtattr *rta = rta_buf;
--- 
-2.29.2
-
diff --git a/package/ell/0003-ell-add-missing-include-in-dhcp-server.patch b/package/ell/0002-ell-add-missing-include-in-dhcp-server.patch
similarity index 100%
rename from package/ell/0003-ell-add-missing-include-in-dhcp-server.patch
rename to package/ell/0002-ell-add-missing-include-in-dhcp-server.patch
