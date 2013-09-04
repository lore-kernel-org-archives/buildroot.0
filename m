From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:45 -0500
Subject: [Buildroot] [PATCH 06/17] sepolgen: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-7-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in            |    1 +
 package/sepolgen/Config.in   |    7 ++++++
 package/sepolgen/sepolgen.mk |   46 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/Config.in b/package/Config.in
index 5c4adb9..ca38111 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -902,6 +902,7 @@ source "package/checkpolicy/Config.in"
 source "package/libsepol/Config.in"
 source "package/libselinux/Config.in"
 source "package/libsemanage/Config.in"
+source "package/sepolgen/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
new file mode 100644
index 0000000..9954890
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+	help
+	  sepolgen is a python module/library that forms the core 
+	  of the modern audit2allow (a rewrite). 
+	  
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
new file mode 100644
index 0000000..17f7108
--- /dev/null
+++ b/package/sepolgen/sepolgen.mk
@@ -0,0 +1,46 @@
+#############################################################
+#
+# sepolgen
+#
+#############################################################
+SEPOLGEN_VERSION = 1.1.9
+SEPOLGEN_SOURCE = sepolgen-$(SEPOLGEN_VERSION).tar.gz
+SEPOLGEN_SITE = http://userspace.selinuxproject.org/releases/20130423/
+SEPOLGEN_LICENSE = GPLv2
+SEPOLGEN_LICENSE_FILES = COPYING
+
+SEPOLGEN_DEPENDENCIES = python
+
+SEPOLGEN_INSTALL_STAGING = YES
+SEPOLGEN_INSTALL_TARGET = YES
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
+define SEPOLGEN_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define SEPOLGEN_UNINSTALL_STAGING_CMDS
+	rm -rf $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/dist-packages/sepolgen/
+	rm -rf $(STAGING_DIR)/var/lib/sepolgen/
+endef
+
+define SEPOLGEN_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/dist-packages/sepolgen/
+	rm -rf $(TARGET_DIR)/var/lib/sepolgen/
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
