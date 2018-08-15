From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 22:12:27 +0200
Subject: [Buildroot] [git commit] boost: locale needs thread with icu
Message-ID: <20180815200853.428548D3F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73cdfc6a4d8ab9a1041f9e58be9102cad74f3647
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

output/host/usr/bin/nios2-linux-readelf -d output/staging/usr/lib/libboost_locale.so

Dynamic section at offset 0x125ec0 contains 36 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [librt.so.1]
 0x00000001 (NEEDED)                     Shared library: [libicudata.so.60]
 0x00000001 (NEEDED)                     Shared library: [libicui18n.so.60]
 0x00000001 (NEEDED)                     Shared library: [libicuuc.so.60]

Fixes:
 - http://autobuild.buildroot.net/results/57838f7cd84f37b66ab7007deaea847af8f54b72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 510ed336e4..035a450d12 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -190,6 +190,7 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
