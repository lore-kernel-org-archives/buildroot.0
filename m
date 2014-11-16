From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 12:04:47 +0100
Subject: [Buildroot] [PATCH] package/libcap: needs headers >= 3.0
Message-ID: <1416135887-27267-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap requires XATTR_NAME_CAPS, which was introduced in Linux 2.6.24.

However, we have some toolchains, liek the CodeSourcery PowerPC 2011.03,
that is missing those defines, even though it uses headers from Linux
2.6.38.

Since there is no perfect way to avoid the situation, just require
headers >= 3.0 to build libcap.

Propagate the new dependency to packages that select libcap.

Fixes a lot of build failures, of which:
    http://autobuild.buildroot.net/results/e90/e909ca48ad2d1c85b19258f65e0c89a2813ac45e/
    http://autobuild.buildroot.net/results/23a/23aac9bb1cc48e5974bcf50256a16c67318f9ba2/
    http://autobuild.buildroot.net/results/597/597da58cb2fccb92d7883802c60b31264cacad08/
    http://autobuild.buildroot.net/results/538/538b23417c68f6c8c0c8c92dfc0e8ed314bac01b/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cdrkit/Config.in | 5 +++--
 package/libcap/Config.in | 4 ++++
 package/lxc/Config.in    | 6 ++++--
 package/squid/Config.in  | 6 ++++--
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 9ba5dbf..81c5c01 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CDRKIT
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	bool "cdrkit"
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
@@ -12,6 +13,6 @@ config BR2_PACKAGE_CDRKIT
 
 	  http://www.cdrkit.org/
 
-comment "cdrkit needs a toolchain w/ largefile"
+comment "cdrkit needs a toolchain w/ largefile, headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 5b0c827..2e3c8d9 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # XATTR_NAME_CAPS
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
@@ -22,3 +23,6 @@ config BR2_PACKAGE_LIBCAP_TOOLS
 	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
 
 endif
+
+comment "libcap needs a toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 3eae64a..cf85712 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LXC
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no timerfd
 	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
@@ -14,8 +15,9 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ IPv6, threads, largefile"
+comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # no timerfd
 	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
+                || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/squid/Config.in b/package/squid/Config.in
index ad9fab5..ce38371 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,7 +1,8 @@
-comment "squid needs a toolchain w/ C++, IPv6"
+comment "squid needs a toolchain w/ C++, IPv6, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # toolchain too old
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6 \
+        || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
@@ -9,6 +10,7 @@ config BR2_PACKAGE_SQUID
 	depends on BR2_INET_IPV6
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
-- 
1.9.1
