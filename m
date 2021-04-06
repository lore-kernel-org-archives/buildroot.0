From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 22:47:15 +0000
Subject: [Buildroot] [PATCH 2/4] package/s6-*: use shared options and
 cleanup dependencies
Message-ID: <EZrDhGwS8thHhPYRPdvzlg6TubUgJfFRjCVgug4HG6U@cp3-web-029.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use shared options provided as variables by each dependency. To enhance
code clarity, be explicit of each dependency and remove dependencies
that are not hard dependencies.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/mdevd/mdevd.mk                        | 11 +-------
 package/s6-linux-init/Config.in               |  2 --
 package/s6-linux-init/s6-linux-init.mk        | 14 +++-------
 package/s6-linux-utils/s6-linux-utils.mk      | 11 +-------
 package/s6-networking/s6-networking.mk        | 16 ++++-------
 .../s6-portable-utils/s6-portable-utils.mk    | 11 +-------
 package/s6-rc/s6-rc.mk                        | 28 ++++---------------
 7 files changed, 18 insertions(+), 75 deletions(-)

diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index e2924009f5..b2961c9bef 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -11,17 +11,8 @@ MDEVD_LICENSE_FILES = COPYING
 MDEVD_INSTALL_STAGING = YES
 MDEVD_DEPENDENCIES = skalibs
 
-MDEVD_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
-
 define MDEVD_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MDEVD_CONF_OPTS))
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SHARED_SKALIBS_CONF_OPTS))
 endef
 
 define MDEVD_BUILD_CMDS
diff --git a/package/s6-linux-init/Config.in b/package/s6-linux-init/Config.in
index b56b861f99..b2858d2958 100644
--- a/package/s6-linux-init/Config.in
+++ b/package/s6-linux-init/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_S6_LINUX_INIT
 	bool "s6-linux-init"
 	depends on BR2_USE_MMU # s6
 	select BR2_PACKAGE_S6
-	select BR2_PACKAGE_S6_LINUX_UTILS
-	select BR2_PACKAGE_S6_PORTABLE_UTILS
 	help
 	  s6-linux-init is a set of minimalistic tools to create a
 	  s6-based init system, including a /sbin/init binary, on a
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index efd4984085..ff7b9c0dfd 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -8,18 +8,12 @@ S6_LINUX_INIT_VERSION = 1.0.6.1
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
-S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
+S6_LINUX_INIT_DEPENDENCIES = skalibs s6 execline
 
 S6_LINUX_INIT_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
+	$(SHARED_SKALIBS_CONF_OPTS) \
+	$(SHARED_EXECLINE_CONF_OPTS) \
+	$(SHARED_S6_CONF_OPTS)
 
 define S6_LINUX_INIT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_INIT_CONF_OPTS))
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index dcc4f9e4b2..c2f8a7e71f 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -10,17 +10,8 @@ S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
 S6_LINUX_UTILS_DEPENDENCIES = skalibs
 
-S6_LINUX_UTILS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
-
 define S6_LINUX_UTILS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_UTILS_CONF_OPTS))
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SHARED_SKALIBS_CONF_OPTS))
 endef
 
 define S6_LINUX_UTILS_BUILD_CMDS
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index d687c567cd..7f7da1fb71 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -9,19 +9,13 @@ S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
 S6_NETWORKING_INSTALL_STAGING = YES
-S6_NETWORKING_DEPENDENCIES = s6-dns s6
+S6_NETWORKING_DEPENDENCIES = skalibs execline s6 s6-dns
 
 S6_NETWORKING_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6-dns \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
+	$(SHARED_SKALIBS_CONF_OPTS) \
+	$(SHARED_EXECLINE_CONF_OPTS) \
+	$(SHARED_S6_CONF_OPTS) \
+	$(SHARED_S6_DNS_CONF_OPTS)
 
 ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 9da165b49b..adfcc5d451 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -10,17 +10,8 @@ S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
 S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
 
-S6_PORTABLE_UTILS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
-
 define S6_PORTABLE_UTILS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_PORTABLE_UTILS_CONF_OPTS))
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SHARED_SKALIBS_CONF_OPTS))
 endef
 
 define S6_PORTABLE_UTILS_BUILD_CMDS
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 4e0ef57d7a..5a6ddca8ea 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -9,18 +9,12 @@ S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
 S6_RC_INSTALL_STAGING = YES
-S6_RC_DEPENDENCIES = s6
+S6_RC_DEPENDENCIES = skalibs s6 execline
 
 S6_RC_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
+	$(SHARED_SKALIBS_CONF_OPTS) \
+	$(SHARED_EXECLINE_CONF_OPTS) \
+	$(SHARED_S6_CONF_OPTS)
 
 define S6_RC_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_RC_CONF_OPTS))
@@ -44,20 +38,10 @@ define S6_RC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
-HOST_S6_RC_DEPENDENCIES = host-s6
-
-HOST_S6_RC_CONF_OPTS = \
-	--prefix=$(HOST_DIR) \
-	--libexecdir=/usr/libexec \
-	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
-	--with-include=$(HOST_DIR)/include \
-	--with-dynlib=$(HOST_DIR)/lib \
-	--disable-static \
-	--enable-shared \
-	--disable-allstatic
+HOST_S6_RC_DEPENDENCIES = host-skalibs host-s6 host-execline
 
 define HOST_S6_RC_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_S6_RC_CONF_OPTS))
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(SHARED_HOST_SKALIBS_CONF_OPTS))
 endef
 
 define HOST_S6_RC_BUILD_CMDS
-- 
2.30.2
