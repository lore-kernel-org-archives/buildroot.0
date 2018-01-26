From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 13:39:54 +0100
Subject: [Buildroot] [git commit] netsniff-ng: bump to version 0.6.4
Message-ID: <20180126124345.5F6BF83C7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb5bb052c60d9ade0e6c4f953edd45820667ae0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches merged upstream.

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-PKG_CONFIG-into-account-for-libnetfilte.patch | 43 ---------------
 .../0002-proc.h-add-missing-headers.patch          | 44 ---------------
 ...ix-if_arp.h-musl-libc-kernel-headers-conf.patch | 62 ----------------------
 ...0004-staging-compilation-fix-with-new-gcc.patch | 31 -----------
 package/netsniff-ng/netsniff-ng.hash               |  2 +-
 package/netsniff-ng/netsniff-ng.mk                 |  2 +-
 6 files changed, 2 insertions(+), 182 deletions(-)

diff --git a/package/netsniff-ng/0001-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch b/package/netsniff-ng/0001-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
deleted file mode 100644
index bd7619b..0000000
--- a/package/netsniff-ng/0001-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2d38d16d86db941fcb4d4fb8ad761e7e163c01e5 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 16 Apr 2017 07:41:38 +0300
-Subject: [PATCH] flowtop: take PKG_CONFIG into account for
- libnetfilter_conntrack
-
-Use $PKG_CONFIG to determine the linker flags for libnetfilter_conntrack. This
-fixes static link failure like the following:
-
-  LD	flowtop
-.../usr/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libnetfilter_conntrack.a(main.o): In function `nfct_open_nfnl':
-main.c:(.text+0x52): undefined reference to `nfnl_subsys_open'
-main.c:(.text+0x69): undefined reference to `nfnl_subsys_close'
-main.c:(.text+0x87): undefined reference to `nfnl_subsys_open'
-main.c:(.text+0xa3): undefined reference to `nfnl_subsys_close'
-.../usr/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libnetfilter_conntrack.a(main.o): In function `nfct_open':
-main.c:(.text+0xc9): undefined reference to `nfnl_open'
-main.c:(.text+0xf0): undefined reference to `nfnl_close'
-...
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-Patch status: sent upstream
-http://www.mail-archive.com/netsniff-ng%40googlegroups.com/msg01971.html
-
- flowtop/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/flowtop/Makefile b/flowtop/Makefile
-index effe7eb33fc3..e001ce8aaf13 100644
---- a/flowtop/Makefile
-+++ b/flowtop/Makefile
-@@ -1,5 +1,5 @@
- flowtop-libs =	-lurcu \
--		-lnetfilter_conntrack \
-+		$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libnetfilter_conntrack 2> /dev/null ) \
- 		$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs ncurses 2> /dev/null \
- 			|| echo '-lncurses') \
- 		$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs tinfo 2> /dev/null ) \
--- 
-2.11.0
-
diff --git a/package/netsniff-ng/0002-proc.h-add-missing-headers.patch b/package/netsniff-ng/0002-proc.h-add-missing-headers.patch
deleted file mode 100644
index 6968445..0000000
--- a/package/netsniff-ng/0002-proc.h-add-missing-headers.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 28773ac06d0e0f00d6a56973eacae4f5df9e8cc2 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 16 Apr 2017 08:11:20 +0300
-Subject: [PATCH] proc.h: add missing headers
-
-ino_t and pid_t require stat.h and types.h, respectively. Fixes the following
-build failure with musl libc:
-
-In file included from cpp.c:7:0:
-proc.h:11:31: error: unknown type name ???ino_t???
- extern int proc_find_by_inode(ino_t ino, char *cmdline, size_t len, pid_t *pid);
-                               ^
-proc.h:11:69: error: unknown type name ???pid_t???
- extern int proc_find_by_inode(ino_t ino, char *cmdline, size_t len, pid_t *pid);
-                                                                     ^
-proc.h:12:25: error: unknown type name ???pid_t???
- extern bool proc_exists(pid_t pid);
-                         ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-Patch status: sent upstream
-http://www.mail-archive.com/netsniff-ng%40googlegroups.com/msg01972.html
-
- proc.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/proc.h b/proc.h
-index 4c34a6412a81..2ce0c6e7a932 100644
---- a/proc.h
-+++ b/proc.h
-@@ -2,6 +2,8 @@
- #define PROC_H
- 
- #include <stdbool.h>
-+#include <sys/stat.h>
-+#include <sys/types.h>
- 
- extern void cpu_affinity(int cpu);
- extern int set_proc_prio(int prio);
--- 
-2.11.0
-
diff --git a/package/netsniff-ng/0003-pcap_io.h-fix-if_arp.h-musl-libc-kernel-headers-conf.patch b/package/netsniff-ng/0003-pcap_io.h-fix-if_arp.h-musl-libc-kernel-headers-conf.patch
deleted file mode 100644
index 23b0284..0000000
--- a/package/netsniff-ng/0003-pcap_io.h-fix-if_arp.h-musl-libc-kernel-headers-conf.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From f937049ea82ac74635861b3a780d1372f681cc6b Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 16 Apr 2017 08:18:10 +0300
-Subject: [PATCH] pcap_io.h: fix if_arp.h musl libc/kernel headers conflict
-
-Use libc provided arp definitions to avoid build failure with musl libc:
-
-In file included from pcap_io.h:19:0,
-                 from trafgen.c:59:
-.../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_arp.h:113:8: error: redefinition of ???struct arpreq???
- struct arpreq {
-        ^
-In file included from .../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:111:0,
-                 from .../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/net/ethernet.h:10,
-                 from trafgen.c:23:
-.../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/net/if_arp.h:99:8: note: originally defined here
- struct arpreq {
-        ^
-
-Add a local definition of the ARPHRD_CAN macro that glibc does not provide.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-Patch status: sent upstream
-http://www.mail-archive.com/netsniff-ng%40googlegroups.com/msg01974.html
-
- built_in.h | 4 ++++
- pcap_io.h  | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/built_in.h b/built_in.h
-index d10579abd689..fa8af60d6029 100644
---- a/built_in.h
-+++ b/built_in.h
-@@ -382,6 +382,10 @@ static inline u64 cpu_to_le64(u64 val)
- # define PACKET_QDISC_BYPASS 20
- #endif
- 
-+#ifndef ARPHRD_CAN
-+# define ARPHRD_CAN			280
-+#endif
-+
- #ifndef ARPHRD_IEEE802154_MONITOR
- # define ARPHRD_IEEE802154_MONITOR	805
- #endif
-diff --git a/pcap_io.h b/pcap_io.h
-index 3d70b217ada6..088858e89ccd 100644
---- a/pcap_io.h
-+++ b/pcap_io.h
-@@ -16,7 +16,7 @@
- #include <sys/socket.h>
- #include <linux/if.h>
- #include <linux/if_packet.h>
--#include <linux/if_arp.h>
-+#include <net/if_arp.h>
- 
- #include "built_in.h"
- #include "die.h"
--- 
-2.11.0
-
diff --git a/package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch b/package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch
deleted file mode 100644
index fce604e..0000000
--- a/package/netsniff-ng/0004-staging-compilation-fix-with-new-gcc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 551aa0ee996132e443b5d12cbb6f114ac9aabcd3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
-Date: Mon, 3 Jul 2017 18:24:32 +0200
-Subject: [PATCH] staging: compilation fix with new gcc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Jaroslav ??karvada <jskarvad@redhat.com>
-
-Upstream patch 551aa0ee996132e443b5d12cbb6f114ac9aabcd3
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- staging/mz.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/staging/mz.h b/staging/mz.h
-index 5ed05a7..aa2c36f 100644
---- a/staging/mz.h
-+++ b/staging/mz.h
-@@ -40,6 +40,7 @@
- #include <netinet/in.h>
- #include <stdarg.h>
- #include <math.h>
-+#include <stdint.h>
- 
- extern int verbose_level;
- 
--- 
-2.9.5
-
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index fea2dad..576e000 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 f8e0094f77de8a70f91240bfa77137d5631ac48138cb29fcf962c0bcbe81f04a netsniff-ng-0.6.3.tar.xz
+sha256 fd67150e0954b7079b6d0c72fb0ef1f34091357ad559b45c68e8752376bdc307 netsniff-ng-0.6.4.tar.xz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 73c840c..fb1c2c7 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.3
+NETSNIFF_NG_VERSION = 0.6.4
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
