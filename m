From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:08 +0200
Subject: [Buildroot] [PATCH 09/12] ltp-testsuite: depends on MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-10-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/ltp-testsuite/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 0e71677..76fa1a1 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -4,6 +4,7 @@ comment "ltp-testsuite needs specific uClibc options, see help"
 
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
@@ -22,7 +23,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads"
+comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads, MMU"
 	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_USE_MMU
-- 
2.1.0
