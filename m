From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 00:31:48 +0200
Subject: [Buildroot] [PATCH] leaktracer: New package
Message-ID: <1467412308-17545-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                |  1 +
 package/leaktracer/Config.in     |  8 ++++++++
 package/leaktracer/leaktracer.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/leaktracer/Config.in
 create mode 100644 package/leaktracer/leaktracer.mk

diff --git a/package/Config.in b/package/Config.in
index 5779d04..b465fe9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,6 +88,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/ktap/Config.in"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
+	source "package/leaktracer/Config.in"
 	source "package/lmbench/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/lsof/Config.in"
diff --git a/package/leaktracer/Config.in b/package/leaktracer/Config.in
new file mode 100644
index 0000000..18c07a7
--- /dev/null
+++ b/package/leaktracer/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LEAKTRACER
+	bool "leaktracer"
+	help
+	  LeakTracer is a small tool written to check a C++ program for memory
+	  leaks. Ideal if valgrind is not ported to your platform or if you
+	  can't use libduma.
+
+	  https://github.com/fredericgermain/LeakTracer
diff --git a/package/leaktracer/leaktracer.mk b/package/leaktracer/leaktracer.mk
new file mode 100644
index 0000000..73dd0fc
--- /dev/null
+++ b/package/leaktracer/leaktracer.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# leaktracer
+#
+################################################################################
+
+LEAKTRACER_VERSION = b1b6c44762669de4fa6b48a02a813bfd3eb53a23
+LEAKTRACER_SITE = $(call github,fredericgermain,leaktracer,$(LEAKTRACER_VERSION))
+LEAKTRACER_LICENSE = LGPLv2.1+ (Library) GPLv2+ (manual and tools)
+LEAKTRACER_LICENSE_FILES = COPYING COPYING.LIB
+LEAKTRACER_INSTALL_STAGING = YES
+
+define LEAKTRACER_BUILD_CMDS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" OBJDIR="$(@D)/build" -C $(@D)
+endef
+
+define LEAKTRACER_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install \
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr OBJDIR="$(@D)/build"
+endef
+
+define LEAKTRACER_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install \
+		DESTDIR="$(TARGET_DIR)" PREFIX=/usr OBJDIR="$(@D)/build"
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
