From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:22:28 +0100
Subject: [Buildroot] [git commit] package/kodi: needs
	BR2_TOOLCHAIN_HAS_SYNC_8
Message-ID: <20160305142328.EC09180ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35ab3a372f3415e8f7aa9279600b68827c94b645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build error on arm detected by autobuilders:
http://autobuild.buildroot.net/results/439/43939f65e4516adddc4385c6e0a2193abcab0446/
http://autobuild.buildroot.net/results/322/322e3cd3b444106c9b624675c2265d4fdfefe458/
http://autobuild.buildroot.net/results/3c1/3c1a0e35325828c554f49ab9dbeb4b9b16f9b1e5/
http://autobuild.buildroot.net/results/222/222e8f3392a794b693ff0a9617453bdffbce8aef/
http://autobuild.buildroot.net/results/d91/d91efe30996ddbb4706885b48ff6d5d3fa974df8/

and this build error on BR2_x86_i486

xbmc/filesystem/filesystem.a(FileCache.o): In function `std::__atomic_base<long long>::store(long long, std::memory_order)':
/home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to `__atomic_store_8'
/home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:478: undefined reference to `__atomic_store_8'
xbmc/filesystem/filesystem.a(FileCache.o): In function `std::__atomic_base<long long>::load(std::memory_order) const':
/home/bernd/buildroot/br6_kodi_next/output/host/usr/i486-buildroot-linux-uclibc/include/c++/4.9.3/bits/atomic_base.h:500: undefined reference to `__atomic_load_8'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 13955e4..474376f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
+		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
+		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
 comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
