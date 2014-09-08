From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  8 Sep 2014 10:32:43 +0400
Subject: [Buildroot] [PATCH 1/2] libtirpc: add dependency on atomic
	operations
In-Reply-To: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
References: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1410157964-8422-2-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6bb90d3f2b840a1faacf152a1d93a909a2dc98d3
http://autobuild.buildroot.net/results/994a84d192848b90a70e28e5ebaa769701bcaec9

Following packages select "libtirpc", so adding dependency as well:
 * argus
 * conntrack-tools
 * lmbench
 * nfs-utils
 * quota
 * rpcbind

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/Config.in           | 1 +
 package/conntrack-tools/Config.in | 1 +
 package/libtirpc/Config.in        | 1 +
 package/lmbench/Config.in         | 1 +
 package/nfs-utils/Config.in       | 1 +
 package/quota/Config.in           | 1 +
 package/rpcbind/Config.in         | 1 +
 7 files changed, 7 insertions(+)

diff --git a/package/argus/Config.in b/package/argus/Config.in
index 6d47734..2fab07a 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ARGUS
 	bool "argus"
 	depends on BR2_INET_IPV6
+	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index ec19d8e..36b12b7 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index a8e6dd3..a5fe175 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBTIRPC
 	# used instead of libtirpc.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c4ea522..5b88d62 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
+	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_USE_MMU # fork()
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index dff5150..3168333 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -5,6 +5,7 @@ comment "nfs-utils needs a toolchain w/ largefile, threads"
 
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
+	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 69f03af..cceb2ab 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on !(BR2_microblazeel || BR2_microblazebe) # util-linux
+	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 2a79bdc..bc658d6 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RPCBIND
 	bool "rpcbind"
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
+	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
-- 
1.9.3
