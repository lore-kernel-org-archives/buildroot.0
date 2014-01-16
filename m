From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:20:18 +0100
Subject: [Buildroot] [git commit] rt-tests: disable NPTL is missing
Message-ID: <20140116082549.E5AA69C4C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=881c487e8817a7c19b0c67684dde5510f871aa52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8aa/8aaa4b56a53241b7342fede568fbc72a7656cc38/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 36c111b..58a88a8 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Too old uClibc, does not provide priority-inheritance
-	# mutexes
-	depends on !BR2_avr32
+	# priority-inheritance mutex needs NPTL
+	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
+	# no NPTL for these archs
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -23,5 +24,6 @@ config BR2_PACKAGE_RT_TESTS
 	  http://rt.wiki.kernel.org
 
 comment "rt-tests needs a toolchain w/ threads"
-	depends on !BR2_avr32
+	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
