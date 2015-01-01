From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 20:42:00 +0100
Subject: [Buildroot] [git commit] libselinux: new package
Message-ID: <20150101194423.EBFC78042B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d9f54ac654b15bcffd2a20fe57ad01a494cc4c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Add hash file.
  - Enable on all architectures, and enable on uClibc. The
    autobuilders will let us know if there are any problems.
  - Use "Public Domain" as the license instead of "PublicDomain"
  - Handle Python 2 vs. Python 3 for the host package. Either can be
    used by libselinux.
  - Change the trick used to get the library and programs installed in
    usr/lib/ and usr/sbin/ instead of lib/ and sbin/.]

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/libselinux/Config.in       |   19 +++++++++
 package/libselinux/libselinux.hash |    2 +
 package/libselinux/libselinux.mk   |   79 ++++++++++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a4f5d8b..850fc09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -947,6 +947,7 @@ menu "Other"
 endmenu
 
 menu "Security"
+	source "package/libselinux/Config.in"
 	source "package/libsepol/Config.in"
 endmenu
 
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
new file mode 100644
index 0000000..c8a23b3
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
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
new file mode 100644
index 0000000..861c327
--- /dev/null
+++ b/package/libselinux/libselinux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 57aad47c06b7ec18a76e8d9870539277a84cb40109cfdcf70ed3260bdb04447a libselinux-2.1.13.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
new file mode 100644
index 0000000..4e55727
--- /dev/null
+++ b/package/libselinux/libselinux.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# libselinux
+#
+################################################################################
+
+LIBSELINUX_VERSION = 2.1.13
+LIBSELINUX_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSELINUX_LICENSE = Public Domain
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
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBSELINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	# Create the selinuxfs mount point
+	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
+	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
+		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
+endef
+
+HOST_LIBSELINUX_DEPENDENCIES = \
+	host-libsepol host-pcre host-swig
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_LIBSELINUX_DEPENDENCIES += host-python3
+HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m/
+HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
+else
+HOST_LIBSELINUX_DEPENDENCIES += host-python
+HOST_LIBSELINUX_PYTHONLIBDIR = -L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
+HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
+endif
+
+HOST_LIBSELINUX_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
+	PYINC="$(HOST_LIBSELINUX_PYINC)" \
+	PYTHONLIBDIR="$(HOST_LIBSELINUX_PYTHONLIBDIR)" \
+	PYLIBVER="$(HOST_LIBSELINUX_PYLIBVER)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define HOST_LIBSELINUX_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and
+	# header paths.
+	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
+		SHLIBDIR=$(HOST_DIR)/usr/lib all
+	# Generate python interface wrapper
+	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
+endef
+
+define HOST_LIBSELINUX_INSTALL_CMDS
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
+		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
+	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
+	# Install python interface wrapper
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
