From: Dagg <daggs@gmx.com>
Date: Thu,  2 Jun 2016 00:16:07 +0300
Subject: [Buildroot] [PATCH v2] libamcodec: New Package
Message-ID: <20160601211607.31807-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

changes:

v1 -> v2:
 - use git repo as should.
 - add hash file.
 - add alsa-lib dependecy.
 - fix linkage errors.
 - use the correct env vars in makefile calls.

Signed-off-by: Dagg <daggs@gmx.com>
---
 package/Config.in                                  |  1 +
 .../0001-fix_non_cross_compile_env_vars.patch      | 23 +++++++++++++++
 package/libamcodec/Config.in                       | 12 ++++++++
 package/libamcodec/libamcodec.hash                 |  2 ++
 package/libamcodec/libamcodec.mk                   | 33 ++++++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 package/libamcodec/0001-fix_non_cross_compile_env_vars.patch
 create mode 100644 package/libamcodec/Config.in
 create mode 100644 package/libamcodec/libamcodec.hash
 create mode 100644 package/libamcodec/libamcodec.mk

diff --git a/package/Config.in b/package/Config.in
index 6c6a562..0a56070 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/libamcodec/0001-fix_non_cross_compile_env_vars.patch b/package/libamcodec/0001-fix_non_cross_compile_env_vars.patch
new file mode 100644
index 0000000..72dad18
--- /dev/null
+++ b/package/libamcodec/0001-fix_non_cross_compile_env_vars.patch
@@ -0,0 +1,23 @@
+--- a/amcodec/Makefile	2016-06-01 22:40:01.000000000 +0300
++++ b/amcodec/Makefile	2016-06-01 22:41:32.000000000 +0300
+@@ -7,13 +7,13 @@ QUITE_CMD=1
+ 
+ INSTALL_FLAGS=-m 755
+ 
+-CPP=g++
+-AS=as
+-AR=ar
+-LD=ld
+-NM=nm
+-STRIP=strip
+-OBJCOPY=objcopy
++CPP ?= g++
++AS ?= as
++AR ?= ar
++LD ?= ld
++NM ?= nm
++STRIP ?= strip
++OBJCOPY ?= objcopy
+ export CC CPP AS AR LD NM STRIP OBJCOPY
+ 
+ TOPDIR=$(shell pwd)
diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
new file mode 100644
index 0000000..35b63a6
--- /dev/null
+++ b/package/libamcodec/Config.in
@@ -0,0 +1,12 @@
+comment "libamcodec needs a toolchain w/ threads"
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
index 0000000..3a0055f
--- /dev/null
+++ b/package/libamcodec/libamcodec.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 44580255c63bde1544b1376bc8d33f73ef0c634afda5065455a01b77f6e2729b  libamcodec-ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d.tar.gz
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
new file mode 100644
index 0000000..4c300ed
--- /dev/null
+++ b/package/libamcodec/libamcodec.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libamcodec
+#
+################################################################################
+
+LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
+LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
+LIBAMCODEC_DEPENDENCIES = alsa-lib
+
+# this pkg uses a non standard prefix vars, so we need to use them.
+define LIBAMCODEC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amavutils M_PREFIX="$(STAGING_DIR)/usr"
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amadec M_PREFIX="$(STAGING_DIR)/usr"
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/amcodec PREFIX="$(STAGING_DIR)"
+endef
+
+define LIBAMCODEC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib
+
+	mkdir -p $(STAGING_DIR)/usr/include/amcodec
+	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
+endef
+
+define LIBAMCODEC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib
+	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib
+endef
+									    
+$(eval $(generic-package))
-- 
2.8.3
