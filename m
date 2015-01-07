From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  7 Jan 2015 11:11:03 -0600
Subject: [Buildroot] [PATCH v2 28/28] libsemanage: cleanup python use and
	license definition
In-Reply-To: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420650663-49350-29-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original package supported python on target, now we just use
it as part of the host tools.  The license was also mis-assigned.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libsemanage/Config.in      | 10 -------
 package/libsemanage/libsemanage.mk | 54 ++++++++++++++++----------------------
 2 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index bef5c78..39ecb46 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -17,15 +17,5 @@ config BR2_PACKAGE_LIBSEMANAGE
 
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
 comment "libsemanage needs a toolchain w/ largefile, threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 17e8fea..b115325 100644
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
+	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)/" \
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
-- 
1.9.1
