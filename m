From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:51:02 +0200
Subject: [Buildroot] [git commit] squeezelite: new package
Message-ID: <20151012155202.3D9D781E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5328048af0c9c1f8dd0a4d24bd9160447c596e20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - replicate the ffmpeg "depends on" related to the broken NIOS2
    toolchains to the BR2_PACKAGE_SQUEEZELITE_FFMPEG option.
  - use the github helper function.
  - add hash file.]

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/squeezelite/0001-Makefile-override.patch |   42 ++++++++++++++++++++++
 package/squeezelite/Config.in                    |   40 ++++++++++++++++++++
 package/squeezelite/squeezelite.hash             |    2 +
 package/squeezelite/squeezelite.mk               |   42 ++++++++++++++++++++++
 5 files changed, 127 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 084efa0..37d9cd0 100644
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
diff --git a/package/squeezelite/0001-Makefile-override.patch b/package/squeezelite/0001-Makefile-override.patch
new file mode 100644
index 0000000..4e11541
--- /dev/null
+++ b/package/squeezelite/0001-Makefile-override.patch
@@ -0,0 +1,42 @@
+This patch is applied to squeezelite Makefile to add override
+directive for CFLAGS and LDFLAGS assignment.
+This enables adding flags to CFLAGS and LDFLAGS in Makefile.
+
+Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+
+diff -ruN a/Makefile b/Makefile
+--- a/Makefile	2015-02-01 23:56:21.000000000 +0900
++++ b/Makefile	2015-09-29 20:06:52.268069187 +0900
+@@ -1,4 +1,6 @@
+ # Cross compile support - create a Makefile which defines these three variables and then includes this Makefile...
++override CFLAGS += $(OPTS)
++override LDFLAGS += -lasound -lpthread -lm -lrt
+ CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
+ LDFLAGS ?= -lasound -lpthread -lm -lrt
+ EXECUTABLE ?= squeezelite
+@@ -52,20 +54,20 @@
+ 
+ # add optional link options
+ ifneq (,$(findstring $(OPT_LINKALL), $(CFLAGS)))
+-	LDFLAGS += $(LINKALL)
++	override LDFLAGS += $(LINKALL)
+ ifneq (,$(findstring $(OPT_FF), $(CFLAGS)))
+-	LDFLAGS += $(LINKALL_FF)
++	override LDFLAGS += $(LINKALL_FF)
+ endif
+ ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
+-	LDFLAGS += $(LINKALL_RESAMPLE)
++	override LDFLAGS += $(LINKALL_RESAMPLE)
+ endif
+ ifneq (,$(findstring $(OPT_IR), $(CFLAGS)))
+-	LDFLAGS += $(LINKALL_IR)
++	override LDFLAGS += $(LINKALL_IR)
+ endif
+ else
+ # if not LINKALL and linux add LINK_LINUX
+ ifeq ($(UNAME), Linux)
+-	LDFLAGS += $(LINK_LINUX)
++	override LDFLAGS += $(LINK_LINUX)
+ endif
+ endif
+ 
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
new file mode 100644
index 0000000..1241085
--- /dev/null
+++ b/package/squeezelite/Config.in
@@ -0,0 +1,40 @@
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
+config BR2_PACKAGE_SQUEEZELITE_FFMPEG
+	bool "Enable WMA and ALAC decoding"
+	default y
+	select BR2_PACKAGE_FFMPEG
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # ffmpeg
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # ffmpeg
+
+config BR2_PACKAGE_SQUEEZELITE_DSD
+	bool "Enable DSD decoding"
+
+config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
+	bool "Enable resampling support"
+	select BR2_PACKAGE_LIBSOXR
+
+config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
+	bool "Enable visualiser support"
+
+endif
+
+comment "squeezelite needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/squeezelite/squeezelite.hash b/package/squeezelite/squeezelite.hash
new file mode 100644
index 0000000..1dbb4c1
--- /dev/null
+++ b/package/squeezelite/squeezelite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0c844e7714d3f15325629c59ee75e6309763116e61a6b73486b502e2e5cce5fd squeezelite-v1.8.tar.gz
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
new file mode 100644
index 0000000..b9dfa7f
--- /dev/null
+++ b/package/squeezelite/squeezelite.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# squeezelite
+#
+################################################################################
+
+SQUEEZELITE_VERSION = v1.8
+SQUEEZELITE_SITE = $(call github,robadenshi,squeezelite,$(SQUEEZELITE_VERSION))
+SQUEEZELITE_LICENSE = GPLv3
+SQUEEZELITE_LICENSE_FILE = LICENSE.txt
+SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
+SQUEEZELITE_MAKE_OPTS = -DLINKALL
+
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_FFMPEG),y)
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
+define SQUEEZELITE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
+endef
+
+define SQUEEZELITE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/squeezelite \
+		$(TARGET_DIR)/usr/bin/squeezelite
+endef
+
+$(eval $(generic-package))
