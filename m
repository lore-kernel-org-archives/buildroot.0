From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:30:09 +0200
Subject: [Buildroot] [git commit] netsniff-ng: bump to version 0.6.3
Message-ID: <20170420213014.3AE87821EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9e224a9702f921948595b8bf063166fcc61819e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Add two more patches to deal with musl build issues.

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-PKG_CONFIG-into-account-for-libnetfilte.patch} |  0
 ...-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch | 48 -----------------
 .../0002-proc.h-add-missing-headers.patch          | 44 +++++++++++++++
 ...ix-if_arp.h-musl-libc-kernel-headers-conf.patch | 62 ++++++++++++++++++++++
 package/netsniff-ng/netsniff-ng.hash               |  2 +-
 package/netsniff-ng/netsniff-ng.mk                 |  2 +-
 6 files changed, 108 insertions(+), 50 deletions(-)

diff --git a/package/netsniff-ng/0002-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch b/package/netsniff-ng/0001-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
similarity index 100%
rename from package/netsniff-ng/0002-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
rename to package/netsniff-ng/0001-flowtop-take-PKG_CONFIG-into-account-for-libnetfilte.patch
diff --git a/package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch b/package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch
deleted file mode 100644
index 4ccf9d6..0000000
--- a/package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 88ec2ad37cabb3d3b7ca0e8e5ea3d682c083618d Mon Sep 17 00:00:00 2001
-From: Tobias Klauser <tklauser@distanz.ch>
-Date: Mon, 6 Mar 2017 12:22:57 +0100
-Subject: [PATCH] netsniff-ng: nlmsg: Drop dissection of GENL_ID_GENERATE type
-
-After kernel commit a07ea4d9941a ("genetlink: no longer support using
-static family IDs"), GENL_ID_GENERATE is no longer exposed to userspace
-(and actually should never have been). Change the genl nlmsg dissector
-to only consider the nlctrl family and the two other static family IDs
-needed for workarounds. All other family IDs are considered dynamically
-generated.
-
-Fixes #171
-Reported-by: Jaroslav ??karvada <jskarvad@redhat.com>
-Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 88ec2ad37cabb
-
- proto_nlmsg.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/proto_nlmsg.c b/proto_nlmsg.c
-index f8993e794a54..f2064059be08 100644
---- a/proto_nlmsg.c
-+++ b/proto_nlmsg.c
-@@ -242,9 +242,15 @@ static const char *nlmsg_rtnl_type2str(uint16_t type)
- static const char *nlmsg_genl_type2str(uint16_t type)
- {
- 	switch (type) {
--	case GENL_ID_GENERATE:	return "id gen";
--	case GENL_ID_CTRL:	return "id ctrl";
--	default:		return NULL;
-+	case GENL_ID_CTRL:	return "nlctrl";
-+#if defined(GENL_ID_PCMRAID)
-+	case GENL_ID_PCMRAID:	return "pcmraid";
-+#endif
-+#if defined(GENL_ID_VFS_DQUOT)
-+	case GENL_ID_VFS_DQUOT:	return "vfs dquot";
-+#endif
-+	/* only dynamic family IDs should be used starting with Linux 4.10 */
-+	default:		return "dynamic";
- 	}
- }
- 
--- 
-2.11.0
-
diff --git a/package/netsniff-ng/0002-proc.h-add-missing-headers.patch b/package/netsniff-ng/0002-proc.h-add-missing-headers.patch
new file mode 100644
index 0000000..6968445
--- /dev/null
+++ b/package/netsniff-ng/0002-proc.h-add-missing-headers.patch
@@ -0,0 +1,44 @@
+From 28773ac06d0e0f00d6a56973eacae4f5df9e8cc2 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 16 Apr 2017 08:11:20 +0300
+Subject: [PATCH] proc.h: add missing headers
+
+ino_t and pid_t require stat.h and types.h, respectively. Fixes the following
+build failure with musl libc:
+
+In file included from cpp.c:7:0:
+proc.h:11:31: error: unknown type name ???ino_t???
+ extern int proc_find_by_inode(ino_t ino, char *cmdline, size_t len, pid_t *pid);
+                               ^
+proc.h:11:69: error: unknown type name ???pid_t???
+ extern int proc_find_by_inode(ino_t ino, char *cmdline, size_t len, pid_t *pid);
+                                                                     ^
+proc.h:12:25: error: unknown type name ???pid_t???
+ extern bool proc_exists(pid_t pid);
+                         ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+Patch status: sent upstream
+http://www.mail-archive.com/netsniff-ng%40googlegroups.com/msg01972.html
+
+ proc.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/proc.h b/proc.h
+index 4c34a6412a81..2ce0c6e7a932 100644
+--- a/proc.h
++++ b/proc.h
+@@ -2,6 +2,8 @@
+ #define PROC_H
+ 
+ #include <stdbool.h>
++#include <sys/stat.h>
++#include <sys/types.h>
+ 
+ extern void cpu_affinity(int cpu);
+ extern int set_proc_prio(int prio);
+-- 
+2.11.0
+
diff --git a/package/netsniff-ng/0003-pcap_io.h-fix-if_arp.h-musl-libc-kernel-headers-conf.patch b/package/netsniff-ng/0003-pcap_io.h-fix-if_arp.h-musl-libc-kernel-headers-conf.patch
new file mode 100644
index 0000000..23b0284
--- /dev/null
+++ b/package/netsniff-ng/0003-pcap_io.h-fix-if_arp.h-musl-libc-kernel-headers-conf.patch
@@ -0,0 +1,62 @@
+From f937049ea82ac74635861b3a780d1372f681cc6b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 16 Apr 2017 08:18:10 +0300
+Subject: [PATCH] pcap_io.h: fix if_arp.h musl libc/kernel headers conflict
+
+Use libc provided arp definitions to avoid build failure with musl libc:
+
+In file included from pcap_io.h:19:0,
+                 from trafgen.c:59:
+.../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_arp.h:113:8: error: redefinition of ???struct arpreq???
+ struct arpreq {
+        ^
+In file included from .../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:111:0,
+                 from .../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/net/ethernet.h:10,
+                 from trafgen.c:23:
+.../usr/x86_64-buildroot-linux-musl/sysroot/usr/include/net/if_arp.h:99:8: note: originally defined here
+ struct arpreq {
+        ^
+
+Add a local definition of the ARPHRD_CAN macro that glibc does not provide.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+Patch status: sent upstream
+http://www.mail-archive.com/netsniff-ng%40googlegroups.com/msg01974.html
+
+ built_in.h | 4 ++++
+ pcap_io.h  | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/built_in.h b/built_in.h
+index d10579abd689..fa8af60d6029 100644
+--- a/built_in.h
++++ b/built_in.h
+@@ -382,6 +382,10 @@ static inline u64 cpu_to_le64(u64 val)
+ # define PACKET_QDISC_BYPASS 20
+ #endif
+ 
++#ifndef ARPHRD_CAN
++# define ARPHRD_CAN			280
++#endif
++
+ #ifndef ARPHRD_IEEE802154_MONITOR
+ # define ARPHRD_IEEE802154_MONITOR	805
+ #endif
+diff --git a/pcap_io.h b/pcap_io.h
+index 3d70b217ada6..088858e89ccd 100644
+--- a/pcap_io.h
++++ b/pcap_io.h
+@@ -16,7 +16,7 @@
+ #include <sys/socket.h>
+ #include <linux/if.h>
+ #include <linux/if_packet.h>
+-#include <linux/if_arp.h>
++#include <net/if_arp.h>
+ 
+ #include "built_in.h"
+ #include "die.h"
+-- 
+2.11.0
+
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 79dc686..fea2dad 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 4f2f7afc96b5044b5ccd3b671d0c3b8cb166bfa7f1063cea6c2d5e0fd5a13cf5 netsniff-ng-0.6.2.tar.xz
+sha256 f8e0094f77de8a70f91240bfa77137d5631ac48138cb29fcf962c0bcbe81f04a netsniff-ng-0.6.3.tar.xz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 5d59747..73c840c 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.2
+NETSNIFF_NG_VERSION = 0.6.3
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
