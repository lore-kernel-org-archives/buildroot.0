From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 16:29:06 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/libtirpc: does not build with
	musl libc
In-Reply-To: <cover.1434292018.git.yann.morin.1998@free.fr>
References: <cover.1434292018.git.yann.morin.1998@free.fr>
Message-ID: <a13a154a08aa3fd09400a2b1ae3571544a86f3db.1434292018.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously-packaged libtirpc version, 0.2.4, did not build with musl on
ARM (see build failures, below) because of missing header sys/cdefs.h

Newly-packaged version, 0.3.1, does not build on musl, on ARM for the
same reason as 0.2.4, and on whatever the architecture (ARM included)
because of the extra-missing header sys/queue.h .

Fixes:
    http://autobuild.buildroot.org/results/331/331c84b322c6a0205c15f9c5237047f0e2a63ef8/
    http://autobuild.buildroot.org/results/d30/d30993a7cfb4874159eab83c73e360d518471bf2/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/Config.in           | 5 +++--
 package/conntrack-tools/Config.in | 5 +++--
 package/libtirpc/Config.in        | 5 +++--
 package/lmbench/Config.in         | 6 ++++--
 package/nfs-utils/Config.in       | 6 ++++--
 package/quota/Config.in           | 6 ++++--
 package/rpcbind/Config.in         | 5 +++--
 7 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/package/argus/Config.in b/package/argus/Config.in
index 7a7d2b6..ebcbce0 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ARGUS
 	bool "argus"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libtirpc
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -9,6 +10,6 @@ config BR2_PACKAGE_ARGUS
 
 	  http://qosient.com/argus/
 
-comment "argus needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "argus needs a uClibc or (e)glibc toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 87bf2d0..cbfbddf 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libtirpc
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
@@ -16,7 +17,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools needs a toolchain w/ threads, dynamic library"
+comment "conntrack-tools needs a uClibc or (e)glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index a8e6dd3..e5abd68 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,12 +7,13 @@ config BR2_PACKAGE_LIBTIRPC
 	# used instead of libtirpc.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
 
 	  http://sourceforge.net/projects/libtirpc/
 
-comment "libtirpc needs a toolchain w/ threads"
+comment "libtirpc needs a uClibc or (e)glibc toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c4ea522..7cc9d73 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_USE_MMU # fork()
 	help
@@ -9,6 +10,7 @@ config BR2_PACKAGE_LMBENCH
 
 	  http://sourceforge.net/projects/lmbench/
 
-comment "lmbench needs a toolchain w/ threads"
+comment "lmbench needs a uClibc or (e)glibc toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) \
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 66f9c21..e5ed3b5 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,10 +1,12 @@
-comment "nfs-utils needs a toolchain w/ threads"
+comment "nfs-utils needs a uClibc or (e)glibc toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) \
+		|| BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_USE_MMU # fork()
 	help
diff --git a/package/quota/Config.in b/package/quota/Config.in
index c8ab0d7..a1e9155 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libtirpc
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -10,7 +11,8 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota needs a toolchain w/ wchar, threads"
+comment "quota needs a uClibc or (e)glibc toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || \
-		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) || \
+		BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 2a79bdc..a385020 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RPCBIND
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on !BR2_TOOLCHAIN_USES_MUSL # libtirpc
 	select BR2_PACKAGE_LIBTIRPC
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed for libtirpc
@@ -13,7 +14,7 @@ config BR2_PACKAGE_RPCBIND
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
 
-comment "rpcbind needs a toolchain w/ threads"
+comment "rpcbind needs a uClibc or (e)glibc toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
-- 
1.9.1
