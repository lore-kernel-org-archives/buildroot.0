From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:27:01 +0200
Subject: [Buildroot] [git commit] openipmi: needs NPTL support
Message-ID: <20160810125340.59E1D7FFD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a65eacfc11eae3a989e2d354e1c768217f04e4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openipmi uses the pthread_condattr_setclock() function, which is only
available with the NPTL thread implementation.

Fixes:

  http://autobuild.buildroot.net/results/fc4084f8d1ff3fe98066c7cc051c2127bbe77ec5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openipmi/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openipmi/Config.in b/package/openipmi/Config.in
index da88657..d8c94b3 100644
--- a/package/openipmi/Config.in
+++ b/package/openipmi/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OPENIPMI
 	bool "openipmi"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_NCURSES
 	help
@@ -13,6 +13,6 @@ config BR2_PACKAGE_OPENIPMI
 
 	  http://openipmi.sourceforge.net
 
-comment "openipmi needs a toolchain w/ dynamic library, threads"
+comment "openipmi needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
