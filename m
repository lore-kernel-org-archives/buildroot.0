From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 25 Sep 2013 14:32:37 -0500
Subject: [Buildroot] [PATCH v3 02/16] libselinux: new package
In-Reply-To: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1380137571-688-3-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v2 -> v3:
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and BR2_LARGEFILE (suggested by Thomas).
  - Corrected a minor issue in the mk file found during testing.
Changes v1 -> v2:
  - Move Config.in entry into the libraries section since this is a
    library.
  - General cleanup to the mk file to conform to the standard format.
  - Removed a dependency on the Linux kernel.
  - Changed the original Python select in the Config.in to be a check 
    in the libselinux.mk file.
  - Added a select for libsepol and pcre in the menuconfig instead of
    just having package dependencies.
  - Removed building the python bindings in the host configuration.

 package/Config.in                |    1 +
 package/libselinux/Config.in     |   19 ++++++++
 package/libselinux/libselinux.mk |   94 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 0 deletions(-)
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk

diff --git a/package/Config.in b/package/Config.in
index 1dd60d1..d2f651e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -695,6 +695,7 @@ source "package/tzdata/Config.in"
 endmenu
 
 menu "Security"
+source "package/libselinux/Config.in"
 source "package/libsepol/Config.in"
 endmenu
 
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
new file mode 100644
index 0000000..503805f
--- /dev/null
+++ b/package/libselinux/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBSELINUX
+	bool "libselinux"
+	select BR2_PACKAGE_LIBSEPOL
+	select BR2_PACKAGE_PCRE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  libselinux is the runtime SELinux library that provides interfaces 
+	  (e.g. library functions for the SELinux kernel APIs like getcon(), 
+	  other support functions like getseuserbyname()) to SELinux-aware 
+	  applications. libselinux may use the shared libsepol to manipulate 
+	  the binary policy if necessary (e.g. to downgrade the policy format 
+	  to an older version supported by the kernel) when loading policy.
+	  
+	  http://selinuxproject.org/page/Main_Page
+
+comment "libselinux support requires a toolchain with large file and threading support"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
new file mode 100644
index 0000000..034d535
--- /dev/null
+++ b/package/libselinux/libselinux.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# libselinux
+#
+################################################################################
+
+LIBSELINUX_VERSION = 2.1.13
+LIBSELINUX_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSELINUX_LICENSE = PublicDomain
+LIBSELINUX_LICENSE_FILES = LICENSE
+
+LIBSELINUX_DEPENDENCIES = libsepol pcre
+
+LIBSELINUX_INSTALL_STAGING = YES
+
+LIBSELINUX_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+
+LIBSELINUX_DEPENDENCIES += python host-swig host-python
+LIBSELINUX_MAKE_OPTS += \
+	PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define LIBSELINUX_PYTHON_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and 
+	# header paths.
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) swigify pywrap
+endef
+
+define LIBSELINUX_PYTHON_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSELINUX_PYTHON_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+
+endif
+
+define LIBSELINUX_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and 
+	# header paths.
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+	$(LIBSELINUX_PYTHON_BUILD_CMDS)
+endef
+
+define LIBSELINUX_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(LIBSELINUX_PYTHON_INSTALL_STAGING_CMDS)
+endef
+
+define LIBSELINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+	$(LIBSELINUX_PYTHON_INSTALL_TARGET_CMDS)
+endef
+
+define LIBSELINUX_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+HOST_LIBSELINUX_DEPENDENCIES = host-libsepol host-pcre
+
+HOST_LIBSELINUX_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
+	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread"
+
+define HOST_LIBSELINUX_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and 
+	# header paths.
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) all
+endef
+
+define HOST_LIBSELINUX_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+	mv $(HOST_DIR)/lib/libselinux.so.1 $(HOST_DIR)/usr/lib
+	(cd $(HOST_DIR)/usr/lib; rm -f libselinux.so; \
+		ln -s libselinux.so.1 libselinux.so)
+	-rmdir $(HOST_DIR)/lib
+	(if [ -f $(HOST_DIR)/sbin/matchpathcon ]; then \
+		mv $(HOST_DIR)/sbin/matchpathcon $(HOST_DIR)/usr/sbin/; \
+		-rmdir $(HOST_DIR)/sbin; \
+	fi)
+endef
+
+define HOST_LIBSELINUX_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
