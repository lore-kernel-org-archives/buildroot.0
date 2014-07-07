From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  7 Jul 2014 18:21:54 +0400
Subject: [Buildroot] [PATCH] ARC: disable packages that require atomic
	builtins
Message-ID: <1404742914-21583-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In particular libtirpc is reported to be broken here: http://autobuild.buildroot.net/results/6bb90d3f2b840a1faacf152a1d93a909a2dc98d3

"rpcbind" in its turn selects "libtirpc", so it's required to disable it as well

As it is seen from http://autobuild.buildroot.org/results/3bd/3bda860a269dd9a4e38533cc9350892c68102618
"zeromq" also uses "___sync_add_and_fetch_2" & "___sync_fetch_and_add_2" in
"libpgm" so need to disable it.

And finally "zyre" selects "zeromq" so we disable it for ARC too.

signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtirpc/Config.in | 2 ++
 package/rpcbind/Config.in  | 2 ++
 package/zeromq/Config.in   | 1 +
 package/zyre/Config.in     | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index a8e6dd3..4fb3eeb 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBTIRPC
 	# dependencies of libtirpc for which native RPC support can be
 	# used instead of libtirpc.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
+	depends on !BR2_arc # atomic builtins
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
@@ -16,3 +17,4 @@ config BR2_PACKAGE_LIBTIRPC
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 2a79bdc..136553a 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_RPCBIND
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed for libtirpc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
+	depends on !BR2_arc # atomic builtins @libtirpc
 	# fork()
 	depends on BR2_USE_MMU
 	help
@@ -16,4 +17,5 @@ config BR2_PACKAGE_RPCBIND
 comment "rpcbind needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc
 	depends on BR2_USE_MMU
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 778a503..5382c98 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	depends on !BR2_avr32 # openpgm
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # openpgm
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # openpgm
+	depends on !BR2_arc # atomic builtins
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 86fff35..d955b0e 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_ZYRE
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed by czmq
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
+	depends on !BR2_arc # atomic builtins @zeromq
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	help
@@ -19,6 +20,7 @@ config BR2_PACKAGE_ZYRE
 
 comment "zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on BR2_USE_MMU
+	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.9.3
