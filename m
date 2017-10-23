From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 23 Oct 2017 14:34:13 -0400
Subject: [Buildroot] [PATCH 1/1] boost: require NPTL
Message-ID: <20171023183413.18288-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pin_thread.cpp:31:39: error: '::pthread_setaffinity_np' has not been declared [1]


[1]
http://autobuild.buildroot.net/results/029/0298038fc126d15733d81c54e0bb7cb00be48b92/build-end.log
http://autobuild.buildroot.net/results/6f3/6f3a218c47204e431100799482a3ed0ec159fa15/build-end.log
http://autobuild.buildroot.net/results/63e/63e5569a90d3ace97cb6102509cbd04aeab6f5f7/build-end.log


Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 3b3c89b8c1..e06529a3fe 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,9 +1,10 @@
-comment "boost needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "boost needs a toolchain w/ C++, threads, wchar, NTPL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# Boost could theorically be built with threading=single, but
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
-- 
2.13.6
