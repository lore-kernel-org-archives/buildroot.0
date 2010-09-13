From: Chih-Min Chao <cmchao@gmail.com>
Date: Mon, 13 Sep 2010 23:12:13 +0800
Subject: [Buildroot] [PATCH 3/5] libopenal : new package
In-Reply-To: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
References: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
Message-ID: <1284390735-2261-4-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libopenal/Config.in    |    8 ++++++
 package/multimedia/libopenal/libopenal.mk |   39 +++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libopenal/Config.in
 create mode 100644 package/multimedia/libopenal/libopenal.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 3b0eec5..17e84b2 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -17,6 +17,7 @@ source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libopenal/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
diff --git a/package/multimedia/libopenal/Config.in b/package/multimedia/libopenal/Config.in
new file mode 100644
index 0000000..7262708
--- /dev/null
+++ b/package/multimedia/libopenal/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBOPENAL
+	bool "libopenal"
+	help
+	  OpenAL is a cross-platform 3D audio API appropriate
+	  for use with gaming applications and many other types
+	  of audio applications
+
+	  http://connect.creativelabs.com/openal/default.aspx
diff --git a/package/multimedia/libopenal/libopenal.mk b/package/multimedia/libopenal/libopenal.mk
new file mode 100644
index 0000000..e2b8c97
--- /dev/null
+++ b/package/multimedia/libopenal/libopenal.mk
@@ -0,0 +1,39 @@
+LIBOPENAL_VERSION=1.12.854
+LIBOPENAL_SOURCE=openal-soft-$(LIBOPENAL_VERSION).tar.bz2
+LIBOPENAL_SITE=http://kcat.strangesoft.net/openal-releases
+LIBOPENAL_DEPENDENCIES= host-cmake
+
+# CMake doesn't support having the --sysroot option directly in the
+# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
+LIBOPENAL_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
+LIBOPENAL_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
+LIBOPENAL_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
+LIBOPENAL_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
+
+define LIBOPENAL_CONFIGURE_CMDS
+ -mkdir $(@D)/build
+ (cd $(@D)/build ; \
+	$(HOST_DIR)/usr/bin/cmake .. \
+		-Wno-dev \
+		-DCMAKE_SYSTEM_NAME:STRING="Linux" \
+		-DCMAKE_C_COMPILER:FILEPATH="$(LIBOPENAL_TARGET_CC)" \
+		-DCMAKE_CXX_COMPILER:FILEPATH="$(LIBOPENAL_TARGET_CXX)" \
+		-DCMAKE_C_FLAGS:STRING="$(LIBOPENAL_TARGET_CFLAGS)" \
+		-DCMAKE_CXX_FLAGS:STRING="$(LIBOPENAL_TARGET_CXXFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
+		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
+		-DCMAKE_FIND_ROOT_PATH:PATH="$(STAGING_DIR)" \
+		-DCMAKE_INSTALL_PREFIX:PATH="$(TARGET_DIR)" \
+ )
+endef
+
+define LIBOPENAL_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build
+endef
+
+define LIBOPENAL_INSTALL_TARGET_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build install
+endef
+
+$(eval $(call GENTARGETS,package,libopenal))
-- 
1.7.0.4
