From: Eric Limpens <limpens@gmail.com>
Date: Tue, 23 Sep 2014 21:53:32 +0200
Subject: [Buildroot] [PATCH 1/1] ympd: new package
Message-ID: <1411502012-13553-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/Config.in                                       |  1 +
 package/ympd/Config.in                                  |  9 +++++++++
 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch | 12 ++++++++++++
 package/ympd/ympd.mk                                    | 10 ++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/ympd/Config.in
 create mode 100644 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
 create mode 100644 package/ympd/ympd.mk

diff --git a/package/Config.in b/package/Config.in
index 2eefc3f..1578404 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ menu "Audio and video applications"
 	source "package/wavpack/Config.in"
 	source "package/xbmc/Config.in"
 	source "package/yavta/Config.in"
+	source "package/ympd/Config.in"
 endmenu
 
 menu "Compressors and decompressors"
diff --git a/package/ympd/Config.in b/package/ympd/Config.in
new file mode 100644
index 0000000..53f128e
--- /dev/null
+++ b/package/ympd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_YMPD
+	bool "ympd"
+	select BR2_PACKAGE_LIBMPDCLIENT #libmpdclient
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  ympd, Standalone MPD Web GUI written in C, utilizing Websockets and Bootstrap/JS
+
+comment "ympd needs a toolchain w/ threads"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
new file mode 100644
index 0000000..55a29ee
--- /dev/null
+++ b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
@@ -0,0 +1,12 @@
+--- ympd-a98d760dddff4b0dd595d977c9077f34beff05c5/CMakeLists.txt	2014-05-24 15:25:47.000000000 +0200
++++ ympd-a98d760dddff4b0dd595d977c9077f34beff05c5-1/CMakeLists.txt	2014-09-23 20:04:55.491997850 +0200
+@@ -29,6 +29,7 @@
+ )
+ 
+-add_executable(mkdata htdocs/mkdata.c)
+-get_target_property(MKDATA_EXE mkdata LOCATION)
++#add_executable(mkdata htdocs/mkdata.c)
++#get_target_property(MKDATA_EXE mkdata LOCATION)
++set(MKDATA_EXE "./mkdata")
+ 
+ add_custom_command(OUTPUT ${PROJECT_BINARY_DIR}/assets.c
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
new file mode 100644
index 0000000..22727a9
--- /dev/null
+++ b/package/ympd/ympd.mk
@@ -0,0 +1,10 @@
+YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
+YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
+
+define YMPD_MAKE_HOST_TOOL
+        $(CC) -O2 $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
+endef
+
+YMPD_PRE_BUILD_HOOKS += YMPD_MAKE_HOST_TOOL
+
+$(eval $(cmake-package))
-- 
1.9.1
