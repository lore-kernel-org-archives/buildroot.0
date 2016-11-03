From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Nov 2016 07:53:50 +0200
Subject: [Buildroot] [PATCH] bridge-utils: fix build with musl
Message-ID: <0b4d1e33355f00f915768a2bc3f5c4d997206731.1478152430.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply a patch that removes direct include of kernel headers to avoid conflict
of definitions.

Fixes:
http://autobuild.buildroot.net/results/4aa/4aaeca4f1fca1794b039d7255a1828ff724f2234/
http://autobuild.buildroot.net/results/b48/b48a70137a4a568b31337f899fd21d05552db5e2/
http://autobuild.buildroot.net/results/bff/bff5767fc7e821a7674ee022111db84e4a9449d0/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
In a discussion of this issue on the musl list last year Rich Felker
suggested[1] the following hack for fixing the widespread musl issue with
packages using kernel headers:

 --- usr/include/linux/libc-compat.h-orig	2016-11-03 07:25:09.853807823 +0200
 +++ usr/include/linux/libc-compat.h	2016-11-03 07:25:49.602834223 +0200
 @@ -49,7 +49,7 @@
  #define _LIBC_COMPAT_H

  /* We have included glibc headers... */
 -#if defined(__GLIBC__)
 +#if 1

  /* Coordinate with glibc net/if.h header. */
  #if defined(_NET_IF_H) && defined(__USE_MISC)

I verified that it fixes this build failure. What do you think of that as a
temporary measure until musl finds a better solution[2]?

[1] http://www.openwall.com/lists/musl/2015/10/08/2
[2] http://www.openwall.com/lists/musl/2016/10/18/1
---
 ...ridge-fix-headers-conflict-with-musl-libc.patch | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 package/bridge-utils/0002-libbridge-fix-headers-conflict-with-musl-libc.patch

diff --git a/package/bridge-utils/0002-libbridge-fix-headers-conflict-with-musl-libc.patch b/package/bridge-utils/0002-libbridge-fix-headers-conflict-with-musl-libc.patch
new file mode 100644
index 000000000000..fd7f45ed4e03
--- /dev/null
+++ b/package/bridge-utils/0002-libbridge-fix-headers-conflict-with-musl-libc.patch
@@ -0,0 +1,140 @@
+From 24e5409190820a14e4d097924b1acaab62bb3b99 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 30 Oct 2016 18:12:00 +0200
+Subject: [PATCH] libbridge: fix headers conflict with musl libc
+
+Don't including kernel headers directly to avoid headers conflict like:
+
+In file included from .../sysroot/usr/include/linux/if_bridge.h:18:0,
+                 from libbridge.h:26,
+                 from libbridge_if.c:26:
+.../sysroot/usr/include/linux/in6.h:32:8: error: redefinition of ?struct in6_addr?
+ struct in6_addr {
+        ^
+In file included from libbridge.h:24:0,
+                 from libbridge_if.c:26:
+.../sysroot/usr/include/netinet/in.h:23:8: note: originally defined here
+ struct in6_addr {
+        ^
+
+Instead copy the required linux/if_bridge.h definitions into
+libbridge_private.h.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: Nacked
+(https://lists.linuxfoundation.org/pipermail/bridge/2016-November/010107.html)
+---
+ libbridge/libbridge.h         |  1 -
+ libbridge/libbridge_private.h | 83 ++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 82 insertions(+), 2 deletions(-)
+
+diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
+index ff047f933cd6..18b40cd90413 100644
+--- a/libbridge/libbridge.h
++++ b/libbridge/libbridge.h
+@@ -23,7 +23,6 @@
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_bridge.h>
+ 
+ /* defined in net/if.h but that conflicts with linux/if.h... */
+ extern unsigned int if_nametoindex (const char *__ifname);
+diff --git a/libbridge/libbridge_private.h b/libbridge/libbridge_private.h
+index 99a511dae00a..565025b7bccb 100644
+--- a/libbridge/libbridge_private.h
++++ b/libbridge/libbridge_private.h
+@@ -24,7 +24,88 @@
+ #include <linux/sockios.h>
+ #include <sys/time.h>
+ #include <sys/ioctl.h>
+-#include <linux/if_bridge.h>
++
++/* From linux/if_ether.h */
++#ifndef ETH_ALEN
++#define ETH_ALEN	6
++#endif
++
++/* From linux/if_bridge.h */
++#ifndef BRCTL_GET_VERSION
++#define BRCTL_GET_VERSION 0
++#define BRCTL_GET_BRIDGES 1
++#define BRCTL_ADD_BRIDGE 2
++#define BRCTL_DEL_BRIDGE 3
++#define BRCTL_ADD_IF 4
++#define BRCTL_DEL_IF 5
++#define BRCTL_GET_BRIDGE_INFO 6
++#define BRCTL_GET_PORT_LIST 7
++#define BRCTL_SET_BRIDGE_FORWARD_DELAY 8
++#define BRCTL_SET_BRIDGE_HELLO_TIME 9
++#define BRCTL_SET_BRIDGE_MAX_AGE 10
++#define BRCTL_SET_AGEING_TIME 11
++#define BRCTL_SET_GC_INTERVAL 12
++#define BRCTL_GET_PORT_INFO 13
++#define BRCTL_SET_BRIDGE_STP_STATE 14
++#define BRCTL_SET_BRIDGE_PRIORITY 15
++#define BRCTL_SET_PORT_PRIORITY 16
++#define BRCTL_SET_PATH_COST 17
++#define BRCTL_GET_FDB_ENTRIES 18
++
++#define BR_STATE_DISABLED 0
++#define BR_STATE_LISTENING 1
++#define BR_STATE_LEARNING 2
++#define BR_STATE_FORWARDING 3
++#define BR_STATE_BLOCKING 4
++
++struct __bridge_info {
++	__u64 designated_root;
++	__u64 bridge_id;
++	__u32 root_path_cost;
++	__u32 max_age;
++	__u32 hello_time;
++	__u32 forward_delay;
++	__u32 bridge_max_age;
++	__u32 bridge_hello_time;
++	__u32 bridge_forward_delay;
++	__u8 topology_change;
++	__u8 topology_change_detected;
++	__u8 root_port;
++	__u8 stp_enabled;
++	__u32 ageing_time;
++	__u32 gc_interval;
++	__u32 hello_timer_value;
++	__u32 tcn_timer_value;
++	__u32 topology_change_timer_value;
++	__u32 gc_timer_value;
++};
++
++struct __port_info {
++	__u64 designated_root;
++	__u64 designated_bridge;
++	__u16 port_id;
++	__u16 designated_port;
++	__u32 path_cost;
++	__u32 designated_cost;
++	__u8 state;
++	__u8 top_change_ack;
++	__u8 config_pending;
++	__u8 unused0;
++	__u32 message_age_timer_value;
++	__u32 forward_delay_timer_value;
++	__u32 hold_timer_value;
++};
++
++struct __fdb_entry {
++	__u8 mac_addr[ETH_ALEN];
++	__u8 port_no;
++	__u8 is_local;
++	__u32 ageing_timer_value;
++	__u8 port_hi;
++	__u8 pad0;
++	__u16 unused;
++};
++#endif /* BRCTL_GET_VERSION */
+ 
+ #define MAX_BRIDGES	1024
+ #define MAX_PORTS	1024
+-- 
+2.10.1
+
-- 
2.10.1
