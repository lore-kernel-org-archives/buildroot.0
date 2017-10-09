From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 18:27:31 -0400
Subject: [Buildroot] [PATCH 8/8] selinux-python: new package
In-Reply-To: <20171009222731.15119-1-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
Message-ID: <20171009222731.15119-8-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python utilities that were previously in policycoreutils are now maintained
in a seperate package called selinux-python.  This package includes:

- audit2allow
- chcat
- semanage
- sepolgen
- sepolicy

Currently, only audit2allow and sepolgen are selectable.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/selinux-python/Config.in           | 47 ++++++++++++++++++++++++++
 package/selinux-python/selinux-python.hash |  2 ++
 package/selinux-python/selinux-python.mk   | 53 ++++++++++++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 package/selinux-python/Config.in
 create mode 100644 package/selinux-python/selinux-python.hash
 create mode 100644 package/selinux-python/selinux-python.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 18e878d8d5..a44f87e47b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/policycoreutils/
 F:	package/python-mutagen/
 F:	package/restorecond/
 F:	package/refpolicy/
+F:	package/selinux-python/
 F:	package/sepolgen/
 F:	package/setools/
 F:	package/sngrep/
diff --git a/package/Config.in b/package/Config.in
index c9677a460c..0c7ed44177 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1841,6 +1841,7 @@ menu "Security"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
 	source "package/restorecond/Config.in"
+	source "package/selinux-python/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
new file mode 100644
index 0000000000..1078c4e792
--- /dev/null
+++ b/package/selinux-python/Config.in
@@ -0,0 +1,47 @@
+menuconfig BR2_PACKAGE_SELINUX_PYTHON
+	bool "SELinux Python packages"
+	help
+	  A set of SELinux tools written in python that help with
+	  managing a system with SELinux enabled.
+
+	  https://github.com/SELinuxProject/selinux/wiki
+
+if BR2_PACKAGE_SELINUX_PYTHON
+
+comment "packages"
+
+config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
+	bool "audit2allow"
+	depends on BR2_USE_WCHAR # python3, sepolgen
+	depends on BR2_USE_MMU # python3, sepolgen
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3, sepolgen, checkpolicy
+	depends on !BR2_STATIC_LIBS # python3, sepolgen
+	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
+	depends on !BR2_arc # checkpolicy
+	select BR2_PACKAGE_SEPOLGEN
+	select BR2_PACKAGE_CHECKPOLICY
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  Enable audit2allow to be built
+
+config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
+	bool "sepolgen"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
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
+
+endif
diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
new file mode 100644
index 0000000000..42fe575e7b
--- /dev/null
+++ b/package/selinux-python/selinux-python.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 4217cb965ecda96c91e15ffcc2e7ddd13ecc2bf5631100f3cd072a7616f140ed selinux-python-2.7.tar.gz
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
new file mode 100644
index 0000000000..2a141be9ab
--- /dev/null
+++ b/package/selinux-python/selinux-python.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# selinux-python
+#
+################################################################################
+
+SELINUX_PYTHON_VERSION = 2.7
+SELINUX_PYTHON_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+SELINUX_PYTHON_LICENSE = GPL-2.0
+SELINUX_PYTHON_LICENSE_FILES = COPYING
+
+SELINUX_PYTHON_MAKE_OPTS += \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	ARCH="$(BR2_ARCH)" \
+	LIBDIR="$(STAGING_DIR)/usr/lib"
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_SELINUX_PYTHON_DEPENDENCIES += host-python3
+HOST_SELINUX_PYTHON_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
+else
+HOST_SELINUX_PYTHON_DEPENDENCIES += host-python
+HOST_SELINUX_PYTHON_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
+endif
+
+ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
+SELINUX_PYTHON_DEPENDENCIES += checkpolicy
+SELINUX_PYTHON_MAKE_DIRS += audit2allow
+
+endif
+
+ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN),y)
+SELINUX_PYTHON_MAKE_DIRS += sepolgen/src/sepolgen
+endif
+
+define SELINUX_PYTHON_BUILD_CMDS
+	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
+		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
+			DESTDIR=$(STAGING_DIR) all
+	)
+endef
+
+define SELINUX_PYTHON_INSTALL_TARGET_CMDS
+	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
+		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
+			DESTDIR=$(TARGET_DIR) install
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.13.6
