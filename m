From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Thu,  5 Mar 2009 15:03:07 +0100
Subject: [Buildroot] convert some Config.in selects to depends
In-Reply-To: <>
References: <>
Message-ID: <1236261787-13705-1-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

quick grep showed theses invalid selects of toolchain options.
---
 package/fuse/Config.in       |    5 ++++-
 package/lzma/Config.in       |    5 ++++-
 package/netkitbase/Config.in |    5 ++++-
 package/qtopia4/Config.in    |    6 +++---
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/fuse/Config.in b/package/fuse/Config.in
index afe64ff..dffadf8 100644
--- a/package/fuse/Config.in
+++ b/package/fuse/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
-	select BR2_LARGEFILE
+	depends on BR2_LARGEFILE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
 	  http://fuse.sourceforge.net/
+
+comment "libfuse requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index e2e44f3..9ca3c02 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_LZMA_TARGET
 	bool "Install lzma for the target system"
-	select BR2_GCC_CROSS_CXX
+	depends on BR2_GCC_CROSS_CXX
 	help
 	  lzma utils on the target
 
 	  http://tukaani.org/lzma/
 
+comment "lzma requires a toolchain with C++ support"
+        depends on !BR2_GCC_CROSS_CXX
+
 config BR2_PACKAGE_LZMA_TARGET_HEADERS
 	bool "lzma headers in target"
 	depends on BR2_PACKAGE_LZMA_TARGET
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 410d282..725e500 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
-	select BR2_INET_RPC
+	depends on BR2_INET_RPC
 	help
 	  Old-style inetd.
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
+
+comment "netkitbase requires a toolchain with RPC support"
+        depends on !BR2_INET_RPC
diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
index 4477ee3..b88d19a 100644
--- a/package/qtopia4/Config.in
+++ b/package/qtopia4/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_QTOPIA4
 	bool "qtopia4"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PTHREADS_NATIVE
+	depends on BR2_PTHREADS_NATIVE
 	help
 	  Qtopia core 4.
 
 	  http://www.trolltech.com/
 
-comment "qtopia4 requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "qtopia4 requires a toolchain with C++ and NPTL support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PTHREADS_NATIVE
 
 if BR2_PACKAGE_QTOPIA4
 
-- 
1.5.4.3
