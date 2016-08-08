From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:14 +0200
Subject: [Buildroot] [PATCH 3/9] s6: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6, a small suite of programs for UNIX,
designed to allow process supervision (a.k.a service supervision), in
the line of daemontools and runit.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in    |  1 +
 package/s6/Config.in | 13 ++++++++++
 package/s6/s6.mk     | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 package/s6/Config.in
 create mode 100644 package/s6/s6.mk

diff --git a/package/Config.in b/package/Config.in
index d35ee3f..4fa2380 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1718,6 +1718,7 @@ menu "System tools"
 	source "package/quota/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/s6/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/s6/Config.in b/package/s6/Config.in
new file mode 100644
index 0000000..6434175
--- /dev/null
+++ b/package/s6/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_S6
+	bool "s6"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_EXECLINE
+	help
+	  s6 is a small suite of programs for UNIX, designed to allow process
+	  supervision (a.k.a service supervision), in the line of daemontools
+	  and runit, as well as various operations on processes and daemons.
+
+	  http://skarnet.org/software/s6/
+
+comment "s6 needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
new file mode 100644
index 0000000..428561d
--- /dev/null
+++ b/package/s6/s6.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# s6
+#
+################################################################################
+
+S6_VERSION = v2.3.0.0
+S6_SITE = git://git.skarnet.org/s6.git
+S6_LICENSE = ISC
+S6_LICENSE_FILES = COPYING
+S6_INSTALL_STAGING = YES
+S6_DEPENDENCIES = execline
+
+S6_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+S6_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+S6_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define S6_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_CONFIGURE_OPTS))
+endef
+
+define S6_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define S6_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+HOST_S6_DEPENDENCIES = host-execline
+
+HOST_S6_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/usr/include \
+	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_S6_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_S6_CONFIGURE_OPTS))
+endef
+
+define HOST_S6_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_S6_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
+		install-dynlib \
+		install-include
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.4.11
