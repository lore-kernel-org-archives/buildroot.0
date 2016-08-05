From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Aug 2016 18:35:41 +0200
Subject: [Buildroot] [PATCH] uclibc: proper thread default on m68k and
	Microblaze
Message-ID: <1470414941-29826-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Traditionally, Buildroot has a default of enabling thread
support. However, with the current construct of the thread choice in the
uclibc package, the m68k and microblaze architecture end up with no
thread support as the default.

In order to avoid having to explicit a more complicated "default" value
for the choice, we take a simple approach:

 - The "none" choice is moved at the end of the list, so that it is not
   selected as the default unless there is really no other thread
   implementation available.

 - We make NPTL the default thread implementation.

 - On architectures where NPTL is not available, the NPTL option will
   not be available, so Kconfig will automatically fallback to
   linuxthreads.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 7c99195..b7714d4 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -47,15 +47,13 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 choice
 	prompt "Thread library implementation"
+	# Use NPTL when available. If not available, kconfig will
+	# automatically fall back to linuxthreads.
 	default BR2_PTHREADS_NATIVE
-	default BR2_PTHREADS if !BR2_USE_MMU
 	help
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain.
 
-	config BR2_PTHREADS_NONE
-		bool "none"
-
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
@@ -67,6 +65,10 @@ choice
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on BR2_USE_MMU
 		depends on !BR2_m68k && !BR2_microblaze
+
+	config BR2_PTHREADS_NONE
+		bool "none"
+
 endchoice
 
 config BR2_PTHREAD_DEBUG
-- 
2.7.4
