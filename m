From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:05 -0600
Subject: [Buildroot] [ PATCH v4 05/20] libsemanage: new package
In-Reply-To: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1386872840-22051-6-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v3 -> v4:
  - Added back in the Python bindings creation configure option
    (suggested by Thomas).
  - Added a dependency on host-flex (suggeste by Thomas).
  - Cleaned up configure comments (suggested by Thomas).
  - Removed the clean command.
Changes v2 -> v3:
  - Changes patch naming convention (suggested by Thomas).
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and BR2_LARGEFILE
    (suggested by Thomas).
Changes v1 -> v2:
  - Move Config.in entry into the libraries section since this is a
    library.
  - General cleanup to the mk file to conform to the standard format.
  - Fixed the patch naming to avoid using the version number.
  - Cleaned up the patch to include a signed-off-by line.
  - Changed package dependencies into selects in the config.
  - Changed the original Python select in the Config.in to be a check
    in the mk file.
  - Removed building the python bindings in the host configuration.
---
 package/Config.in                                  |    1 +
 package/libsemanage/Config.in                      |   30 ++++++++
 .../libsemanage-0001-execption-lib-path-fix.patch  |   14 ++++
 package/libsemanage/libsemanage.mk                 |   72 ++++++++++++++++++++
 4 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 package/libsemanage/Config.in
 create mode 100644 package/libsemanage/libsemanage-0001-execption-lib-path-fix.patch
 create mode 100644 package/libsemanage/libsemanage.mk

diff --git a/package/Config.in b/package/Config.in
index 11cfcab..8f2d3c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -726,6 +726,7 @@ endmenu
 
 menu "Security"
 source "package/libselinux/Config.in"
+source "package/libsemanage/Config.in"
 source "package/libsepol/Config.in"
 endmenu
 
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
new file mode 100644
index 0000000..e4013cd
--- /dev/null
+++ b/package/libsemanage/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LIBSEMANAGE
+	bool "libsemanage"
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_USTR
+	select BR2_PACKAGE_BZIP2
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  libsemanage is the policy management library. It uses
+	  libsepol for binary policy manipulation and libselinux for
+	  interacting with the SELinux system. It also exec's helper
+	  programs for loading policy and for checking whether the
+	  file_contexts configuration is valid (load_policy and
+	  setfiles from policycoreutils) presently, although this may
+	  change at least for the bootstrapping case (for rpm).
+
+	  http://selinuxproject.org/page/Main_Page
+
+comment "libsemanage needs a toolchain w/ largefile, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+
+if BR2_PACKAGE_LIBSEMANAGE
+
+config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
+	select BR2_PACKAGE_PYTHON
+	bool "python bindings"
+	help
+	  enable building python bindings
+
+endif
diff --git a/package/libsemanage/libsemanage-0001-execption-lib-path-fix.patch b/package/libsemanage/libsemanage-0001-execption-lib-path-fix.patch
new file mode 100644
index 0000000..cbcbea5
--- /dev/null
+++ b/package/libsemanage/libsemanage-0001-execption-lib-path-fix.patch
@@ -0,0 +1,14 @@
+Patch to correct a missing header file issue.
+
+Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
+
+--- a/src/exception.sh	2011-12-21 11:46:04.000000000 -0600
++++ b/src/exception.sh	2012-08-27 11:29:58.000000000 -0500
+@@ -9,6 +9,6 @@
+ }
+ "
+ }
+-gcc -x c -c - -aux-info temp.aux < ../include/semanage/semanage.h
++gcc -x c -c - -aux-info temp.aux -I../include < ../include/semanage/semanage.h
+ for i in `awk '/extern int/ { print $6 }' temp.aux`; do except $i ; done
+ rm -f -- temp.aux -.o
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
new file mode 100644
index 0000000..44d8324
--- /dev/null
+++ b/package/libsemanage/libsemanage.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# libsemanage
+#
+################################################################################
+
+LIBSEMANAGE_VERSION = 2.1.10
+LIBSEMANAGE_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSEPOL_LICENSE = LGPLv2.1+
+LIBSEPOL_LICENSE_FILES = COPYING
+
+LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
+
+LIBSEMANAGE_INSTALL_STAGING = YES
+
+LIBSEMANAGE_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS),y)
+
+LIBSEMANAGE_DEPENDENCIES += python host-swig host-python
+LIBSEMANAGE_MAKE_OPT += \
+	PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define LIBSEMANAGE_PYTHON_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPT) DESTDIR=$(STAGING_DIR) swigify pywrap
+endef
+
+define LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSEMANAGE_MAKE_OPT) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSEMANAGE_MAKE_OPT) DESTDIR=$(TARGET_DIR)
+endef
+
+endif # End of BR2_PACKAGE_PYTHON
+
+define LIBSEMANAGE_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and 
+	# header paths.
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPT) DESTDIR=$(STAGING_DIR) all
+	$(LIBSEMANAGE_PYTHON_BUILD_CMDS)
+endef
+
+define LIBSEMANAGE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(LIBSEMANAGE_MAKE_OPT) DESTDIR=$(STAGING_DIR)
+	$(LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS)
+endef
+
+define LIBSEMANAGE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(LIBSEMANAGE_MAKE_OPT) DESTDIR=$(TARGET_DIR)
+	$(LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS)
+endef
+
+HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol \
+	host-libselinux host-ustr host-bzip2
+
+define HOST_LIBSEMANAGE_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and 
+	# header paths.
+	$(MAKE) -C $(@D) all $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_LIBSEMANAGE_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
