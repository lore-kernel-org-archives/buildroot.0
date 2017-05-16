From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:45:35 +0200
Subject: [Buildroot] [git commit] package/boost: disable boost-locale for
	static only build with icu
Message-ID: <20170516084342.DF86882884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5270553b9037c775acec493c8d05275fdf53ed05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Boost fails to build with the following error:

error: Tried to build the target twice, with property sets having
error: these incompatible properties:
error:
error:     -  <runtime-link>static <warnings>all
error:     -  <runtime-link>shared <warnings>on

when the following conditions are met:

 - BR2_STATIC_LIBS=y
 - BR2_PACKAGE_ICU=y
 - BR2_PACKAGE_BOOST_LOCALE=y
 - Another BR2_PACKAGE_BOOST_xyz option is enabled, which enables a
   feature not provided just by header files, but that requires
   building a library.

In such a situation, Boost absolutely wants to build the libboost
libraries as shared libraries. Not having boost-locale, or not having
icu is sufficient to avoid the issue.

So, as a simple work-around, we prevent from building boost-locale
when icu and static linking are used.

Fixes:

  http://autobuild.buildroot.net/results/c8f7aa85f5791d8ae8cf4b9085788adc5152286f/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas:
 - only disable boost-locale when icu is enabled
 - improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9825c09..f0a2385 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -98,8 +98,21 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
+	# When boost-locale is enabled with icu support, Boost no
+	# longer supports building the libboost_* libraries as static
+	# libraries, causing build failures when other boost features
+	# than boost-locale are enabled. To work around this, we
+	# prevent using boost-locale on static linking configurations
+	# with icu enabled. See
+	# https://svn.boost.org/trac/boost/ticket/9685 for more
+	# details.
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 
+comment "boost-locale needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_ICU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
