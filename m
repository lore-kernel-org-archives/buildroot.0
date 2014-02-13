From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 14:22:06 +0100
Subject: [Buildroot] [PATCH 5/6] tvheadend: use
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392297727-17627-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/Config.in | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index da60f83..ac4a192 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,22 +1,16 @@
-comment "tvheadend needs a toolchain w/ largefile, IPv6, threads"
-	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
-	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "tvheadend needs a toolchain w/ largefile, IPv6, NPTL threads"
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
-- 
1.8.3.2
