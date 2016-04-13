From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:12:52 +0200
Subject: [Buildroot] [git commit] cannelloni: needs dynamic library
Message-ID: <20160413211303.1BFAE7FD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64281e5a91e39c67479b8cdbde535e258b968c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cannelloni selects lksctp which depends on !BR2_STATIC_LIBS, but this
dependency was not propagated to cannelloni. Due to this, when
cannelloni was selected, lksctp-tools could be built even in a
BR2_STATIC_LIBS=y configuration.

We fix this by propagating the dependency. While we're at it, we
adjust the indentation of the cannelloni comment dependencies.

Fixes:

  http://autobuild.buildroot.org/results/b589af984499c532951217eb500ff31e6655c63f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cannelloni/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index cb51709..8f3e888 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CANNELLONI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
+	depends on !BR2_STATIC_LIBS # lksctp-tools
 	select BR2_PACKAGE_LKSCTP_TOOLS
 	help
 	  A SocketCAN over Ethernet tunnel. The tunnel supports both
@@ -11,7 +12,7 @@ config BR2_PACKAGE_CANNELLONI
 
 	  https://github.com/mguentner/cannelloni
 
-comment "cannelloni needs a toolchain w/ C++, threads, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-	!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
