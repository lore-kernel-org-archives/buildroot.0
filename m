From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:04:52 +0200
Subject: [Buildroot] [git commit] package/socat: fix build issue
Message-ID: <20160920190507.E4B8B819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec1cbd8ea74d5dd039f7787abbac07cdce0edf9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix two build issue when socat is build with musl:
  - Set NETDB_INTERNAL locally since it's not provided by musl
  - remove if_tun.h kernel header

Fixes:
http://autobuild.buildroot.net/results/029/02977d3844ef62b1e9cbfbab244593632757c5e2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/socat/0003-compat-set-NETDB_INTERNAL.patch | 35 +++++++++
 ...004-xio-tun-remove-if_tun.h-kernel-header.patch | 91 ++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/package/socat/0003-compat-set-NETDB_INTERNAL.patch b/package/socat/0003-compat-set-NETDB_INTERNAL.patch
new file mode 100644
index 0000000..da31073
--- /dev/null
+++ b/package/socat/0003-compat-set-NETDB_INTERNAL.patch
@@ -0,0 +1,35 @@
+From e7804d1750652e39c7a5803d360b29b2637a695f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2016 21:04:01 +0200
+Subject: [PATCH] compat: set NETDB_INTERNAL
+
+Musl doesn't provide NETDB_INTERNAL which is defined in resolv/netdb.h
+in Glibc [1].
+
+Set NETDB_INTERNAL to -1 locally if not already defined.
+Based on [2].
+
+[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=resolv/netdb.h;h=3aba530932c7a62a4f23e3193e9186da677f552b;hb=fdfc9260b61d3d72541f18104d24c7bcb0ce5ca2#l74
+[2] http://git.alpinelinux.org/cgit/aports/tree/main/socat/netdb-internal.patch?id=5a45173b50892cb634197c30b3506ebff98d3b7d
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ compat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/compat.h b/compat.h
+index 19a929f..4f5ee6d 100644
+--- a/compat.h
++++ b/compat.h
+@@ -666,6 +666,8 @@ typedef int sig_atomic_t;
+ 
+ #if !defined(NETDB_INTERNAL) && defined(h_NETDB_INTERNAL)
+ #  define NETDB_INTERNAL h_NETDB_INTERNAL
++#elif !defined(NETDB_INTERNAL)
++#  define NETDB_INTERNAL (-1)
+ #endif
+ 
+ #ifndef INET_ADDRSTRLEN
+-- 
+2.5.5
+
diff --git a/package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch b/package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch
new file mode 100644
index 0000000..7704123
--- /dev/null
+++ b/package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch
@@ -0,0 +1,91 @@
+From 1c141194e3587cc8124e5f4512dc3030e5a104b1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2016 22:06:09 +0200
+Subject: [PATCH] xio-tun: remove if_tun.h kernel header
+
+xio-tun mixes userspace and kernel headers.
+
+http://wiki.musl-libc.org/wiki/FAQ#Q:_why_am_i_getting_.22error:_redefinition_of_struct_ethhdr.2Ftcphdr.2Fetc.22_.3F
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ config.h.in   | 3 ---
+ configure.in  | 8 +-------
+ sysincludes.h | 3 ---
+ xio-tun.c     | 6 ++++++
+ 4 files changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/config.h.in b/config.h.in
+index 9058bf8..ed0962c 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -258,9 +258,6 @@
+ /* Define if you have the <linux/errqueue.h> header file.  */
+ #undef HAVE_LINUX_ERRQUEUE_H
+ 
+-/* Define if you have the <linux/if_tun.h> header file.  */
+-#undef HAVE_LINUX_IF_TUN_H
+-
+ /* Define if you have the <netpacket/packet.h> header file.  */
+ #undef HAVE_NETPACKET_PACKET_H
+ 
+diff --git a/configure.in b/configure.in
+index 1d2e76f..27bb3d5 100644
+--- a/configure.in
++++ b/configure.in
+@@ -78,7 +78,7 @@ AC_CHECK_HEADERS(arpa/nameser.h)
+ 
+ AC_HEADER_RESOLV()
+ 
+-AC_CHECK_HEADERS(termios.h linux/if_tun.h)
++AC_CHECK_HEADERS(termios.h)
+ AC_CHECK_HEADERS(net/if_dl.h)
+ AC_CHECK_HEADERS(linux/types.h)
+ AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <sys/time.h>
+@@ -680,12 +680,6 @@ AC_ARG_ENABLE(tun, [  --disable-tun           disable TUN/TAP support],
+ 	       esac],
+ 	       [AC_MSG_RESULT(yes);    WITH_TUN=1 ])
+ 
+-#
+-if ! test "$ac_cv_header_linux_if_tun_h" = 'yes'; then
+-  AC_MSG_WARN(include file linux/if_tun.h not found, disabling TUN)
+-  WITH_TUN=
+-fi
+-#
+ if test -n "$WITH_TUN"; then
+   AC_DEFINE(WITH_TUN)
+ fi
+diff --git a/sysincludes.h b/sysincludes.h
+index 98dff77..28067f4 100644
+--- a/sysincludes.h
++++ b/sysincludes.h
+@@ -142,9 +142,6 @@
+ #if HAVE_NETINET_IF_ETHER_H
+ #include <netinet/if_ether.h>
+ #endif
+-#if HAVE_LINUX_IF_TUN_H
+-#include <linux/if_tun.h>
+-#endif
+ 
+ #if HAVE_TERMIOS_H && _WITH_TERMIOS
+ #include <termios.h>
+diff --git a/xio-tun.c b/xio-tun.c
+index 0628d27..f965a7e 100644
+--- a/xio-tun.c
++++ b/xio-tun.c
+@@ -14,6 +14,12 @@
+ 
+ #include "xio-tun.h"
+ 
++/* TUNSETIFF flags from if_tun.h kernel header */
++#define IFF_TUN		0x0001
++#define IFF_TAP		0x0002
++#define IFF_NO_PI	0x1000
++
++#define TUNSETIFF	_IOW('T', 202, int)
+ 
+ static int xioopen_tun(int argc, const char *argv[], struct opt *opts, int xioflags, xiofile_t *fd, unsigned groups, int dummy1, int dummy2, int dummy3);
+ 
+-- 
+2.5.5
+
