From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Jul 2018 19:30:26 +0200
Subject: [Buildroot] [PATCH 1/1] boost: thread needs atomic if GCC has bug
 64735
Message-ID: <20180713173026.2389-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gcc has bug 64735, lock-free atomic ints are not supported:
 - lockfree boost::atomic_flag : no

As a result, boost thread needs boost atomic:
output/host/usr/bin/nios2-linux-readelf -d output/staging/usr/lib/libboost_thread.so

Dynamic section at offset 0x2cee0 contains 32 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_atomic.so.1.67.0]

Fixes:
 - http://autobuild.buildroot.net/results/5a7db292f1365f27e32695527701d5b827f60092
 - http://autobuild.buildroot.net/results/413dff87f5329d3c5180167a8711cdedea5dec67
 - http://autobuild.buildroot.net/results/a7eb4cbcdbd9412c344f45336dec58c82e84dab9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 510ed336e4..42428fab10 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -313,6 +313,7 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	select BR2_PACKAGE_BOOST_ATOMIC if BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
-- 
2.14.1
