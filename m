From: Bradford Barr <bradford@density.io>
Date: Tue, 26 Sep 2017 16:35:03 -0400
Subject: [Buildroot] [PATCH 1/2] tbb: new package
In-Reply-To: <20170926203504.22326-1-bradford@density.io>
References: <20170926203504.22326-1-bradford@density.io>
Message-ID: <20170926203504.22326-2-bradford@density.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

Intel Threading Building Blocks (TBB), is a C++ library to help developers
write highly parallelized applications. OpenCV uses it to accelerate some of
it's more heavy weight procedures.

Signed-off-by: bradford barr <bradford@density.io>
---
 package/Config.in                     |  1 +
 package/tbb/0001-prevent-thumb.patch  | 15 +++++++++++++++
 package/tbb/0002-cross-compiler.patch | 14 ++++++++++++++
 package/tbb/Config.in                 | 13 +++++++++++++
 package/tbb/tbb.hash                  |  3 +++
 package/tbb/tbb.mk                    | 35 +++++++++++++++++++++++++++++++++++
 6 files changed, 81 insertions(+)
 create mode 100644 package/tbb/0001-prevent-thumb.patch
 create mode 100644 package/tbb/0002-cross-compiler.patch
 create mode 100644 package/tbb/Config.in
 create mode 100644 package/tbb/tbb.hash
 create mode 100644 package/tbb/tbb.mk

diff --git a/package/Config.in b/package/Config.in
index 6acd0c4..f71e781 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1503,6 +1503,7 @@ endif
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
+	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/tbb/0001-prevent-thumb.patch b/package/tbb/0001-prevent-thumb.patch
new file mode 100644
index 0000000..942f7f4
--- /dev/null
+++ b/package/tbb/0001-prevent-thumb.patch
@@ -0,0 +1,15 @@
+diff -Naur tbb-2017_U8/build/linux.gcc.inc b/build/linux.gcc.inc
+--- tbb-2017_U8/build/linux.gcc.inc	2017-09-22 15:57:33.000000000 -0400
++++ b/build/linux.gcc.inc	2017-09-25 14:46:39.584066690 -0400
+@@ -115,11 +115,6 @@
+     LIB_LINK_FLAGS += -mcpu=v9 -m64
+ endif
+ 
+-# automatically generate "IT" instructions when compiling for Thumb ISA
+-ifeq (armv7,$(arch))
+-    CPLUS_FLAGS    += -Wa,-mimplicit-it=thumb
+-endif
+-
+ #------------------------------------------------------------------------------
+ # Setting assembler data.
+ #------------------------------------------------------------------------------
diff --git a/package/tbb/0002-cross-compiler.patch b/package/tbb/0002-cross-compiler.patch
new file mode 100644
index 0000000..60a4eb3
--- /dev/null
+++ b/package/tbb/0002-cross-compiler.patch
@@ -0,0 +1,14 @@
+diff -Naur tbb-2017_U8/build/linux.gcc.inc b/build/linux.gcc.inc
+--- tbb-2017_U8/build/linux.gcc.inc	2017-09-25 14:58:24.593148831 -0400
++++ b/build/linux.gcc.inc	2017-09-25 15:08:17.032422555 -0400
+@@ -32,8 +32,8 @@
+ EXPORT_KEY = -Wl,--version-script,
+ LIBDL = -ldl
+ 
+-CPLUS = g++
+-CONLY = gcc
++CPLUS = arm-linux-gnueabihf-g++
++CONLY = arm-linux-gnueabihf-gcc
+ LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
+ LIBS += -lpthread -lrt
+ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
diff --git a/package/tbb/Config.in b/package/tbb/Config.in
new file mode 100644
index 0000000..d2c8c04
--- /dev/null
+++ b/package/tbb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TBB
+	bool "tbb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you easily
+	  write parallel C++ programs that take full advantage of multicore
+	  performance, that are portable, composable and have future-proof
+	  scalability.
+
+	  https://www.threadingbuildingblocks.org/
+
+comment "tbb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
new file mode 100644
index 0000000..7e73cb4
--- /dev/null
+++ b/package/tbb/tbb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c6462217d4ecef2b44fce63cfdf31f9db4f6ff493869899d497a5aef68b05fc5  tbb-2018_U1.tar.gz
+sha256  1b1357f280e750d42506212adad02f85ac07c9d3e3c0813104f9122ef350497f  tbb-2017_U8.tar.gz
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
new file mode 100644
index 0000000..d9ac4c8
--- /dev/null
+++ b/package/tbb/tbb.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# tbb
+#
+################################################################################
+
+TBB_VERSION = 2017_U8
+TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
+TBB_INSTALL_STAGING = YES
+TBB_LICENSE = Apache-2.0
+TBB_LICENSE_FILES = LICENSE
+
+define TBB_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CPLUS=$(HOSTCXX) CONLY=$(HOSTCC) arch=$(BR2_ARCH) -C $(@D) tbb
+endef
+
+define TBB_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/tbb
+	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/tbb
+	for f in $$(find $(@D)/build/linux_*_release -type f -iname "libtbb.so*"); do \
+		if grep -q -v INPUT $$f; then \
+			$(INSTALL) -D -m 0755 $$f $(STAGING_DIR)/usr/lib ; \
+		fi \
+	done
+endef
+
+define TBB_INSTALL_TARGET_CMDS
+	for f in $$(find $(@D)/build/linux_*_release -type f -iname "libtbb.so*"); do \
+		if grep -q -v INPUT $$f; then \
+			$(INSTALL) -D -m 0755 $$f $(TARGET_DIR)/usr/lib ; \
+		fi \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
