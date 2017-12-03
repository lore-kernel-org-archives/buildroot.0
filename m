From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  3 Dec 2017 21:34:38 +0200
Subject: [Buildroot] [PATCH 1/2] trinity: bump to version 1.8
Message-ID: <6ad09d50510868507c76a49ae5b0df26dc24f46e.1512329679.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches.

Add an upstream patch fixing build with kernel headers v4.14 or newer.

Enable build for musl; Marcin Nowakowski fixed all incompatibilities in
this version.

Fixes:
http://autobuild.buildroot.net/results/1a8/1a891bfa1f29060003bb7f4fce100aa5a1034673/
http://autobuild.buildroot.net/results/f22/f22cb03a4ec1eafb89ca5e81a2864f928117b54d/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-compat-handle-removed-autofs-macros.patch | 61 ++++++++++++++++++
 ...rspace-headers-for-ax25-instead-of-kernel.patch | 26 --------
 ...002-fix-build-when_USE_BPF-is-not-defined.patch | 72 ----------------------
 .../0003-Check-for-bpf-attr-map-flags.patch        | 60 ------------------
 ...4-get_syscall_entry-remove-SYSCALL_OFFSET.patch | 44 -------------
 ...ix-cross-compile-detection-of-broken-ipv6.patch | 49 ---------------
 ...06-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch | 40 ------------
 package/trinity/Config.in                          |  6 +-
 package/trinity/trinity.hash                       |  3 +-
 package/trinity/trinity.mk                         |  2 +-
 10 files changed, 66 insertions(+), 297 deletions(-)
 create mode 100644 package/trinity/0001-compat-handle-removed-autofs-macros.patch
 delete mode 100644 package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
 delete mode 100644 package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
 delete mode 100644 package/trinity/0003-Check-for-bpf-attr-map-flags.patch
 delete mode 100644 package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
 delete mode 100644 package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch
 delete mode 100644 package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch

diff --git a/package/trinity/0001-compat-handle-removed-autofs-macros.patch b/package/trinity/0001-compat-handle-removed-autofs-macros.patch
new file mode 100644
index 000000000000..e3c6ee3b54e9
--- /dev/null
+++ b/package/trinity/0001-compat-handle-removed-autofs-macros.patch
@@ -0,0 +1,61 @@
+From e4f31d5a1ce65974c2a6b2e6e1a2b16fffc51518 Mon Sep 17 00:00:00 2001
+From: Jiri Slaby <jslaby@suse.cz>
+Date: Tue, 28 Nov 2017 10:15:22 +0100
+Subject: [PATCH] compat: handle removed autofs macros
+
+In file included from ioctls/autofs.c:4:0:
+ioctls/autofs.c:241:8: error: 'AUTOFS_IOC_EXPIRE_INDIRECT' undeclared here (not in a function); did you mean 'AUTOFS_IOC_EXPIRE_CMD'?
+  IOCTL(AUTOFS_IOC_EXPIRE_INDIRECT),
+        ^
+include/ioctls.h:53:15: note: in definition of macro 'IOCTL'
+  { .request = _request, .name = #_request, }
+               ^~~~~~~~
+ioctls/autofs.c:242:8: error: 'AUTOFS_IOC_EXPIRE_DIRECT' undeclared here (not in a function); did you mean 'AUTOFS_IOC_EXPIRE_INDIRECT'?
+  IOCTL(AUTOFS_IOC_EXPIRE_DIRECT),
+        ^
+include/ioctls.h:53:15: note: in definition of macro 'IOCTL'
+  { .request = _request, .name = #_request, }
+               ^~~~~~~~
+
+Define them as AUTOFS_IOC_EXPIRE_MULTI as they used to be.
+
+Signed-off-by: Jiri Slaby <jslaby@suse.cz>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit e4f31d5a1ce
+
+ include/compat.h | 8 ++++++++
+ ioctls/autofs.c  | 1 +
+ 2 files changed, 9 insertions(+)
+
+diff --git a/include/compat.h b/include/compat.h
+index 10065ceca5f6..fc9a1b95ac4c 100644
+--- a/include/compat.h
++++ b/include/compat.h
+@@ -1209,3 +1209,11 @@ struct kvm_get_htab_fd {
+ #ifndef SO_IP_SET
+ #define SO_IP_SET 83
+ #endif
++
++/* linux/auto_fs4.h */
++#ifndef AUTOFS_IOC_EXPIRE_INDIRECT
++#define AUTOFS_IOC_EXPIRE_INDIRECT AUTOFS_IOC_EXPIRE_MULTI
++#endif
++#ifndef AUTOFS_IOC_EXPIRE_DIRECT
++#define AUTOFS_IOC_EXPIRE_DIRECT AUTOFS_IOC_EXPIRE_MULTI
++#endif
+diff --git a/ioctls/autofs.c b/ioctls/autofs.c
+index 04a3eb811326..a39ccccc056b 100644
+--- a/ioctls/autofs.c
++++ b/ioctls/autofs.c
+@@ -8,6 +8,7 @@
+ #include "shm.h"
+ #include "syscall.h"
+ #include "utils.h"
++#include "compat.h"
+ 
+ /* include/linux/auto_dev-ioctl.h */
+ /*
+-- 
+2.15.0
+
diff --git a/package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch b/package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
deleted file mode 100644
index e077bf43f2f3..000000000000
--- a/package/trinity/0001-use-userspace-headers-for-ax25-instead-of-kernel.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d Mon Sep 17 00:00:00 2001
-From: Dave Jones <davej@codemonkey.org.uk>
-Date: Mon, 5 Dec 2016 12:46:14 -0500
-Subject: [PATCH] use userspace headers for ax25 instead of kernel.
-
-This should solve https://bugzilla.redhat.com/show_bug.cgi?id=1400720
-
-[Upstream commit: https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- net/proto-rose.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/net/proto-rose.c b/net/proto-rose.c
-index ccbf294f..b277f839 100644
---- a/net/proto-rose.c
-+++ b/net/proto-rose.c
-@@ -6,7 +6,7 @@
- #include <sys/un.h>
- #include <netinet/in.h>
- #include <bits/sockaddr.h>
--#include <linux/ax25.h> /* for ax25_address in rose.h */
-+#include <netax25/ax25.h> /* for ax25_address in rose.h */
- #include <netrose/rose.h>
- #include <stdlib.h>
- #include "net.h"
diff --git a/package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch b/package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
deleted file mode 100644
index 4fb2c690c5ce..000000000000
--- a/package/trinity/0002-fix-build-when_USE_BPF-is-not-defined.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From f447db18b389050ecc5e66dbf549d5953633e23e Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Mon, 7 Nov 2016 12:50:27 +0100
-Subject: [PATCH] fix build when USE_BPF is not defined
-
-net/bpf.o: In function `bpf_gen_filter': bpf.c:852: undefined reference to `get_rand_bpf_fd'
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-[Upstream commit: https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- net/bpf.c             | 3 +++
- syscalls/prctl.c      | 4 +++-
- syscalls/setsockopt.c | 2 ++
- 3 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/net/bpf.c b/net/bpf.c
-index 4fe94173..d6ca14bd 100644
---- a/net/bpf.c
-+++ b/net/bpf.c
-@@ -8,6 +8,7 @@
- #include <string.h>
- 
- #include "bpf.h"
-+#include "config.h"
- #include "debug.h"
- #include "log.h"
- #include "net.h"
-@@ -17,6 +18,7 @@
- #include "utils.h"
- #include "compat.h"
- 
-+#ifdef USE_BPF
- /**
-  * BPF filters are used in networking such as in pf_packet, but also
-  * in seccomp for application sand-boxing. Additionally, with arch
-@@ -885,3 +887,4 @@ void bpf_gen_filter(unsigned long **addr, unsigned long *addrlen)
- 	if (dump_bpf)
- 		bpf_disasm_all(bpf->filter, bpf->len);
- }
-+#endif
-diff --git a/syscalls/prctl.c b/syscalls/prctl.c
-index 02d2dbc6..cdbcdc21 100644
---- a/syscalls/prctl.c
-+++ b/syscalls/prctl.c
-@@ -45,9 +45,11 @@ static int prctl_opts[] = {
- #ifdef USE_SECCOMP
- static void do_set_seccomp(struct syscallrecord *rec)
- {
--	unsigned long *optval = NULL, optlen = 0;
-+	unsigned long *optval = NULL, __unused__ optlen = 0;
- 
-+#ifdef USE_BPF
- 	bpf_gen_seccomp(&optval, &optlen);
-+#endif
- 
- 	rec->a2 = SECCOMP_MODE_FILTER;
- 	rec->a3 = (unsigned long) optval;
-diff --git a/syscalls/setsockopt.c b/syscalls/setsockopt.c
-index 8189b7a8..d395e54e 100644
---- a/syscalls/setsockopt.c
-+++ b/syscalls/setsockopt.c
-@@ -48,7 +48,9 @@ static void socket_setsockopt(struct sockopt *so, __unused__ struct socket_tripl
- 	case SO_ATTACH_FILTER: {
- 		unsigned long *optval = NULL, optlen = 0;
- 
-+#ifdef USE_BPF
- 		bpf_gen_filter(&optval, &optlen);
-+#endif
- 
- 		so->optval = (unsigned long) optval;
- 		so->optlen = optlen;
diff --git a/package/trinity/0003-Check-for-bpf-attr-map-flags.patch b/package/trinity/0003-Check-for-bpf-attr-map-flags.patch
deleted file mode 100644
index ee2bc377b58a..000000000000
--- a/package/trinity/0003-Check-for-bpf-attr-map-flags.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 87427256640f806710dd97fc807a9a896147c617 Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Sat, 12 Nov 2016 00:55:35 +0000
-Subject: [PATCH] Check for bpf_attr map_flags.
-
-map_flags is not available until Linux 4.6.
-
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-[Upstream commit: https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure | 28 +++++++++++++++++++++++++++-
- 1 file changed, 27 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index ca37e4ef..18d9df73 100755
---- a/configure
-+++ b/configure
-@@ -222,6 +222,33 @@ else
- fi
- 
- #############################################################################################
-+# is /usr/include/linux/bpf.h new enough to feature bpf
-+#
-+echo -n "[*] Checking if bpf_attr can use map_flags.. "
-+rm -f "$TMP" || exit 1
-+
-+cat >"$TMP.c" << EOF
-+#include <stdio.h>
-+#include <linux/bpf.h>
-+
-+void main()
-+{
-+	union bpf_attr attr = {
-+		.map_flags = 0,
-+	};
-+}
-+EOF
-+
-+${CC} ${CFLAGS} "$TMP.c" -o "$TMP" &>"$TMP.log"
-+if [ ! -x "$TMP" ]; then
-+	echo $RED "[NO]" $COL_RESET
-+	MISSING_DEFS=1
-+else
-+	echo $GREEN "[YES]" $COL_RESET
-+	echo "#define USE_BPF 1" >> $CONFIGH
-+fi
-+
-+#############################################################################################
- 
- check_header linux/caif/caif_socket.h USE_CAIF
- check_header linux/if_alg.h USE_IF_ALG
-@@ -239,7 +266,6 @@ check_header execinfo.h USE_BACKTRACE
- check_header netatalk/at.h USE_APPLETALK
- check_header netrom/netrom.h USE_NETROM
- check_header netrose/rose.h USE_ROSE
--check_header linux/bpf.h USE_BPF
- 
- rm -f "$TMP" "$TMP.log" "$TMP.c"
- 
diff --git a/package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch b/package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
deleted file mode 100644
index 4c58d6249a0d..000000000000
--- a/package/trinity/0004-get_syscall_entry-remove-SYSCALL_OFFSET.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1d9af9d07ae111c253c92112fb50000adac47a0c Mon Sep 17 00:00:00 2001
-From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
-Date: Thu, 29 Jun 2017 12:24:10 +0200
-Subject: [PATCH] get_syscall_entry: remove SYSCALL_OFFSET
-
-0-based syscall numbers are used throughout the application and the
-SYSCALL_OFFSET is only added when invoking the syscall. It is therefore
-wrong to substract the offset in get_syscall_entry, as it leads to
-dereferencing array entries at negative offsets and segfaults.
-
-Tested on MIPS32/LE.
-This change effectively reverts cc5108ff ('make get_syscall_entry take
-SYSCALL_OFFSET into account')
-
-Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
-[Upstream commit: https://github.com/kernelslacker/trinity/commit/1d9af9d07ae111c253c92112fb50000adac47a0c]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tables.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/tables.c b/tables.c
-index e7dab85d..8090146a 100644
---- a/tables.c
-+++ b/tables.c
-@@ -673,15 +673,14 @@ int munge_tables(void)
-  */
- struct syscallentry * get_syscall_entry(unsigned int callno, bool do32)
- {
--	unsigned int offset = callno - SYSCALL_OFFSET;
- 	if (biarch == FALSE)
--		return syscalls[offset].entry;
-+		return syscalls[callno].entry;
- 
- 	/* biarch case */
- 	if (do32 == TRUE)
--		return syscalls_32bit[offset].entry;
-+		return syscalls_32bit[callno].entry;
- 	else
--		return syscalls_64bit[offset].entry;
-+		return syscalls_64bit[callno].entry;
- }
- 
- /*
diff --git a/package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch b/package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch
deleted file mode 100644
index 5bc326010d64..000000000000
--- a/package/trinity/0005-configure-fix-cross-compile-detection-of-broken-ipv6.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ac38a49a18e337fb3bc7ac8e06097e28e1e3b3f7 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 14 Apr 2017 07:43:04 +0300
-Subject: [PATCH] configure: fix cross compile detection of broken ipv6 headers
-
-Checking the content of the host ipv6.h headers is incompatible with cross
-compilation. Target headers may not be the same as the host. Do direct build
-test instead using the ${CC} (cross) compiler to detect headers issues.
-
-Define _GNU_SOURCE to make sure glibc ipv6 definitions are exposed.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: submitted upstream
-
- configure | 17 +++++++++++++++--
- 1 file changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index aa3f7f334971..8639a38eba96 100755
---- a/configure
-+++ b/configure
-@@ -51,8 +51,21 @@ echo "[*] Checking system headers."
- [ -z "$IPV6" ] && IPV6=yes
- if [[ "$IPV6" == "yes" ]]; then
- 	echo -n "[*] Checking ipv6 headers ... "
--	RET=$(grep __UAPI_DEF_IN6_PKTINFO /usr/include/linux/ipv6.h)
--	if [ -z "$RET" ]; then
-+	rm -f "$TMP" || exit 1
-+
-+	cat >"$TMP.c" << EOF
-+#include <netinet/in.h>
-+#include <netinet/ip6.h>
-+#include <linux/in6.h>
-+#include <linux/ipv6.h>
-+
-+int main()
-+{
-+	struct in6_addr test;
-+}
-+EOF
-+	${CC} ${CFLAGS} -D_GNU_SOURCE "$TMP.c" -o "$TMP" &>"$TMP.log"
-+	if [ ! -x "$TMP" ]; then
- 		echo $RED "[BROKEN]" $COL_RESET "See https://patchwork.ozlabs.org/patch/425881/"
- 	else
- 		echo $GREEN "[OK]" $COL_RESET
--- 
-2.11.0
-
diff --git a/package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch b/package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch
deleted file mode 100644
index 27c7850a01b4..000000000000
--- a/package/trinity/0006-Include-sys-io.h-for-UIO_MAXIOV-symbol.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From dd7fc8b44cc8bb8a7e9dc03aa3aa57fbefbf433b Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Tue, 20 Jun 2017 22:43:01 +0000
-Subject: [PATCH] Include sys/io.h for UIO_MAXIOV symbol.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch fixes this build error.
-
-  CC	net/proto-ipv4.o
-net/proto-ipv4.c: In function ?ip_setsockopt?:
-net/proto-ipv4.c:231:49: error: ?UIO_MAXIOV? undeclared (first use in this function); did you mean ?_IO_MAGIC??
-   so->optlen = rnd() % sizeof(unsigned long)*(2*UIO_MAXIOV+512);
-                                                 ^~~~~~~~~~
-                                                 _IO_MAGIC
-
-Upstream: https://github.com/kernelslacker/trinity/commit/dd7fc8b44cc8bb8a7e9dc03aa3aa57fbefbf433b
-
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- net/proto-ipv4.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/net/proto-ipv4.c b/net/proto-ipv4.c
-index b77364e..9ffaa5e 100644
---- a/net/proto-ipv4.c
-+++ b/net/proto-ipv4.c
-@@ -1,6 +1,7 @@
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <sys/un.h>
-+#include <sys/uio.h>
- #include <netinet/in.h>
- #include <netinet/udp.h>
- #include <stdlib.h>
--- 
-1.9.1
-
diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 0fc737e28ff4..31a930570aad 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -10,14 +10,12 @@ config BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
 config BR2_PACKAGE_TRINITY
 	bool "trinity"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # FTW_ACTIONRETVAL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # IPV6_UNICAST_IF
 	help
 	  A Linux System call fuzz tester
 
 	  http://codemonkey.org.uk/projects/trinity/
 
-comment "trinity needs a uClibc or glibc toolchain w/ headers >= 3.4"
+comment "trinity needs a toolchain w/ headers >= 3.4"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index 7f48cfaba3db..2000653336f5 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4cb2bd4049ce523fdf47490c4c18b8eb713c720d4b3b13d6ec2ae246aac908ad  trinity-1.7.tar.xz
+sha256 8cadc4221660b7accc4728311ce1a130ac9b9d1f3b04e35508ba0cc80d9c3f94  trinity-1.8.tar.xz
+sha256 35e3fc68c89fd7b8f72fd910b521cb3292f859e9181f3c26bd0df84d144bc1d4  COPYING
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 1bada39cc52f..61565d073d1a 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = 1.7
+TRINITY_VERSION = 1.8
 TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
 TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
-- 
2.15.0
