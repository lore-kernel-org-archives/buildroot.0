From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Oct 2020 20:10:52 +0200
Subject: [Buildroot] [git commit] package/uclibc-ng-test: update to latest
 git version
Message-ID: <20201016175939.695E083A81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29fdbd2b6c0921d4443c48e7901a03a310d5959c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches are upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...scall6-fix-build-with-musl-and-older-kenr.patch | 45 --------------------
 ...Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch | 43 -------------------
 ...c-test-nftw.c-fix-build-with-latest-glibc.patch | 42 -------------------
 ...tst-mqueue4.c-fix-build-with-latest-glibc.patch | 48 ----------------------
 package/uclibc-ng-test/uclibc-ng-test.mk           |  2 +-
 5 files changed, 1 insertion(+), 179 deletions(-)

diff --git a/package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch b/package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch
deleted file mode 100644
index ca433261ba..0000000000
--- a/package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9a09c89fdd0e0cebec48d1bb7bc187bf92ae361c Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 13 Mar 2018 12:58:59 +0200
-Subject: [PATCH] misc/tst-syscall6: fix build with musl and older kenrel
- headers
-
-The RWF_DSYNC and RWF_HIPRI macros were introduced in kernel version 4.6
-with the preadv2/pwritev2 system calls. musl libc provides its own
-syscall definitions, even when the kernel headers are older. This leads
-to the following build failure:
-
-tst-syscall6.c: In function 'main':
-tst-syscall6.c:32:48: error: 'RWF_DSYNC' undeclared (first use in this function)
-  nio = syscall(SYS_pwritev2, fd, iov, 2, 0, 0, RWF_DSYNC);
-                                                ^~~~~~~~~
-tst-syscall6.c:32:48: note: each undeclared identifier is reported only once for each function it appears in
-tst-syscall6.c:42:58: error: 'RWF_HIPRI' undeclared (first use in this function)
-  nio = syscall(SYS_preadv2, fd, iov, 1, strlen(str0), 0, RWF_HIPRI);
-                                                          ^~~~~~~~~
-
-Make the code depend also on RWF_HIPRI to fix this failure.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: patch sent to Waldemar Brodkorb <wbx@openadk.org>
-
- test/misc/tst-syscall6.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/misc/tst-syscall6.c b/test/misc/tst-syscall6.c
-index fa51c275e4a5..9ad2ddac2b8f 100644
---- a/test/misc/tst-syscall6.c
-+++ b/test/misc/tst-syscall6.c
-@@ -9,7 +9,7 @@
- 
- int main()
- {
--#if defined SYS_preadv2 && defined SYS_pwritev2
-+#if defined SYS_preadv2 && defined SYS_pwritev2 && defined RWF_HIPRI
- 	char tmp[] = "/tmp/tst-preadv2-XXXXXX";
- 	int fd;
- 	struct iovec iov[2];
--- 
-2.16.1
-
diff --git a/package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch b/package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch
deleted file mode 100644
index 34760f3dfb..0000000000
--- a/package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 164b1b5592ef6ad9fceba06bdfa31787e9c0329d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 14 Nov 2018 21:26:54 +0100
-Subject: [PATCH] Add NO_CRYPT to fix build with glibc 2.28
-
-Since glibc 2.28
-(https://savannah.gnu.org/forum/forum.php?forum_id=9205), the obsolete
-functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt, ecb_crypt,
-and des_setparity are no longer available to newly linked binaries, and
-the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no longer
-installed. These functions encrypted and decrypted data with the DES
-block cipher, which is no longer considered secure. Software that still
-uses these functions should switch to a modern cryptography library,
-such as libgcrypt.
-
-So add a NO_CRYPT variable to disable test/crypt
-
-Fixes:
- - http://autobuild.buildroot.org/results/158438debb0ce313b012b871e199bed42ba38294
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- test/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/test/Makefile b/test/Makefile
-index 5a136ea..6690d25 100644
---- a/test/Makefile
-+++ b/test/Makefile
-@@ -39,6 +39,10 @@ ifeq ($(NO_MATH),1)
- DIRS := $(filter-out math,$(DIRS))
- endif
- 
-+ifeq ($(NO_CRYPT),1)
-+DIRS := $(filter-out crypt,$(DIRS))
-+endif
-+
- test check all: run
- 
- run: subdirs_run
--- 
-2.14.1
-
diff --git a/package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch b/package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch
deleted file mode 100644
index 2c45aeee6d..0000000000
--- a/package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From de742f52d46d82db1fe1b0f3255043d48843901d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Oct 2019 11:14:35 +0100
-Subject: [PATCH] test/misc/test-nftw.c: fix build with latest glibc
-
-Fix the following error with latest glibc:
-
-In function 'open',
-    inlined from 'do_test' at tst-nftw.c:38:10,
-    inlined from 'main' at ../test-skeleton.c:318:12:
-/home/mark/buildroot-test/instance-0/output/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/bits/fcntl2.h:50:4: error: call to '__open_missing_mode' declared with attribute error: open with O_CREAT or O_TMPFILE in second argument needs 3 arguments
-    __open_missing_mode ();
-    ^~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.net/results/f370abcc8dc12975d96a46c34db978554f8c21db
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/wbx-github/uclibc-ng-test/pull/1]
----
- test/misc/tst-nftw.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/test/misc/tst-nftw.c b/test/misc/tst-nftw.c
-index 970dfc2..7a08c78 100644
---- a/test/misc/tst-nftw.c
-+++ b/test/misc/tst-nftw.c
-@@ -35,9 +35,9 @@ do_test(void)
- 	perror("Creating path");
-     if ((mkdir(subpath, 0700)) < 0)
- 	perror("Creating subpath");
--    if ((open(filepath, O_CREAT)) < 0)
-+    if ((open(filepath, O_CREAT, 0600)) < 0)
- 	perror("Opening filepath");
--    if ((open(filesubpath, O_CREAT)) < 0)
-+    if ((open(filesubpath, O_CREAT, 0600)) < 0)
- 	perror("Opening filesubpath");
- 
-     if (nftw(path, process_one_entry, 100, (FTW_CHDIR|FTW_DEPTH|FTW_PHYS)) < 0)
--- 
-2.23.0
-
diff --git a/package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch b/package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch
deleted file mode 100644
index 374427d96c..0000000000
--- a/package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 04052336f84a84811dd03bfed4cfcb4fe7b424cc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Oct 2019 11:21:47 +0100
-Subject: [PATCH] test/nptl/tst-mqueue4.c: fix build with latest glibc
-
-Fix the following error with latest glibc:
-
-In file included from /home/fabrice/buildroot/output/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/mqueue.h:93:0,
-                 from tst-mqueue4.c:22:
-In function 'mq_open',
-    inlined from 'do_test' at tst-mqueue4.c:174:6:
-/home/fabrice/buildroot/output/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/bits/mqueue2.h:41:5: error: call to '__mq_open_wrong_number_of_args' declared with attribute error: mq_open can be called either with 2 or 4 arguments
-     __mq_open_wrong_number_of_args ();
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.net/results/f370abcc8dc12975d96a46c34db978554f8c21db
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/wbx-github/uclibc-ng-test/pull/1]
----
- test/nptl/tst-mqueue4.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/test/nptl/tst-mqueue4.c b/test/nptl/tst-mqueue4.c
-index 87ef0c3..1fbecc5 100644
---- a/test/nptl/tst-mqueue4.c
-+++ b/test/nptl/tst-mqueue4.c
-@@ -171,14 +171,14 @@ do_test (void)
-       result = 1;
-     }
- 
--  q2 = mq_open (name, O_RDONLY, 0600);
-+  q2 = mq_open (name, O_RDONLY, 0600, &attr);
-   if (q2 == (mqd_t) -1)
-     {
-       printf ("mq_open without O_CREAT failed with %m\n");
-       result = 1;
-     }
- 
--  mqd_t q3 = mq_open (name, O_RDONLY, 0600);
-+  mqd_t q3 = mq_open (name, O_RDONLY, 0600, &attr);
-   if (q3 == (mqd_t) -1)
-     {
-       printf ("mq_open without O_CREAT failed with %m\n");
--- 
-2.23.0
-
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index aeea799d88..1d1722adee 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = c6d62cbc60504c7f6867b486248b0ef7cc2da554
+UCLIBC_NG_TEST_VERSION = c64d6ac77f0e745c70e76024212c72e4bbe2091a
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
