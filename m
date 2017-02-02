From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  2 Feb 2017 17:45:04 -0500
Subject: [Buildroot] [PATCH 3/4] libselinux: allow compiling python wrapper
	module for target
In-Reply-To: <20170202224505.22882-1-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
Message-ID: <20170202224505.22882-3-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux currently does not compile it's python wrapper module
for the target.  This is needed for audit2allow to function properly.

This patch allows for the python wrapper to be built.  The current
makefile will try to install the python wrapper to the host directory
unless the PYSITEDIR variable is set.  I wrapped the build of the
python wrapper in a check for AUDIT2ALLOW because of the extra python
dependency, as I am sure many users don't want to have to install
python if they don't have to.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/libselinux/libselinux.mk | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 44120c4..fba5d41 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -30,6 +30,7 @@ endef
 define LIBSELINUX_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+		
 endef
 
 define LIBSELINUX_INSTALL_TARGET_CMDS
@@ -39,8 +40,39 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
 	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
 		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
+		
 endef
 
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
+LIBSELINUX_DEPENDENCIES += host-swig
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBSELINUX_DEPENDENCIES += python3
+LIBSELINUX_PYTHONLIBDIR = -L$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
+LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
+else
+LIBSELINUX_DEPENDENCIES += python
+LIBSELINUX_PYTHONLIBDIR = -L$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
+endif
+
+LIBSELINUX_MAKE_OPTS += \
+	PYINC="$(LIBSELINUX_PYINC)" \
+	PYTHONLIBDIR="$(LIBSELINUX_PYTHONLIBDIR)" \
+	PYLIBVER="$(LIBSELINUX_PYLIBVER)" \
+	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+LIBSELINUX_BUILD_CMDS += $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
+	$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) swigify pywrap
+
+LIBSELINUX_INSTALL_TARGET_CMDS += $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(LIBSELINUX_MAKE_OPTS) install-pywrap
+
+endif
+
 HOST_LIBSELINUX_DEPENDENCIES = \
 	host-libsepol host-pcre host-swig
 
-- 
2.9.3
