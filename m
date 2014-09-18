From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Sep 2014 15:22:15 +0400
Subject: [Buildroot] [PATCH] libpfm4: needs NPTL support
Message-ID: <1411039335-20178-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following build failure when tools use Linux threads instead of NPTL:
--->---
self_smpl_multi.c: In function 'my_thread':
self_smpl_multi.c:354:2: error: implicit declaration of function 'pthread_barrier_wait' [-Werror=implicit-function-declaration]
  pthread_barrier_wait(&barrier);
  ^
self_smpl_multi.c: In function 'main':
self_smpl_multi.c:450:2: error: implicit declaration of function 'pthread_barrier_init' [-Werror=implicit-function-declaration]
  pthread_barrier_init(&barrier, 0, max_thr+1);
  ^
cc1: all warnings being treated as errors
--->---

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpfm4/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 86ca8f6..91b56a3 100644
--- a/package/libpfm4/Config.in
+++ b/package/libpfm4/Config.in
@@ -2,13 +2,12 @@ config BR2_PACKAGE_LIBPFM4
 	bool "libpfm4"
 	depends on !BR2_avr32 # no perf_event_open
 	depends on !BR2_xtensa && !BR2_bfin # no nptl or linuxthreads (new)
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  A helper library to help encode Performance Events to use with
 	  Operating system kernels performance monitoring interfaces.
 
 	  http://perfmon2.sourceforge.net/
 
-comment "libpfm4 needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_bfin
+comment "libpfm4 needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
1.9.3
