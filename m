From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:44 -0000
Subject: [Buildroot] [git commit] package/socat: bump to version 1.7.3.3
Message-ID: <20190903133620.C4CB48A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ef3e072bdb1f9632a58406c1f7a80228a791a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop if_tun.h kernel header removal patch; current musl doesn't need it.

Don't disable termios_ispeed; commit 1c25119a9360 ("socat: convert to
AUTOTARGETS") disabled it for no apparent reason.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...004-xio-tun-remove-if_tun.h-kernel-header.patch | 91 ----------------------
 package/socat/socat.hash                           |  6 +-
 package/socat/socat.mk                             |  4 +-
 3 files changed, 4 insertions(+), 97 deletions(-)

diff --git a/package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch b/package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch
deleted file mode 100644
index 7704123f30..0000000000
--- a/package/socat/0004-xio-tun-remove-if_tun.h-kernel-header.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 1c141194e3587cc8124e5f4512dc3030e5a104b1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 28 Aug 2016 22:06:09 +0200
-Subject: [PATCH] xio-tun: remove if_tun.h kernel header
-
-xio-tun mixes userspace and kernel headers.
-
-http://wiki.musl-libc.org/wiki/FAQ#Q:_why_am_i_getting_.22error:_redefinition_of_struct_ethhdr.2Ftcphdr.2Fetc.22_.3F
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- config.h.in   | 3 ---
- configure.in  | 8 +-------
- sysincludes.h | 3 ---
- xio-tun.c     | 6 ++++++
- 4 files changed, 7 insertions(+), 13 deletions(-)
-
-diff --git a/config.h.in b/config.h.in
-index 9058bf8..ed0962c 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -258,9 +258,6 @@
- /* Define if you have the <linux/errqueue.h> header file.  */
- #undef HAVE_LINUX_ERRQUEUE_H
- 
--/* Define if you have the <linux/if_tun.h> header file.  */
--#undef HAVE_LINUX_IF_TUN_H
--
- /* Define if you have the <netpacket/packet.h> header file.  */
- #undef HAVE_NETPACKET_PACKET_H
- 
-diff --git a/configure.in b/configure.in
-index 1d2e76f..27bb3d5 100644
---- a/configure.in
-+++ b/configure.in
-@@ -78,7 +78,7 @@ AC_CHECK_HEADERS(arpa/nameser.h)
- 
- AC_HEADER_RESOLV()
- 
--AC_CHECK_HEADERS(termios.h linux/if_tun.h)
-+AC_CHECK_HEADERS(termios.h)
- AC_CHECK_HEADERS(net/if_dl.h)
- AC_CHECK_HEADERS(linux/types.h)
- AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <sys/time.h>
-@@ -680,12 +680,6 @@ AC_ARG_ENABLE(tun, [  --disable-tun           disable TUN/TAP support],
- 	       esac],
- 	       [AC_MSG_RESULT(yes);    WITH_TUN=1 ])
- 
--#
--if ! test "$ac_cv_header_linux_if_tun_h" = 'yes'; then
--  AC_MSG_WARN(include file linux/if_tun.h not found, disabling TUN)
--  WITH_TUN=
--fi
--#
- if test -n "$WITH_TUN"; then
-   AC_DEFINE(WITH_TUN)
- fi
-diff --git a/sysincludes.h b/sysincludes.h
-index 98dff77..28067f4 100644
---- a/sysincludes.h
-+++ b/sysincludes.h
-@@ -142,9 +142,6 @@
- #if HAVE_NETINET_IF_ETHER_H
- #include <netinet/if_ether.h>
- #endif
--#if HAVE_LINUX_IF_TUN_H
--#include <linux/if_tun.h>
--#endif
- 
- #if HAVE_TERMIOS_H && _WITH_TERMIOS
- #include <termios.h>
-diff --git a/xio-tun.c b/xio-tun.c
-index 0628d27..f965a7e 100644
---- a/xio-tun.c
-+++ b/xio-tun.c
-@@ -14,6 +14,12 @@
- 
- #include "xio-tun.h"
- 
-+/* TUNSETIFF flags from if_tun.h kernel header */
-+#define IFF_TUN		0x0001
-+#define IFF_TAP		0x0002
-+#define IFF_NO_PI	0x1000
-+
-+#define TUNSETIFF	_IOW('T', 202, int)
- 
- static int xioopen_tun(int argc, const char *argv[], struct opt *opts, int xioflags, xiofile_t *fd, unsigned groups, int dummy1, int dummy2, int dummy3);
- 
--- 
-2.5.5
-
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 77abcf29a9..92d62ab716 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,7 +1,7 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5	607a24c15bd2cb54e9328bfbbd3a1ae9	socat-1.7.3.2.tar.bz2
-# Calculated based on the hash above
-sha256	e3561f808739383eb10fada1e5d4f26883f0311b34fd0af7837d0c95ef379251	socat-1.7.3.2.tar.bz2
+md5	b2a032a47b8b89a18485697fa975154f	socat-1.7.3.3.tar.bz2
+# From http://www.dest-unreach.org/socat/download.sha256sum
+sha256	0dd63ffe498168a4aac41d307594c5076ff307aa0ac04b141f8f1cec6594d04a	socat-1.7.3.3.tar.bz2
 # Locally calculated
 sha256	4846488cea98a2905dc75b7aa5eea721568e372447efe06b85bd896ee8c54f10	README
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 5fea067d82..c6f99c2afa 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.3.2
+SOCAT_VERSION = 1.7.3.3
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
 SOCAT_LICENSE_FILES = README COPYING COPYING.OpenSSL
 
-SOCAT_CONF_ENV = sc_cv_termios_ispeed=no
-
 ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 SOCAT_CONF_ENV += \
 	sc_cv_sys_crdly_shift=12 \
