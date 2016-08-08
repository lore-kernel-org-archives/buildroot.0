From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:20 +0200
Subject: [Buildroot] [PATCH 9/9] s6-linux-init: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-10-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-linux-init, a set of minimalistic tools to
create a s6-based init system, including a /sbin/init program, on a
machine running a Linux kernel.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                      |  1 +
 package/s6-linux-init/Config.in        | 15 +++++++++++++
 package/s6-linux-init/s6-linux-init.mk | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/s6-linux-init/Config.in
 create mode 100644 package/s6-linux-init/s6-linux-init.mk

diff --git a/package/Config.in b/package/Config.in
index e7bfd94..41f19c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-linux-init/Config.in"
 	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
diff --git a/package/s6-linux-init/Config.in b/package/s6-linux-init/Config.in
new file mode 100644
index 0000000..a472929
--- /dev/null
+++ b/package/s6-linux-init/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_S6_LINUX_INIT
+	bool "s6-linux-init"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_S6
+	select BR2_PACKAGE_S6_LINUX_UTILS
+	select BR2_PACKAGE_S6_PORTABLE_UTILS
+	help
+	  s6-linux-init is a set of minimalistic tools to create a s6-based
+	  init system, including a /sbin/init program, on a machine running
+	  a Linux kernel.
+
+	  http://skarnet.org/software/s6-linux-init/
+
+comment "s6-linux-init needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
new file mode 100644
index 0000000..c02916c
--- /dev/null
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# s6-linux-init
+#
+################################################################################
+
+S6_LINUX_INIT_VERSION = v0.1.0.0
+S6_LINUX_INIT_SITE = git://git.skarnet.org/s6-linux-init.git
+S6_LINUX_INIT_LICENSE = ISC
+S6_LINUX_INIT_LICENSE_FILES = COPYING
+S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
+
+S6_LINUX_INIT_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+S6_LINUX_INIT_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+S6_LINUX_INIT_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define S6_LINUX_INIT_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_INIT_CONFIGURE_OPTS))
+endef
+
+define S6_LINUX_INIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define S6_LINUX_INIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.4.11
