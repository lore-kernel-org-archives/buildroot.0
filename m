From: Eric Limpens <limpens@gmail.com>
Date: Tue, 23 Sep 2014 22:32:49 +0200
Subject: [Buildroot] [PATCH 1/1] ympd: new package (version 2)
Message-ID: <1411504369-15582-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/Config.in                                       |  1 +
 package/ympd/Config.in                                  | 10 ++++++++++
 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch | 16 ++++++++++++++++
 package/ympd/ympd.mk                                    | 16 ++++++++++++++++
 4 files changed, 43 insertions(+)
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
index 0000000..dadb897
--- /dev/null
+++ b/package/ympd/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_YMPD
+	bool "ympd"
+	select BR2_PACKAGE_LIBMPDCLIENT
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  ympd, Standalone MPD Web GUI written in C,
+	  utilizing Websockets and Bootstrap/JS
+
+comment "ympd needs a toolchain w/ threads"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
new file mode 100644
index 0000000..502e532
--- /dev/null
+++ b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
@@ -0,0 +1,16 @@
+CMakeLists.txt: make it cross-compile friendly. Upstream is looking into a proper solution. 
+
+Signed-Off-by: Eric Limpens <Limpens@Gmail.com>
+
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
index 0000000..33fd4ec
--- /dev/null
+++ b/package/ympd/ympd.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ympd
+#
+################################################################################
+
+YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
+YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
+
+define YMPD_MAKE_HOST_TOOL
+        $(HOSTCC) $(HOST_CFLAGS) $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
+endef
+
+YMPD_PRE_BUILD_HOOKS += YMPD_MAKE_HOST_TOOL
+
+$(eval $(cmake-package))
-- 
1.9.1
