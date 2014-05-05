From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  5 May 2014 06:58:03 +0300
Subject: [Buildroot] [PATCH] czmq: needs MMU
Message-ID: <97ed4f06546e84c2b326a01447f77519460dfeff.1399262283.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6dd/6dd6954e5ab8c422070e53b0e616e1b1a821c626/

Also, remove the Blackfin toolchain dependencies as these are redundant now
since Blackfin is a noMMU arch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/czmq/Config.in | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 29333680fd61..fbdedd1bec2f 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -1,22 +1,18 @@
 config BR2_PACKAGE_CZMQ
 	bool "czmq"
 	select BR2_PACKAGE_ZEROMQ
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
-	# support
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	help
 	  High-level C Binding for 0MQ
 
 	  http://czmq.zeromq.org/
 
 comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-- 
2.0.0.rc0
