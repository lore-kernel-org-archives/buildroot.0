From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:19 +0200
Subject: [Buildroot] [PATCH 8/9] s6-linux-utils: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-9-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-linux-utils, a set of minimalistic
Linux-specific system utilities.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                        |  1 +
 package/s6-linux-utils/Config.in         | 12 ++++++++++
 package/s6-linux-utils/s6-linux-utils.mk | 38 ++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/s6-linux-utils/Config.in
 create mode 100644 package/s6-linux-utils/s6-linux-utils.mk

diff --git a/package/Config.in b/package/Config.in
index b0ef7f7..e7bfd94 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
diff --git a/package/s6-linux-utils/Config.in b/package/s6-linux-utils/Config.in
new file mode 100644
index 0000000..bb46d3d
--- /dev/null
+++ b/package/s6-linux-utils/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_S6_LINUX_UTILS
+	bool "s6-linux-utils"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_SKALIBS
+	help
+	  s6-linux-utils is a set of minimalistic Linux-specific system
+	  utilities.
+
+	  http://skarnet.org/software/s6-linux-utils/
+
+comment "s6-linux-utils needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
new file mode 100644
index 0000000..f59b428
--- /dev/null
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# s6-linux-utils
+#
+################################################################################
+
+S6_LINUX_UTILS_VERSION = v2.1.0.0
+S6_LINUX_UTILS_SITE = git://git.skarnet.org/s6-linux-utils.git
+S6_LINUX_UTILS_LICENSE = ISC
+S6_LINUX_UTILS_LICENSE_FILES = COPYING
+S6_LINUX_UTILS_DEPENDENCIES = skalibs
+
+S6_LINUX_UTILS_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+S6_LINUX_UTILS_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+S6_LINUX_UTILS_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define S6_LINUX_UTILS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_UTILS_CONFIGURE_OPTS))
+endef
+
+define S6_LINUX_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define S6_LINUX_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.4.11
