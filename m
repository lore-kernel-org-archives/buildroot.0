From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:55:36 +0100
Subject: [Buildroot] [git commit] package/uclibc-ng-test: fix build with
 latest glibc
Message-ID: <20191029214929.632178D656@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f89ab5c0cf44017955ebf72c89c31df60b1b0a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are merged upstream.

Fixes:
 - http://autobuild.buildroot.net/results/f370abcc8dc12975d96a46c34db978554f8c21db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...c-test-nftw.c-fix-build-with-latest-glibc.patch | 42 +++++++++++++++++++
 ...tst-mqueue4.c-fix-build-with-latest-glibc.patch | 48 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch b/package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch
new file mode 100644
index 0000000000..2c45aeee6d
--- /dev/null
+++ b/package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch
@@ -0,0 +1,42 @@
+From de742f52d46d82db1fe1b0f3255043d48843901d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 29 Oct 2019 11:14:35 +0100
+Subject: [PATCH] test/misc/test-nftw.c: fix build with latest glibc
+
+Fix the following error with latest glibc:
+
+In function 'open',
+    inlined from 'do_test' at tst-nftw.c:38:10,
+    inlined from 'main' at ../test-skeleton.c:318:12:
+/home/mark/buildroot-test/instance-0/output/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/bits/fcntl2.h:50:4: error: call to '__open_missing_mode' declared with attribute error: open with O_CREAT or O_TMPFILE in second argument needs 3 arguments
+    __open_missing_mode ();
+    ^~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.net/results/f370abcc8dc12975d96a46c34db978554f8c21db
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/wbx-github/uclibc-ng-test/pull/1]
+---
+ test/misc/tst-nftw.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/misc/tst-nftw.c b/test/misc/tst-nftw.c
+index 970dfc2..7a08c78 100644
+--- a/test/misc/tst-nftw.c
++++ b/test/misc/tst-nftw.c
+@@ -35,9 +35,9 @@ do_test(void)
+ 	perror("Creating path");
+     if ((mkdir(subpath, 0700)) < 0)
+ 	perror("Creating subpath");
+-    if ((open(filepath, O_CREAT)) < 0)
++    if ((open(filepath, O_CREAT, 0600)) < 0)
+ 	perror("Opening filepath");
+-    if ((open(filesubpath, O_CREAT)) < 0)
++    if ((open(filesubpath, O_CREAT, 0600)) < 0)
+ 	perror("Opening filesubpath");
+ 
+     if (nftw(path, process_one_entry, 100, (FTW_CHDIR|FTW_DEPTH|FTW_PHYS)) < 0)
+-- 
+2.23.0
+
diff --git a/package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch b/package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch
new file mode 100644
index 0000000000..374427d96c
--- /dev/null
+++ b/package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch
@@ -0,0 +1,48 @@
+From 04052336f84a84811dd03bfed4cfcb4fe7b424cc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 29 Oct 2019 11:21:47 +0100
+Subject: [PATCH] test/nptl/tst-mqueue4.c: fix build with latest glibc
+
+Fix the following error with latest glibc:
+
+In file included from /home/fabrice/buildroot/output/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/mqueue.h:93:0,
+                 from tst-mqueue4.c:22:
+In function 'mq_open',
+    inlined from 'do_test' at tst-mqueue4.c:174:6:
+/home/fabrice/buildroot/output/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/bits/mqueue2.h:41:5: error: call to '__mq_open_wrong_number_of_args' declared with attribute error: mq_open can be called either with 2 or 4 arguments
+     __mq_open_wrong_number_of_args ();
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.net/results/f370abcc8dc12975d96a46c34db978554f8c21db
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/wbx-github/uclibc-ng-test/pull/1]
+---
+ test/nptl/tst-mqueue4.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/nptl/tst-mqueue4.c b/test/nptl/tst-mqueue4.c
+index 87ef0c3..1fbecc5 100644
+--- a/test/nptl/tst-mqueue4.c
++++ b/test/nptl/tst-mqueue4.c
+@@ -171,14 +171,14 @@ do_test (void)
+       result = 1;
+     }
+ 
+-  q2 = mq_open (name, O_RDONLY, 0600);
++  q2 = mq_open (name, O_RDONLY, 0600, &attr);
+   if (q2 == (mqd_t) -1)
+     {
+       printf ("mq_open without O_CREAT failed with %m\n");
+       result = 1;
+     }
+ 
+-  mqd_t q3 = mq_open (name, O_RDONLY, 0600);
++  mqd_t q3 = mq_open (name, O_RDONLY, 0600, &attr);
+   if (q3 == (mqd_t) -1)
+     {
+       printf ("mq_open without O_CREAT failed with %m\n");
+-- 
+2.23.0
+
