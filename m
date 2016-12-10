From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 10 Dec 2016 20:20:47 +0100
Subject: [Buildroot] [Patch v2 6/9] s6-rc: new package
In-Reply-To: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1481397650-14664-7-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-rc, a service manager for s6-based systems,
i.e. a suite of programs that can start and stop services, both
long-running daemons and one-time initialization scripts, in the proper
order according to a dependency tree.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in            |  1 +
 package/s6-rc/Config.in      | 11 +++++++
 package/s6-rc/Config.in.host |  6 ++++
 package/s6-rc/s6-rc.hash     |  2 ++
 package/s6-rc/s6-rc.mk       | 74 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+)
 create mode 100644 package/s6-rc/Config.in
 create mode 100644 package/s6-rc/Config.in.host
 create mode 100644 package/s6-rc/s6-rc.hash
 create mode 100644 package/s6-rc/s6-rc.mk

diff --git a/package/Config.in b/package/Config.in
index 300e39a..bf2ffcc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1751,6 +1751,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/s6-rc/Config.in b/package/s6-rc/Config.in
new file mode 100644
index 0000000..416d230
--- /dev/null
+++ b/package/s6-rc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_S6_RC
+	bool "s6-rc"
+	select BR2_PACKAGE_S6
+	depends on BR2_USE_MMU # s6
+	help
+	  s6-rc is a service manager for s6-based systems, i.e. a suite of
+	  programs that can start and stop services, both long-running daemons
+	  and one-time initialization scripts, in the proper order according to
+	  a dependency tree.
+
+	  http://skarnet.org/software/s6-rc/
diff --git a/package/s6-rc/Config.in.host b/package/s6-rc/Config.in.host
new file mode 100644
index 0000000..d4e55c8
--- /dev/null
+++ b/package/s6-rc/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_S6_RC
+	bool "host s6-rc tools"
+	help
+	  Host tools from s6-rc for managing the service database.
+
+	  http://skarnet.org/software/s6-rc/
diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
new file mode 100644
index 0000000..3d5186c
--- /dev/null
+++ b/package/s6-rc/s6-rc.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 d04a8a765740ed55e38a33da3639197f51f83b3e498bdef5bc1d1d322b1acff3 s6-rc-0.1.0.0.tar.gz
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
new file mode 100644
index 0000000..2a97d41
--- /dev/null
+++ b/package/s6-rc/s6-rc.mk
@@ -0,0 +1,74 @@
+################################################################################
+#
+# s6-rc
+#
+################################################################################
+
+S6_RC_VERSION = 0.1.0.0
+S6_RC_SITE = http://skarnet.org/software/s6-rc
+S6_RC_LICENSE = ISC
+S6_RC_LICENSE_FILES = COPYING
+S6_RC_INSTALL_STAGING = YES
+S6_RC_DEPENDENCIES = s6
+
+S6_RC_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_RC_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_RC_CONF_OPTS))
+endef
+
+define S6_RC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_RC_REMOVE_STATIC_LIB_DIR
+	rm -rf $(TARGET_DIR)/usr/lib/s6-rc
+endef
+
+S6_RC_POST_INSTALL_TARGET_HOOKS += S6_RC_REMOVE_STATIC_LIB_DIR
+
+define S6_RC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_RC_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+HOST_S6_RC_DEPENDENCIES = host-s6
+
+HOST_S6_RC_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/usr/include \
+	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_S6_RC_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_S6_RC_CONF_OPTS))
+endef
+
+define HOST_S6_RC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_S6_RC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
+		install-dynlib \
+		install-bin
+	rm -f $(HOST_DIR)/usr/bin/s6-rc-dryrun
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.5.5
