From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:26 -0500
Subject: [Buildroot] [PATCH v2 06/17] sepolgen: new package
In-Reply-To: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378936777-28308-7-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Changed package dependencies into selects in the config.

 package/Config.in            |    4 ++++
 package/sepolgen/Config.in   |    8 ++++++++
 package/sepolgen/sepolgen.mk |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/Config.in b/package/Config.in
index 4569fa2..57fe70d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -905,6 +905,10 @@ source "package/xenomai/Config.in"
 source "package/rtai/Config.in"
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
index 0000000..2a4b49c
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+	select BR2_PACKAGE_PYTHON
+	help
+	  sepolgen is a python module/library that forms the core 
+	  of the modern audit2allow (a rewrite). 
+	  
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
new file mode 100644
index 0000000..a8c4786
--- /dev/null
+++ b/package/sepolgen/sepolgen.mk
@@ -0,0 +1,35 @@
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
+define SEPOLGEN_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
