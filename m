From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 19 Dec 2016 22:29:13 +0100
Subject: [Buildroot] [Patch v3 7/9] s6-portable-utils: new package
In-Reply-To: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1482182955-23916-8-git-send-email-eric.le.bihan.dev@free.fr>
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
 package/Config.in                                |  1 +
 package/s6-portable-utils/Config.in              | 11 ++++++++
 package/s6-portable-utils/s6-portable-utils.hash |  2 ++
 package/s6-portable-utils/s6-portable-utils.mk   | 34 ++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/s6-portable-utils/Config.in
 create mode 100644 package/s6-portable-utils/s6-portable-utils.hash
 create mode 100644 package/s6-portable-utils/s6-portable-utils.mk

diff --git a/package/Config.in b/package/Config.in
index e6334e8..3cee9ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1761,6 +1761,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
diff --git a/package/s6-portable-utils/Config.in b/package/s6-portable-utils/Config.in
new file mode 100644
index 0000000..95aca0e
--- /dev/null
+++ b/package/s6-portable-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_S6_PORTABLE_UTILS
+	bool "s6-portable-utils"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  s6-portable-utils is a set of tiny general Unix utilities, often
+	  performing well-known tasks such as cut and grep, but optimized for
+	  simplicity and small size. They were designed for embedded systems
+	  and other constrained environments, but they work everywhere.
+
+	  http://skarnet.org/software/s6-portable-utils/
diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
new file mode 100644
index 0000000..a03e6cd
--- /dev/null
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 cde145b7b9d1f1685f271c45c8aed635e74221689bb8ec21a11b3e5a252d1c4e s6-portable-utils-2.1.0.0.tar.gz
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
new file mode 100644
index 0000000..7461450
--- /dev/null
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# s6-portable-utils
+#
+################################################################################
+
+S6_PORTABLE_UTILS_VERSION = 2.1.0.0
+S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
+S6_PORTABLE_UTILS_LICENSE = ISC
+S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
+S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
+
+S6_PORTABLE_UTILS_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_PORTABLE_UTILS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_PORTABLE_UTILS_CONF_OPTS))
+endef
+
+define S6_PORTABLE_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_PORTABLE_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.5.5
