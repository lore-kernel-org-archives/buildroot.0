From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Sep 2014 15:49:20 +0400
Subject: [Buildroot] [PATCH v2] libpfm4: needs NPTL support
Message-ID: <1411040960-24270-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following build failure:
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

And since xtensa, avr32 and bfin don't support NPTL we may remove arch
dependencies as well.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---

In v2 architecture dependencies were removed as suggested by Baruch.

---
 package/libpfm4/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 86ca8f6..441c6de 100644
--- a/package/libpfm4/Config.in
+++ b/package/libpfm4/Config.in
@@ -1,14 +1,11 @@
 config BR2_PACKAGE_LIBPFM4
 	bool "libpfm4"
-	depends on !BR2_avr32 # no perf_event_open
-	depends on !BR2_xtensa && !BR2_bfin # no nptl or linuxthreads (new)
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
