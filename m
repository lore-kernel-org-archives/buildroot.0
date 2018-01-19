From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 19 Jan 2018 09:58:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Bump to version
 20180118
Message-ID: <20180119085826.1673-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ removed 3 patches accepted upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../0002-uClibc-ng-has-no-profil-support.patch     | 39 ----------
 ...eed-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch | 84 ----------------------
 .../0004-syscalls-mknodat-Fix-missing-config.patch | 28 --------
 package/ltp-testsuite/ltp-testsuite.hash           |  4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  2 +-
 5 files changed, 3 insertions(+), 154 deletions(-)
 delete mode 100644 package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch
 delete mode 100644 package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch
 delete mode 100644 package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch

diff --git a/package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch b/package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch
deleted file mode 100644
index c1496037c1..0000000000
--- a/package/ltp-testsuite/0002-uClibc-ng-has-no-profil-support.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4ab7dc5fd201318e2a62dbd3ba1680b97034ec65 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Fri, 30 Sep 2016 17:45:03 +0200
-Subject: [PATCH] uClibc-ng has no profil() support
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Erico: Rebase for ltp 20160920]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- testcases/kernel/syscalls/profil/profil01.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/profil/profil01.c b/testcases/kernel/syscalls/profil/profil01.c
-index 2fc47aa..f8afd57 100644
---- a/testcases/kernel/syscalls/profil/profil01.c
-+++ b/testcases/kernel/syscalls/profil/profil01.c
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
-@@ -124,3 +127,9 @@ int main(int ac, char *av[])
- 
- 	tst_exit();
- }
-+#else /* systems that dont support profil */
-+int main(void)
-+{
-+        tst_brkm(TCONF, NULL, "system doesn't have profil support");
-+}
-+#endif
--- 
-2.7.4
-
diff --git a/package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch b/package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch
deleted file mode 100644
index 14f5888ded..0000000000
--- a/package/ltp-testsuite/0003-uClibc-ng-need-__UCLIBC_SV4_DEPRECATED__-enabled-for.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From bb966fd9efc3b9bec3ca72b0e72dd760434e0f10 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Fri, 30 Sep 2016 17:45:16 +0200
-Subject: [PATCH] uClibc-ng need __UCLIBC_SV4_DEPRECATED__ enabled for ustat
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Erico: Rebase for ltp 20160920]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- testcases/kernel/syscalls/ustat/ustat01.c | 12 ++++++++++++
- testcases/kernel/syscalls/ustat/ustat02.c | 10 ++++++++++
- 2 files changed, 22 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/ustat/ustat01.c b/testcases/kernel/syscalls/ustat/ustat01.c
-index 494647b..35e0bb1 100644
---- a/testcases/kernel/syscalls/ustat/ustat01.c
-+++ b/testcases/kernel/syscalls/ustat/ustat01.c
-@@ -21,7 +21,9 @@
- 
- #include <unistd.h>
- #include <errno.h>
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
- #include <sys/ustat.h>
-+#endif
- #include <sys/types.h>
- #include <sys/stat.h>
- #include "test.h"
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
-@@ -79,3 +84,10 @@ static void setup(void)
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
-diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
-index edada31..795c605 100644
---- a/testcases/kernel/syscalls/ustat/ustat02.c
-+++ b/testcases/kernel/syscalls/ustat/ustat02.c
-@@ -22,7 +22,9 @@
- 
- #include <unistd.h>
- #include <errno.h>
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
- #include <sys/ustat.h>
-+#endif
- #include <sys/stat.h>
- #include <sys/types.h>
- #include "test.h"
-@@ -32,6 +34,8 @@ static void setup(void);
- 
- char *TCID = "ustat02";
- 
-+#if !defined(__UCLIBC__) || defined(__UCLIBC_SV4_DEPRECATED__)
-+
- static dev_t invalid_dev = -1;
- static dev_t root_dev;
- struct ustat ubuf;
-@@ -101,3 +105,9 @@ static void setup(void)
- 
- 	root_dev = buf.st_dev;
- }
-+#else /* systems that dont support ustat */
-+int main(void)
-+{
-+        tst_brkm(TCONF, NULL, "system doesn't have ustat support");
-+}
-+#endif
--- 
-2.7.4
-
diff --git a/package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch b/package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch
deleted file mode 100644
index d315a948a9..0000000000
--- a/package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0ee59c66f4e4930d543395fb8617e26cf8b22025 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Thu, 7 Dec 2017 17:37:01 +0100
-Subject: [PATCH] syscalls/mknodat: Fix missing config
-
-Found by buildroot project, where this broke build on uClibc-ng, thanks!
-http://autobuild.buildroot.net/results/6c0506423c76b61018da26c2549570e3d9eb5763/build-end.log
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
----
- testcases/kernel/syscalls/mknodat/mknodat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/syscalls/mknodat/mknodat.h b/testcases/kernel/syscalls/mknodat/mknodat.h
-index 577d5ac9c..b4e828c5d 100644
---- a/testcases/kernel/syscalls/mknodat/mknodat.h
-+++ b/testcases/kernel/syscalls/mknodat/mknodat.h
-@@ -22,6 +22,7 @@
- #define MKNODAT_H
- 
- #include <sys/types.h>
-+#include "config.h"
- #include "lapi/syscalls.h"
- 
- #if !defined(HAVE_MKNODAT)
--- 
-2.15.0
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 42feaade27..d75d204385 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20170929/ltp-full-20170929.tar.xz.sha1
-sha1 a170db3bc7203c9a998a277a369e7020dc61a382  ltp-full-20170929.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20180118/ltp-full-20180118.tar.xz.sha1
+sha1 2e643f1e29cd89efc8059729f60237a427fd409e  ltp-full-20180118.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index bbeee5b23d..87854568d8 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20170929
+LTP_TESTSUITE_VERSION = 20180118
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
-- 
2.15.1
