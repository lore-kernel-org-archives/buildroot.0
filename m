From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:43 -0500
Subject: [Buildroot] [PATCH 04/17] libsemanage: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-5-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                                  |    1 +
 package/libsemanage/Config.in                      |   21 ++++
 .../libsemanage-2.1.10-execptionLibPathFix.patch   |   10 ++
 package/libsemanage/libsemanage.mk                 |  113 ++++++++++++++++++++
 4 files changed, 145 insertions(+), 0 deletions(-)
 create mode 100644 package/libsemanage/Config.in
 create mode 100644 package/libsemanage/libsemanage-2.1.10-execptionLibPathFix.patch
 create mode 100644 package/libsemanage/libsemanage.mk

diff --git a/package/Config.in b/package/Config.in
index fa70e84..b6b3cec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -900,6 +900,7 @@ endmenu
 menu "Security"
 source "package/libsepol/Config.in"
 source "package/libselinux/Config.in"
+source "package/libsemanage/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
new file mode 100644
index 0000000..d4a9868
--- /dev/null
+++ b/package/libsemanage/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBSEMANAGE
+	bool "libsemanage"
+	help
+	  libsemanage is the policy management library. It uses libsepol for binary 
+	  policy manipulation and libselinux for interacting with the SELinux 
+	  system. It also exec's helper programs for loading policy and for checking
+	  whether the file_contexts configuration is valid (load_policy and 
+	  setfiles from policycoreutils) presently, although this may change at 
+	  least for the bootstrapping case (for rpm).
+	  
+	  http://selinuxproject.org/page/Main_Page
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
diff --git a/package/libsemanage/libsemanage-2.1.10-execptionLibPathFix.patch b/package/libsemanage/libsemanage-2.1.10-execptionLibPathFix.patch
new file mode 100644
index 0000000..3972a79
--- /dev/null
+++ b/package/libsemanage/libsemanage-2.1.10-execptionLibPathFix.patch
@@ -0,0 +1,10 @@
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
index 0000000..39098e8
--- /dev/null
+++ b/package/libsemanage/libsemanage.mk
@@ -0,0 +1,113 @@
+#############################################################
+#
+# libsemanage
+#
+#############################################################
+LIBSEMANAGE_VERSION = 2.1.10
+LIBSEMANAGE_SOURCE = libsemanage-$(LIBSEMANAGE_VERSION).tar.gz
+LIBSEMANAGE_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSEPOL_LICENSE = LGPLv2.1
+LIBSEPOL_LICENSE_FILES = COPYING
+
+##############################
+# Target Section
+##############################
+LIBSEMANAGE_DEPENDENCIES = host-bison libsepol libselinux ustr bzip2
+
+LIBSEMANAGE_INSTALL_STAGING = YES
+LIBSEMANAGE_INSTALL_TARGET = YES
+
+LIBSEMANAGE_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS),y)
+
+LIBSEMANAGE_DEPENDENCIES += python host-swig host-python
+LIBSEMANAGE_MAKE_CMDS += PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define LIBSEMANAGE_PYTHON_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(STAGING_DIR) swigify
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(STAGING_DIR) pywrap
+endef
+
+define LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install-pywrap $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+define LIBSEMANAGE_PYTHON_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*semanage*
+endef
+
+define LIBSEMANAGE_PYTHON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/*semanage*
+endef
+
+endif
+
+define LIBSEMANAGE_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(STAGING_DIR) all
+	$(LIBSEMANAGE_PYTHON_BUILD_CMDS)
+endef
+
+define LIBSEMANAGE_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+	$(LIBSEMANAGE_PYTHON_INSTALL_STAGING_CMDS)
+endef
+
+define LIBSEMANAGE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+	rm -rf $(addprefix $(TARGET_DIR),/usr/share/man/ /usr/include/)
+	$(LIBSEMANAGE_PYTHON_INSTALL_TARGET_CMDS)
+endef
+
+define LIBSEMANAGE_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define LIBSEMANAGE_UNINSTALL_STAGING_CMDS
+	rm -rf $(addprefix $(STAGING_DIR),/usr/include/semanage /usr/lib/libsemanage* \
+		/usr/lib/pkgconfig/libsemanage* /etc/selinux/semanage.conf)
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man3/*.3)))
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man5/*.5)))
+	$(LIBSEMANAGE_PYTHON_UNINSTALL_STAGING_CMDS)
+endef
+
+define LIBSEMANAGE_UNINSTALL_TARGET_CMDS
+	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/libsemanage* \
+		/usr/lib/pkgconfig/libsemanage* /etc/selinux/semanage.conf)
+	$(LIBSEMANAGE_PYTHON_UNINSTALL_TARGET_CMDS)
+endef
+
+##############################
+# Host Section
+##############################
+HOST_LIBSEMANAGE_DEPENDENCIES = host-python host-bison host-libsepol host-libselinux host-ustr host-bzip2
+
+HOST_LIBSEMANAGE_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
+	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
+
+define HOST_LIBSEMANAGE_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(HOST_DIR) all
+	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(HOST_DIR) swigify
+	$(MAKE) -C $(@D) $(HOST_LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(HOST_DIR) pywrap
+endef
+
+define HOST_LIBSEMANAGE_INSTALL_CMDS
+	$(MAKE) -C $(@D) install install-pywrap $(HOST_LIBSEMANAGE_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_LIBSEMANAGE_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
