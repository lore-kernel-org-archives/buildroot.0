From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 18:53:41 +0200
Subject: [Buildroot] [PATCH 19/20] trinity: don't download patches from
	Github
In-Reply-To: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
References: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702165342.29522-20-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rspace-headers-for-ax25-instead-of-kernel.patch | 26 ++++++++
 ...002-fix-build-when_USE_BPF-is-not-defined.patch | 72 ++++++++++++++++++++++
 .../0003-Check-for-bpf-attr-map-flags.patch        | 60 ++++++++++++++++++
 ...4-get_syscall_entry-remove-SYSCALL_OFFSET.patch | 44 +++++++++++++
 ...x-cross-compile-detection-of-broken-ipv6.patch} |  0
 package/trinity/trinity.hash                       |  4 --
 package/trinity/trinity.mk                         |  5 --
 7 files changed, 202 insertions(+), 9 deletions(-)
 create mode 100644 package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
 create mode 100644 package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
 create mode 100644 package/trinity/0003-Check-for-bpf-attr-map-flags.patch
 create mode 100644 package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
 rename package/trinity/{0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch => 0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch} (100%)

diff --git a/package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch b/package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
new file mode 100644
index 0000000..e077bf4
--- /dev/null
+++ b/package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
@@ -0,0 +1,26 @@
+From b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d Mon Sep 17 00:00:00 2001
+From: Dave Jones <davej@codemonkey.org.uk>
+Date: Mon, 5 Dec 2016 12:46:14 -0500
+Subject: [PATCH] use userspace headers for ax25 instead of kernel.
+
+This should solve https://bugzilla.redhat.com/show_bug.cgi?id=1400720
+
+[Upstream commit: https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ net/proto-rose.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/proto-rose.c b/net/proto-rose.c
+index ccbf294f..b277f839 100644
+--- a/net/proto-rose.c
++++ b/net/proto-rose.c
+@@ -6,7 +6,7 @@
+ #include <sys/un.h>
+ #include <netinet/in.h>
+ #include <bits/sockaddr.h>
+-#include <linux/ax25.h> /* for ax25_address in rose.h */
++#include <netax25/ax25.h> /* for ax25_address in rose.h */
+ #include <netrose/rose.h>
+ #include <stdlib.h>
+ #include "net.h"
diff --git a/package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch b/package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
new file mode 100644
index 0000000..4fb2c69
--- /dev/null
+++ b/package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
@@ -0,0 +1,72 @@
+From f447db18b389050ecc5e66dbf549d5953633e23e Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Mon, 7 Nov 2016 12:50:27 +0100
+Subject: [PATCH] fix build when USE_BPF is not defined
+
+net/bpf.o: In function `bpf_gen_filter': bpf.c:852: undefined reference to `get_rand_bpf_fd'
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+[Upstream commit: https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ net/bpf.c             | 3 +++
+ syscalls/prctl.c      | 4 +++-
+ syscalls/setsockopt.c | 2 ++
+ 3 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/net/bpf.c b/net/bpf.c
+index 4fe94173..d6ca14bd 100644
+--- a/net/bpf.c
++++ b/net/bpf.c
+@@ -8,6 +8,7 @@
+ #include <string.h>
+ 
+ #include "bpf.h"
++#include "config.h"
+ #include "debug.h"
+ #include "log.h"
+ #include "net.h"
+@@ -17,6 +18,7 @@
+ #include "utils.h"
+ #include "compat.h"
+ 
++#ifdef USE_BPF
+ /**
+  * BPF filters are used in networking such as in pf_packet, but also
+  * in seccomp for application sand-boxing. Additionally, with arch
+@@ -885,3 +887,4 @@ void bpf_gen_filter(unsigned long **addr, unsigned long *addrlen)
+ 	if (dump_bpf)
+ 		bpf_disasm_all(bpf->filter, bpf->len);
+ }
++#endif
+diff --git a/syscalls/prctl.c b/syscalls/prctl.c
+index 02d2dbc6..cdbcdc21 100644
+--- a/syscalls/prctl.c
++++ b/syscalls/prctl.c
+@@ -45,9 +45,11 @@ static int prctl_opts[] = {
+ #ifdef USE_SECCOMP
+ static void do_set_seccomp(struct syscallrecord *rec)
+ {
+-	unsigned long *optval = NULL, optlen = 0;
++	unsigned long *optval = NULL, __unused__ optlen = 0;
+ 
++#ifdef USE_BPF
+ 	bpf_gen_seccomp(&optval, &optlen);
++#endif
+ 
+ 	rec->a2 = SECCOMP_MODE_FILTER;
+ 	rec->a3 = (unsigned long) optval;
+diff --git a/syscalls/setsockopt.c b/syscalls/setsockopt.c
+index 8189b7a8..d395e54e 100644
+--- a/syscalls/setsockopt.c
++++ b/syscalls/setsockopt.c
+@@ -48,7 +48,9 @@ static void socket_setsockopt(struct sockopt *so, __unused__ struct socket_tripl
+ 	case SO_ATTACH_FILTER: {
+ 		unsigned long *optval = NULL, optlen = 0;
+ 
++#ifdef USE_BPF
+ 		bpf_gen_filter(&optval, &optlen);
++#endif
+ 
+ 		so->optval = (unsigned long) optval;
+ 		so->optlen = optlen;
diff --git a/package/trinity/0003-Check-for-bpf-attr-map-flags.patch b/package/trinity/0003-Check-for-bpf-attr-map-flags.patch
new file mode 100644
index 0000000..ee2bc37
--- /dev/null
+++ b/package/trinity/0003-Check-for-bpf-attr-map-flags.patch
@@ -0,0 +1,60 @@
+From 87427256640f806710dd97fc807a9a896147c617 Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Sat, 12 Nov 2016 00:55:35 +0000
+Subject: [PATCH] Check for bpf_attr map_flags.
+
+map_flags is not available until Linux 4.6.
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+[Upstream commit: https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure | 28 +++++++++++++++++++++++++++-
+ 1 file changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index ca37e4ef..18d9df73 100755
+--- a/configure
++++ b/configure
+@@ -222,6 +222,33 @@ else
+ fi
+ 
+ #############################################################################################
++# is /usr/include/linux/bpf.h new enough to feature bpf
++#
++echo -n "[*] Checking if bpf_attr can use map_flags.. "
++rm -f "$TMP" || exit 1
++
++cat >"$TMP.c" << EOF
++#include <stdio.h>
++#include <linux/bpf.h>
++
++void main()
++{
++	union bpf_attr attr = {
++		.map_flags = 0,
++	};
++}
++EOF
++
++${CC} ${CFLAGS} "$TMP.c" -o "$TMP" &>"$TMP.log"
++if [ ! -x "$TMP" ]; then
++	echo $RED "[NO]" $COL_RESET
++	MISSING_DEFS=1
++else
++	echo $GREEN "[YES]" $COL_RESET
++	echo "#define USE_BPF 1" >> $CONFIGH
++fi
++
++#############################################################################################
+ 
+ check_header linux/caif/caif_socket.h USE_CAIF
+ check_header linux/if_alg.h USE_IF_ALG
+@@ -239,7 +266,6 @@ check_header execinfo.h USE_BACKTRACE
+ check_header netatalk/at.h USE_APPLETALK
+ check_header netrom/netrom.h USE_NETROM
+ check_header netrose/rose.h USE_ROSE
+-check_header linux/bpf.h USE_BPF
+ 
+ rm -f "$TMP" "$TMP.log" "$TMP.c"
+ 
diff --git a/package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch b/package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
new file mode 100644
index 0000000..4c58d62
--- /dev/null
+++ b/package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
@@ -0,0 +1,44 @@
+From 1d9af9d07ae111c253c92112fb50000adac47a0c Mon Sep 17 00:00:00 2001
+From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+Date: Thu, 29 Jun 2017 12:24:10 +0200
+Subject: [PATCH] get_syscall_entry: remove SYSCALL_OFFSET
+
+0-based syscall numbers are used throughout the application and the
+SYSCALL_OFFSET is only added when invoking the syscall. It is therefore
+wrong to substract the offset in get_syscall_entry, as it leads to
+dereferencing array entries at negative offsets and segfaults.
+
+Tested on MIPS32/LE.
+This change effectively reverts cc5108ff ('make get_syscall_entry take
+SYSCALL_OFFSET into account')
+
+Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+[Upstream commit: https://github.com/kernelslacker/trinity/commit/1d9af9d07ae111c253c92112fb50000adac47a0c]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tables.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/tables.c b/tables.c
+index e7dab85d..8090146a 100644
+--- a/tables.c
++++ b/tables.c
+@@ -673,15 +673,14 @@ int munge_tables(void)
+  */
+ struct syscallentry * get_syscall_entry(unsigned int callno, bool do32)
+ {
+-	unsigned int offset = callno - SYSCALL_OFFSET;
+ 	if (biarch == FALSE)
+-		return syscalls[offset].entry;
++		return syscalls[callno].entry;
+ 
+ 	/* biarch case */
+ 	if (do32 == TRUE)
+-		return syscalls_32bit[offset].entry;
++		return syscalls_32bit[callno].entry;
+ 	else
+-		return syscalls_64bit[offset].entry;
++		return syscalls_64bit[callno].entry;
+ }
+ 
+ /*
diff --git a/package/trinity/0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch b/package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch
similarity index 100%
rename from package/trinity/0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch
rename to package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch
diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index b896158..7f48cfa 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,6 +1,2 @@
 # Locally calculated
 sha256 4cb2bd4049ce523fdf47490c4c18b8eb713c720d4b3b13d6ec2ae246aac908ad  trinity-1.7.tar.xz
-sha256 5601474b10973b99f6f4ecc67c8ac54000754d7110553cc81c7648bd7e73c810  b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
-sha256 1974e473113b4e79fb2ff820e2b03f475a538e43343c24ca077a04214b9e0418  f447db18b389050ecc5e66dbf549d5953633e23e.patch
-sha256 9f9846a9c257b7df7e944c8b3ea956a8e8166bba67b3ea6c231382f095753312  87427256640f806710dd97fc807a9a896147c617.patch
-sha256 e6e47e813424f6b92b5a2e8f56bbd3bae63db47b76ece81a934a9390e194cbfc  1d9af9d07ae111c253c92112fb50000adac47a0c.patch
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 7396570..1bada39 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -10,11 +10,6 @@ TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
-TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch \
-		https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e.patch \
-		https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617.patch \
-		https://github.com/kernelslacker/trinity/commit/1d9af9d07ae111c253c92112fb50000adac47a0c.patch
-
 ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
 TRINITY_DEPENDENCIES += btrfs-progs
 endif
-- 
2.9.4
