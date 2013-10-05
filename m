From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Oct 2013 16:16:14 +0200
Subject: [Buildroot] [PATCH 5/5] busybox: add patches to fix build with the
	musl C library
In-Reply-To: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1380982574-16628-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those patches have been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-libbb-use-poll.h-instead-of-sys-poll.h.patch | 32 +++++++++++++++++++
 ...onfig-include-linux-if_slip.h-instead-of-.patch | 33 ++++++++++++++++++++
 ...libiproute-use-linux-if_packet.h-instead-.patch | 36 ++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
 create mode 100644 package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch

diff --git a/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch b/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000..089d858
--- /dev/null
+++ b/package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,32 @@
+From 676452a92d1fc4f85e8d89930d7729197c031026 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 5 Oct 2013 15:51:56 +0200
+Subject: [PATCH 1/3] libbb: use <poll.h> instead of <sys/poll.h>
+
+As the pol() manpage recommends, include the <poll.h> header instead
+of <sys/poll.h>. This allows to get rid of gazillions of warnings when
+building Busybox against the musl C library, which prints a warning
+when the internal header <sys/poll.h> is included directly instead of
+the <poll.h> header.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/libbb.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libbb.h b/include/libbb.h
+index e520060..f03f454 100644
+--- a/include/libbb.h
++++ b/include/libbb.h
+@@ -37,7 +37,7 @@
+ #include <libgen.h> /* dirname,basename */
+ #undef basename
+ #define basename dont_use_basename
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <sys/socket.h>
+-- 
+1.8.1.2
+
diff --git a/package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch b/package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
new file mode 100644
index 0000000..ed35719
--- /dev/null
+++ b/package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
@@ -0,0 +1,33 @@
+From 5eae213031a3ef88fe8d9d0a387f44264ea635cc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 5 Oct 2013 15:53:16 +0200
+Subject: [PATCH 2/3] network/ifconfig: include <linux/if_slip.h> instead of
+ <net/if_slip.h>
+
+The musl C library doesn't provide the <net/if_slip.h> since userspace
+applications can just as well use the <linux/if_slip.h> kernel header.
+
+This commit fixes the build of the ifconfig applet with the musl C
+library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ networking/ifconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/ifconfig.c b/networking/ifconfig.c
+index 782374b..c90ed6b 100644
+--- a/networking/ifconfig.c
++++ b/networking/ifconfig.c
+@@ -56,7 +56,7 @@
+ #endif
+ 
+ #if ENABLE_FEATURE_IFCONFIG_SLIP
+-# include <net/if_slip.h>
++# include <linux/if_slip.h>
+ #endif
+ 
+ /* I don't know if this is needed for busybox or not.  Anyone? */
+-- 
+1.8.1.2
+
diff --git a/package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch b/package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch
new file mode 100644
index 0000000..7b74656
--- /dev/null
+++ b/package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch
@@ -0,0 +1,36 @@
+From d4fec31889ad660a58dab633c511221feb66e817 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 5 Oct 2013 15:55:06 +0200
+Subject: [PATCH 3/3] networking/libiproute: use <linux/if_packet.h> instead of
+ <net/if_packet.h>
+
+The musl C library doesn't provide the <net/if_packet.h> since the
+corresponding kernel headers <linux/if_packet.h> already provides the
+necessary definitions. Replacing <net/if_packet.h> by
+<linux/if_packet.h> also removes the need to include
+<netpacket/packet.h>
+
+This commit fixes the build of iplink with the musl C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ networking/libiproute/iplink.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/networking/libiproute/iplink.c b/networking/libiproute/iplink.c
+index bad2017..32ccb1c 100644
+--- a/networking/libiproute/iplink.c
++++ b/networking/libiproute/iplink.c
+@@ -5,8 +5,7 @@
+  * Licensed under GPLv2 or later, see file LICENSE in this source tree.
+  */
+ #include <net/if.h>
+-#include <net/if_packet.h>
+-#include <netpacket/packet.h>
++#include <linux/if_packet.h>
+ #include <netinet/if_ether.h>
+ 
+ #include "ip_common.h"  /* #include "libbb.h" is inside */
+-- 
+1.8.1.2
+
-- 
1.8.1.2
