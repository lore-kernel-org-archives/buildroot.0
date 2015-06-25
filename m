From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 25 Jun 2015 19:13:23 +0530
Subject: [Buildroot] [PATCH 1/2] glog: add dependency on dynamic library
Message-ID: <1435239804-17119-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when BR2_STATIC_LIBS=y

src/symbolize.cc:110:19: error: dlfcn.h: No such file or directory

glog requires dlfcn.h header. So add dependency on dynamic library

fixes:
http://autobuild.buildroot.net/results/75d/75d17ceb764c2c1136047c089a0c554770ca98a4/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/glog/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index aed0a3e..534997a 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_GLOG
 	bool "glog"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
-comment "glog needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "glog needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
-- 
1.9.1
