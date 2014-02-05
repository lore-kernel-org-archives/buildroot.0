From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 23:32:56 +0100
Subject: [Buildroot] [git commit] opencv: need threads support
Message-ID: <20140205223406.1FF029C818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5c24ee3cdeb941e807ec02dc2fc3b70c9bf8760
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the opencv_core module needs threads support, just globally
disable the whole opencv package if the toolchain does not offer this
support.

Fixes:
  http://autobuild.buildroot.org/results/8dd/8dd1674674018a931ba09cc5b414c32360e51692/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 146011a..ccde5cb 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	help
@@ -208,5 +209,5 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 
 endif # BR2_PACKAGE_OPENCV
 
-comment "opencv needs a toolchain w/ C++, wchar"
-	depends on !(BR2_INSTALL_LIBSTDCPP  && BR2_USE_WCHAR)
+comment "opencv needs a toolchain w/ C++, threads, wchar"
+	depends on !(BR2_INSTALL_LIBSTDCPP  && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
