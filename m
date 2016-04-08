From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 18:23:35 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 4.5.0
Message-ID: <20160408163130.3A0AB81DC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6fd41c16a44570289932a2faf1c62106f6f3f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0003-iproute2-fix-building-with-musl.patch since it's upstream.
Add gentoo patch to allow for non-iptables builds.
Add new musl build fix.
Tweak 0001-Avoid-in6_addr-redefinition.patch since the first chunk is no
longer required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Avoid-in6_addr-redefinition.patch         | 22 ++--------
 .../0003-iproute2-fix-building-with-musl.patch     | 33 ---------------
 ...te2-tc_bpf.c-fix-building-with-musl-libc..patch | 37 +++++++++++++++++
 package/iproute2/0004-iproute-no-iptables.patch    | 48 ++++++++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 6 files changed, 90 insertions(+), 54 deletions(-)

diff --git a/package/iproute2/0001-Avoid-in6_addr-redefinition.patch b/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
index 52e2940..3417339 100644
--- a/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
+++ b/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
@@ -29,30 +29,14 @@ Original patch taken from
 http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Gustavo: drop ipt_kernel_headers.h chunk since no longer necessary]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
- include/libiptc/ipt_kernel_headers.h | 2 --
  include/linux/if_bridge.h            | 1 -
  include/linux/netfilter.h            | 2 --
  include/linux/xfrm.h                 | 1 -
- 4 files changed, 6 deletions(-)
+ 3 files changed, 4 deletions(-)
 
-diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
-index 7e87828..9566be5 100644
---- a/include/libiptc/ipt_kernel_headers.h
-+++ b/include/libiptc/ipt_kernel_headers.h
-@@ -15,12 +15,10 @@
- #else /* libc5 */
- #include <sys/socket.h>
- #include <linux/ip.h>
--#include <linux/in.h>
- #include <linux/if.h>
- #include <linux/icmp.h>
- #include <linux/tcp.h>
- #include <linux/udp.h>
- #include <linux/types.h>
--#include <linux/in6.h>
- #endif
- #endif
 diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
 index ee197a3..f823aa4 100644
 --- a/include/linux/if_bridge.h
diff --git a/package/iproute2/0003-iproute2-fix-building-with-musl.patch b/package/iproute2/0003-iproute2-fix-building-with-musl.patch
deleted file mode 100644
index 377bf40..0000000
--- a/package/iproute2/0003-iproute2-fix-building-with-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e445686215f44c95b8b777c4c7efe5318d48505e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 21 Jan 2016 15:14:44 -0300
-Subject: [PATCH] iproute2: fix building with musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We need limits.h for PATH_MAX, fixes:
-
-rt_names.c:364:13: error: ???PATH_MAX??? undeclared (first use in this
-function)
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- lib/rt_names.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/rt_names.c b/lib/rt_names.c
-index f6d17c0..b665d3e 100644
---- a/lib/rt_names.c
-+++ b/lib/rt_names.c
-@@ -18,6 +18,7 @@
- #include <sys/time.h>
- #include <sys/socket.h>
- #include <dirent.h>
-+#include <limits.h>
- 
- #include <asm/types.h>
- #include <linux/rtnetlink.h>
--- 
-2.4.10
-
diff --git a/package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch b/package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch
new file mode 100644
index 0000000..0342abe
--- /dev/null
+++ b/package/iproute2/0003-iproute2-tc_bpf.c-fix-building-with-musl-libc..patch
@@ -0,0 +1,37 @@
+From 01b287582f25cc3a8a36caee5ce13e14b9233f49 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 8 Apr 2016 09:52:55 -0300
+Subject: [PATCH] iproute2: tc_bpf.c: fix building with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We need limits.h for PATH_MAX, fixes:
+
+tc_bpf.c: In function ???bpf_map_selfcheck_pinned???:
+tc_bpf.c:222:12: error: ???PATH_MAX??? undeclared (first use in this
+function)
+  char file[PATH_MAX], buff[4096];
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: submitted upstream
+
+ tc/tc_bpf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tc/tc_bpf.c b/tc/tc_bpf.c
+index d94af82..042e76f 100644
+--- a/tc/tc_bpf.c
++++ b/tc/tc_bpf.c
+@@ -20,6 +20,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <stdarg.h>
++#include <limits.h>
+ 
+ #ifdef HAVE_ELF
+ #include <libelf.h>
+-- 
+2.7.3
+
diff --git a/package/iproute2/0004-iproute-no-iptables.patch b/package/iproute2/0004-iproute-no-iptables.patch
new file mode 100644
index 0000000..7f7f37b
--- /dev/null
+++ b/package/iproute2/0004-iproute-no-iptables.patch
@@ -0,0 +1,48 @@
+Fix build issues when there's no iptables present.
+
+Patch from Matt Whitlock
+See https://bugs.gentoo.org/show_bug.cgi?id=577464
+Status: in theory submitted upstream by Lars Wendler.
+
+--- iproute2-4.5.0/configure~	2016-03-14 23:02:31.000000000 +0000
++++ iproute2-4.5.0/configure	2016-03-17 13:24:17.634743197 +0000
+@@ -169,10 +169,25 @@
+ 
+ check_ipt()
+ {
+-	if ! grep TC_CONFIG_XT Config > /dev/null
++	if grep -q TC_CONFIG_XT Config
+ 	then
++		return
++	fi
++
++	cat >$TMPDIR/ipttest.c <<EOF
++#include <iptables.h>
++int main() { return 0; }
++EOF
++
++	if $CC -std=c90 -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL \
++		$(${PKG_CONFIG} libiptc --cflags --libs 2>/dev/null) -ldl >/dev/null 2>&1
++	then
++		echo "TC_CONFIG_IPT:=y" >>Config
+ 		echo "using iptables"
++	else
++		echo "no"
+ 	fi
++	rm -f $TMPDIR/ipttest.c $TMPDIR/ipttest
+ }
+ 
+ check_ipt_lib_dir()
+--- iproute2-4.5.0/tc/Makefile~	2016-03-14 23:02:31.000000000 +0000
++++ iproute2-4.5.0/tc/Makefile	2016-03-17 13:18:18.686689985 +0000
+@@ -88,7 +88,9 @@
+ 	CFLAGS += -DTC_CONFIG_XT_H
+ 	TCSO += m_xt_old.so
+     else
+-      TCMODULES += m_ipt.o
++      ifeq ($(TC_CONFIG_IPT),y)
++        TCMODULES += m_ipt.o
++      endif
+     endif
+   endif
+ endif
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d291d3d..1dafa8d 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	bc91c367288a19f78ef800cd6840363be1f22da8436fbae88e1a7250490d6514	iproute2-4.4.0.tar.xz
+sha256	3f15292f53e465cb5bd6652961343ca64eb6936309ae75be5d5a541435bc494a	iproute2-4.5.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6fa68c2..91d5033 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.4.0
+IPROUTE2_VERSION = 4.5.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
