From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 22:32:14 +0200
Subject: [Buildroot] [git commit] boost: context needs thread without C++11
 mutex
Message-ID: <20180818202516.C08BE8D5F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b20c5ca3b8c5b180a6ee87556d0c87d474e86cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extract from output/build/boost-1.67.0/libs/context/build/Jamfile.v2:

explicit cxx11_hdr_mutex_check ;
local cxx11_mutex = [ check-target-builds
      cxx11_hdr_mutex_check "C++11 mutex"
    :
    : <library>/boost/thread//boost_thread
  ] ;

So select boost_thread if gcc <= 4.7

Fixes:
 - http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 57e98c72e4..0fd049d53c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -83,6 +83,7 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  C++11 context switching library.
 
