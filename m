From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:53 +0200
Subject: [Buildroot] [PATCH/next 08/10] package/libopenh264: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                  |  1 +
 package/libopenh264/Config.in      | 22 ++++++++++++++++++++
 package/libopenh264/libopenh264.mk | 42 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 package/libopenh264/Config.in
 create mode 100644 package/libopenh264/libopenh264.mk

diff --git a/package/Config.in b/package/Config.in
index 8a7960c..8fa4414 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -955,6 +955,7 @@ menu "Multimedia"
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
index 0000000..2ce0a14
--- /dev/null
+++ b/package/libopenh264/libopenh264.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# libopenh264
+#
+################################################################################
+
+LIBOPENH264_VERSION = v1.4.0
+LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
+LIBOPENH264_LICENSE = BSD
+LIBOPENH264_LICENSE_FILES = LICENSE
+LIBOPENH264_INSTALL_STAGING = YES
+LIBOPENH264_DEPENDENCIES = host-nasm
+
+ifeq ($(BR2_aarch64),y)
+LIBOPENH264_ARCH = aarch64
+endif
+ifeq ($(BR2_mips)$(BR2_mipsel),y)
+LIBOPENH264_ARCH = mips
+endif
+ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+LIBOPENH264_ARCH = mips64
+endif
+ifeq ($(BR2_i386),y)
+LIBOPENH264_ARCH = x86
+endif
+ifeq ($(BR2_x86_64),y)
+LIBOPENH264_ARCH = x86_64
+endif
+
+define LIBOPENH264_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) ARCH=$(LIBOPENH264_ARCH) ENABLE64BIT=$(if $(BR2_x86_64),Yes,No)
+endef
+
+define LIBOPENH264_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr
+endef
+
+define LIBOPENH264_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
