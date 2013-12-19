From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:37:56 -0600
Subject: [Buildroot] [PATCH v5 07/20] sepolgen: new package
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-8-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - No changes.
Changes v3 -> v4:
  - Cleaned up configure comments (suggested by Thomas).
  - Removed the clean command.
Changes v2 -> v3:
  - No changes.
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Changed package dependencies into selects in the config.
---
 package/Config.in            |    4 ++++
 package/sepolgen/Config.in   |   14 ++++++++++++++
 package/sepolgen/sepolgen.mk |   31 +++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/Config.in b/package/Config.in
index 1bb32f4..a838d6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -950,6 +950,10 @@ source "package/rtai/Config.in"
 source "package/xenomai/Config.in"
 endmenu
 
+menu "Security"
+source "package/sepolgen/Config.in"
+endmenu
+
 menu "Shell and utilities"
 source "package/at/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
new file mode 100644
index 0000000..d7d0d37
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+	select BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_USE_MMU # python
+	help
+	  sepolgen is a python module/library that forms the core
+	  of the modern audit2allow (a rewrite).
+
+	  http://selinuxproject.org/page/Main_Page
+
+comment "sepolgen needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
new file mode 100644
index 0000000..099c9d0
--- /dev/null
+++ b/package/sepolgen/sepolgen.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# sepolgen
+#
+################################################################################
+
+SEPOLGEN_VERSION = 1.1.9
+SEPOLGEN_SITE = http://userspace.selinuxproject.org/releases/20130423/
+SEPOLGEN_LICENSE = GPLv2
+SEPOLGEN_LICENSE_FILES = COPYING
+
+SEPOLGEN_DEPENDENCIES = python
+
+SEPOLGEN_INSTALL_STAGING = YES
+
+SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
+	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+define SEPOLGEN_BUILD_CMDS
+	$(MAKE) -C $(@D) $(SEPOLGEN_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define SEPOLGEN_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(SEPOLGEN_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define SEPOLGEN_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
