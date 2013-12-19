From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:37:51 -0600
Subject: [Buildroot] [PATCH v5 02/20] libselinux: new package
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-3-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - No changes.
Changes v3 -> v4:
  - Re-added the Python bindings configure option (suggested
    by Thomas).
  - Added the creation of the selinux mount point to the
    install step (suggested by Thomas).
  - Cleaned up configure comments (suggested by Thomas).
  - Removed the package clean command.
Changes v2 -> v3:
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and
    BR2_LARGEFILE (suggested by Thomas).
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
---
 package/Config.in                |    1 +
 package/libselinux/Config.in     |   29 ++++++++++++
 package/libselinux/libselinux.mk |   88 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 0 deletions(-)
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk

diff --git a/package/Config.in b/package/Config.in
index 3685807..c57b169 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ source "package/tzdata/Config.in"
 endmenu
 
 menu "Security"
+source "package/libselinux/Config.in"
 source "package/libsepol/Config.in"
 endmenu
 
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
new file mode 100644
index 0000000..14182c3
--- /dev/null
+++ b/package/libselinux/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_LIBSELINUX
+	bool "libselinux"
+	select BR2_PACKAGE_LIBSEPOL
+	select BR2_PACKAGE_PCRE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  libselinux is the runtime SELinux library that provides
+	  interfaces (e.g. library functions for the SELinux kernel
+	  APIs like getcon(), other support functions like
+	  getseuserbyname()) to SELinux-aware applications. libselinux
+	  may use the shared libsepol to manipulate the binary policy
+	  if necessary (e.g. to downgrade the policy format to an
+	  older version supported by the kernel) when loading policy.
+
+	  http://selinuxproject.org/page/Main_Page
+
+comment "libselinux needs a toolchain w/ largefile, threads"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+
+if BR2_PACKAGE_LIBSELINUX
+
+config BR2_PACKAGE_LIBSELINUX_PYTHON_BINDINGS
+	select BR2_PACKAGE_PYTHON
+	bool "python bindings"
+	help
+	  enable building python bindings
+
+endif
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
new file mode 100644
index 0000000..035d721
--- /dev/null
+++ b/package/libselinux/libselinux.mk
@@ -0,0 +1,88 @@
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
+ifeq ($(BR2_PACKAGE_LIBSELINUX_PYTHON_BINDINGS),y)
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
+	# Create the selinuxfs mount point
+	mkdir $(TARGET_DIR)/selinux
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
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
