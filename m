From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 15:56:12 -0500
Subject: [Buildroot] [PATCH 2/4] sepolgen: Add target compile option.
In-Reply-To: <20170109205614.25011-1-aduskett@codeblue.com>
References: <20170109205614.25011-1-aduskett@codeblue.com>
Message-ID: <20170109205614.25011-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a user wants to use the tool audit2allow provided by
policycoreutils, they will need the python bindings from
sepolgen on the target file system.


Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/sepolgen/Config.in   |  8 ++++++++
 package/sepolgen/sepolgen.mk | 22 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/sepolgen/Config.in

diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
new file mode 100644
index 0000000..f43a1bc
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+	help
+	  This package contains a Python module that forms the core of the 
+	  modern audit2allow (which is a part of the package policycoreutils). 
+	  It contains infrastructure for parsing SELinux related messages as 
+	  produced by the audit system. 
+	  It has facilities for generating policy based on required access.
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 137eaed..c40bbb3 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -9,6 +9,27 @@ SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/fi
 SEPOLGEN_LICENSE = GPLv2
 SEPOLGEN_LICENSE_FILES = COPYING
 
+
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
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
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_SEPOLGEN_DEPENDENCIES = host-python3
 HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
@@ -28,3 +49,4 @@ define HOST_SEPOLGEN_INSTALL_CMDS
 endef
 
 $(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.9.3
