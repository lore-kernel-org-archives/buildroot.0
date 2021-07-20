From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Jul 2021 23:01:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix build with gcc 4.8
Message-ID: <20210720210134.90010-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the following build failure with gcc 4.8 which is raised since bump
to version 2.51 in commit bef89e381d0d698053a026d6a8cb0ded260bd074:

uns_test.c: In function 'main':
uns_test.c:118:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i=0; i<2; i++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/9e67bdd540bb7779a13e27c55114a561c12b289a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Permit-compilation-with-std-c89.patch | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 package/libcap/0001-Permit-compilation-with-std-c89.patch

diff --git a/package/libcap/0001-Permit-compilation-with-std-c89.patch b/package/libcap/0001-Permit-compilation-with-std-c89.patch
new file mode 100644
index 0000000000..0219f09f52
--- /dev/null
+++ b/package/libcap/0001-Permit-compilation-with-std-c89.patch
@@ -0,0 +1,123 @@
+From 06ec53d0c9fcddcc071a0e07731e6c83238400e6 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Mon, 21 Jun 2021 17:46:43 -0700
+Subject: Permit compilation with -std=c89.
+
+Tested with
+
+  make COPTS="-O2 -std=c89" clean all test sudotest
+
+This addresses the issue reported by Byron Stanoszek:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=213541
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=06ec53d0c9fcddcc071a0e07731e6c83238400e6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile                   | 1 +
+ libcap/cap_test.c          | 1 +
+ psx/psx.c                  | 2 +-
+ tests/exploit.c            | 9 +++++++--
+ tests/libcap_launch_test.c | 6 +++---
+ tests/uns_test.c           | 3 ++-
+ 6 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9666bf0..984d502 100644
+--- a/Makefile
++++ b/Makefile
+@@ -68,6 +68,7 @@ endif
+ distcheck:
+ 	./distcheck.sh
+ 	$(MAKE) DYNAMIC=yes clean all test sudotest
++	$(MAKE) DYNAMIC=no COPTS="-O2 -std=c89" clean all test sudotest
+ 	$(MAKE) PAM_CAP=no CC=/usr/local/musl/bin/musl-gcc clean all test sudotest
+ 	$(MAKE) clean all test sudotest
+ 	$(MAKE) distclean
+diff --git a/libcap/cap_test.c b/libcap/cap_test.c
+index c9e83de..a717217 100644
+--- a/libcap/cap_test.c
++++ b/libcap/cap_test.c
+@@ -79,4 +79,5 @@ int main(int argc, char **argv) {
+ 	exit(1);
+     }
+     printf("cap_test PASS\n");
++    exit(0);
+ }
+diff --git a/psx/psx.c b/psx/psx.c
+index 12dbbc5..90dcc50 100644
+--- a/psx/psx.c
++++ b/psx/psx.c
+@@ -229,7 +229,7 @@ static void psx_syscall_start(void) {
+     psx_tracker.psx_sig = SIGSYS;
+ 
+     psx_confirm_sigaction();
+-    psx_do_registration(); // register the main thread.
++    psx_do_registration(); /* register the main thread. */
+ 
+     psx_tracker.initialized = 1;
+ }
+diff --git a/tests/exploit.c b/tests/exploit.c
+index 28bac88..814337c 100644
+--- a/tests/exploit.c
++++ b/tests/exploit.c
+@@ -16,6 +16,10 @@
+  * to execute arbitrary code. As such, if all but one thread drops
+  * privilege, privilege escalation is somewhat trivial.
+  */
++
++/* as per "man sigaction" */
++#define _POSIX_C_SOURCE 200809L
++
+ #include <pthread.h>
+ #include <signal.h>
+ #include <stdio.h>
+@@ -148,7 +152,8 @@ int main(int argc, char **argv) {
+     if (greatest_len != 1) {
+ 	printf("exploit succeeded\n");
+ 	exit(1);
+-    } else {
+-	printf("exploit failed\n");
+     }
++
++    printf("exploit failed\n");
++    exit(0);
+ }
+diff --git a/tests/libcap_launch_test.c b/tests/libcap_launch_test.c
+index 6cbfc43..5286979 100644
+--- a/tests/libcap_launch_test.c
++++ b/tests/libcap_launch_test.c
+@@ -199,10 +199,10 @@ int main(int argc, char **argv) {
+     cap_free(final);
+     cap_free(orig);
+ 
+-    if (success) {
+-	printf("cap_launch_test: PASSED\n");
+-    } else {
++    if (!success) {
+ 	printf("cap_launch_test: FAILED\n");
+ 	exit(1);
+     }
++    printf("cap_launch_test: PASSED\n");
++    exit(0);
+ }
+diff --git a/tests/uns_test.c b/tests/uns_test.c
+index 41aa0a6..d8f5415 100644
+--- a/tests/uns_test.c
++++ b/tests/uns_test.c
+@@ -115,7 +115,8 @@ int main(int argc, char **argv)
+     }
+     close(fds.from[0]);
+ 
+-    for (int i=0; i<2; i++) {
++    int i;
++    for (i=0; i<2; i++) {
+ 	char *map_file;
+ 	if (asprintf(&map_file, file_formats[i], pid) < 0) {
+ 	    perror("allocate string");
+-- 
+cgit 1.2.3-1.el7
+
-- 
2.30.2
