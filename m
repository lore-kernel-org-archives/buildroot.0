From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Aug 2016 23:39:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/kismet: remove kernel header
In-Reply-To: <1471642793-12953-1-git-send-email-romain.naour@gmail.com>
References: <1471642793-12953-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1471642793-12953-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dumpfile_tuntap.h mixes userspace and kernel headers.

Fixes:
http://autobuild.buildroot.net/results/8a3/8a3e2ba9e0a698d25e1fc8684784e8ba9a5d2e80

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...ntap-don-t-include-linux-if_tun.h-kernel-.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch

diff --git a/package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch b/package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch
new file mode 100644
index 0000000..be69434
--- /dev/null
+++ b/package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch
@@ -0,0 +1,51 @@
+From 1466cbbdef835634366b2eb3a284fdff5833338c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 19 Aug 2016 23:30:06 +0200
+Subject: [PATCH] dumpfile_tuntap: don't include linux/if_tun.h kernel header
+
+dumpfile_tuntap.h mixes userspace and kernel headers.
+
+As suggested in the musl wiki [1], remove the linux/include directives
+and copy the required definitions.
+
+[1] http://wiki.musl-libc.org/wiki/FAQ
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ dumpfile_tuntap.h | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/dumpfile_tuntap.h b/dumpfile_tuntap.h
+index 37f50b6..8b23a2a 100644
+--- a/dumpfile_tuntap.h
++++ b/dumpfile_tuntap.h
+@@ -64,17 +64,18 @@
+ #include "packetchain.h"
+ #include "dumpfile.h"
+ 
+-#ifdef SYS_LINUX 
+-#include <linux/if_tun.h>
++#ifdef SYS_LINUX
++/* TUNSETIFF ifr flags */
++#define IFF_TUN		0x0001
++#define IFF_TAP		0x0002
++#define IFF_NO_PI	0x1000
+ 
+ // Linux IEEE80211 link typ to set
+ #define LNX_LINKTYPE_80211		801
+-// If the system headers don't have the TUNSETLINK ioctl, define it here,
+-// and we'll figure it out at runtime
+-#ifndef TUNSETLINK
+-#define TUNSETLINK				_IOW('T', 205, int)
+-#endif
+-
++/* Ioctl defines */
++#define TUNSETNOCSUM	_IOW('T', 200, int)
++#define TUNSETIFF		_IOW('T', 202, int)
++#define TUNSETLINK		_IOW('T', 205, int)
+ #endif
+ 
+ struct ipc_dft_open {
+-- 
+2.5.5
+
-- 
2.5.5
