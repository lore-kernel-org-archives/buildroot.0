From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  1 Dec 2020 23:37:58 +0100
Subject: [Buildroot] [PATCH/next v1 1/2] package/ell: bump version to 0.35
Message-ID: <20201201223759.11147-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebased (and renumbered) 001-ell-rtnl-fix-compile-with-older-toolchains.patch

- drop dynamic library dependency as no longer needed since
  upstream commits [1] and [2]

- add two upstream patches to fix musl/uclibc compile

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e129cb4cd2270f308c1564e75859672643dd902b
[2] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=a4ac2cb0e14f564754f7e2067ac7dde0a9ab1914

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...l-fix-compile-with-older-toolchains.patch} | 20 ++++----
 ...002-build-Add-rawmemchr-to-missing.h.patch | 47 +++++++++++++++++++
 ...l-add-missing-include-in-dhcp-server.patch | 26 ++++++++++
 package/ell/Config.in                         |  6 +--
 package/ell/ell.hash                          |  2 +-
 package/ell/ell.mk                            |  2 +-
 6 files changed, 88 insertions(+), 15 deletions(-)
 rename package/ell/{0002-ell-rtnl-fix-compile-with-older-toolchains.patch => 0001-ell-rtnl-fix-compile-with-older-toolchains.patch} (84%)
 create mode 100644 package/ell/0002-build-Add-rawmemchr-to-missing.h.patch
 create mode 100644 package/ell/0003-ell-add-missing-include-in-dhcp-server.patch

diff --git a/package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch b/package/ell/0001-ell-rtnl-fix-compile-with-older-toolchains.patch
similarity index 84%
rename from package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch
rename to package/ell/0001-ell-rtnl-fix-compile-with-older-toolchains.patch
index ba6cafa7a8..0375be854c 100644
--- a/package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch
+++ b/package/ell/0001-ell-rtnl-fix-compile-with-older-toolchains.patch
@@ -1,4 +1,4 @@
-From 60b4cd4c703be380aef194d31a1ffc4b42431bde Mon Sep 17 00:00:00 2001
+From c4218f71352ae5e39692e030d9af2c665dbb2eee Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Thu, 9 Apr 2020 22:21:36 +0200
 Subject: [PATCH] ell/rtnl: fix compile with older toolchains
@@ -18,6 +18,7 @@ Fixes:
   ell/rtnl.c:120:8: error: 'RTA_PREF' undeclared (first use in this function)
 
 [Upstream: https://lists.ofono.org/hyperkitty/list/ell at lists.01.org/thread/TOJ5XEY7X6WMOMJHX4KWI5LFEOX2QTBQ]
+[Rebased for ell-0.35]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  configure.ac | 2 ++
@@ -25,10 +26,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0351f89..3be35a4 100644
+index 1e5ead9..bec472d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -113,6 +113,8 @@ AC_CHECK_LIB(dl, dlopen, dummy=yes,
+@@ -110,6 +110,8 @@ AC_CHECK_FUNC(epoll_create, dummy=yes,
  
  AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
  
@@ -38,23 +39,24 @@ index 0351f89..3be35a4 100644
  				[enable ell/glib main loop example]),
  					[enable_glib=${enableval}])
 diff --git a/ell/rtnl.c b/ell/rtnl.c
-index dc83937..3493d34 100644
+index c115573..ccfa6fe 100644
 --- a/ell/rtnl.c
 +++ b/ell/rtnl.c
-@@ -25,8 +25,9 @@
+@@ -25,9 +25,10 @@
  #endif
  
  #define _GNU_SOURCE
 -#include <linux/if.h>
 +#include <sys/types.h>
+ #include <linux/icmpv6.h>
  #include <sys/socket.h>
 +#include <linux/if.h>
  #include <arpa/inet.h>
  
  #include "util.h"
-@@ -35,6 +36,10 @@
- #include "rtnl.h"
- #include "private.h"
+@@ -524,6 +525,10 @@ LIB_EXPORT bool l_rtnl_route_set_scope(struct l_rtnl_route *rt, uint8_t scope)
+ 	return true;
+ }
  
 +#if defined HAVE_DECL_RTA_PREF && !HAVE_DECL_RTA_PREF
 +#define RTA_PREF 20
@@ -64,5 +66,5 @@ index dc83937..3493d34 100644
  {
  	struct rtattr *rta = rta_buf;
 -- 
-2.26.0
+2.29.2
 
diff --git a/package/ell/0002-build-Add-rawmemchr-to-missing.h.patch b/package/ell/0002-build-Add-rawmemchr-to-missing.h.patch
new file mode 100644
index 0000000000..3e00023001
--- /dev/null
+++ b/package/ell/0002-build-Add-rawmemchr-to-missing.h.patch
@@ -0,0 +1,47 @@
+From 3916c1cc32be205e185a8a56de5cde1b9ec60e81 Mon Sep 17 00:00:00 2001
+From: Denis Kenzior <denkenz@gmail.com>
+Date: Mon, 30 Nov 2020 13:00:11 -0600
+Subject: [PATCH] build: Add rawmemchr to missing.h
+
+For those systems (i.e. musl) that do not support this
+
+[Upstream: https://git.kernel.org/pub/scm/libs/ell/ell.git/patch/?id=3916c1cc32be205e185a8a56de5cde1b9ec60e81]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac  |  1 +
+ ell/missing.h | 10 ++++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 1e5ead9..f34add1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -98,6 +98,7 @@ AC_ARG_ENABLE(ubsan, AC_HELP_STRING([--enable-ubsan],
+ ])
+ 
+ AC_CHECK_FUNCS(explicit_bzero)
++AC_CHECK_FUNCS(rawmemchr)
+ 
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+diff --git a/ell/missing.h b/ell/missing.h
+index 6b9b0fd..2a3e647 100644
+--- a/ell/missing.h
++++ b/ell/missing.h
+@@ -67,3 +67,13 @@ static inline void explicit_bzero(void *s, size_t n)
+ #ifndef SO_BINDTOIFINDEX
+ #define SO_BINDTOIFINDEX 62
+ #endif
++
++#ifndef HAVE_RAWMEMCHR
++static inline void *rawmemchr(const void *s, int c)
++{
++_Pragma("GCC diagnostic push")
++_Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
++	return memchr(s, c, (size_t) -1);
++_Pragma("GCC diagnostic pop")
++}
++#endif
+-- 
+2.29.2
+
diff --git a/package/ell/0003-ell-add-missing-include-in-dhcp-server.patch b/package/ell/0003-ell-add-missing-include-in-dhcp-server.patch
new file mode 100644
index 0000000000..a2ac7b0965
--- /dev/null
+++ b/package/ell/0003-ell-add-missing-include-in-dhcp-server.patch
@@ -0,0 +1,26 @@
+From 6dfff19d4716ba216de1a3298ed0f667d7782810 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
+Date: Mon, 30 Nov 2020 18:40:33 -0300
+Subject: [PATCH] ell: add missing include in dhcp-server.
+
+[Upstream: https://git.kernel.org/pub/scm/libs/ell/ell.git/patch/?id=6dfff19d4716ba216de1a3298ed0f667d7782810]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ ell/dhcp-server.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c
+index c983ed4..144e83e 100644
+--- a/ell/dhcp-server.c
++++ b/ell/dhcp-server.c
+@@ -24,6 +24,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <linux/types.h>
+ #include <net/ethernet.h>
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
+-- 
+2.29.2
+
diff --git a/package/ell/Config.in b/package/ell/Config.in
index d337154878..c7c9164816 100644
--- a/package/ell/Config.in
+++ b/package/ell/Config.in
@@ -2,14 +2,12 @@ config BR2_PACKAGE_ELL
 	bool "ell"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
 	  Embedded Linux library (ell)
 
 	  https://01.org/ell
 
-comment "ell needs a toolchain w/ dynamic library, wchar, headers >= 4.12"
+comment "ell needs a toolchain w/ wchar, headers >= 4.12"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 43324e658d..b93c43a49d 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  fc3fd66739008fabf4b62f8bc1b37110cc44b9e8233c34f8d991939d0e0247b6  ell-0.33.tar.gz
+sha256  3f17aaaec2ad8eb8471ff2b18cc8d1bf48e55086bd95d22f327f06fde7c1c277  ell-0.35.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index f35c022503..8aec067bc0 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.33
+ELL_VERSION = 0.35
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.29.2
