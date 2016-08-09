From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Aug 2016 14:44:44 +0200
Subject: [Buildroot] [PATCH] openipmi: needs NPTL support
Message-ID: <1470746684-6062-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.7.4
