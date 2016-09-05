From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Sep 2016 23:00:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: use
	BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <20160905210056.24393-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __atomic_fetch_add_4 so libatomic must be pulled in if
necessary. Fixes
http://autobuild.buildroot.net/results/652/6521223b426c3cb4dfefab27bc6021900db6910e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opencv3/Config.in  | 2 ++
 package/opencv3/opencv3.mk | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 2f4aa7a..4c00bf1 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_OPENCV3
 	bool "opencv3"
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
@@ -335,6 +336,7 @@ config BR2_PACKAGE_OPENCV3_INSTALL_DATA
 endif # BR2_PACKAGE_OPENCV3
 
 comment "opencv3 needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 91cdfe6..2529de9 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -10,6 +10,11 @@ OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3c
 OPENCV3_LICENSE_FILES = LICENSE
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-latomic"
+endif
+
 # OpenCV component options
 OPENCV3_CONF_OPTS += \
 	-DBUILD_DOCS=OFF \
-- 
2.9.3
