From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Aug 2018 22:34:19 +0200
Subject: [Buildroot] [PATCH v2,1/2] boost: locale needs thread with icu
Message-ID: <20180814203420.10964-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Split patch in two and move select of chrono from locale to thread

 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 42428fab10..69fd6158ca 100644
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
-- 
2.14.1
