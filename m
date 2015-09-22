From: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
Date: Tue, 22 Sep 2015 12:02:27 +0900
Subject: [Buildroot] [PATCH v8 1/1] squeezelite: new package
Message-ID: <201509220302.t8M32RG6003915@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
 package/Config.in                  |    1 +
 package/squeezelite/Config.in      |   26 ++++++++++++++++++++++++++
 package/squeezelite/squeezelite.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/squeezelite/Config.in
 create mode 100644 package/squeezelite/squeezelite.mk

diff --git a/package/Config.in b/package/Config.in
index 5158371..2a47420 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -33,6 +33,7 @@ menu "Audio and video applications"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
+	source "package/squeezelite/Config.in"
 	source "package/tidsp-binaries/Config.in"
 	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
new file mode 100644
index 0000000..65dfff3
--- /dev/null
+++ b/package/squeezelite/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_SQUEEZELITE
+	bool "squeezelite"
+	depends on BR2_USE_WCHAR # flac
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_USE_MMU # mpg123
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
+config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
+	bool "Enable resampling function"
+	default y
+	depends on BR2_PACKAGE_SQUEEZELITE
+	help
+	  Enable resampling function
+
+comment "squeezelite needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
new file mode 100644
index 0000000..4ea2715
--- /dev/null
+++ b/package/squeezelite/squeezelite.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# squeezelite
+#
+################################################################################
+
+SQUEEZELITE_VERSION = v1.8
+SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
+SQUEEZELITE_SITE_METHOD = git
+SQUEEZELITE_LICENSE = GPLv3
+SQUEEZELITE_LICENSE_FILE = LICENSE.txt
+SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123 libsoxr
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
+	SQUEEZELITE_MAKE_OPTS += -DRESAMPLE -DRESAMPLE_MP
+endif
+
+define SQUEEZELITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
+		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define SQUEEZELITE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
1.7.1

============================================================
    Hiroshi Kawashima
