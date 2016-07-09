From: Dagg Stompler <daggs@gmx.com>
Date: Sat,  9 Jul 2016 20:41:20 +0300
Subject: [Buildroot] [PATCH v4] libamcodec: New Package
Message-ID: <20160709174120.4438-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v3 -> v4:
  - add missing LIBAMCODEC_INSTALL_STAGING (thanks to Bernd Kuhls).
  - use new version of git repo and update the hash.
  - drop 0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch patch as it was merged into the repo.

v2 -> v3:
  - fix sum256 value.
  - fix patch.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/Config.in                  |  1 +
 package/libamcodec/Config.in       | 13 +++++++++++++
 package/libamcodec/libamcodec.hash |  2 ++
 package/libamcodec/libamcodec.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/libamcodec/Config.in
 create mode 100644 package/libamcodec/libamcodec.hash
 create mode 100644 package/libamcodec/libamcodec.mk

diff --git a/package/Config.in b/package/Config.in
index 4e746a3..b264766 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1100,6 +1100,7 @@ endmenu
 menu "Multimedia"
 	source "package/bitstream/Config.in"
 	source "package/libaacs/Config.in"
+	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
new file mode 100644
index 0000000..52778ba
--- /dev/null
+++ b/package/libamcodec/Config.in
@@ -0,0 +1,13 @@
+comment "libamcodec needs a toolchain w/ threads"
+	depends on BR2_arm || BR2_aarch64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBAMCODEC
+	bool "libamcodec"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	    Interface library for Amlogic media codecs
+
+	    https://github.com/mdrjr/c2_aml_libs.git
diff --git a/package/libamcodec/libamcodec.hash b/package/libamcodec/libamcodec.hash
new file mode 100644
index 0000000..13bb1e85
--- /dev/null
+++ b/package/libamcodec/libamcodec.hash
@@ -0,0 +1,2 @@
+# Locally computed hash
+sha256 5e4a1157e75f802585445df55182b5ef123f635b7faca95fbda3f7cdef8bad1c  libamcodec-6f9b99182f94be14fce785c75aa1e9bce868e229.tar.gz
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
new file mode 100644
index 0000000..1d280d5
--- /dev/null
+++ b/package/libamcodec/libamcodec.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libamcodec
+#
+################################################################################
+
+LIBAMCODEC_VERSION = 6f9b99182f94be14fce785c75aa1e9bce868e229
+LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
+LIBAMCODEC_DEPENDENCIES = alsa-lib
+LIBAMCODEC_LICENSE = Unclear
+LIBAMCODEC_INSTALL_STAGING = YES
+
+# This package uses the M_PREFIX or PREFIX variables to construct the header and
+# library paths used when compiling
+define LIBAMCODEC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amavutils M_PREFIX="$(STAGING_DIR)/usr"
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amadec M_PREFIX="$(STAGING_DIR)/usr"
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amcodec PREFIX="$(STAGING_DIR)"
+endef
+
+define LIBAMCODEC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib/libamavutils.so
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib/libamadec.so
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib/libamcodec.so
+	mkdir -p $(STAGING_DIR)/usr/include/amcodec
+	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
+endef
+
+define LIBAMCODEC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib/libamavutils.so
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib/libamadec.so
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib/libamcodec.so
+endef
+
+$(eval $(generic-package))
-- 
2.9.0
