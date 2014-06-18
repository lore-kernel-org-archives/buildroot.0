From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:01:03 +0200
Subject: [Buildroot] [git commit] blackfin: 2012R1 toolchain is gone,
	remove kludges
Message-ID: <20140618123419.C77AD9CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ff0323105d1f978c75a1adb73f744a6324369d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove ADI toolchain 2012R1 package kludges since that version is gone
since the last bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/Config.in |    6 ++----
 package/openpgm/Config.in  |    1 -
 package/popt/popt.mk       |    2 +-
 package/rpcbind/Config.in  |    6 ++----
 package/zeromq/Config.in   |    1 -
 package/zyre/Config.in     |    6 ++----
 6 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index a6759e7..a8e6dd3 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_LIBTIRPC
 	# don't need to propagate this dependency to reverse
 	# dependencies of libtirpc for which native RPC support can be
 	# used instead of libtirpc.
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
@@ -15,6 +14,5 @@ config BR2_PACKAGE_LIBTIRPC
 	  http://sourceforge.net/projects/libtirpc/
 
 comment "libtirpc needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index a9d0cc8..dc66367 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_OPENPGM
 	depends on !BR2_avr32
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 9f2d070..f3ef43f 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -16,7 +16,7 @@ POPT_CONF_ENV = ac_cv_va_copy=yes
 # The external Blackfin toolchains have <glob.h>, but not all the
 # necessary uClibc options for glob functions, so we force disable the
 # usage of the glob functions for these toolchains.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 POPT_CONF_ENV += ac_cv_header_glob_h=no
 endif
 
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index e02fb95..2a79bdc 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_RPCBIND
 	select BR2_PACKAGE_LIBTIRPC
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed for libtirpc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	# fork()
 	depends on BR2_USE_MMU
 	help
@@ -15,7 +14,6 @@ config BR2_PACKAGE_RPCBIND
 	  into universal addresses.
 
 comment "rpcbind needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index a02f4ab..778a503 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -34,7 +34,6 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	depends on !BR2_avr32 # openpgm
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # openpgm
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # openpgm
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 31e1d6f..fbfc6f9 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -8,8 +8,7 @@ config BR2_PACKAGE_ZYRE
 	depends on BR2_USE_MMU # filemq -> czmq
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed by filemq -> czmq
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	select BR2_PACKAGE_FILEMQ
 	help
 	  An open-source framework for proximity-based peer-to-peer
@@ -19,7 +18,6 @@ config BR2_PACKAGE_ZYRE
 
 comment "zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
