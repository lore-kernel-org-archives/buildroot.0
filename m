From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 15:56:13 -0500
Subject: [Buildroot] [PATCH 3/4] libselinux: allow python bindings on the
	target filing system.
In-Reply-To: <20170109205614.25011-1-aduskett@codeblue.com>
References: <20170109205614.25011-1-aduskett@codeblue.com>
Message-ID: <20170109205614.25011-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a user wants to use the tool audit2allow provided by
policycoreutils, they will need the python bindings from
libselinux on the target file system.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libselinux/libselinux.mk | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 165ac4c..5a03602 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -20,6 +20,53 @@ LIBSELINUX_MAKE_OPTS = \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 	ARCH=$(KERNEL_ARCH)
 
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBSELINUX_DEPENDENCIES += python3
+LIBSELINUX_PYTHONLIBDIR = -L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/
+LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
+else
+LIBSELINUX_DEPENDENCIES += python
+LIBSELINUX_PYTHONLIBDIR = -L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
+LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
+endif
+
+define LIBSELINUX_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and
+	# header paths.
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(LIBSELINUX_MAKE_OPTS) \
+		PYSITEDIR=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		DESTDIR=$(STAGING_DIR) all pywrap
+		
+endef
+
+define LIBSELINUX_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(LIBSELINUX_MAKE_OPTS) \
+		PYSITEDIR=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		DESTDIR=$(STAGING_DIR) install install-pywrap
+
+endef
+
+define LIBSELINUX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(LIBSELINUX_MAKE_OPTS) \
+		PYSITEDIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		DESTDIR=$(TARGET_DIR) install install-pywrap
+			
+	# Create the selinuxfs mount point
+	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
+	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
+		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
+endef
+
+
+else
+
 define LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
@@ -41,6 +88,8 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
 endef
 
+endif
+
 HOST_LIBSELINUX_DEPENDENCIES = \
 	host-libsepol host-pcre host-swig
 
-- 
2.9.3
