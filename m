From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 08:44:39 +0200
Subject: [Buildroot] [git commit] czmq: needs MMU
Message-ID: <20140505064708.C7F579CB01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=948b963d1bbba6ad3cdca7d68a3bd02eadaadbb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6dd/6dd6954e5ab8c422070e53b0e616e1b1a821c626/

Also, remove the Blackfin toolchain dependencies as these are redundant now
since Blackfin is a noMMU arch.

[Peter: propagate to filemq as well]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/Config.in   |    8 ++------
 package/filemq/Config.in |    8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 2933368..fbdedd1 100644
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
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b7b085d..1604846 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -8,17 +8,13 @@ config BR2_PACKAGE_FILEMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
-	# support, which is needed by czmq
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on BR2_USE_MMU # czmq
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
 
 	  http://github.com/zeromq/filemq
 
 comment "filemq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
