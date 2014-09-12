From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:20 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: depends on MMU
Message-ID: <20140913074255.A81AB9D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c85126c6aa93976ff81f36118ad336dfbf0c7c9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://sysmic.org/~jezz/results/dfc51d2b:

.../ltp-testsuite-20140115/lib/tests/tst_checkpoint_child.c:40: undefined reference to `_fork'
collect2: ld returned 1 exit status
make[3]: *** [tst_checkpoint_child] Error 1
make[3]: *** Waiting for unfinished jobs....
/tmp/ccF9CQQa.o: In function `main':
.../ltp-testsuite-20140115/lib/tests/tst_checkpoint_parent.c:40: undefined reference to `_fork'
collect2: ld returned 1 exit status
make[3]: *** [tst_checkpoint_parent] Error 1
/tmp/ccwCGpYd.o: In function `main':
.../ltp-testsuite-20140115/lib/tests/tst_checkpoint_parent_exits.c:40: undefined reference to `_fork'
collect2: ld returned 1 exit status
make[3]: *** [tst_checkpoint_parent_exits] Error 1
/tmp/cc8TiB6d.o: In function `main':
.../ltp-testsuite-20140115/lib/tests/tst_process_state.c:43: undefined reference to `_fork'
collect2: ld returned 1 exit status
make[3]: *** [tst_process_state] Error 1
/tmp/ccrf7Gjb.o: In function `main':
.../ltp-testsuite-20140115/lib/tests/tst_checkpoint_child_exits.c:40: undefined reference to `_fork'
collect2: ld returned 1 exit status

[Peter: don't mention mmu dependency in comment]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 0e71677..2cb49a6 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -4,6 +4,7 @@ comment "ltp-testsuite needs specific uClibc options, see help"
 
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
@@ -24,5 +25,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads"
 	depends on !BR2_nios2
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
 		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
