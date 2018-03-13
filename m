From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:13:26 +0100
Subject: [Buildroot] [git commit] uclibc-ng-test: fix build with musl and
 older kernel headers
Message-ID: <20180313211610.B55ED80069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02940d8ccf0503fb5fff83da4ed48fbafa00911d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl libc provides its own system call macros, including
preadv2/pwritev2. Having these macros defined is not enough to determine
availability of other related macros in kernel headers.

Add a patch to check these macros directly.

Fixes:
http://autobuild.buildroot.net/results/7e9/7e9945f46ef9e0f6de7e1c85b0ca1104df6c86f5/
http://autobuild.buildroot.net/results/782/782652193bb6770ae68d509b3a7087667622d627/
http://autobuild.buildroot.net/results/582/5827a724c7f24218010f4cdd24924dca457b0361/

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...scall6-fix-build-with-musl-and-older-kenr.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch b/package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch
new file mode 100644
index 0000000000..ca433261ba
--- /dev/null
+++ b/package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch
@@ -0,0 +1,45 @@
+From 9a09c89fdd0e0cebec48d1bb7bc187bf92ae361c Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 13 Mar 2018 12:58:59 +0200
+Subject: [PATCH] misc/tst-syscall6: fix build with musl and older kenrel
+ headers
+
+The RWF_DSYNC and RWF_HIPRI macros were introduced in kernel version 4.6
+with the preadv2/pwritev2 system calls. musl libc provides its own
+syscall definitions, even when the kernel headers are older. This leads
+to the following build failure:
+
+tst-syscall6.c: In function 'main':
+tst-syscall6.c:32:48: error: 'RWF_DSYNC' undeclared (first use in this function)
+  nio = syscall(SYS_pwritev2, fd, iov, 2, 0, 0, RWF_DSYNC);
+                                                ^~~~~~~~~
+tst-syscall6.c:32:48: note: each undeclared identifier is reported only once for each function it appears in
+tst-syscall6.c:42:58: error: 'RWF_HIPRI' undeclared (first use in this function)
+  nio = syscall(SYS_preadv2, fd, iov, 1, strlen(str0), 0, RWF_HIPRI);
+                                                          ^~~~~~~~~
+
+Make the code depend also on RWF_HIPRI to fix this failure.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: patch sent to Waldemar Brodkorb <wbx@openadk.org>
+
+ test/misc/tst-syscall6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/misc/tst-syscall6.c b/test/misc/tst-syscall6.c
+index fa51c275e4a5..9ad2ddac2b8f 100644
+--- a/test/misc/tst-syscall6.c
++++ b/test/misc/tst-syscall6.c
+@@ -9,7 +9,7 @@
+ 
+ int main()
+ {
+-#if defined SYS_preadv2 && defined SYS_pwritev2
++#if defined SYS_preadv2 && defined SYS_pwritev2 && defined RWF_HIPRI
+ 	char tmp[] = "/tmp/tst-preadv2-XXXXXX";
+ 	int fd;
+ 	struct iovec iov[2];
+-- 
+2.16.1
+
