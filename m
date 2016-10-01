From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat,  1 Oct 2016 13:50:23 +0200
Subject: [Buildroot] [PATCH 2/3] ltp-testsuite: bump to version 20160920
In-Reply-To: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
References: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <1475322624-20518-2-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001-fix-uClibc-build.patch is now part of upstream so it is not
needed in Buildroot anymore. The remaining patches were just rebased and
then renumbered so that they apply cleanly to this new version.

This has been build-tested with both glibc and uClibc toolchains and
run-tested on x86_64 and aarch64.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

---
I wonder if we should really maintain the uClibc-related patches given
that even the patches themselves mention that they are not upstreamable.
This feels a bit like maintaining feature patches. If upstream adds more
changes that break uClibc, we would need to maintain that ourselves.
I'm interested in maintaining this package but if it turns out that it
eventually starts breaking for uClibc in future versions, I'd vote for
removing uClibc support for it.
---
 package/ltp-testsuite/0001-fix-uClibc-build.patch  |  51 -------
 ...disable-tirpc_auth_authdes_-create-tests.patch} |   9 +-
 .../0002-uClibc-ng-has-no-profil-support.patch     |  39 +++++
 .../0003-disable-profil-on-uClibc.patch            |  27 ----
 ...eed-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch |  84 +++++++++++
 .../0004-disable-ustat-on-uClibc.patch             |  70 ---------
 ...-unused-and-not-available-for-uClibc-ng-l.patch | 157 +++++++++++++++++++++
 package/ltp-testsuite/0005-rpc-fix-uClibc.patch    | 125 ----------------
 package/ltp-testsuite/ltp-testsuite.hash           |   8 +-
 package/ltp-testsuite/ltp-testsuite.mk             |   2 +-
 10 files changed, 292 insertions(+), 280 deletions(-)
 delete mode 100644 package/ltp-testsuite/0001-fix-uClibc-build.patch
 rename package/ltp-testsuite/{0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch => 0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch} (78%)
 create mode 100644 package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch
 delete mode 100644 package/ltp-testsuite/0003-disable-profil-on-uClibc.patch
 create mode 100644 package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch
 delete mode 100644 package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch
 create mode 100644 package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch
 delete mode 100644 package/ltp-testsuite/0005-rpc-fix-uClibc.patch

diff --git a/package/ltp-testsuite/0001-fix-uClibc-build.patch b/package/ltp-testsuite/0001-fix-uClibc-build.patch
deleted file mode 100644
index 231bc83..0000000
--- a/package/ltp-testsuite/0001-fix-uClibc-build.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-O_DIRECTORY is only available if _GNU_SOURCE is defined
-
-https://github.com/linux-test-project/ltp/pull/58
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify01.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify01.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify01.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify01.c	2016-03-05 00:55:02.977264913 +0100
-@@ -25,6 +25,7 @@
-  * DESCRIPTION
-  *     Check that fanotify work for a file
-  */
-+#define _GNU_SOURCE
- #include "config.h"
- 
- #include <stdio.h>
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify02.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify02.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify02.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify02.c	2016-03-05 00:54:44.600558612 +0100
-@@ -25,6 +25,7 @@
-  * DESCRIPTION
-  *     Check that fanotify work for children of a directory
-  */
-+#define _GNU_SOURCE
- #include "config.h"
- 
- #include <stdio.h>
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify03.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify03.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify03.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify03.c	2016-03-05 00:55:13.917685403 +0100
-@@ -25,6 +25,7 @@
-  * DESCRIPTION
-  *     Check that fanotify permission events work
-  */
-+#define _GNU_SOURCE
- #include "config.h"
- 
- #include <stdio.h>
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify04.c ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify04.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/fanotify/fanotify04.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/fanotify/fanotify04.c	2016-03-05 00:55:24.530093286 +0100
-@@ -25,6 +25,8 @@
-  * DESCRIPTION
-  *     Check various fanotify special flags
-  */
-+
-+#define _GNU_SOURCE
- #include "config.h"
- 
- #include <stdio.h>
diff --git a/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch b/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
similarity index 78%
rename from package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
rename to package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
index f69b364..344ba4a 100644
--- a/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
+++ b/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
@@ -1,4 +1,7 @@
-rpc-tirpc: disable tirpc_auth_authdes_*create tests
+From 9bbadb7ece1b068465279e7248b3439d443054a6 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Fri, 30 Sep 2016 17:43:08 +0200
+Subject: [PATCH] rpc-tirpc: disable tirpc_auth_authdes_*create tests
 
 Due to Buildroot patch 0007-Disable-DES-authentification-support.patch on
 libtirpc, this library is built without method authdes_create. Any code
@@ -9,6 +12,8 @@ just disable the problematic tests.
 
 Upstream-status: not applicable
 Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+[Erico: Rebase for ltp 20160920]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 ---
  testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile | 4 ++++
  1 file changed, 4 insertions(+)
@@ -27,5 +32,5 @@ index 45bc8a6..c04a088 100644
 +
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 -- 
-1.9.5
+2.7.4
 
diff --git a/package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch b/package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch
new file mode 100644
index 0000000..c149603
--- /dev/null
+++ b/package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch
@@ -0,0 +1,39 @@
+From 4ab7dc5fd201318e2a62dbd3ba1680b97034ec65 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Fri, 30 Sep 2016 17:45:03 +0200
+Subject: [PATCH] uClibc-ng has no profil() support
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Erico: Rebase for ltp 20160920]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ testcases/kernel/syscalls/profil/profil01.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/profil/profil01.c b/testcases/kernel/syscalls/profil/profil01.c
+index 2fc47aa..f8afd57 100644
+--- a/testcases/kernel/syscalls/profil/profil01.c
++++ b/testcases/kernel/syscalls/profil/profil01.c
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
+@@ -124,3 +127,9 @@ int main(int ac, char *av[])
+ 
+ 	tst_exit();
+ }
++#else /* systems that dont support profil */
++int main(void)
++{
++        tst_brkm(TCONF, NULL, "system doesn't have profil support");
++}
++#endif
+-- 
+2.7.4
+
diff --git a/package/ltp-testsuite/0003-disable-profil-on-uClibc.patch b/package/ltp-testsuite/0003-disable-profil-on-uClibc.patch
deleted file mode 100644
index d33b677..0000000
--- a/package/ltp-testsuite/0003-disable-profil-on-uClibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-uClibc-ng has no profil() support
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/profil/profil01.c ltp-full-20160126/testcases/kernel/syscalls/profil/profil01.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/profil/profil01.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/profil/profil01.c	2016-03-05 01:00:07.328962536 +0100
-@@ -37,6 +37,9 @@
- #define PROFIL_BUFLEN (32*1024)
- 
- char *TCID = "profil01";
-+
-+#if !defined(__UCLIBC__)
-+
- int TST_TOTAL = 1;
- 
- static volatile sig_atomic_t profil_done;
-@@ -124,3 +127,9 @@
- 
- 	tst_exit();
- }
-+#else /* systems that dont support profil */
-+int main(void)
-+{
-+        tst_brkm(TCONF, NULL, "system doesn't have profil support");
-+}
-+#endif
diff --git a/package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch b/package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch
new file mode 100644
index 0000000..14f5888
--- /dev/null
+++ b/package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch
@@ -0,0 +1,84 @@
+From bb966fd9efc3b9bec3ca72b0e72dd760434e0f10 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Fri, 30 Sep 2016 17:45:16 +0200
+Subject: [PATCH] uClibc-ng need __UCLIBC_SV4_DEPRECATED__ enabled for ustat
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Erico: Rebase for ltp 20160920]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ testcases/kernel/syscalls/ustat/ustat01.c | 12 ++++++++++++
+ testcases/kernel/syscalls/ustat/ustat02.c | 10 ++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/ustat/ustat01.c b/testcases/kernel/syscalls/ustat/ustat01.c
+index 494647b..35e0bb1 100644
+--- a/testcases/kernel/syscalls/ustat/ustat01.c
++++ b/testcases/kernel/syscalls/ustat/ustat01.c
+@@ -21,7 +21,9 @@
+ 
+ #include <unistd.h>
+ #include <errno.h>
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
+ #include <sys/ustat.h>
++#endif
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include "test.h"
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
+@@ -79,3 +84,10 @@ static void setup(void)
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
+diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
+index edada31..795c605 100644
+--- a/testcases/kernel/syscalls/ustat/ustat02.c
++++ b/testcases/kernel/syscalls/ustat/ustat02.c
+@@ -22,7 +22,9 @@
+ 
+ #include <unistd.h>
+ #include <errno.h>
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
+ #include <sys/ustat.h>
++#endif
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include "test.h"
+@@ -32,6 +34,8 @@ static void setup(void);
+ 
+ char *TCID = "ustat02";
+ 
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
++
+ static dev_t invalid_dev = -1;
+ static dev_t root_dev;
+ struct ustat ubuf;
+@@ -101,3 +105,9 @@ static void setup(void)
+ 
+ 	root_dev = buf.st_dev;
+ }
++#else /* systems that dont support ustat */
++int main(void)
++{
++        tst_brkm(TCONF, NULL, "system doesn't have ustat support");
++}
++#endif
+-- 
+2.7.4
+
diff --git a/package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch b/package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch
deleted file mode 100644
index 7a1f017..0000000
--- a/package/ltp-testsuite/0004-disable-ustat-on-uClibc.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-uClibc-ng need __UCLIBC_SV4_DEPRECATED__ enabled for ustat
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat01.c ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat01.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat01.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat01.c	2016-03-05 01:15:39.492789841 +0100
-@@ -20,7 +20,9 @@
-  */
- 
- #include <unistd.h>
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
- #include <ustat.h>
-+#endif
- #include <errno.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -30,6 +32,9 @@
- static void setup(void);
- 
- char *TCID = "ustat01";
-+
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
-+
- int TST_TOTAL = 1;
- 
- static dev_t dev_num;
-@@ -79,3 +84,10 @@
- 
- 	dev_num = buf.st_dev;
- }
-+#else /* systems that dont support ustat */
-+int main(void)
-+{
-+        tst_brkm(TCONF, NULL, "system doesn't have ustat support");
-+}
-+#endif
-+
-diff -Nur ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat02.c ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat02.c
---- ltp-full-20160126.orig/testcases/kernel/syscalls/ustat/ustat02.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/kernel/syscalls/ustat/ustat02.c	2016-03-05 01:15:55.677411889 +0100
-@@ -21,7 +21,9 @@
-  */
- 
- #include <unistd.h>
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
- #include <ustat.h>
-+#endif
- #include <errno.h>
- #include <sys/stat.h>
- #include <sys/types.h>
-@@ -32,6 +34,8 @@
- 
- char *TCID = "ustat02";
- 
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
-+
- static dev_t invalid_dev = -1;
- static dev_t root_dev;
- struct ustat ubuf;
-@@ -101,3 +105,9 @@
- 
- 	root_dev = buf.st_dev;
- }
-+#else /* systems that dont support ustat */
-+int main(void)
-+{
-+        tst_brkm(TCONF, NULL, "system doesn't have ustat support");
-+}
-+#endif
diff --git a/package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch b/package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch
new file mode 100644
index 0000000..fc3dce9
--- /dev/null
+++ b/package/ltp-testsuite/0004-rusers.h-is-unused-and-not-available-for-uClibc-ng-l.patch
@@ -0,0 +1,157 @@
+From 780bec6c2742231ca73d4dee51c727815cf857b3 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Fri, 30 Sep 2016 17:45:31 +0200
+Subject: [PATCH] rusers.h is unused and not available for uClibc-ng / libtirpc
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Erico: Rebase for ltp 20160920]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ .../tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c    | 1 -
+ .../rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c         | 1 -
+ .../rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c         | 1 -
+ .../rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c   | 1 -
+ .../rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c  | 1 -
+ .../rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c     | 1 -
+ .../rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c     | 1 -
+ .../rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c      | 1 -
+ .../rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c   | 1 -
+ .../rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c  | 1 -
+ .../rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c     | 1 -
+ 11 files changed, 11 deletions(-)
+
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
+index 7f157e1..728c023 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
+index d9a3111..8d80a5e 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
+index cabffc7..a4d1d6f 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
+index 4f10466..863aec7 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
+index 290f357..e849468 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
+index 55bac16..8c1800b 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
+index 09d1bf9..384a00d 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
+index 3e15306..285eb21 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
+index a7030a2..1f2690a 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
+index 06f4740..faa8ef6 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
+index ca38aa0..974f5fb 100644
+--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
++++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
+@@ -30,7 +30,6 @@
+ #include <time.h>
+ #include <rpc/rpc.h>
+ #include <sys/socket.h>
+-#include <rpcsvc/rusers.h>
+ #include <utmp.h>
+ #include <sys/time.h>
+ #include <netdb.h>
+-- 
+2.7.4
+
diff --git a/package/ltp-testsuite/0005-rpc-fix-uClibc.patch b/package/ltp-testsuite/0005-rpc-fix-uClibc.patch
deleted file mode 100644
index 1d9152b..0000000
--- a/package/ltp-testsuite/0005-rpc-fix-uClibc.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-rusers.h is unused and not available for uClibc-ng / libtirpc
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_auth_destroy/rpc_auth_destroy.c	2016-03-05 02:16:56.274105305 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authnone_create/rpc_authnone_create.c	2016-03-05 02:16:32.641196984 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create/rpc_authunix_create.c	2016-03-05 02:21:09.831850681 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_auth_authunix_create_default/rpc_authunix_create_default.c	2016-03-05 02:18:57.370759601 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create.c	2016-03-05 02:23:32.113319210 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_limits.c	2016-03-05 02:23:39.221592413 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clnttcp_create/rpc_clnttcp_create_stress.c	2016-03-05 02:23:48.565951560 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate.c	2016-03-05 02:23:56.706264429 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_bufcreate/rpc_clntudp_bufcreate_limits.c	2016-03-05 02:24:03.818537786 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create.c	2016-03-05 02:24:10.518795308 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
-diff -Nur ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c
---- ltp-full-20160126.orig/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c	2016-01-26 13:35:25.000000000 +0100
-+++ ltp-full-20160126/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_clntudp_create/rpc_clntudp_create_stress.c	2016-03-05 02:24:20.095163371 +0100
-@@ -30,7 +30,6 @@
- #include <time.h>
- #include <rpc/rpc.h>
- #include <sys/socket.h>
--#include <rpcsvc/rusers.h>
- #include <utmp.h>
- #include <sys/time.h>
- #include <netdb.h>
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index f3c1be5..a6041e6 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20160126/ltp-full-20160126.tar.xz.md5
-md5 fc3b7411cdf17b2608e26c05d36fc26a  ltp-full-20160126.tar.xz
-# From: https://github.com/linux-test-project/ltp/releases/download/20160126/ltp-full-20160126.tar.xz.sha1
-sha1 a39c9b05edb942cde23a1f7fa08289a5e427fa04  ltp-full-20160126.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20160920/ltp-full-20160920.tar.xz.md5
+md5 d1d5b7389d209fe0afca16d8d73a8357  ltp-full-20160920.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20160920/ltp-full-20160920.tar.xz.sha1
+sha1 79f3311ecbcf02f070e601745243c9757638c4ef  ltp-full-20160920.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index e97659e..4f325ba 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20160126
+LTP_TESTSUITE_VERSION = 20160920
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
-- 
2.7.4
