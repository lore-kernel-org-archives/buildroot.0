From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:55:52 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: update to latest,
	fix uClibc-ng issues
Message-ID: <20160305135923.8021E80649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f82fe9751d813e9f75b8332ad8cd64ce24ec463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to latest ltp-testsuite release, which resolves sparc64/sparc
autobuild failures:
http://autobuild.buildroot.net/results/a6445df26514dfa9cd7e5b9d34b4687d46a8d19b/

Furthermore it should fix any other uClibc-ng related issues.
0001-fix-build-on-uClibc-exp10.patch removed, as uClibc-ng 1.0.12
contains exp10() implementation.
0001-fix-uClibc-build.patch suggested upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-build-on-uClibc-exp10.patch           |  22 ----
 package/ltp-testsuite/0001-fix-uClibc-build.patch  |  51 +++++++++
 .../0003-disable-profil-on-uClibc.patch            |  27 +++++
 .../0004-disable-ustat-on-uClibc.patch             |  70 ++++++++++++
 package/ltp-testsuite/0005-rpc-fix-uClibc.patch    | 125 +++++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.hash           |   8 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  13 ++-
 7 files changed, 289 insertions(+), 27 deletions(-)

diff --git a/package/ltp-testsuite/0001-fix-build-on-uClibc-exp10.patch b/package/ltp-testsuite/0001-fix-build-on-uClibc-exp10.patch
deleted file mode 100644
index 7a02d95..0000000
--- a/package/ltp-testsuite/0001-fix-build-on-uClibc-exp10.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
-
-exp10 extension is not part of uClibc, so compute it.
-
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
-diff -purN ltp-testsuite-20101031.orig/testcases/realtime/lib/libstats.c ltp-testsuite-20101031/testcases/realtime/lib/libstats.c
---- ltp-testsuite-20101031.orig/testcases/realtime/lib/libstats.c	2012-10-22 23:19:02.306646174 +0200
-+++ ltp-testsuite-20101031/testcases/realtime/lib/libstats.c	2012-10-22 23:25:41.554847766 +0200
-@@ -46,6 +46,11 @@
- #include <libstats.h>
- #include <librttest.h>
- 
-+#ifdef __UCLIBC__
-+/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
-+#define exp10(x) (exp((x) * log(10)))
-+#endif /* __UCLIBC__ */
-+
- int save_stats = 0;
- 
- /* static helper functions */
diff --git a/package/ltp-testsuite/0001-fix-uClibc-build.patch b/package/ltp-testsuite/0001-fix-uClibc-build.patch
new file mode 100644
index 0000000..231bc83
--- /dev/null
+++ b/package/ltp-testsuite/0001-fix-uClibc-build.patch
@@ -0,0 +1,51 @@
+O_DIRECTORY is only available if _GNU_SOURCE is defined
+
+https://github.com/linux-test-project/ltp/pull/58
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify01.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify01.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify01.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify01.c	2016-03-05 00:55:02.977264913 +0100
+@@ -25,6 +25,7 @@
+  * DESCRIPTION
+  *     Check that fanotify work for a file
+  */
++#define _GNU_SOURCE
+ #include "config.h"
+ 
+ #include <stdio.h>
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify02.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify02.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify02.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify02.c	2016-03-05 00:54:44.600558612 +0100
+@@ -25,6 +25,7 @@
+  * DESCRIPTION
+  *     Check that fanotify work for children of a directory
+  */
++#define _GNU_SOURCE
+ #include "config.h"
+ 
+ #include <stdio.h>
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify03.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify03.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify03.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify03.c	2016-03-05 00:55:13.917685403 +0100
+@@ -25,6 +25,7 @@
+  * DESCRIPTION
+  *     Check that fanotify permission events work
+  */
++#define _GNU_SOURCE
+ #include "config.h"
+ 
+ #include <stdio.h>
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify04.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify04.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify04.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify04.c	2016-03-05 00:55:24.530093286 +0100
+@@ -25,6 +25,8 @@
+  * DESCRIPTION
+  *     Check various fanotify special flags
+  */
++
++#define _GNU_SOURCE
+ #include "config.h"
+ 
+ #include <stdio.h>
diff --git a/package/ltp-testsuite/0003-disable-profil-on-uClibc.patch b/package/ltp-testsuite/0003-disable-profil-on-uClibc.patch
new file mode 100644
index 0000000..d33b677
--- /dev/null
+++ b/package/ltp-testsuite/0003-disable-profil-on-uClibc.patch
@@ -0,0 +1,27 @@
+uClibc-ng has no profil() support
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/profil/profil01.c ltp-full-20160126/testcases/kernel/syscalls/profil/profil01.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/profil/profil01.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/profil/profil01.c	2016-03-05 01:00:07.328962536 +0100
+@@ -37,6 +37,9 @@
+ #define PROFIL_BUFLEN (32*1024)
+ 
+ char *TCID = "profil01";
++
++#if !defined(__UCLIBC__)
++
+ int TST_TOTAL = 1;
+ 
+ static volatile sig_atomic_t profil_done;
+@@ -124,3 +127,9 @@
+ 
+ 	tst_exit();
+ }
++#else /* systems that dont support profil */
++int main(void)
++{
++        tst_brkm(TCONF, NULL, "system doesn't have profil support");
++}
++#endif
diff --git a/package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch b/package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch
new file mode 100644
index 0000000..7a1f017
--- /dev/null
+++ b/package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch
@@ -0,0 +1,70 @@
+uClibc-ng need __UCLIBC_SV4_DEPRECATED__ enabled for ustat
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat01.c ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat01.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat01.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat01.c	2016-03-05 01:15:39.492789841 +0100
+@@ -20,7 +20,9 @@
+  */
+ 
+ #include <unistd.h>
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
+ #include <ustat.h>
++#endif
+ #include <errno.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -30,6 +32,9 @@
+ static void setup(void);
+ 
+ char *TCID = "ustat01";
++
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
++
+ int TST_TOTAL = 1;
+ 
+ static dev_t dev_num;
+@@ -79,3 +84,10 @@
+ 
+ 	dev_num = buf.st_dev;
+ }
++#else /* systems that dont support ustat */
++int main(void)
++{
++        tst_brkm(TCONF, NULL, "system doesn't have ustat support");
++}
++#endif
++
+diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat02.c ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat02.c
+--- ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat02.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat02.c	2016-03-05 01:15:55.677411889 +0100
+@@ -21,7 +21,9 @@
+  */
+ 
+ #include <unistd.h>
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
+ #include <ustat.h>
++#endif
+ #include <errno.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+@@ -32,6 +34,8 @@
+ 
+ char *TCID = "ustat02";
+ 
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
++
+ static dev_t invalid_dev = -1;
+ static dev_t root_dev;
+ struct ustat ubuf;
+@@ -101,3 +105,9 @@
+ 
+ 	root_dev = buf.st_dev;
+ }
++#else /* systems that dont support ustat */
++int main(void)
++{
++        tst_brkm(TCONF, NULL, "system doesn't have ustat support");
++}
++#endif
diff --git a/package/ltp-testsuite/0005-rpc-fix-uClibc.patch b/package/ltp-testsuite/0005-rpc-fix-uClibc.patch
new file mode 100644
index 0000000..1d9152b
--- /dev/null
+++ b/package/ltp-testsuite/0005-rpc-fix-uClibc.patch
@@ -0,0 +1,125 @@
+rusers.h is unused and not available for uClibc-ng / libtirpc
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c	2016-03-05 02:16:56.274105305 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c	2016-03-05 02:16:32.641196984 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c	2016-03-05 02:21:09.831850681 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c	2016-03-05 02:18:57.370759601 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c	2016-03-05 02:23:32.113319210 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c	2016-03-05 02:23:39.221592413 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c	2016-03-05 02:23:48.565951560 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c	2016-03-05 02:23:56.706264429 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c	2016-03-05 02:24:03.818537786 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c	2016-03-05 02:24:10.518795308 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
+--- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c	2016-01-26 13:35:25.000000000 +0100
++++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c	2016-03-05 02:24:20.095163371 +0100
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index d60b8a4..f3c1be5 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20150903/ltp-full-20150903.tar.xz.md5
-md5 4ee849923b69f79b5208e71f3ed20484  ltp-full-20150903.tar.xz
-# From: https://github.com/linux-test-project/ltp/releases/download/20150903/ltp-full-20150903.tar.xz.sha1
-sha1 d39bb3a41bfd1fd584703cf066fb2e935af0c00a  ltp-full-20150903.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20160126/ltp-full-20160126.tar.xz.md5
+md5 fc3b7411cdf17b2608e26c05d36fc26a  ltp-full-20160126.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20160126/ltp-full-20160126.tar.xz.sha1
+sha1 a39c9b05edb942cde23a1f7fa08289a5e427fa04  ltp-full-20160126.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index e081cfa..81b1d87 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20150903
+LTP_TESTSUITE_VERSION = 20160126
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
@@ -38,4 +38,15 @@ LTP_TESTSUITE_CONF_ENV += \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
+# Requires uClibc fts and bessel support, normally not enabled
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+define LTP_TESTSUITE_REMOVE_UNSUPPORTED
+        rm -rf $(@D)/testcases/kernel/controllers/cpuset/
+        rm -rf $(@D)/testcases/misc/math/float/bessel/
+        rm -f $(@D)/testcases/misc/math/float/float_bessel.c
+endef
+LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
+endif
+
+
 $(eval $(autotools-package))
