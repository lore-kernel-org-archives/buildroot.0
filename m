From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 00:04:46 +0100
Subject: [Buildroot] [git commit] iproute2: bump to version 4.9.0
Message-ID: <20161222230522.2702381751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd9549610f3b90037d0ce996628e99dbbb5bbe9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the libc-compat.h musl workaround patch to the copy of the kernel header.

Add a patch adding missing limits.h for musl.

Drop 0001-Avoid-in6_addr-redefinition.patch; not needed after the
libc-compat.h patch.

Drop upstream 0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch.

Drop 0004-iproute-no-iptables.patch; should be fixed by upstream commit
4710e46ec3 (tc, ipt: don't enforce iproute2 dependency on iptables-devel).

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...musl-workaround-to-the-libc-compat.h-copy.patch | 38 +++++++++++
 .../0001-Avoid-in6_addr-redefinition.patch         | 79 ----------------------
 ...te2-tc_bpf.c-fix-building-with-musl-libc..patch | 37 ----------
 .../0003-tc-add-missing-limits.h-header.patch      | 38 +++++++++++
 package/iproute2/0004-iproute-no-iptables.patch    | 48 -------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 7 files changed, 78 insertions(+), 166 deletions(-)

diff --git a/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch b/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
new file mode 100644
index 0000000..c7c6e15
--- /dev/null
+++ b/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
@@ -0,0 +1,38 @@
+From b4edb4eebbfd35934b8bc6d7ee0e00e76a01596c Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 22 Dec 2016 15:26:30 +0200
+Subject: [PATCH] Add the musl workaround to the libc-compat.h copy
+
+The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
+__USE_MISC) to solve conflicts with libc provided headers. This patch makes
+libc-compat.h work also for musl libc.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
+musl fix must go to the kernel first.
+---
+ include/linux/libc-compat.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/libc-compat.h b/include/linux/libc-compat.h
+index f38571dabd8d..30f0b67c7a12 100644
+--- a/include/linux/libc-compat.h
++++ b/include/linux/libc-compat.h
+@@ -49,10 +49,12 @@
+ #define _LIBC_COMPAT_H
+ 
+ /* We have included glibc headers... */
+-#if defined(__GLIBC__)
++#if 1
++#define __USE_MISC
+ 
+ /* Coordinate with glibc net/if.h header. */
+ #if defined(_NET_IF_H) && defined(__USE_MISC)
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
+ 
+ /* GLIBC headers included first so don't define anything
+  * that would already be defined. */
+-- 
+2.11.0
+
diff --git a/package/iproute2/0001-Avoid-in6_addr-redefinition.patch b/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
deleted file mode 100644
index 3417339..0000000
--- a/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 48596709d8ab59727b79a5c6db33ebb251c36543 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 19 Nov 2015 17:44:25 +0100
-Subject: [PATCH] Avoid in6_addr redefinition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Due to both <netinet/in.h> and <linux/in6.h> being included, the
-in6_addr is being redefined: once from the C library headers and once
-from the kernel headers. This causes some build failures with for
-example the musl C library:
-
-In file included from ../include/linux/xfrm.h:4:0,
-                 from xfrm.h:29,
-                 from ipxfrm.c:39:
-../include/linux/in6.h:32:8: error: redefinition of ???struct in6_addr???
- struct in6_addr {
-        ^
-In file included from .../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netdb.h:9:0,
-                 from ipxfrm.c:34:
-.../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:24:8: note: originally defined here
- struct in6_addr
-        ^
-
-In order to fix this, use just the C library header <netinet/in.h>.
-
-Original patch taken from
-http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Gustavo: drop ipt_kernel_headers.h chunk since no longer necessary]
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- include/linux/if_bridge.h            | 1 -
- include/linux/netfilter.h            | 2 --
- include/linux/xfrm.h                 | 1 -
- 3 files changed, 4 deletions(-)
-
-diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
-index ee197a3..f823aa4 100644
---- a/include/linux/if_bridge.h
-+++ b/include/linux/if_bridge.h
-@@ -15,7 +15,6 @@
- 
- #include <linux/types.h>
- #include <linux/if_ether.h>
--#include <linux/in6.h>
- 
- #define SYSFS_BRIDGE_ATTR	"bridge"
- #define SYSFS_BRIDGE_FDB	"brforward"
-diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
-index b71b4c9..3e4e6ae 100644
---- a/include/linux/netfilter.h
-+++ b/include/linux/netfilter.h
-@@ -4,8 +4,6 @@
- #include <linux/types.h>
- 
- #include <linux/sysctl.h>
--#include <linux/in.h>
--#include <linux/in6.h>
- 
- /* Responses from hook functions. */
- #define NF_DROP 0
-diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
-index b8f5451..a9761a5 100644
---- a/include/linux/xfrm.h
-+++ b/include/linux/xfrm.h
-@@ -1,7 +1,6 @@
- #ifndef _LINUX_XFRM_H
- #define _LINUX_XFRM_H
- 
--#include <linux/in6.h>
- #include <linux/types.h>
- 
- /* All of the structures in this file may not change size as they are
--- 
-2.6.3
-
diff --git a/package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch b/package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch
deleted file mode 100644
index 0342abe..0000000
--- a/package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 01b287582f25cc3a8a36caee5ce13e14b9233f49 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 8 Apr 2016 09:52:55 -0300
-Subject: [PATCH] iproute2: tc_bpf.c: fix building with musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We need limits.h for PATH_MAX, fixes:
-
-tc_bpf.c: In function ???bpf_map_selfcheck_pinned???:
-tc_bpf.c:222:12: error: ???PATH_MAX??? undeclared (first use in this
-function)
-  char file[PATH_MAX], buff[4096];
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: submitted upstream
-
- tc/tc_bpf.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tc/tc_bpf.c b/tc/tc_bpf.c
-index d94af82..042e76f 100644
---- a/tc/tc_bpf.c
-+++ b/tc/tc_bpf.c
-@@ -20,6 +20,7 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <stdarg.h>
-+#include <limits.h>
- 
- #ifdef HAVE_ELF
- #include <libelf.h>
--- 
-2.7.3
-
diff --git a/package/iproute2/0003-tc-add-missing-limits.h-header.patch b/package/iproute2/0003-tc-add-missing-limits.h-header.patch
new file mode 100644
index 0000000..b9b27f3
--- /dev/null
+++ b/package/iproute2/0003-tc-add-missing-limits.h-header.patch
@@ -0,0 +1,38 @@
+From 1f4547b0a81db617f4b0d02711d9e39278eb8283 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 22 Dec 2016 20:45:11 +0200
+Subject: [PATCH] tc: add missing limits.h header
+
+This fixes under musl build issues like:
+
+f_matchall.c: In function ???matchall_parse_opt???:
+f_matchall.c:48:12: error: ???LONG_MIN??? undeclared (first use in this function)
+   if (h == LONG_MIN || h == LONG_MAX) {
+            ^
+f_matchall.c:48:12: note: each undeclared identifier is reported only once for each function it appears in
+f_matchall.c:48:29: error: ???LONG_MAX??? undeclared (first use in this function)
+   if (h == LONG_MIN || h == LONG_MAX) {
+                             ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: posted http://marc.info/?l=linux-netdev&m=148243283002957&w=2
+---
+ tc/tc_util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tc/tc_util.h b/tc/tc_util.h
+index f198a4ad5554..4db26c6d5e25 100644
+--- a/tc/tc_util.h
++++ b/tc/tc_util.h
+@@ -2,6 +2,7 @@
+ #define _TC_UTIL_H_ 1
+ 
+ #define MAX_MSG 16384
++#include <limits.h>
+ #include <linux/pkt_sched.h>
+ #include <linux/pkt_cls.h>
+ #include <linux/gen_stats.h>
+-- 
+2.11.0
+
diff --git a/package/iproute2/0004-iproute-no-iptables.patch b/package/iproute2/0004-iproute-no-iptables.patch
deleted file mode 100644
index 7f7f37b..0000000
--- a/package/iproute2/0004-iproute-no-iptables.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Fix build issues when there's no iptables present.
-
-Patch from Matt Whitlock
-See https://bugs.gentoo.org/show_bug.cgi?id=577464
-Status: in theory submitted upstream by Lars Wendler.
-
---- iproute2-4.5.0/configure~	2016-03-14 23:02:31.000000000 +0000
-+++ iproute2-4.5.0/configure	2016-03-17 13:24:17.634743197 +0000
-@@ -169,10 +169,25 @@
- 
- check_ipt()
- {
--	if ! grep TC_CONFIG_XT Config > /dev/null
-+	if grep -q TC_CONFIG_XT Config
- 	then
-+		return
-+	fi
-+
-+	cat >$TMPDIR/ipttest.c <<EOF
-+#include <iptables.h>
-+int main() { return 0; }
-+EOF
-+
-+	if $CC -std=c90 -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL \
-+		$(${PKG_CONFIG} libiptc --cflags --libs 2>/dev/null) -ldl >/dev/null 2>&1
-+	then
-+		echo "TC_CONFIG_IPT:=y" >>Config
- 		echo "using iptables"
-+	else
-+		echo "no"
- 	fi
-+	rm -f $TMPDIR/ipttest.c $TMPDIR/ipttest
- }
- 
- check_ipt_lib_dir()
---- iproute2-4.5.0/tc/Makefile~	2016-03-14 23:02:31.000000000 +0000
-+++ iproute2-4.5.0/tc/Makefile	2016-03-17 13:18:18.686689985 +0000
-@@ -88,7 +88,9 @@
- 	CFLAGS += -DTC_CONFIG_XT_H
- 	TCSO += m_xt_old.so
-     else
--      TCMODULES += m_ipt.o
-+      ifeq ($(TC_CONFIG_IPT),y)
-+        TCMODULES += m_ipt.o
-+      endif
-     endif
-   endif
- endif
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 1dafa8d..5cacc7f 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	3f15292f53e465cb5bd6652961343ca64eb6936309ae75be5d5a541435bc494a	iproute2-4.5.0.tar.xz
+sha256	c0f30f043f7767cc1b2cd2197b08d4e9b2392c95823fabe30bbce308c30116c4	iproute2-4.9.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 09e68c5..5ea5299 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.5.0
+IPROUTE2_VERSION = 4.9.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
