From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 10 May 2017 11:25:54 +0200
Subject: [Buildroot] [PATCH] boost: disable locale and regex modules if
	static build and icu are enabled
Message-ID: <1494408354-20297-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Boost build system doesn't support ICU static only building [1], so
so disable locale and regex modules for this case.

[1] http://boost.2283326.n4.nabble.com/bjam-Building-Regex-with-static-runtime-linking-td2588874.html

Fixes:
http://autobuild.buildroot.net/results/436/436f6173bb29a945abc75899a6b74e1266362fc9

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9825c09..76efe3b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -98,6 +98,8 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
+	# Boost build system doesn't support ICU static only building
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_BOOST_LOG
@@ -134,6 +136,8 @@ config BR2_PACKAGE_BOOST_RANDOM
 
 config BR2_PACKAGE_BOOST_REGEX
 	bool "boost-regex"
+	# Boost build system doesn't support ICU static only building
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
 
 config BR2_PACKAGE_BOOST_SERIALIZATION
 	bool "boost-serialization"
-- 
2.1.4
