From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 14:11:55 +0200
Subject: [Buildroot] [git commit] libamcodec: new package
Message-ID: <20160716121305.E67967FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ddd6bff322d58454ce2e9115b360f9833fe4ea3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dagg Stompler <daggs@gmx.com>
[Thomas:
 - use the AML_LIBS_STAGING_DIR variable instead of PREFIX/M_PREFIX to
   indicate the compiler sysroot, which allows to use a foreach loop
   in the build commands.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/libamcodec/Config.in       | 13 +++++++++++++
 package/libamcodec/libamcodec.hash |  2 ++
 package/libamcodec/libamcodec.mk   | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fe6ca65..51ff961 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1104,6 +1104,7 @@ endmenu
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
index 0000000..8fab95d
--- /dev/null
+++ b/package/libamcodec/libamcodec.mk
@@ -0,0 +1,36 @@
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
+# This package uses the AML_LIBS_STAGING_DIR variable to construct the
+# header and library paths used when compiling
+define LIBAMCODEC_BUILD_CMDS
+	$(foreach d,amavutils amadec amcodec,\
+		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+			-C $(@D)/$(d) AML_LIBS_STAGING_DIR=$(STAGING_DIR)
+	)
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
