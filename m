From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 13 Sep 2013 12:41:20 +0200
Subject: [Buildroot] [PATCH v3] libtirpc: requires toolchain with threading
	support
Message-ID: <1379068880-18028-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>

---
changes v2 -> v3
* rebase on master
* minor wording fix

changes v1 -> v2
* propagate libtirpc dependency

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/conntrack-tools/Config.in | 7 +++++--
 package/libtirpc/Config.in        | 4 ++++
 package/lmbench/Config.in         | 4 ++++
 package/nfs-utils/Config.in       | 6 ++++--
 package/quota/Config.in           | 7 +++++--
 package/rpcbind/Config.in         | 4 ++++
 6 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 50f2000..64f18fe 100644
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
@@ -16,5 +17,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools requires a toolchain with IPV6 and LARGEFILE support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
+comment "conntrack-tools requires a toolchain with IPV6, LARGEFILE and threading support"
+	depends on !BR2_INET_IPV6 || \
+		!BR2_LARGEFILE || \
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index b9db5aa..eab4f3e 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,8 +7,12 @@ config BR2_PACKAGE_LIBTIRPC
 	# used instead of libtirpc.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
 
 	  http://sourceforge.net/projects/libtirpc/
+
+comment "libtirpc requires a toolchain with threading support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index d710e1f..c7b656c 100644
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
+comment "lmbench requires a toolchain with threading support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index fa35f35..8f61f2b 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
 	help
@@ -9,8 +10,9 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "nfs-utils requires a toolchain with LARGEFILE and threading support"
+	depends on !BR2_LARGEFILE || \
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 5127a9a..57cf57d 100644
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
@@ -14,5 +15,7 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "quota requires a toolchain with LARGEFILE, WCHAR and threading support"
+	depends on !BR2_LARGEFILE || \
+		!BR2_USE_WCHAR || \
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index cbe53af..663313b 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RPCBIND
 	bool "rpcbind"
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed for libtirpc
@@ -10,3 +11,6 @@ config BR2_PACKAGE_RPCBIND
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
+
+comment "rpcbind requires a toolchain with threading support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.4
