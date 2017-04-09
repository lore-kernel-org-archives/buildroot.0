From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 14:54:30 +0200
Subject: [Buildroot] [git commit] sepolgen: allow compiling for target
Message-ID: <20170409134130.12B7D82306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86dcd0e6fecf0d19ceee211e0efc586aa023cb31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sepolgen is currently a host-only package, however it is a dependency
of audit2allow.  This patch allows for sepolgen to be compiled for the
target.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - fix formatting of Config.in file
 - add missing dependencies inherited from the fact that the package
   selects python3.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/sepolgen/Config.in   | 19 +++++++++++++++++++
 package/sepolgen/sepolgen.mk | 19 +++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a4855a9..7c10bc4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1739,6 +1739,7 @@ endmenu
 
 menu "Security"
 	source "package/policycoreutils/Config.in"
+	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
new file mode 100644
index 0000000..3671816
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	help
+	  This package contains a Python module that forms the core of
+	  the modern audit2allow (which is a part of the package
+	  policycoreutils).  It contains infrastructure for parsing
+	  SELinux related messages as produced by the audit system.
+	  It has facilities for generating policy based on required
+	  access.
+
+comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 94c0d59..033b468 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -10,6 +10,24 @@ SEPOLGEN_LICENSE = GPL-2.0
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
