From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 19 Dec 2016 22:29:09 +0100
Subject: [Buildroot] [Patch v3 3/9] s6: new package
In-Reply-To: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1482182955-23916-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6, a small suite of programs for UNIX,
designed to allow process supervision (a.k.a service supervision), in
the line of daemontools and runit.

The host variant is provided as it is required to build the host
variant of s6-rc. Only the libraries and headers are installed.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in    |  1 +
 package/s6/Config.in | 10 ++++++++
 package/s6/s6.hash   |  2 ++
 package/s6/s6.mk     | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 package/s6/Config.in
 create mode 100644 package/s6/s6.hash
 create mode 100644 package/s6/s6.mk

diff --git a/package/Config.in b/package/Config.in
index 7c0e4e1..6b4fdb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1758,6 +1758,7 @@ menu "System tools"
 	source "package/quota/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/s6/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/s6/Config.in b/package/s6/Config.in
new file mode 100644
index 0000000..7b6b86b
--- /dev/null
+++ b/package/s6/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_S6
+	bool "s6"
+	select BR2_PACKAGE_EXECLINE
+	depends on BR2_USE_MMU # execline
+	help
+	  s6 is a small suite of programs for UNIX, designed to allow process
+	  supervision (a.k.a service supervision), in the line of daemontools
+	  and runit, as well as various operations on processes and daemons.
+
+	  http://skarnet.org/software/s6/
diff --git a/package/s6/s6.hash b/package/s6/s6.hash
new file mode 100644
index 0000000..36526de
--- /dev/null
+++ b/package/s6/s6.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 5e788d5935dbcce76ac9a99cfcf6ee46a2ffb84220c84225df7589e9a3585560 s6-2.4.0.0.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
new file mode 100644
index 0000000..de08f67
--- /dev/null
+++ b/package/s6/s6.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# s6
+#
+################################################################################
+
+S6_VERSION = 2.4.0.0
+S6_SITE = http://skarnet.org/software/s6
+S6_LICENSE = ISC
+S6_LICENSE_FILES = COPYING
+S6_INSTALL_STAGING = YES
+S6_DEPENDENCIES = execline
+
+S6_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_CONF_OPTS))
+endef
+
+define S6_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_REMOVE_STATIC_LIB_DIR
+	rm -rf $(TARGET_DIR)/usr/lib/s6
+endef
+
+S6_POST_INSTALL_TARGET_HOOKS += S6_REMOVE_STATIC_LIB_DIR
+
+define S6_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+HOST_S6_DEPENDENCIES = host-execline
+
+HOST_S6_CONF_OPTS = \
+	--prefix=$(HOST_DIR)/usr \
+	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/usr/include \
+	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_S6_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_S6_CONF_OPTS))
+endef
+
+define HOST_S6_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_S6_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install-dynlib install-include
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.5.5
