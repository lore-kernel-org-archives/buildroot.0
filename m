From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 May 2014 18:31:34 -0300
Subject: [Buildroot] [PATCH 1/3] lz4: new package
Message-ID: <1400189496-29633-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in     |  1 +
 package/lz4/Config.in | 14 ++++++++++++++
 package/lz4/lz4.mk    | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/lz4/Config.in
 create mode 100644 package/lz4/lz4.mk

diff --git a/package/Config.in b/package/Config.in
index e0f982e..7a3e5ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -38,6 +38,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/infozip/Config.in"
+source "package/lz4/Config.in"
 source "package/lzip/Config.in"
 source "package/lzop/Config.in"
 source "package/xz/Config.in"
diff --git a/package/lz4/Config.in b/package/lz4/Config.in
new file mode 100644
index 0000000..a855e31
--- /dev/null
+++ b/package/lz4/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LZ4
+	bool "lz4"
+	depends on BR2_LARGEFILE
+	help
+	  LZ4 is a very fast lossless compression algorithm, providing
+	  compression speed at 400 MB/s per core, scalable with multi-cores
+	  CPU. It also features an extremely fast decoder, with speed
+	  in multiple GB/s per core, typically reaching RAM speed limits
+	  on multi-core systems.
+
+	  https://code.google.com/p/lz4/
+
+comment "lz4 needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
new file mode 100644
index 0000000..a089b0e
--- /dev/null
+++ b/package/lz4/lz4.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lz4
+#
+################################################################################
+
+LZ4_VERSION = r117
+LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
+LZ4_INSTALL_STAGING = YES
+LZ4_LICENSE = BSD-2c
+LZ4_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define LZ4_DISABLE_SHARED
+	$(SED) '/SHARED/d' $(@D)/Makefile
+endef
+LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
+endif
+
+define HOST_LZ4_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define HOST_LZ4_INSTALL_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
+endef
+
+define LZ4_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) liblz4
+endef
+
+define LZ4_INSTALL_STAGING_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(STAGING_DIR)
+endef
+
+define LZ4_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.5.5
