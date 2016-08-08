From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:18 +0200
Subject: [Buildroot] [PATCH 7/9] s6-portable-utils: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-8-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-portable-utils, a set of tiny general Unix
utilities, often performing well-known tasks such as cut and grep, but
optimized for simplicity and small size.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                              |  1 +
 package/s6-portable-utils/Config.in            | 14 ++++++++++
 package/s6-portable-utils/s6-portable-utils.mk | 38 ++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/s6-portable-utils/Config.in
 create mode 100644 package/s6-portable-utils/s6-portable-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 18bd2fd..b0ef7f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
diff --git a/package/s6-portable-utils/Config.in b/package/s6-portable-utils/Config.in
new file mode 100644
index 0000000..c17181f
--- /dev/null
+++ b/package/s6-portable-utils/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_S6_PORTABLE_UTILS
+	bool "s6-portable-utils"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_SKALIBS
+	help
+	  s6-portable-utils is a set of tiny general Unix utilities, often
+	  performing well-known tasks such as cut and grep, but optimized for
+	  simplicity and small size. They were designed for embedded systems
+	  and other constrained environments, but they work everywhere.
+
+	  http://skarnet.org/software/s6-portable-utils/
+
+comment "s6-portable-utils needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
new file mode 100644
index 0000000..2ffbcbe
--- /dev/null
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# s6-portable-utils
+#
+################################################################################
+
+S6_PORTABLE_UTILS_VERSION = v2.0.6.0
+S6_PORTABLE_UTILS_SITE = git://git.skarnet.org/s6-portable-utils.git
+S6_PORTABLE_UTILS_LICENSE = ISC
+S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
+S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
+
+S6_PORTABLE_UTILS_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+S6_PORTABLE_UTILS_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+S6_PORTABLE_UTILS_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define S6_PORTABLE_UTILS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_PORTABLE_UTILS_CONFIGURE_OPTS))
+endef
+
+define S6_PORTABLE_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define S6_PORTABLE_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.4.11
