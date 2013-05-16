From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 16 May 2013 21:03:10 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with threads
	support
Message-ID: <1368730990-20495-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "gilles.talis@gmail.com" <gilles.talis@gmail.com>

Fixes:
http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>
---
 package/conntrack-tools/Config.in | 5 +++--
 package/libtirpc/Config.in        | 4 ++++
 package/lmbench/Config.in         | 4 ++++
 package/nfs-utils/Config.in       | 5 +++--
 package/quota/Config.in           | 5 +++--
 package/rpcbind/Config.in         | 4 ++++
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 50f2000..beac016 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
@@ -16,5 +17,5 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools requires a toolchain with IPV6 and LARGEFILE support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
+comment "conntrack-tools requires a toolchain with IPV6, LARGEFILE and thread support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 7e891b4..f2a6f83 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBTIRPC
 	bool "libtirpc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
 
 	  http://sourceforge.net/projects/libtirpc/
+
+comment "libtirpc requires a toolchain with threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index d710e1f..8492e9c 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
 
 	  http://sourceforge.net/projects/lmbench/
+
+comment "lmbench requires a toolchain with thread support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index fa35f35..4b5d413 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
 	help
@@ -9,8 +10,8 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "nfs-utils requires a toolchain with LARGEFILE and thread support"
+	depends on !BR2_LARGEFILE || !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 5127a9a..e086c0c 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on !(BR2_microblazeel || BR2_microblazebe) # util-linux
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
@@ -14,5 +15,5 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "quota requires a toolchain with LARGEFILE, WCHAR and thread support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 1bdcd9e..ac18036 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_RPCBIND
 	bool "rpcbind"
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
+
+comment "rpcbind requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.2.3
