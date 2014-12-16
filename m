From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:53:53 -0600
Subject: [Buildroot] [PATCH 01/30] libselinux: new package
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                |  1 +
 package/libselinux/Config.in     | 25 ++++++++++++++
 package/libselinux/libselinux.mk | 70 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk

diff --git a/package/Config.in b/package/Config.in
index f41e332..0944542 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -936,6 +936,7 @@ menu "Other"
 endmenu
 
 menu "Security"
+	source "package/libselinux/Config.in"
 	source "package/libsepol/Config.in"
 endmenu
 
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
new file mode 100644
index 0000000..239f31e
--- /dev/null
+++ b/package/libselinux/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBSELINUX
+	bool "libselinux"
+	select BR2_PACKAGE_LIBSEPOL
+	select BR2_PACKAGE_PCRE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	# No direct limitation to build other arch or libc(s).
+	# Limiting based on qemu tested arch(s).
+	depends on BR2_powerpc || BR2_powerpc64 || \
+		BR2_i386 || BR2_x86_64 || BR2_arm
+	depends on BR2_TOOLCHAIN_USES_GLIBC # UCLIBC needs testing
+
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
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
new file mode 100644
index 0000000..9e2b438
--- /dev/null
+++ b/package/libselinux/libselinux.mk
@@ -0,0 +1,70 @@
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
+define LIBSELINUX_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and
+	# header paths.
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+endef
+
+define LIBSELINUX_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSELINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+	# Create the selinuxfs mount point
+	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
+	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
+		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
+endef
+
+HOST_LIBSELINUX_DEPENDENCIES = host-libsepol host-pcre host-python host-swig
+
+HOST_LIBSELINUX_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
+	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
+	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define HOST_LIBSELINUX_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and
+	# header paths.
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) all
+	# Generate python interface wrapper
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
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
+	# Install python interface wrapper
+	$(MAKE) -C $(@D) install-pywrap $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
