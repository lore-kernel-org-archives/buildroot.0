From: Steve deRosier <derosier@gmail.com>
Date: Fri, 15 Apr 2016 18:23:44 -0700
Subject: [Buildroot] [PATCH 1/1] flatcc: new package
Message-ID: <1460769824-19461-1-git-send-email-steve.derosier@lairdtech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds flatcc as a new package, pulling v0.3.0 from github. flatcc has
both a host tool - the compiler, and libraries for the target.

Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
---
 package/Config.in        |  1 +
 package/flatcc/Config.in |  8 ++++++++
 package/flatcc/flatcc.mk | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/flatcc/Config.in
 create mode 100644 package/flatcc/flatcc.mk

diff --git a/package/Config.in b/package/Config.in
index bcfe13b..9e3d953 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1201,6 +1201,7 @@ menu "Other"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
+	source "package/flatcc/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/gflags/Config.in"
diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
new file mode 100644
index 0000000..4f84f06
--- /dev/null
+++ b/package/flatcc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FLATCC
+	bool "flatcc"
+	help
+	  flatcc is C language implementation of Google Flatbuffers. It consists
+	  of both a library for the target as well as a flatbuffer compiler tool
+	  for the host.
+
+	  https://github.com/dvidelabs/flatcc
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
new file mode 100644
index 0000000..28fb89b
--- /dev/null
+++ b/package/flatcc/flatcc.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# FLATCC
+#
+################################################################################
+FLATCC_VERSION = v0.3.0
+FLATCC_SITE =$(call github,dvidelabs,flatcc,$(FLATCC_VERSION))
+FLATCC_LICENSE = Apache-2.0
+FLATCC_LICENSE_FILES = LICENSE
+FLATCC_INSTALL_STAGING = YES
+FLATCC_DEPENDENCIES += host-flatcc
+
+FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF -DFLATCC_PORTABLE=ON
+HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
+
+define HOST_FLATCC_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/flatcc $(HOST_DIR)/usr/bin/flatcc
+endef
+
+ifeq ($(BR2_STATIC_LIBS),y)
+	FLATCC_INSTALL_TARGET = NO
+define FLATCC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.a $(STAGING_DIR)/usr/lib/libflatcc.a
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.a $(STAGING_DIR)/usr/lib/libflatccrt.a
+	cp -r $(@D)/include/flatcc $(STAGING_DIR)/usr/include/.
+endef
+else
+define FLATCC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(STAGING_DIR)/usr/lib/libflatcc.so
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(STAGING_DIR)/usr/lib/libflatccrt.so
+	cp -r $(@D)/include/flatcc $(STAGING_DIR)/usr/include/.
+endef
+endif
+
+define FLATCC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(TARGET_DIR)/usr/lib/libflatcc.so
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(TARGET_DIR)/usr/lib/libflatccrt.so
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
1.9.1
