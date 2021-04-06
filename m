From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 22:47:08 +0000
Subject: [Buildroot] [PATCH 1/4] package/{skalibs, execline, s6,
 s6-dns}: change prefix and shared options
Message-ID: <HbmuNdRmOn2PdMjzu0i70kXEVtJ7gzFTC74uRm0Le50@cp3-web-012.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The s6 suite of tools are predominantly used as an init system and for
process supervision. It is therefore preferable for these tools to be
installed with the default prefix / (as opposed to /usr).

Also improve maintainability and extensibility by introducing variables
that enable dependant packages to use shared configuration options.
This gives better build guarantees in different configuration scenarios
such as default paths, shared or static libraries, etc.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/execline/execline.mk | 28 +++++++++++-----------------
 package/s6-dns/s6-dns.mk     | 19 ++++---------------
 package/s6/s6.mk             | 28 ++++++++--------------------
 package/skalibs/skalibs.mk   | 33 +++++++++++++++++++++++++++++++--
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 0ab5a03f2e..f6001ed3f7 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,13 +12,12 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
+	$(SHARED_SKALIBS_CONF_OPTS) \
+	--shebangdir=/bin
+
+# This variable can be used by dependant packages.
+SHARED_EXECLINE_CONF_OPTS = \
+	--with-lib=$(STAGING_DIR)/lib/execline
 
 define EXECLINE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(EXECLINE_CONF_OPTS))
@@ -44,17 +43,12 @@ endef
 
 HOST_EXECLINE_DEPENDENCIES = host-skalibs
 
-# Set --shebangdir to /usr/bin, as this value is used by the host variant of
-# s6-rc when generating execline scripts for the target.
+# The host package does not have a run-time dependency on the
+# --shebangdir option. But it must align with the target variant since
+# it affects the output of commands.
 HOST_EXECLINE_CONF_OPTS = \
-	--prefix=$(HOST_DIR) \
-	--shebangdir=/usr/bin \
-	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
-	--with-include=$(HOST_DIR)/include \
-	--with-dynlib=$(HOST_DIR)/lib \
-	--disable-static \
-	--enable-shared \
-	--disable-allstatic
+	$(SHARED_HOST_SKALIBS_CONF_OPTS) \
+	--shebangdir=/bin
 
 define HOST_EXECLINE_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_EXECLINE_CONF_OPTS))
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 9ed75bd600..3b1047dab3 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -11,29 +11,18 @@ S6_DNS_LICENSE_FILES = COPYING
 S6_DNS_INSTALL_STAGING = YES
 S6_DNS_DEPENDENCIES = skalibs
 
-S6_DNS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
+# This variable can be used by dependant packages.
+SHARED_S6_DNS_CONF_OPTS = \
+	--with-lib=$(STAGING_DIR)/lib/s6-dns
 
 define S6_DNS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_DNS_CONF_OPTS))
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SHARED_SKALIBS_CONF_OPTS))
 endef
 
 define S6_DNS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
-define S6_DNS_REMOVE_STATIC_LIB_DIR
-	rm -rf $(TARGET_DIR)/usr/lib/s6-dns
-endef
-
-S6_DNS_POST_INSTALL_TARGET_HOOKS += S6_DNS_REMOVE_STATIC_LIB_DIR
-
 define S6_DNS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 443ecbbffd..8068601ab5 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -9,17 +9,14 @@ S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
 S6_INSTALL_STAGING = YES
-S6_DEPENDENCIES = execline
+S6_DEPENDENCIES = skalibs execline
 
 S6_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
-	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
-	$(SHARED_STATIC_LIBS_OPTS)
+	$(SHARED_SKALIBS_CONF_OPTS) \
+	$(SHARED_EXECLINE_CONF_OPTS)
+
+SHARED_S6_CONF_OPTS = \
+	--with-lib=$(STAGING_DIR)/lib/s6
 
 define S6_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_CONF_OPTS))
@@ -43,19 +40,10 @@ define S6_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
-HOST_S6_DEPENDENCIES = host-execline
-
-HOST_S6_CONF_OPTS = \
-	--prefix=$(HOST_DIR) \
-	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
-	--with-include=$(HOST_DIR)/include \
-	--with-dynlib=$(HOST_DIR)/lib \
-	--disable-static \
-	--enable-shared \
-	--disable-allstatic
+HOST_S6_DEPENDENCIES = host-skalibs host-execline
 
 define HOST_S6_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_S6_CONF_OPTS))
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(SHARED_HOST_SKALIBS_CONF_OPTS))
 endef
 
 define HOST_S6_BUILD_CMDS
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index f92859ff26..fe042604c2 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -10,12 +10,24 @@ SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
 SKALIBS_INSTALL_STAGING = YES
 
+SKALIBS_DEFAULT_PATH = $(call qstrip,$(BR2_SYSTEM_DEFAULT_PATH))
 SKALIBS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
+	--prefix=/ \
+	--libexecdir=/libexec \
+	--with-default-path=$(SKALIBS_DEFAULT_PATH) \
 	--with-sysdep-devurandom=yes \
 	$(SHARED_STATIC_LIBS_OPTS)
 
+# This variable can be used by dependant packages.
+SHARED_SKALIBS_CONF_OPTS = \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
 define SKALIBS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SKALIBS_CONF_OPTS))
 endef
@@ -33,8 +45,25 @@ define SKALIBS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
+# The --with-default-path option needs to match the target variant.
 HOST_SKALIBS_CONF_OPTS = \
 	--prefix=$(HOST_DIR) \
+	--with-default-path=$(SKALIBS_DEFAULT_PATH) \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+# This variable can be used by dependant packages.
+#
+# Note: Dependant host packages does not have a run-time dependencies on
+# the --libexecdir option. But it must align with the target variant
+# since it affects how target packages run.
+SHARED_HOST_SKALIBS_CONF_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--libexecdir=/libexec \
+	--with-sysdeps=$(HOST_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/include \
+	--with-dynlib=$(HOST_DIR)/lib \
 	--disable-static \
 	--enable-shared \
 	--disable-allstatic
-- 
2.30.2
