From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:01:56 +0200
Subject: [Buildroot] [git commit] uclibc: proper thread default on m68k and
	Microblaze
Message-ID: <20160807210419.2E33E80648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f82441bfa41afdfad17c86f268b1ea973f60b7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Traditionally, Buildroot has a default of enabling thread
support. However, with the current construct of the thread choice in the
uclibc package, the m68k and microblaze architecture end up with no
thread support as the default.

In order to avoid having to explicit a more complicated "default" value
for the choice, we take a simple approach: we order the 3 possible
choices by order of "preference", since Kconfig selects the first
selectable option in a choice by default.

So, NPTL is first and is the default when available. Then comes
linuxthreads which only gets selected as the default when NPTL is
available. None is offered as a last choice (in the current
implementation, it is never the default, since all architectures can
have thread support, either through NPTL or linuxthreads).

[Thomas: reworked according to Yann's comment that we could rely on the
Kconfig behavior that selects the first available choice option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 7c99195..33969cc 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -47,26 +47,25 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE
-	default BR2_PTHREADS if !BR2_USE_MMU
 	help
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain.
 
-	config BR2_PTHREADS_NONE
-		bool "none"
-
-	config BR2_PTHREADS
-		bool "linuxthreads"
-		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
-
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on BR2_USE_MMU
 		depends on !BR2_m68k && !BR2_microblaze
+
+	config BR2_PTHREADS
+		bool "linuxthreads"
+		select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
+
+	config BR2_PTHREADS_NONE
+		bool "none"
+
 endchoice
 
 config BR2_PTHREAD_DEBUG
