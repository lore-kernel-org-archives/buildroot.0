From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Aug 2018 22:01:07 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/squid: depends on
 current_exception
Message-ID: <20180824200107.22849-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build error

TextException.cc: In function 'std::ostream& CurrentException(std::ostream&)':
TextException.cc:64:9: error: 'current_exception' is not a member of 'std'
     if (std::current_exception()) {

using this defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv5-ctng-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBKRB5=y

According to http://www.squid-cache.org/Versions/v4/RELEASENOTES.html#ss1.1
squid-4.2 depends on C++11, but adding -std=c++11 did not fix the build
error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/squid/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index c1eb25c6b9..aeffbc6579 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,10 +1,12 @@
-comment "squid needs a toolchain w/ C++"
+comment "squid needs a toolchain w/ C++ not affected by GCC bug 64735"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
+		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
-- 
2.18.0
