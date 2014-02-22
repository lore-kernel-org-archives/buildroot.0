From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 23:40:52 +0100
Subject: [Buildroot] [git commit] tvheadend: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
Message-ID: <20140228133416.1A0F59BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=977276685fe72fc6014e1f86e9f54199d725e0bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/Config.in |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index da60f83..74df825 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,22 +1,16 @@
-comment "tvheadend needs a toolchain w/ largefile, IPv6, threads"
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "tvheadend needs a toolchain w/ largefile, IPv6, NPTL"
+	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on BR2_LARGEFILE && BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# tvheadend requires an atomic_add operation. Either you have
 	# a gcc >= 4.3 toolchain and it uses the gcc intrinsics, or it
 	# has special code for x86, x86-64, PPC and ARM. So in the
 	# context of Buildroot, the only really problematic
 	# architecture is avr32, which uses gcc 4.2.
 	depends on !BR2_avr32
-	# clock_nanosleep needs NPTL
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	# no NPTL for these archs
-	depends on !BR2_xtensa && !BR2_arc
 	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
