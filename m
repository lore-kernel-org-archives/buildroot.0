From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Jul 2018 19:43:04 +0200
Subject: [Buildroot] [PATCH 1/1] boost: locale needs chrono and thread with
 icu
Message-ID: <20180713174304.4055-1-fontaine.fabrice@gmail.com>
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
 package/boost/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 42428fab10..92aa17dc63 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -189,7 +189,9 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
+	select BR2_PACKAGE_BOOST_CHRONO if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
-- 
2.14.1
