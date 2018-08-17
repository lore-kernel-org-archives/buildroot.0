From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Aug 2018 00:10:14 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] boost: thread needs atomic if GCC hasn't lock-free
In-Reply-To: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
References: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
Message-ID: <20180817221014.32681-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When gcc has not always lock-free atomic ints:
 - lockfree boost::atomic_flag : no

boost thread needs boost atomic:
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - issue was not related to bug 64735 but to lock-free atomic ints so
   add a patch to toolchain/Config.in to get this information in a
   dedicated variable and use it in boost

 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 97695e17b7..57e98c72e4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -313,6 +313,7 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
-- 
2.14.1
