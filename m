From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:50:59 +0200
Subject: [Buildroot] [git commit] connman: remove xtables build fix patch
Message-ID: <20160522205120.A774E81838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f5a1b3a5cae60d07c1497cd4aa2cf6d45f8257d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was added in 0dece985 to deal with kernel headers 4.5 -> 4.5.4
breakage. Unfortunately the fix in 4.5.5 and 4.6+ doesn't deal correctly
with this causing more build breakage, so we'd rather "break" for the
small range of 4.5.x versions broken than for the rest of time.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/0001-xtables.patch | 61 --------------------------------------
 1 file changed, 61 deletions(-)

diff --git a/package/connman/0001-xtables.patch b/package/connman/0001-xtables.patch
deleted file mode 100644
index 277fce6..0000000
--- a/package/connman/0001-xtables.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Use some preprocessor tricks to route around incompatibilies seen
-between newer Linux kernels and glibc when both net/if.h and linux/if.h
-are included in the same source.
-
-Patch from gentoo, see https://bugs.gentoo.org/show_bug.cgi?id=577584
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- connman-1.31/src/iptables.c.old	2016-03-22 20:12:47.829460752 -0700
-+++ connman-1.31/src/iptables.c	2016-03-22 21:33:36.835384724 -0700
-@@ -28,11 +28,11 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
- #include <sys/errno.h>
- #include <sys/socket.h>
--#include <xtables.h>
-+#include "connman_xtables.h"
- #include <inttypes.h>
- 
- #include <linux/netfilter_ipv4/ip_tables.h>
- 
- #include "connman.h"
---- connman-1.31/src/firewall.c.old	2016-03-22 21:29:01.959472262 -0700
-+++ connman-1.31/src/firewall.c	2016-03-22 21:33:53.048144181 -0700
-@@ -23,11 +23,11 @@
- #include <config.h>
- #endif
- 
- #include <errno.h>
- 
--#include <xtables.h>
-+#include "connman_xtables.h"
- #include <linux/netfilter_ipv4/ip_tables.h>
- 
- #include "connman.h"
- 
- #define CHAIN_PREFIX "connman-"
---- /dev/null	2016-03-18 06:21:16.372989086 -0700
-+++ connman-1.31/include/connman_xtables.h	2016-03-22 21:32:21.349504786 -0700
-@@ -0,0 +1,20 @@
-+#ifndef CONNMAN_XTABLES_H
-+#define CONNMAN_XTABLES_H
-+
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0)
-+#include <xtables.h>
-+#else
-+#ifdef __USE_MISC
-+#define GENTOO_USE_MISC __USE_MISC
-+#undef __USE_MISC
-+#endif
-+
-+#include <xtables.h>
-+
-+#ifdef GENTOO_USE_MISC
-+#define __USE_MISC GENTOO_USE_MISC
-+#undef GENTOO_USE_MISC
-+#endif
-+#endif
-+#endif
