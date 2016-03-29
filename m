From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:23:00 +0200
Subject: [Buildroot] [git commit] uclibc: NPTL thread implementation only
	available on MMU platforms
Message-ID: <20160329222302.18552817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c218c337c7476a8b0007451117d0510ff10fde55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As indicated by the uClibc-ng source code, the NPTL thread
implementation is only available on MMU platforms, so we replicate
this dependency in Buildroot so that the appropriate thread
implementation is chosen by default on ARM noMMU.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e722908..1448037 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -48,6 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 choice
 	prompt "Thread library implementation"
 	default BR2_PTHREADS_NATIVE
+	default BR2_PTHREADS_OLD if !BR2_USE_MMU
 	help
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain.
@@ -69,6 +70,7 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		depends on BR2_USE_MMU
 		depends on !BR2_m68k && !BR2_x86_i386
 endchoice
 
