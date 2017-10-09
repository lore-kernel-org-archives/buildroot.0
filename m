From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 18:27:29 -0400
Subject: [Buildroot] [PATCH 6/8] sepolgen: Remove package
In-Reply-To: <20171009222731.15119-1-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
Message-ID: <20171009222731.15119-6-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sepolgen has been consolidated into the selinux-python package for version
2.7.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in              |  1 -
 package/sepolgen/Config.in     | 19 ----------------
 package/sepolgen/sepolgen.hash |  2 --
 package/sepolgen/sepolgen.mk   | 49 ------------------------------------------
 4 files changed, 71 deletions(-)
 delete mode 100644 package/sepolgen/Config.in
 delete mode 100644 package/sepolgen/sepolgen.hash
 delete mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/Config.in b/package/Config.in
index 6f8564334d..b9c62de1f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1840,7 +1840,6 @@ menu "Security"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
-	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
deleted file mode 100644
index 8dd90388c8..0000000000
--- a/package/sepolgen/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_SEPOLGEN
-	bool "sepolgen"
-	depends on BR2_USE_WCHAR # python3
-	depends on BR2_USE_MMU # python3
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
-	depends on !BR2_STATIC_LIBS # python3
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	help
-	  This package contains a Python module that forms the core of
-	  the modern audit2allow (which is a part of the package
-	  policycoreutils).  It contains infrastructure for parsing
-	  SELinux related messages as produced by the audit system.
-	  It has facilities for generating policy based on required
-	  access.
-
-comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
deleted file mode 100644
index b338a7019f..0000000000
--- a/package/sepolgen/sepolgen.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 6a327b1576d914e57ad796a541a7a9bcceefb14c445355559993de0fdb8e7a60  sepolgen-2.6.tar.gz
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
deleted file mode 100644
index ab7f18d857..0000000000
--- a/package/sepolgen/sepolgen.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# sepolgen
-#
-################################################################################
-
-SEPOLGEN_VERSION = 2.6
-SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-SEPOLGEN_LICENSE = GPL-2.0
-SEPOLGEN_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SEPOLGEN_DEPENDENCIES = python3
-SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-else
-SEPOLGEN_DEPENDENCIES = python
-SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-endif
-
-define SEPOLGEN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
-endef
-
-define SEPOLGEN_INSTALL_TARGET_CMDS
-	$(MAKE_ENV) $(MAKE) -C $(@D) $(SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR) install
-endef
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_SEPOLGEN_DEPENDENCIES = host-python3
-HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-else
-HOST_SEPOLGEN_DEPENDENCIES = host-python
-HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-endif
-
-define HOST_SEPOLGEN_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
-endef
-
-define HOST_SEPOLGEN_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.13.6
