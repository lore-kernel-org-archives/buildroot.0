From: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
Date: Mon, 28 Sep 2015 21:46:54 +0900
Subject: [Buildroot] [PATCH v13 1/1] squeezelite: new package
Message-ID: <201509281246.t8SCktDe022277@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, all.

Please review attached patch.

I've fixed SQUEEZELITE_BUILD_CMDS issue.
I hope this will be the final version, and be pulled up.

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
v12 -> v13
- change SQUEEZELITE_SITE to github (mine), cloned from original
  google code site (original site is unstable to fetch).
- change to use $(TARGET_CONFIGURE_OPTS) on SQUEEZELITE_BUILD_CMDS to
  be suitable for buildroot make system.
- to accomplish above, change to generate buildroot suitable Makefile from
  original squeezelite's Makefile (using 'override' directive for CFLAGS,
  LDFLAGS).

v11 -> v12
- remove -DRESAMPLE_MP, because libsoxr is compiled without
  openMP support in buildroot, so meaningless for now.
- add -DLINKALL to resolve symbols in optional libraries (libsoxr, etc).
- add more configuration options : ffmpeg, DSD, Visualizer.
  lirc support is not included for now, because more work will be
  necessary to use it (eg: modifying package/lirc-tools to add
  LIRC_TOOLS_INSTALL_STAGING = YES).
---
 package/Config.in                  |    1 +
 package/squeezelite/Config.in      |   46 ++++++++++++++++++++++++++++++++
 package/squeezelite/squeezelite.mk |   51 ++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 package/squeezelite/Config.in
 create mode 100644 package/squeezelite/squeezelite.mk

diff --git a/package/Config.in b/package/Config.in
index 0e0c5cd..7c5a43a 100644
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
index 0000000..b4af3c8
--- /dev/null
+++ b/package/squeezelite/Config.in
@@ -0,0 +1,46 @@
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
+	help
+	  Logitech Media Server client
+
+	  https://code.google.com/p/squeezelite/
+
+if BR2_PACKAGE_SQUEEZELITE
+
+config BR2_PACKAGE_SQUEEZELITE_FF
+	bool "Enable wma, alac decoding (by ffmpeg)"
+	default y
+	select BR2_PACKAGE_FFMPEG
+	help
+	  Enable wma, alac decoding
+
+config BR2_PACKAGE_SQUEEZELITE_DSD
+	bool "Enable dsd decoding"
+	help
+	  Enable built-in DSD decoder
+
+config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
+	bool "Enable resampling function"
+	select BR2_PACKAGE_LIBSOXR
+	help
+	  Enable resampling function
+
+config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
+	bool "Enable Visualiser support"
+	help
+	  Enable Visualiser support
+
+endif
+
+comment "squeezelite needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
new file mode 100644
index 0000000..f64da6a
--- /dev/null
+++ b/package/squeezelite/squeezelite.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# squeezelite
+#
+################################################################################
+
+SQUEEZELITE_VERSION = v1.8
+SQUEEZELITE_SITE = https://github.com/robadenshi/squeezelite
+SQUEEZELITE_SITE_METHOD = git
+SQUEEZELITE_LICENSE = GPLv3
+SQUEEZELITE_LICENSE_FILE = LICENSE.txt
+SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
+SQUEEZELITE_MAKE_OPTS = -DLINKALL
+SQUEEZELITE_MAKEFILE  = Makefile.buildroot
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_FF),y)
+SQUEEZELITE_DEPENDENCIES += ffmpeg
+SQUEEZELITE_MAKE_OPTS += -DFFMPEG
+endif
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_DSD),y)
+SQUEEZELITE_MAKE_OPTS += -DDSD
+endif
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
+SQUEEZELITE_DEPENDENCIES += libsoxr
+SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
+endif
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_VISEXPORT),y)
+SQUEEZELITE_MAKE_OPTS += -DVISEXPORT
+endif
+
+define SQUEEZELITE_CONFIGURE_CMDS
+	sed -e '1aoverride CFLAGS += $$(OPTS)' \
+		-e 's/LDFLAGS +=/override LDFLAGS +=/' \
+		-e 's/LDFLAGS ?=/override LDFLAGS +=/' \
+		$(@D)/Makefile >$(@D)/$(SQUEEZELITE_MAKEFILE)
+endef
+
+define SQUEEZELITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
+		-f $(SQUEEZELITE_MAKEFILE) -C $(@D) all
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
