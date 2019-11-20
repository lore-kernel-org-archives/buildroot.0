From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 22:00:24 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: backport 3 more
 musl related patches
Message-ID: <20191120211813.72AB48E4BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eee5e432ed5f1adcd79bf900f1ed8bc5bc766bab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch is fixing
following reports (other 2 has not been reported due previous)

Fixes:
http://autobuild.buildroot.net/results/a38a5d8deaa365f73db427911df68dd10c6930a6
http://autobuild.buildroot.net/results/dfa173caea08876ab69dd959da146b75750cdd28
http://autobuild.buildroot.net/results/1e602f1574e9134a44d5d66838e7851b38e8069a
http://autobuild.buildroot.net/results/f1b4b129ec94795b2144b4501b4301fb20892e71

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tils-compat_16-Always-include-sys-fsuid.h.patch |  52 +++
 ...v4-acl-Remove-unneeded-malloc-sizeof-FILE.patch |  37 +++
 .../0010-Replace-bzero-with-memset.patch           | 351 +++++++++++++++++++++
 3 files changed, 440 insertions(+)

diff --git a/package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch b/package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch
new file mode 100644
index 0000000000..04d47709e9
--- /dev/null
+++ b/package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch
@@ -0,0 +1,52 @@
+From 7b614a0c352fdaae883b0409a94c68bf06bfe914 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sun, 17 Nov 2019 11:40:26 +0100
+Subject: [PATCH] utils/compat_16: Always include <sys/fsuid.h>
+
+All major implementations have setfsuid() declaration in <sys/fsuid.h>.
+This fixes build on musl and (probably) on uclibc).
+
+NOTE: maybe we should guard presence of <sys/fsuid.h> with autotools,
+but we're not doing that for other it's uses.
+
+Fixes: 0e7a99b53 ("setfsgid, setfsuid: clean up and 16-bit version
+fixes")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: 7b614a0c352fdaae883b0409a94c68bf06bfe914]
+---
+ testcases/kernel/syscalls/utils/compat_16.h     | 2 --
+ testcases/kernel/syscalls/utils/compat_tst_16.h | 2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/utils/compat_16.h b/testcases/kernel/syscalls/utils/compat_16.h
+index 5b0338d38..75d5d2d28 100644
+--- a/testcases/kernel/syscalls/utils/compat_16.h
++++ b/testcases/kernel/syscalls/utils/compat_16.h
+@@ -24,9 +24,7 @@
+ 
+ #include <errno.h>
+ #include <grp.h>
+-#if defined(__GLIBC__) || defined(__ANDROID__)
+ #include <sys/fsuid.h>
+-#endif
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
+diff --git a/testcases/kernel/syscalls/utils/compat_tst_16.h b/testcases/kernel/syscalls/utils/compat_tst_16.h
+index 3b86ef3e3..09fa8b0d8 100644
+--- a/testcases/kernel/syscalls/utils/compat_tst_16.h
++++ b/testcases/kernel/syscalls/utils/compat_tst_16.h
+@@ -21,9 +21,7 @@
+ 
+ #include <errno.h>
+ #include <grp.h>
+-#if defined(__GLIBC__) || defined(__ANDROID__)
+ #include <sys/fsuid.h>
+-#endif
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
+-- 
+2.23.0
+
diff --git a/package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch b/package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch
new file mode 100644
index 0000000000..045fb814c8
--- /dev/null
+++ b/package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch
@@ -0,0 +1,37 @@
+From 7eae073fda17a94a36893337b5a5d639024d571c Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sun, 17 Nov 2019 12:53:22 +0100
+Subject: [PATCH] nfsv4/acl: Remove unneeded malloc(sizeof(FILE))
+
+FILE incomplete type under musl (comply C11 [1]).
+malloc(sizeof(FILE)) is not needed anyway, thus remove.
+
+This fixes build on musl (at least):
+acl1.c:51:23: error: invalid application of 'sizeof' to incomplete type 'FILE' {aka 'struct _IO_FILE'}
+  fptr = malloc(sizeof(FILE));
+
+Fixes: 618fd23eb ("Initial add of acl testsuite from Bull")
+
+[1] https://www.openwall.com/lists/musl/2019/01/16/1
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: 7eae073fda17a94a36893337b5a5d639024d571c]
+---
+ testcases/network/nfsv4/acl/acl1.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/acl1.c
+index bdf0180da..aae9484e5 100644
+--- a/testcases/network/nfsv4/acl/acl1.c
++++ b/testcases/network/nfsv4/acl/acl1.c
+@@ -48,7 +48,6 @@ int do_file_op(char *filename)
+ 	result = 0;
+ 	FILE *fptr;
+ 	char str[256] = "./";
+-	fptr = malloc(sizeof(FILE));
+ 
+ 	uid = geteuid();
+ 	strcat(str, filename);
+-- 
+2.23.0
+
diff --git a/package/ltp-testsuite/0010-Replace-bzero-with-memset.patch b/package/ltp-testsuite/0010-Replace-bzero-with-memset.patch
new file mode 100644
index 0000000000..90e30e293e
--- /dev/null
+++ b/package/ltp-testsuite/0010-Replace-bzero-with-memset.patch
@@ -0,0 +1,351 @@
+From cceadfb997513fa71c2ae35fb5e09073175c077f Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sun, 17 Nov 2019 13:52:30 +0100
+Subject: [PATCH] Replace bzero() with memset()
+
+bzero() is deprecated.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: cceadfb997513fa71c2ae35fb5e09073175c077f]
+---
+ lib/tlibio.c                                    |  2 +-
+ testcases/kernel/fs/read_all/read_all.c         |  3 ++-
+ .../kernel/hotplug/memory_hotplug/memtoy.c      |  2 +-
+ .../kernel/syscalls/epoll_ctl/epoll_ctl01.c     |  4 ++--
+ .../kernel/syscalls/epoll_wait/epoll_wait01.c   |  3 +--
+ .../tirpc_simple_rpc_call/tirpc_rpc_call.c      |  1 +
+ .../tirpc_rpc_call_performance.c                |  1 +
+ .../tirpc_rpc_call_stress.c                     |  1 +
+ .../rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c  |  1 +
+ .../tests_pack/tirpc_svc_11/tirpc_svc_11.c      |  1 +
+ .../tests_pack/tirpc_svc_3/tirpc_svc_3.c        |  1 +
+ .../tests_pack/tirpc_svc_4/tirpc_svc_4.c        |  1 +
+ .../tests_pack/tirpc_svc_5/tirpc_svc_5.c        |  1 +
+ .../tests_pack/tirpc_svc_6/tirpc_svc_6.c        |  1 +
+ .../tests_pack/tirpc_svc_7/tirpc_svc_7.c        |  1 +
+ .../tests_pack/tirpc_svc_8/tirpc_svc_8.c        |  1 +
+ .../tests_pack/tirpc_svc_9/tirpc_svc_9.c        |  1 +
+ utils/sctp/func_tests/test_getname.c            | 17 ++++++++---------
+ 18 files changed, 27 insertions(+), 16 deletions(-)
+
+diff --git a/lib/tlibio.c b/lib/tlibio.c
+index 8b30d591d..cc110d1c9 100644
+--- a/lib/tlibio.c
++++ b/lib/tlibio.c
+@@ -105,7 +105,7 @@
+ #else
+ /* for linux or sgi */
+ #include <sys/uio.h>		/* readv(2)/writev(2) */
+-#include <string.h>		/* bzero */
++#include <string.h>
+ #endif
+ #if defined(__linux__) || defined(__sun) || defined(__hpux) || defined(_AIX)
+ #if !defined(UCLINUX) && !defined(__UCLIBC__)
+diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
+index 68fc7d031..47f853223 100644
+--- a/testcases/kernel/fs/read_all/read_all.c
++++ b/testcases/kernel/fs/read_all/read_all.c
+@@ -31,6 +31,7 @@
+ #include <lapi/fnmatch.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <dirent.h>
+ #include <errno.h>
+ #include <unistd.h>
+@@ -287,7 +288,7 @@ static void spawn_workers(void)
+ 	int i;
+ 	struct worker *wa = workers;
+ 
+-	bzero(workers, worker_count * sizeof(*workers));
++	memset(workers, 0, worker_count * sizeof(*workers));
+ 
+ 	for (i = 0; i < worker_count; i++) {
+ 		wa[i].q = queue_init();
+diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
+index 0707a9c8c..8ac9600de 100644
+--- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
++++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
+@@ -367,7 +367,7 @@ void touch_memory(bool rw, unsigned long *memp, size_t memlen)
+ void init_glctx(glctx_t * gcp)
+ {
+ 
+-	bzero(gcp, sizeof(glctx_t));
++	memset(gcp, 0, sizeof(glctx_t));
+ 
+ 	gcp->pagesize = (size_t) sysconf(_SC_PAGESIZE);
+ 
+diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
+index 1f81c3a26..e199ac6ac 100644
+--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
++++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
+@@ -21,7 +21,7 @@
+ 
+ #include <sys/epoll.h>
+ #include <poll.h>
+-#include <strings.h>
++#include <string.h>
+ #include <errno.h>
+ #include "tst_test.h"
+ 
+@@ -88,7 +88,7 @@ static void check_epoll_ctl(int opt, int exp_num)
+ 
+ 	while (events) {
+ 		int events_matched = 0;
+-		bzero(res_evs, sizeof(res_evs));
++		memset(res_evs, 0, sizeof(res_evs));
+ 
+ 		res = epoll_wait(epfd, res_evs, 2, -1);
+ 		if (res <= 0) {
+diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
+index 9c13e2e5c..ad9126aaf 100644
+--- a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
++++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
+@@ -14,7 +14,6 @@
+ #include <sys/epoll.h>
+ #include <poll.h>
+ #include <string.h>
+-#include <strings.h>
+ #include <errno.h>
+ 
+ #include "tst_test.h"
+@@ -181,7 +180,7 @@ static void verify_epollio(void)
+ 	while (events) {
+ 		int events_matched = 0;
+ 
+-		bzero(ret_evs, sizeof(ret_evs));
++		memset(ret_evs, 0, sizeof(ret_evs));
+ 		TEST(epoll_wait(epfd, ret_evs, 2, -1));
+ 
+ 		if (TST_RET <= 0) {
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
+index 257b108cc..1dc533d0c 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
+@@ -27,6 +27,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <time.h>
+ #include <errno.h>
+ #include "lapi/rpc.h"
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
+index 357d9d18d..1a609751a 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
+@@ -27,6 +27,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <sys/time.h>
+ #include "lapi/rpc.h"
+ 
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
+index 56b5ddb57..264e24c45 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
+@@ -27,6 +27,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <time.h>
+ #include <errno.h>
+ #include "lapi/rpc.h"
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
+index 877db2af9..a2d18cc43 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <rpc/rpc.h>
+ #include <utmp.h>
+ 
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
+index a93e831d0..121ae97e8 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <netinet/in.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
+index e20b9b4bb..c28f412fc 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include "lapi/rpc.h"
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
+index 02d745c6a..566b6fcf6 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include "lapi/rpc.h"
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
+index 36003cb4f..ebf577717 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
+@@ -27,6 +27,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <netinet/in.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
+index 71a475373..1dd421e1c 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <pthread.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
+index ea141f4ef..559ef7f97 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <netinet/in.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
+index 6c1c37bac..fd516e4dd 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <pthread.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
+index a000ba265..2fd9b4fc9 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
+@@ -26,6 +26,7 @@
+ */
+ 
+ #include <stdio.h>
++#include <string.h>
+ #include <pthread.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+diff --git a/utils/sctp/func_tests/test_getname.c b/utils/sctp/func_tests/test_getname.c
+index ffc47357c..f7070a34a 100644
+--- a/utils/sctp/func_tests/test_getname.c
++++ b/utils/sctp/func_tests/test_getname.c
+@@ -41,7 +41,6 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <strings.h>
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+@@ -92,7 +91,7 @@ main(int argc, char *argv[])
+         svr_sk = test_socket(pf_class, SOCK_STREAM, IPPROTO_SCTP);
+ 	test_bind(svr_sk, &svr_loop.sa, sizeof(svr_loop));
+ 
+-	bzero(&svr_local_addr, sizeof(svr_local_addr));
++	memset(&svr_local_addr, 0, sizeof(svr_local_addr));
+ 	len = sizeof(svr_local_addr);
+ 	/* Verify that getsockname() on an unconnected socket works fine. */
+ 	error = getsockname(svr_sk, (struct sockaddr *)&svr_local_addr, &len);
+@@ -101,7 +100,7 @@ main(int argc, char *argv[])
+ 
+ 	tst_resm(TPASS, "getsockname on an unconnected socket");
+ 
+-	bzero(&svr_peer_addr, sizeof(svr_peer_addr));
++	memset(&svr_peer_addr, 0, sizeof(svr_peer_addr));
+ 	len = sizeof(svr_peer_addr);
+ 	/* Verify that getpeername() on an unconnected socket fails. */
+ 	error = getpeername(svr_sk, (struct sockaddr *)&svr_peer_addr, &len);
+@@ -125,7 +124,7 @@ main(int argc, char *argv[])
+ #endif
+ 	test_connect(clt_sk, &svr_loop.sa, sizeof(svr_loop));
+ 
+-	bzero(&clt_local_addr, sizeof(clt_local_addr));
++	memset(&clt_local_addr, 0, sizeof(clt_local_addr));
+ 	len = sizeof(clt_local_addr);
+ 	/* Get the client's local address. */
+ 	error = getsockname(clt_sk, (struct sockaddr *)&clt_local_addr, &len);
+@@ -135,7 +134,7 @@ main(int argc, char *argv[])
+ 
+ 	tst_resm(TPASS, "getsockname on a connected client socket");
+ 
+-	bzero(&clt_peer_addr, sizeof(clt_peer_addr));
++	memset(&clt_peer_addr, 0, sizeof(clt_peer_addr));
+ 	len = sizeof(clt_peer_addr);
+ 	/* Get the client's peer address. */
+ 	error = getpeername(clt_sk, (struct sockaddr *)&clt_peer_addr, &len);
+@@ -149,7 +148,7 @@ main(int argc, char *argv[])
+ 	len = sizeof(accept_loop);
+ 	accept_sk = test_accept(svr_sk, &accept_loop.sa, &len); 
+ 
+-	bzero(&svr_local_addr, sizeof(svr_local_addr));
++	memset(&svr_local_addr, 0, sizeof(svr_local_addr));
+ 	len = sizeof(svr_local_addr);
+ 	/* Get the server's local address. */
+ 	error = getsockname(accept_sk, (struct sockaddr *)&svr_local_addr,
+@@ -160,7 +159,7 @@ main(int argc, char *argv[])
+ 
+ 	tst_resm(TPASS, "getsockname on a connected server socket");
+ 
+-	bzero(&svr_peer_addr, sizeof(svr_peer_addr));
++	memset(&svr_peer_addr, 0, sizeof(svr_peer_addr));
+ 	len = sizeof(svr_peer_addr);
+ 	/* Get the server's peer address. */
+ 	error = getpeername(accept_sk, (struct sockaddr *)&svr_peer_addr,
+@@ -200,7 +199,7 @@ main(int argc, char *argv[])
+ #endif
+ 	tst_resm(TPASS, "getsockname/getpeername server/client match");
+ 
+-	bzero(&clt_local_addr, sizeof(clt_local_addr));
++	memset(&clt_local_addr, 0, sizeof(clt_local_addr));
+ 	len = sizeof(clt_local_addr);
+ 	/*getsockname():  Bad socket descriptor, EBADF expected error*/
+ 	error = getsockname(-1, (struct sockaddr *)&clt_local_addr, &len);
+@@ -235,7 +234,7 @@ main(int argc, char *argv[])
+ 
+ 	tst_resm(TPASS, "getsockname with invalid buffer - EFAULT");
+  
+-	bzero(&clt_peer_addr, sizeof(clt_peer_addr));
++	memset(&clt_peer_addr, 0, sizeof(clt_peer_addr));
+ 	len = sizeof(clt_peer_addr);
+ 	/*getpeername():  Bad socket descriptor, EBADF expected error*/
+ 	error = getpeername(-1, (struct sockaddr *)&clt_local_addr, &len);
+-- 
+2.23.0
+
