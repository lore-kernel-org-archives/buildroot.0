From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:55:16 +0200
Subject: [Buildroot] [git commit] connman: add patch to fix build with
	headers >= 4.5
Message-ID: <20160415075521.EDB3B7FB79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dece9857860f48cce75720d441d7c5fcff8c6a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from Gentoo that fixes the build on linux headers >= 4.5
The probem arises from an incompatibility in newer headers when both
net/if.h and linux/if.h are included in the same source.
See https://bugs.gentoo.org/show_bug.cgi?id=577584

Fixes:
http://autobuild.buildroot.net/results/48e/48e6f34a7940f52d987db47784c0d9e82f39de7c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/0003-xtables.patch | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/connman/0003-xtables.patch b/package/connman/0003-xtables.patch
new file mode 100644
index 0000000..277fce6
--- /dev/null
+++ b/package/connman/0003-xtables.patch
@@ -0,0 +1,61 @@
+Use some preprocessor tricks to route around incompatibilies seen
+between newer Linux kernels and glibc when both net/if.h and linux/if.h
+are included in the same source.
+
+Patch from gentoo, see https://bugs.gentoo.org/show_bug.cgi?id=577584
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- connman-1.31/src/iptables.c.old	2016-03-22 20:12:47.829460752 -0700
++++ connman-1.31/src/iptables.c	2016-03-22 21:33:36.835384724 -0700
+@@ -28,11 +28,11 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/errno.h>
+ #include <sys/socket.h>
+-#include <xtables.h>
++#include "connman_xtables.h"
+ #include <inttypes.h>
+ 
+ #include <linux/netfilter_ipv4/ip_tables.h>
+ 
+ #include "connman.h"
+--- connman-1.31/src/firewall.c.old	2016-03-22 21:29:01.959472262 -0700
++++ connman-1.31/src/firewall.c	2016-03-22 21:33:53.048144181 -0700
+@@ -23,11 +23,11 @@
+ #include <config.h>
+ #endif
+ 
+ #include <errno.h>
+ 
+-#include <xtables.h>
++#include "connman_xtables.h"
+ #include <linux/netfilter_ipv4/ip_tables.h>
+ 
+ #include "connman.h"
+ 
+ #define CHAIN_PREFIX "connman-"
+--- /dev/null	2016-03-18 06:21:16.372989086 -0700
++++ connman-1.31/include/connman_xtables.h	2016-03-22 21:32:21.349504786 -0700
+@@ -0,0 +1,20 @@
++#ifndef CONNMAN_XTABLES_H
++#define CONNMAN_XTABLES_H
++
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0)
++#include <xtables.h>
++#else
++#ifdef __USE_MISC
++#define GENTOO_USE_MISC __USE_MISC
++#undef __USE_MISC
++#endif
++
++#include <xtables.h>
++
++#ifdef GENTOO_USE_MISC
++#define __USE_MISC GENTOO_USE_MISC
++#undef GENTOO_USE_MISC
++#endif
++#endif
++#endif
