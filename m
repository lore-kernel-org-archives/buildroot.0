From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Dec 2019 20:11:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/arptables: bump to version 0.0.5
Message-ID: <20191204191144.2591797-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update site to retrieve latest version
- Remove first, second and third patches (already in version)
- Use the new COPYING file as the license file
- arptables binary is now named arptables-legacy since
  http://git.netfilter.org/arptables/commit/?id=28b22d55615447c94c5058e0aacec612ebc27f2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....patch => 0001-Fix-musl-build-issue.patch} |   0
 ...01-arptables-disable-dlfcn.h-include.patch |  32 -----
 .../arptables/0002-src-Use-stdint-types.patch | 134 ------------------
 .../0003-src-Remove-support-for-libc5.patch   |  64 ---------
 package/arptables/Config.in                   |  11 +-
 package/arptables/arptables.hash              |   7 +-
 package/arptables/arptables.mk                |   9 +-
 7 files changed, 18 insertions(+), 239 deletions(-)
 rename package/arptables/{0004-Fix-musl-build-issue.patch => 0001-Fix-musl-build-issue.patch} (100%)
 delete mode 100644 package/arptables/0001-arptables-disable-dlfcn.h-include.patch
 delete mode 100644 package/arptables/0002-src-Use-stdint-types.patch
 delete mode 100644 package/arptables/0003-src-Remove-support-for-libc5.patch

diff --git a/package/arptables/0004-Fix-musl-build-issue.patch b/package/arptables/0001-Fix-musl-build-issue.patch
similarity index 100%
rename from package/arptables/0004-Fix-musl-build-issue.patch
rename to package/arptables/0001-Fix-musl-build-issue.patch
diff --git a/package/arptables/0001-arptables-disable-dlfcn.h-include.patch b/package/arptables/0001-arptables-disable-dlfcn.h-include.patch
deleted file mode 100644
index a5d56d22a6..0000000000
--- a/package/arptables/0001-arptables-disable-dlfcn.h-include.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 948a96d710f377fb0ed8d78c7fb85b299c80ef13 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 8 Nov 2014 10:12:54 -0300
-Subject: [PATCH] arptables: disable dlfcn.h include
-
-The relevant code is disabled in libarptc_incl.c so it's not required
-and breaks the ability to build it in a pure-static toolchain.
-
-Status: sent upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- arptables.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/arptables.c b/arptables.c
-index 64ac3aa..fe270bc 100644
---- a/arptables.c
-+++ b/arptables.c
-@@ -35,7 +35,9 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <inttypes.h>
-+#if 0
- #include <dlfcn.h>
-+#endif
- #include <ctype.h>
- #include <stdarg.h>
- #include <limits.h>
--- 
-2.0.4
-
diff --git a/package/arptables/0002-src-Use-stdint-types.patch b/package/arptables/0002-src-Use-stdint-types.patch
deleted file mode 100644
index 8a85e705d1..0000000000
--- a/package/arptables/0002-src-Use-stdint-types.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 24957c135eaacd718f3c788285de33d64316b32e Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 10:31:24 +0200
-Subject: [PATCH 1/2] src: Use stdint types
-
-Backport of upstream commit 047f37b1d5d865084a435fd7594b8c5c332ccb8d
-
-Please note that the backported patch does not include two changes
-to arptables.h from the upstream - these modified lines added in commit
-dbbe9f7de36aa3c7dd61dc89092c03f7902e474e which was committed after
-the 0.0.4 release.
-
-Upstream-status: backport
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- arptables.c                 | 8 ++++----
- include/arptables.h         | 3 ++-
- include/libarptc/libarptc.h | 7 ++++---
- libarptc/libarptc.c         | 4 ++--
- libarptc/libarptc_incl.c    | 2 +-
- 5 files changed, 13 insertions(+), 11 deletions(-)
-
-diff --git a/arptables.c b/arptables.c
-index 5535ab2..6d1377f 100644
---- a/arptables.c
-+++ b/arptables.c
-@@ -230,7 +230,7 @@ extern void dump_entries(const arptc_handle_t handle);
-    /etc/protocols */
- struct pprot {
- 	char *name;
--	u_int8_t num;
-+	uint8_t num;
- };
- 
- /* Primitive headers... */
-@@ -925,7 +925,7 @@ mask_to_dotted(const struct in_addr *mask)
- {
- 	int i;
- 	static char buf[20];
--	u_int32_t maskaddr, bits;
-+	uint32_t maskaddr, bits;
- 
- 	maskaddr = ntohl(mask->s_addr);
- 
-@@ -967,7 +967,7 @@ string_to_number(const char *s, unsigned int min, unsigned int max,
- }
- 
- static void
--set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
-+set_option(unsigned int *options, unsigned int option, uint16_t *invflg,
- 	   int invert)
- {
- 	if (*options & option)
-@@ -1107,7 +1107,7 @@ register_target(struct arptables_target *me)
- }
- 
- static void
--print_num(u_int64_t number, unsigned int format)
-+print_num(uint64_t number, unsigned int format)
- {
- 	if (format & FMT_KILOMEGAGIGA) {
- 		if (number > 99999) {
-diff --git a/include/arptables.h b/include/arptables.h
-index 820b664..e6a6ba6 100644
---- a/include/arptables.h
-+++ b/include/arptables.h
-@@ -1,6 +1,7 @@
- #ifndef _ARPTABLES_USER_H
- #define _ARPTABLES_USER_H
- 
-+#include <stdint.h>
- #include "arptables_common.h"
- #include "libarptc/libarptc.h"
- 
-@@ -126,7 +127,7 @@ extern char *mask_to_dotted(const struct in_addr *mask);
- 
- extern void parse_hostnetworkmask(const char *name, struct in_addr **addrpp,
-                       struct in_addr *maskp, unsigned int *naddrs);
--extern u_int16_t parse_protocol(const char *s);
-+extern uint16_t parse_protocol(const char *s);
- 
- extern int do_command(int argc, char *argv[], char **table,
- 		      arptc_handle_t *handle);
-diff --git a/include/libarptc/libarptc.h b/include/libarptc/libarptc.h
-index e4f1175..76fbfab 100644
---- a/include/libarptc/libarptc.h
-+++ b/include/libarptc/libarptc.h
-@@ -6,9 +6,10 @@
- #include <linux/netfilter_arp/arp_tables.h>
- 
- #ifndef ARPT_MIN_ALIGN
--/* arpt_entry has pointers and u_int64_t's in it, so if you align to
--   it, you'll also align to any crazy matches and targets someone
--   might write */
-+/* arpt_entry has pointers and uint64_t's in it, so if you align to
-+ * it, you'll also align to any crazy matches and targets someone
-+ * might write.
-+ */
- #define ARPT_MIN_ALIGN (__alignof__(struct arpt_entry))
- #endif
- 
-diff --git a/libarptc/libarptc.c b/libarptc/libarptc.c
-index 2dcaaef..701bae0 100644
---- a/libarptc/libarptc.c
-+++ b/libarptc/libarptc.c
-@@ -256,8 +256,8 @@ unconditional(const struct arpt_arp *arp)
- {
- 	unsigned int i;
- 
--	for (i = 0; i < sizeof(*arp)/sizeof(u_int32_t); i++)
--		if (((u_int32_t *)arp)[i])
-+	for (i = 0; i < sizeof(*arp) / sizeof(uint32_t); i++)
-+		if (((uint32_t *)arp)[i])
- 			return 0;
- 
- 	return 1;
-diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
-index 2fa3d43..b41fcb2 100644
---- a/libarptc/libarptc_incl.c
-+++ b/libarptc/libarptc_incl.c
-@@ -1706,7 +1706,7 @@ TC_COMMIT(TC_HANDLE_T *handle)
- 		/* Kernel will think that pointer should be 64-bits, and get
- 		   padding.  So we accomodate here (assumption: alignment of
- 		   `counters' is on 64-bit boundary). */
--		u_int64_t *kernptr = (u_int64_t *)&newcounters->counters;
-+		uint64_t *kernptr = (uint64_t *)&newcounters->counters;
- 		if ((unsigned long)&newcounters->counters % 8 != 0) {
- 			fprintf(stderr,
- 				"counters alignment incorrect! Mail rusty!\n");
--- 
-2.4.3
-
diff --git a/package/arptables/0003-src-Remove-support-for-libc5.patch b/package/arptables/0003-src-Remove-support-for-libc5.patch
deleted file mode 100644
index 15e893dd0c..0000000000
--- a/package/arptables/0003-src-Remove-support-for-libc5.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 5f1379ff68bfedb56309527bee266a591b27a19e Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 10:31:41 +0200
-Subject: [PATCH 2/2] src: Remove support for libc5
-
-Fixes compilation with musl libc
-
-Backport of upstream commit f4ab8f63f11a72f14687a6646d04ae1bae3fa45f
-Upstream status: backport
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- include/libarptc/arpt_kernel_headers.h | 12 ------------
- libarptc/libarptc.c                    |  4 ----
- 2 files changed, 16 deletions(-)
-
-diff --git a/include/libarptc/arpt_kernel_headers.h b/include/libarptc/arpt_kernel_headers.h
-index 442cc54..140e999 100644
---- a/include/libarptc/arpt_kernel_headers.h
-+++ b/include/libarptc/arpt_kernel_headers.h
-@@ -5,7 +5,6 @@
- 
- #include <limits.h>
- 
--#if defined(__GLIBC__) && __GLIBC__ == 2
- #include <netinet/ip.h>
- #include <netinet/in.h>
- #include <netinet/ip_icmp.h>
-@@ -14,16 +13,5 @@
- #include <netinet/ether.h>
- #include <net/if.h>
- #include <sys/types.h>
--#else
--#include <sys/socket.h>
--#include <linux/ip.h>
--#include <linux/in.h>
--#include <linux/if.h>
--#include <linux/icmp.h>
--#include <linux/tcp.h>
--#include <linux/udp.h>
--#include <linux/types.h>
--#include <linux/in6.h>
--#endif
- 
- #endif
-diff --git a/libarptc/libarptc.c b/libarptc/libarptc.c
-index 701bae0..9c5a5b0 100644
---- a/libarptc/libarptc.c
-+++ b/libarptc/libarptc.c
-@@ -23,10 +23,6 @@
- #define inline
- #endif
- 
--#if !defined(__GLIBC__) || (__GLIBC__ < 2)
--typedef unsigned int socklen_t;
--#endif
--
- #include "libarptc/libarptc.h"
- 
- #define IP_VERSION	4
--- 
-2.4.3
-
diff --git a/package/arptables/Config.in b/package/arptables/Config.in
index 873e791e81..aeb7250a72 100644
--- a/package/arptables/Config.in
+++ b/package/arptables/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_ARPTABLES
-	bool "arptables"
+	bool "arptables-legacy"
 	depends on BR2_USE_MMU # needs fork()
 	help
-	  Tool to set up, maintain, and inspect the tables of ARP rules.
+	  Legacy tool to set up, maintain, and inspect the tables of ARP
+	  rules.
 
-	  http://ebtables.sourceforge.net
+	  A more uptodate client of the arptables tool is provided in
+	  the iptables package. The new tool was formerly known as
+	  arptables-compat.
+
+	  http://git.netfilter.org/arptables
diff --git a/package/arptables/arptables.hash b/package/arptables/arptables.hash
index 95b9997569..8366cea412 100644
--- a/package/arptables/arptables.hash
+++ b/package/arptables/arptables.hash
@@ -1,2 +1,5 @@
-# Locally calculated
-sha256	277985e29ecd93bd759a58242cad0e02ba9d4a6e1b7795235e3b507661bc0049	arptables-v0.0.4.tar.gz
+# From http://ftp.netfilter.org/pub/arptables/arptables-0.0.5.tar.gz.sha256sum
+sha256	4f9a0656ce5c90868f551cd4deeb2d04f33899667e1fb2818b64e432fe8f629c	arptables-0.0.5.tar.gz
+
+# Hash for license file
+sha256	ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1	COPYING
diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index 257b636d62..320a33bb3c 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ARPTABLES_VERSION = 0.0.4
-ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
-ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
+ARPTABLES_VERSION = 0.0.5
+ARPTABLES_SITE = http://ftp.netfilter.org/pub/arptables
 ARPTABLES_LICENSE = GPL-2.0+
+ARPTABLES_LICENSE_FILES = COPYING
 
 define ARPTABLES_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
@@ -15,7 +15,8 @@ define ARPTABLES_BUILD_CMDS
 endef
 
 define ARPTABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/arptables $(TARGET_DIR)/usr/sbin/arptables
+	$(INSTALL) -m 755 -D $(@D)/arptables-legacy \
+		$(TARGET_DIR)/usr/sbin/arptables-legacy
 endef
 
 $(eval $(generic-package))
-- 
2.24.0
