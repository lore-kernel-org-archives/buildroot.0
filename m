From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:28:37 +0100
Subject: [Buildroot] [git commit] s6-rc: new package
Message-ID: <20170310092852.3685B8256F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b4be1a3e0d2c1617e1b9ea25ac664fe22f1d532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6-rc, a service manager for s6-based systems,
i.e. a suite of programs that can start and stop services, both
long-running daemons and one-time initialization scripts, in the proper
order according to a dependency tree.

The host variant is provided so s6-rc-compile is available and can
be used to build the services database offline, either in a package
Makefile or a post-build script.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/s6-rc/Config.in  | 11 ++++++++
 package/s6-rc/s6-rc.hash |  2 ++
 package/s6-rc/s6-rc.mk   | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 88 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e2b5a1e..19392e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -443,6 +443,7 @@ F:	package/ninja/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-networking/
+F:	package/s6-rc/
 F:	package/skalibs/
 F:	package/smack/
 F:	package/xvisor/
diff --git a/package/Config.in b/package/Config.in
index 8e5880d..d12649e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1803,6 +1803,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/s6-rc/Config.in b/package/s6-rc/Config.in
new file mode 100644
index 0000000..d2ec75e
--- /dev/null
+++ b/package/s6-rc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_S6_RC
+	bool "s6-rc"
+	select BR2_PACKAGE_S6
+	depends on BR2_USE_MMU # s6
+	help
+	  s6-rc is a service manager for s6-based systems, i.e. a
+	  suite of programs that can start and stop services, both
+	  long-running daemons and one-time initialization scripts, in
+	  the proper order according to a dependency tree.
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
index 0000000..1c28dcb
--- /dev/null
+++ b/package/s6-rc/s6-rc.mk
@@ -0,0 +1,73 @@
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
+	--prefix=$(HOST_DIR)/usr \
+	--libexecdir=/usr/libexec \
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
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_S6_RC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install-dynlib install-bin
+	rm -f $(HOST_DIR)/usr/bin/s6-rc-dryrun
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
