From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  2 Feb 2017 17:45:02 -0500
Subject: [Buildroot] [PATCH 1/4] sepolgen: allow compiling for target
Message-ID: <20170202224505.22882-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sepolgen is currently a host-only package, however it is a dependency
of audit2allow.  This patch allows for sepolgen to be compiled for the
target.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in            |  1 +
 package/sepolgen/Config.in   |  9 +++++++++
 package/sepolgen/sepolgen.mk | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/sepolgen/Config.in

diff --git a/package/Config.in b/package/Config.in
index d1c517a..9fedc23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1707,6 +1707,7 @@ endmenu
 
 menu "Security"
 	source "package/policycoreutils/Config.in"
+	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
new file mode 100644
index 0000000..87621b6
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+    select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  This package contains a Python module that forms the core of the 
+	  modern audit2allow (which is a part of the package policycoreutils). 
+	  It contains infrastructure for parsing SELinux related messages as 
+	  produced by the audit system. 
+	  It has facilities for generating policy based on required access.
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 137eaed..ce3f683 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -10,6 +10,24 @@ SEPOLGEN_LICENSE = GPLv2
 SEPOLGEN_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
+SEPOLGEN_DEPENDENCIES = python3
+SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
+	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+else
+SEPOLGEN_DEPENDENCIES = python
+SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
+	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+endif
+
+define SEPOLGEN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+define SEPOLGEN_INSTALL_TARGET_CMDS
+	$(MAKE_ENV) $(MAKE) -C $(@D) $(SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR) install
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_SEPOLGEN_DEPENDENCIES = host-python3
 HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
 	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
@@ -27,4 +45,5 @@ define HOST_SEPOLGEN_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.9.3
