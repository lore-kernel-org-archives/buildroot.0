From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:55:46 +0100
Subject: [Buildroot] [git commit] s6: new package
Message-ID: <20170309220234.0D717821DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae47ed449c7ff92b41533ca5a91538622c519e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6, a small suite of programs for UNIX,
designed to allow process supervision (a.k.a service supervision), in
the line of daemontools and runit.

The host variant is provided as it is required to build the host
variant of s6-rc. Only the libraries and headers are installed.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/s6/Config.in | 11 +++++++++
 package/s6/s6.hash   |  2 ++
 package/s6/s6.mk     | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6c74cac..73413eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -440,6 +440,7 @@ F:	package/execline/
 F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
+F:	package/s6/
 F:	package/skalibs/
 F:	package/smack/
 F:	package/xvisor/
diff --git a/package/Config.in b/package/Config.in
index 9eb6a22..1cb584c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1800,6 +1800,7 @@ menu "System tools"
 	source "package/quota/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/s6/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/s6/Config.in b/package/s6/Config.in
new file mode 100644
index 0000000..7c192c1
--- /dev/null
+++ b/package/s6/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_S6
+	bool "s6"
+	select BR2_PACKAGE_EXECLINE
+	depends on BR2_USE_MMU # execline
+	help
+	  s6 is a small suite of programs for UNIX, designed to allow
+	  process supervision (a.k.a service supervision), in the line
+	  of daemontools and runit, as well as various operations on
+	  processes and daemons.
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
