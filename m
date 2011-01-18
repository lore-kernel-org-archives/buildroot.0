From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:36 -0300
Subject: [Buildroot] [PATCH 06/10] libcuefile: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/libcuefile/Config.in     |    6 ++++
 package/multimedia/libcuefile/libcuefile.mk |   41 +++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libcuefile/Config.in
 create mode 100644 package/multimedia/libcuefile/libcuefile.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index cf44d64..60105fc 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -12,6 +12,7 @@ source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libao/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
+source "package/multimedia/libcuefile/Config.in"
 source "package/multimedia/libdvdread/Config.in"
 source "package/multimedia/libdvdnav/Config.in"
 source "package/multimedia/libid3tag/Config.in"
diff --git a/package/multimedia/libcuefile/Config.in b/package/multimedia/libcuefile/Config.in
new file mode 100644
index 0000000..416b3e1
--- /dev/null
+++ b/package/multimedia/libcuefile/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBCUEFILE
+	bool "libcuefile"
+	help
+	  Cue File library from Musepack
+
+	  http://www.musepack.net/
diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/multimedia/libcuefile/libcuefile.mk
new file mode 100644
index 0000000..728d6d0
--- /dev/null
+++ b/package/multimedia/libcuefile/libcuefile.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libcuefile
+#
+################################################################################
+
+LIBCUEFILE_VERSION = r453
+LIBCUEFILE_SITE = http://files.musepack.net/source
+LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
+LIBCUEFILE_DEPENDENCIES = host-cmake
+LIBCUEFILE_INSTALL_STAGING = YES
+
+# CMake doesn't support having the --sysroot option directly in the
+# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
+LIBCUEFILE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
+LIBCUEFILE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
+
+define LIBCUEFILE_CONFIGURE_CMDS
+	(cd $(@D) ; \
+		$(HOST_DIR)/usr/bin/cmake . \
+		-DCMAKE_C_COMPILER:FILEPATH="$(LIBCUEFILE_TARGET_CC)" \
+		-DCMAKE_C_FLAGS:STRING="$(LIBCUEFILE_TARGET_CFLAGS)" \
+		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
+	)
+endef
+
+define LIBCUEFILE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LIBCUEFILE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+	cp -r $(@D)/include $(STAGING_DIR)/usr
+endef
+
+define LIBCUEFILE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	cp -r $(@D)/include $(TARGET_DIR)/usr
+endef
+
+$(eval $(call GENTARGETS,package/multimedia,libcuefile))
-- 
1.7.3.4
