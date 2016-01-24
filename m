From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 12:58:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/socat: fix musl build
Message-ID: <1453636704-20771-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d6e/d6e6f42450c8ad2c54b61d0950b6823f18628bc6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/socat/0002-musl.patch           | 18 ++++++++++++++++++
 package/socat/0003-netdb-internal.patch | 20 ++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 package/socat/0002-musl.patch
 create mode 100644 package/socat/0003-netdb-internal.patch

diff --git a/package/socat/0002-musl.patch b/package/socat/0002-musl.patch
new file mode 100644
index 0000000..f2b368d
--- /dev/null
+++ b/package/socat/0002-musl.patch
@@ -0,0 +1,18 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/socat/use-linux-headers.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- socat-1.7.2.4.orig/sysincludes.h
++++ socat-1.7.2.4/sysincludes.h
+@@ -134,7 +134,7 @@
+ #include <netpacket/packet.h>
+ #endif
+ #if HAVE_NETINET_IF_ETHER_H
+-#include <netinet/if_ether.h>
++#include <linux/if_ether.h>
+ #endif
+ #if HAVE_LINUX_IF_TUN_H
+ #include <linux/if_tun.h>
diff --git a/package/socat/0003-netdb-internal.patch b/package/socat/0003-netdb-internal.patch
new file mode 100644
index 0000000..44bd65f
--- /dev/null
+++ b/package/socat/0003-netdb-internal.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/socat/netdb-internal.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- socat-1.7.2.4.orig/compat.h
++++ socat-1.7.2.4/compat.h
+@@ -656,6 +656,10 @@
+ #  define NETDB_INTERNAL h_NETDB_INTERNAL
+ #endif
+ 
++#if !defined(NETDB_INTERNAL)
++#  define NETDB_INTERNAL (-1)
++#endif
++
+ #ifndef INET_ADDRSTRLEN
+ #  define INET_ADDRSTRLEN sizeof(struct sockaddr_in)
+ #endif
-- 
2.7.0.rc3
