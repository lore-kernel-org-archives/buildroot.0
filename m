From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 19 Sep 2015 10:55:00 +0900
Subject: [Buildroot] [PATCH 1/1] Signed-off-by: Hiroshi Kawashima
	<kei-k@ca2.so-net.ne.jp>
Message-ID: <201509190155.t8J1t0tf027928@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding new package, squeezelite is a sound client for Logitech Media Server.
---
 package/squeezelite/Config.in      |   30 ++++++++++++++++++++++++++++++
 package/squeezelite/squeezelite.mk |   34 ++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 package/squeezelite/Config.in
 create mode 100644 package/squeezelite/squeezelite.mk

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
new file mode 100644
index 0000000..33e1d08
--- /dev/null
+++ b/package/squeezelite/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_SQUEEZELITE
+	bool "squeezelite"
+	depends on BR2_USE_WCHAR	# flac
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBMAD
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_FAAD2
+	select BR2_PACKAGE_MPG123
+	select BR2_PACKAGE_LIBSOXR
+	help
+	  Logitech Media Server client
+	  https://code.google.com/p/squeezelite/
+
+config BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
+	bool "Enable resampling function"
+	default y
+	depends on BR2_PACKAGE_SQUEEZELITE
+	help
+	  Enable resampling function
+
+config BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP
+	bool "Use OpenMP for resampling"
+	default y
+	depends on BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE
+	help
+	  Enable OpenMP support for resampling
+
+comment "squeezelite needs a toolchain w/ wchar (incur from flac)"
+	depends on !BR2_USE_WCHAR
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
new file mode 100644
index 0000000..1ea3007
--- /dev/null
+++ b/package/squeezelite/squeezelite.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# squeezelite -- Logitech Media Server client
+#
+################################################################################
+
+SQUEEZELITE_VERSION = v1.8
+SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
+SQUEEZELITE_SITE_METHOD = git
+SQUEEZELITE_LICENSE = GPLv3
+SQUEEZELITE_LICENSE_FILE = LICENSE.txt
+SQUEEZELITE_INSTALL_STAGING = NO
+SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123 libsoxr
+
+#SQUEEZELITE_OPTS = "-DLINKALL"
+SQUEEZELITE_OPTS = ""
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE),y)
+	SQUEEZELITE_OPTS += -DRESAMPLE
+	ifeq ($(BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP),y)
+		SQUEEZELITE_OPTS += -DRESAMPLE_MP
+	endif
+endif
+
+define SQUEEZELITE_BUILD_CMDS
+    $(MAKE) OPTS="$(SQUEEZELITE_OPTS)" \
+	CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define SQUEEZELITE_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
1.7.1

============================================================
    Hiroshi Kawashima
