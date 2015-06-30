From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:38:36 +0200
Subject: [Buildroot] [git commit] libsemanage: cleanup python use and
	license definition
Message-ID: <20150630143912.DF93481789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7742abe0487a29aeaf3db8e6751eec272e9a27f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original package supported python on target, now we just use
it as part of the host tools.  The license was also mis-assigned.

[Thomas: add removed option to Config.in.legacy.]

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                   |    7 ++++
 package/libsemanage/Config.in      |   10 ------
 package/libsemanage/libsemanage.mk |   54 ++++++++++++++---------------------
 3 files changed, 29 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d86d585..90e1339 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
+	depends on BR2_PACKAGE_PYTHON
+	bool "libsemanage python bindings removed"
+	help
+	  This option has been removed, since the libsemanage Python
+	  bindings on the target were not useful.
+
 config BR2_TARGET_UBOOT_NETWORK
 	bool "U-Boot custom network settings removed"
 	select BR2_LEGACY
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 130fd82..78b6315 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -16,15 +16,5 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-if BR2_PACKAGE_LIBSEMANAGE
-
-config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
-	depends on BR2_PACKAGE_PYTHON
-	bool "python bindings"
-	help
-	  Enable building python bindings
-
-endif
-
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 17e8fea..197c14e 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -6,66 +6,56 @@
 
 LIBSEMANAGE_VERSION = 2.1.10
 LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
-LIBSEPOL_LICENSE = LGPLv2.1+
-LIBSEPOL_LICENSE_FILES = COPYING
-
+LIBSEMANAGE_LICENSE = LGPLv2.1+
+LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
-
 LIBSEMANAGE_INSTALL_STAGING = YES
 
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
-ifeq ($(BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS),y)
-
-LIBSEMANAGE_DEPENDENCIES += python host-swig
-LIBSEMANAGE_MAKE_OPTS += \
-	PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
-	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
-	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
-
-define LIBSEMANAGE_PYTHON_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) swigify pywrap
-endef
-
-define LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install-pywrap
-endef
-
-define LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install-pywrap
-endef
-
-endif # End of BR2_PACKAGE_PYTHON
-
 define LIBSEMANAGE_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
-	$(LIBSEMANAGE_PYTHON_BUILD_CMDS)
 endef
 
 define LIBSEMANAGE_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-	$(LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS)
 endef
 
 define LIBSEMANAGE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-	$(LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS)
 endef
 
-HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol \
-	host-libselinux host-ustr host-bzip2
+HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol host-libselinux \
+				host-ustr host-bzip2 host-swig
+HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
+HOST_LIBSEMANAGE_MAKE_OPTS += \
+	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
+else
+HOST_LIBSEMANAGE_DEPENDENCIES += host-python
+HOST_LIBSEMANAGE_MAKE_OPTS += \
+	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
+endif
 
 define HOST_LIBSEMANAGE_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
 	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) all
+	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
 endef
 
 define HOST_LIBSEMANAGE_INSTALL_CMDS
 	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) install
+	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
 endef
 
 $(eval $(generic-package))
