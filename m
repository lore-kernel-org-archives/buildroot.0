From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 20:17:02 +0100
Subject: [Buildroot] [PATCH v3,1/3] package/tbb: new package
Message-ID: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Intel Threading Building Blocks (TBB), is a C++ library to help developers
write highly parallelized applications. OpenCV uses it to accelerate some of
it's more heavy weight procedures.

Signed-off-by: bradford barr <bradford@density.io>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni and Yegor Yefremov):
 - Bump to latest version
 - Add DEVELOPERS entry
 - Drop unneeded patch
 - Add needed dependencies to display comment in Config.in
 - Drop BR2_ENABLE_DEBUG
 - Fix install of headers
 - Add hash for license file

 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/tbb/Config.in | 17 +++++++++++++++++
 package/tbb/tbb.hash  |  3 +++
 package/tbb/tbb.mk    | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/tbb/Config.in
 create mode 100644 package/tbb/tbb.hash
 create mode 100644 package/tbb/tbb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1f94df951..177db44f25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -879,6 +879,7 @@ F:	package/python-parso/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/suricata/
+F:	package/tbb/
 F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
diff --git a/package/Config.in b/package/Config.in
index 9e2b78fe6a..5861078257 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1816,6 +1816,7 @@ endif
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
+	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/tbb/Config.in b/package/tbb/Config.in
new file mode 100644
index 0000000000..8d4532795a
--- /dev/null
+++ b/package/tbb/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TBB
+	bool "tbb"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
+	  easily write parallel C++ programs that take full advantage
+	  of multicore performance, that are portable, composable and
+	  have future-proof scalability.
+
+	  https://www.threadingbuildingblocks.org/
+
+comment "tbb needs a glibc toolchain w/ threads, C++, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
new file mode 100644
index 0000000000..c079d7a305
--- /dev/null
+++ b/package/tbb/tbb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  15652f5328cf00c576f065e5cd3eaf3317422fe82afb67a9bcec0dc065bd2abe  tbb-2019_U9.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
new file mode 100644
index 0000000000..88ea4fec23
--- /dev/null
+++ b/package/tbb/tbb.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# tbb
+#
+################################################################################
+
+TBB_VERSION = 2019_U9
+TBB_SITE = $(call github,intel,tbb,$(TBB_VERSION))
+TBB_INSTALL_STAGING = YES
+TBB_LICENSE = Apache-2.0
+TBB_LICENSE_FILES = LICENSE
+
+TBB_SO_VERSION = 2
+TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
+
+TBB_BIN_PATH = $(@D)/build/linux_*_release
+
+define TBB_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) arch=$(BR2_ARCH) -C $(@D)
+endef
+
+define TBB_INSTALL_LIBS
+	$(foreach lib,$(TBB_LIBS),
+		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
+			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
+		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
+	)
+endef
+
+define TBB_INSTALL_STAGING_CMDS
+	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include
+	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
+endef
+
+define TBB_INSTALL_TARGET_CMDS
+	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.24.0
