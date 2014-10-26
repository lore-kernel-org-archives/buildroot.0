From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Oct 2014 19:25:15 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libcap: Fix build error with
	kernel headers < 3.6
Message-ID: <1414347915-2617-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/cce/cceb1ccacec36fb7ef41bb7cdb13b3014813b599/

XATTR_NAME_CAPS appears in kernel headers since 3.7:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/include/uapi/linux/xattr.h?id=v3.7

Before it was an internal define of the kernel:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/linux/xattr.h?id=607ca46e97a1b6594b29647d98a32d545c24bdff

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: propagate to reverse dependencies (Thomas)

 package/cdrkit/Config.in  |    5 +++--
 package/libcap/Config.in  |    4 ++++
 package/lxc/Config.in     |    6 ++++--
 package/squid/Config.in   |    6 ++++--
 package/systemd/Config.in |    1 +
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 9ba5dbf..cfbddb8 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CDRKIT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_USE_MMU # fork
 	bool "cdrkit"
 	help
@@ -12,6 +13,6 @@ config BR2_PACKAGE_CDRKIT
 
 	  http://www.cdrkit.org/
 
-comment "cdrkit needs a toolchain w/ largefile"
+comment "cdrkit needs a toolchain w/ largefile, headers >= 3.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 5b0c827..a019928 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
@@ -22,3 +23,6 @@ config BR2_PACKAGE_LIBCAP_TOOLS
 	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
 
 endif
+
+comment "libcap needs headers >= 3.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 3eae64a..bae83b9 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LXC
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no timerfd
@@ -14,8 +15,9 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ IPv6, threads, largefile"
+comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # no timerfd
 	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/squid/Config.in b/package/squid/Config.in
index ad9fab5..4fadd04 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,12 +1,14 @@
-comment "squid needs a toolchain w/ C++, IPv6"
+comment "squid needs a toolchain w/ C++, IPv6, headers >= 3.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # toolchain too old
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 58f76a5..be28975 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_INET_IPV6
 	depends on !BR2_PREFER_STATIC_LIB # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
-- 
1.7.10.4
