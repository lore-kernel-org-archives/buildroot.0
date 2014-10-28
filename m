From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 11:58:58 +0100
Subject: [Buildroot] [git commit] Revert "package/libcap: Fix build error
	with kernel headers < 3.6"
Message-ID: <20141028174947.80879B57E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5146f4b53d926c13a47215ac514e43b2c66b9ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a759931c9b0cb4337dc30fd35d03ce123271c5a4.
---
 package/cdrkit/Config.in  |    5 ++---
 package/libcap/Config.in  |    4 ----
 package/lxc/Config.in     |    6 ++----
 package/squid/Config.in   |    6 ++----
 package/systemd/Config.in |    1 -
 5 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index cfbddb8..9ba5dbf 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_CDRKIT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_LARGEFILE
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_USE_MMU # fork
 	bool "cdrkit"
 	help
@@ -13,6 +12,6 @@ config BR2_PACKAGE_CDRKIT
 
 	  http://www.cdrkit.org/
 
-comment "cdrkit needs a toolchain w/ largefile, headers >= 3.7"
+comment "cdrkit needs a toolchain w/ largefile"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_LARGEFILE
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index a019928..5b0c827 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
@@ -23,6 +22,3 @@ config BR2_PACKAGE_LIBCAP_TOOLS
 	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
 
 endif
-
-comment "libcap needs headers >= 3.7"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index bae83b9..3eae64a 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LXC
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no timerfd
@@ -15,9 +14,8 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.7"
+comment "lxc needs a toolchain w/ IPv6, threads, largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # no timerfd
 	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 4fadd04..ad9fab5 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,14 +1,12 @@
-comment "squid needs a toolchain w/ C++, IPv6, headers >= 3.7"
+comment "squid needs a toolchain w/ C++, IPv6"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # toolchain too old
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index be28975..58f76a5 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_INET_IPV6
 	depends on !BR2_PREFER_STATIC_LIB # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
