From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 14:34:31 +0200
Subject: [Buildroot] [git commit] boost: thread needs atomic if GCC hasn't
 lock-free
Message-ID: <20180818153838.BCD5E8D4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2928dfa080658c35f6f0b7c9e62a3ade438a827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
