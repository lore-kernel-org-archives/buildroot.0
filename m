From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 May 2017 23:45:56 +0200
Subject: [Buildroot] [PATCH] package/boost: disable boost-locale for static
	only build
Message-ID: <20170514214556.17980-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost-locale build system try to link dynamically with icu
see <link>shared and <runtime-link>shared in locale/build/Jamfile.v2
Related to https://svn.boost.org/trac/boost/ticket/9685

Enabling boost-locale for static only build trigger an incompatible
properties combination.

error: Tried to build the target twice, with property sets having
error: these incompatible properties:
error:
error:     -  <runtime-link>static <warnings>all
error:     -  <runtime-link>shared <warnings>on

Fixes:
http://autobuild.buildroot.net/results/c8f/c8f7aa85f5791d8ae8cf4b9085788adc5152286f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9825c09..6ffa8f0 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -98,8 +98,15 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
+	# boost-locale build system try to link dynamically with icu
+	# see <link>shared and <runtime-link>shared in locale/build/Jamfile.v2
+	# Related to https://svn.boost.org/trac/boost/ticket/9685
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 
+comment "boost-locale needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.9.3
