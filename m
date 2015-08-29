From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 14:48:31 +0200
Subject: [Buildroot] [git commit branch/next] package/libopenh264: new
	package
Message-ID: <20150829124901.23C4881DD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=082a3dd28613d18260772b689961ce7843447af7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - make the license info more specific: it's BSD-2c, not just BSD.
  - use a single conditional block to test the architecture, instead
    of multiple separate conditions.
  - add missing arm/armeb handling in the architecture condition.
  - make the host-nasm dependency only used on x86/x86-64, since it's
    not used for other architectures
  - group the ARCH= and ENABLE64BIT= make variable definitions in a
    LIBOPENH264_MAKE_OPTS variable, and use them at install time (in
    addition to build time) to avoid build issues.
  - wrap too long lines in the .mk file.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/libopenh264/Config.in      |   22 +++++++++++++++
 package/libopenh264/libopenh264.mk |   52 ++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d9dfb34..958b3ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -957,6 +957,7 @@ menu "Multimedia"
 	source "package/libmms/Config.in"
 	source "package/libmpeg2/Config.in"
 	source "package/libogg/Config.in"
+	source "package/libopenh264/Config.in"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/live555/Config.in"
diff --git a/package/libopenh264/Config.in b/package/libopenh264/Config.in
new file mode 100644
index 0000000..2b77578
--- /dev/null
+++ b/package/libopenh264/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_x86_64
+
+config BR2_PACKAGE_LIBOPENH264
+	bool "libopenh264"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
+	help
+	  OpenH264 is a codec library which supports H.264 encoding and
+	  decoding.
+
+	  http://www.openh264.org
+
+comment "libopenh264 needs a toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
new file mode 100644
index 0000000..cbe30bc
--- /dev/null
+++ b/package/libopenh264/libopenh264.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# libopenh264
+#
+################################################################################
+
+LIBOPENH264_VERSION = v1.4.0
+LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
+LIBOPENH264_LICENSE = BSD-2c
+LIBOPENH264_LICENSE_FILES = LICENSE
+LIBOPENH264_INSTALL_STAGING = YES
+
+ifeq ($(BR2_aarch64),y)
+LIBOPENH264_ARCH = aarch64
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+LIBOPENH264_ARCH = arm
+else ifeq ($(BR2_i386),y)
+LIBOPENH264_ARCH = x86
+LIBOPENH264_DEPENDENCIES += host-nasm
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+LIBOPENH264_ARCH = mips
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+LIBOPENH264_ARCH = mips64
+else ifeq ($(BR2_x86_64),y)
+LIBOPENH264_ARCH = x86_64
+LIBOPENH264_DEPENDENCIES += host-nasm
+endif
+
+# ENABLE64BIT is really only used for x86-64, other 64 bits
+# architecture don't need it.
+LIBOPENH264_MAKE_OPTS = \
+	ARCH=$(LIBOPENH264_ARCH) \
+	ENABLE64BIT=$(if $(BR2_x86_64),Yes,No)
+
+define LIBOPENH264_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LIBOPENH264_MAKE_OPTS)
+endef
+
+define LIBOPENH264_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LIBOPENH264_MAKE_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define LIBOPENH264_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LIBOPENH264_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
