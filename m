From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Dec 2016 06:52:17 +0200
Subject: [Buildroot] [PATCH] musl: workaround kernel if_ether.h header
	conflict
Message-ID: <17c4ddc5aab7fdf5461d265a1602a13f6f291708.1481863937.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that defines _LINUX_IF_ETHER_H in netinet/if_ether.h to avoid the
conflicting kernel if_ether.h.

Other musl distros (Alpine, Sabotage, Gentoo) patch[1] the kernel headers
instead. This is not practical in Buildroot, since we allow the user to choose
the kernel version.

This only fixes the normal case of including linux/if_ether.h (directly or
indirectly) after netinet/if_ether.h.

Fixes (tcpreplay):
http://autobuild.buildroot.net/results/a65/a65b27f9e288f94f041ced64313dbf55af47bf36/

[1] https://cgit.gentoo.org/proj/musl.git/diff/sys-kernel/linux-headers/files/libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch?id=8eddda8072add075ebf56cf6d288bc1450d6b5f8

Cc: Rich Felker <dalias@aerifal.cx>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
This patch will take effect in the autobuilder after a rebuild of musl
toolchains.
---
 package/musl/0002-avoid-kernel-if_ether.h.patch | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/musl/0002-avoid-kernel-if_ether.h.patch

diff --git a/package/musl/0002-avoid-kernel-if_ether.h.patch b/package/musl/0002-avoid-kernel-if_ether.h.patch
new file mode 100644
index 000000000000..8efbcc845083
--- /dev/null
+++ b/package/musl/0002-avoid-kernel-if_ether.h.patch
@@ -0,0 +1,30 @@
+From 3984adc4976de7553f51e0cf4de1e18c373b332b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 15 Dec 2016 15:10:19 +0200
+Subject: [PATCH] Avoid redefinition of struct ethhdr
+
+This is a workaround to the if_ether.h conflict between musl and the kernel.
+Both define struct ethhdr.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ include/netinet/if_ether.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
+index 11ee65823f93..cfe1949d3371 100644
+--- a/include/netinet/if_ether.h
++++ b/include/netinet/if_ether.h
+@@ -1,6 +1,9 @@
+ #ifndef _NETINET_IF_ETHER_H
+ #define _NETINET_IF_ETHER_H
+ 
++/* Suppress kernel if_ether.h header inclusion */
++#define _LINUX_IF_ETHER_H
++
+ #include <stdint.h>
+ #include <sys/types.h>
+ 
+-- 
+2.10.2
+
-- 
2.10.2
