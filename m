From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 13:18:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: fix musl build
In-Reply-To: <1453637930-22647-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453637930-22647-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453637930-22647-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tcpreplay/0001-musl.patch           | 20 ++++++++++++++++++++
 package/tcpreplay/0002-musl-socklen_t.patch | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 package/tcpreplay/0001-musl.patch
 create mode 100644 package/tcpreplay/0002-musl-socklen_t.patch

diff --git a/package/tcpreplay/0001-musl.patch b/package/tcpreplay/0001-musl.patch
new file mode 100644
index 0000000..cf86719
--- /dev/null
+++ b/package/tcpreplay/0001-musl.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr tcpreplay-4.1.1.org/src/common/sendpacket.h tcpreplay-4.1.1/src/common/sendpacket.h
+--- tcpreplay-4.1.1.org/src/common/sendpacket.h	2015-12-30 23:01:48.000000000 +0100
++++ tcpreplay-4.1.1/src/common/sendpacket.h	2016-01-24 13:15:04.000000000 +0100
+@@ -23,12 +23,6 @@
+ 
+ #include <sys/socket.h>
+ 
+-#ifdef __NetBSD__
+-#include <net/if_ether.h>
+-#else
+-#include <netinet/if_ether.h>
+-#endif
+-
+ #ifdef HAVE_QUICK_TX
+ #include <linux/quick_tx.h>
+ #if defined (__x86_64__)
diff --git a/package/tcpreplay/0002-musl-socklen_t.patch b/package/tcpreplay/0002-musl-socklen_t.patch
new file mode 100644
index 0000000..db49dbc
--- /dev/null
+++ b/package/tcpreplay/0002-musl-socklen_t.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/testing/tcpreplay/musl-socklen_t.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- ./src/common/sendpacket.c.orig
++++ ./src/common/sendpacket.c
+@@ -166,10 +166,6 @@
+ #include "txring.h"
+ #endif
+ 
+-#ifndef __GLIBC__
+-typedef int socklen_t;
+-#endif
+-
+ static sendpacket_t *sendpacket_open_pf(const char *, char *);
+ static struct tcpr_ether_addr *sendpacket_get_hwaddr_pf(sendpacket_t *);
+ static int get_iface_index(int fd, const char *device, char *);
-- 
2.7.0.rc3
