From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:41 -0500
Subject: [Buildroot] [PATCH 02/17] libselinux: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-3-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                |    1 +
 package/libselinux/Config.in     |   22 +++++++
 package/libselinux/libselinux.mk |  128 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+), 0 deletions(-)
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk

diff --git a/package/Config.in b/package/Config.in
index 21f7271..bf68827 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ endmenu
 
 menu "Security"
 source "package/libsepol/Config.in"
+source "package/libselinux/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
new file mode 100644
index 0000000..4f3be64
--- /dev/null
+++ b/package/libselinux/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBSELINUX
+	bool "libselinux"
+	depends on BR2_LINUX_KERNEL
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
index 0000000..ed90186
--- /dev/null
+++ b/package/libselinux/libselinux.mk
@@ -0,0 +1,128 @@
+################################################################################
+#
+# libselinux
+#
+################################################################################
+LIBSELINUX_VERSION = 2.1.13
+LIBSELINUX_SOURCE = libselinux-$(LIBSELINUX_VERSION).tar.gz
+LIBSELINUX_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSELINUX_LICENSE = PublicDomain
+LIBSELINUX_LICENSE_FILES = LICENSE
+
+##############################
+# Target Section
+##############################
+LIBSELINUX_DEPENDENCIES = libsepol pcre
+
+LIBSELINUX_INSTALL_STAGING = YES
+LIBSELINUX_INSTALL_TARGET = YES
+
+LIBSELINUX_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX_PYTHON_BINDINGS),y)
+
+LIBSELINUX_DEPENDENCIES += python host-swig host-python
+LIBSELINUX_MAKE_CMDS += PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define LIBSELINUX_PYTHON_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR) swigify
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR) pywrap
+endef
+
+define LIBSELINUX_PYTHON_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSELINUX_PYTHON_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+define LIBSELINUX_PYTHON_UNINSTALL_STAGING_CMDS
+	rm -rf $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/selinux
+endef
+
+define LIBSELINUX_PYTHON_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/selinux
+endef
+
+endif
+
+define LIBSELINUX_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR) all
+	$(LIBSELINUX_PYTHON_BUILD_CMDS)
+endef
+
+define LIBSELINUX_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+	$(LIBSELINUX_PYTHON_INSTALL_STAGING_CMDS)
+endef
+
+define LIBSELINUX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+	$(LIBSELINUX_PYTHON_INSTALL_TARGET_CMDS)
+endef
+
+define LIBSELINUX_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+LIBSELINUX_SBIN_FILES = avcstat compute_av compute_create compute_member \
+	compute_relabel compute_user getconlist getdefaultcon getenforce \
+	getfilecon getpidcon getsebool getseuser matchpathcon policyvers \
+	sefcontext_compile selinux_check_securetty_context selinuxenabled \
+	selinuxexeccon setenforce setfilecon togglesebool
+
+define LIBSELINUX_UNINSTALL_STAGING_CMDS
+	rm -rf $(addprefix $(STAGING_DIR), /usr/include/selinux \
+		$(addprefix /usr/sbin/, $(LIBSELINUX_SBIN_FILES)) \
+		/usr/lib/pkgconfig/libselinux* /usr/lib/libselinux* /lib/libselinux*)
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man3/*.3)))
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man5/,$(notdir $(wildcard $(@D)/man/man5/*.5)))
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man8/,$(notdir $(wildcard $(@D)/man/man8/*.8)))
+	$(LIBSELINUX_PYTHON_UNINSTALL_STAGING_CMDS)
+endef
+
+define LIBSELINUX_UNINSTALL_TARGET_CMDS
+	rm -rf $(addprefix $(TARGET_DIR), /usr/include/selinux \
+		$(addprefix /usr/sbin/, $(LIBSELINUX_SBIN_FILES)) \
+		/usr/lib/pkgconfig/libselinux* /usr/lib/libselinux* /lib/libselinux*)
+	$(LIBSELINUX_PYTHON_UNINSTALL_TARGET_CMDS)
+endef
+
+##############################
+# Host Section
+##############################
+HOST_LIBSELINUX_DEPENDENCIES = host-python host-libsepol host-swig host-pcre
+
+HOST_LIBSELINUX_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread"\
+	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/" \
+
+define HOST_LIBSELINUX_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR) all
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR) swigify
+	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR) pywrap
+endef
+
+define HOST_LIBSELINUX_INSTALL_CMDS
+	$(MAKE) -C $(@D) install install-pywrap $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+	mv $(HOST_DIR)/lib/libselinux.so.1 $(HOST_DIR)/usr/lib
+	(cd $(HOST_DIR)/usr/lib; rm -f libselinux.so; ln -s libselinux.so.1 libselinux.so)
+	rmdir $(HOST_DIR)/lib
+	(if -f $(HOST_DIR)/sbin/matchpathcon; then \
+		mv $(HOST_DIR)/sbin/matchpathcon $(HOST_DIR)/usr/sbin/; \
+		rmdir $(HOST_DIR)/sbin; \
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
