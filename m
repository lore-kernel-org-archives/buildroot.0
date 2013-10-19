From: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
Date: Sat, 19 Oct 2013 17:46:38 +0400
Subject: [Buildroot] [PATCH] python-sip: new package
Message-ID: <1382190398-9885-1-git-send-email-sergey.kostanbaev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SIP is needed for both PyQt generation on host and running
any PyQt application on target.

Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
---
 Config.in                             |    3 ++
 python-sip/Config.in                  |    8 ++++
 python-sip/python-sip-configure.patch |   42 +++++++++++++++++++++++
 python-sip/python-sip.mk              |   62 ++++++++++++++++++++++++++++++++++
 4 files changed, 117 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a94cb62..db82265 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -157,6 +157,9 @@ source "package/qextserialport/Config.in"
 source "package/qjson/Config.in"
 source "package/qtuio/Config.in"
 source "package/qwt/Config.in"
+
+source "package/python-sip/Config.in"
+
 endif
 
 source "package/qt5/Config.in"
diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
new file mode 100644
index 0000000..d9ee8d7
--- /dev/null
+++ b/package/python-sip/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SIP
+	bool "python-sip"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  SIP is a tool for C/C++ libraries binding. It was developed
+	  to create PyQt
+
+	  http://www.riverbankcomputing.com/software/sip/intro
diff --git a/package/python-sip/python-sip-configure.patch b/package/python-sip/python-sip-configure.patch
new file mode 100644
index 0000000..f7e5a67
--- /dev/null
+++ b/package/python-sip/python-sip-configure.patch
@@ -0,0 +1,42 @@
+Add cross compilation options for using satged python
+config, libraries and includes
+
+Signed-off-by Sergey Kostanbaev <sergey.kostanbaev@gamil.com>
+--- a/configure.py	2013-04-24 12:41:35.382000017 +0400
++++ b/configure.py	2013-04-24 13:09:30.000000000 +0400
+@@ -273,9 +273,9 @@
+         "default_mod_dir":  plat_py_site_dir,
+         "default_sip_dir":  opts.sipsipdir,
+         "py_version":       py_version,
+-        "py_inc_dir":       plat_py_inc_dir,
+-        "py_conf_inc_dir":  plat_py_conf_inc_dir,
+-        "py_lib_dir":       plat_py_lib_dir,
++        "py_inc_dir":       opts.py_inc_dir,
++        "py_conf_inc_dir":  opts.py_conf_inc_dir,
++        "py_lib_dir":       opts.py_lib_dir,
+         "universal":        opts.universal,
+         "arch":             opts.arch,
+         "deployment_target":    opts.deployment_target
+@@ -399,6 +399,22 @@
+             "macros")
+     p.add_option_group(g)
+ 
++    # Python configuration
++    g = optparse.OptionGroup(p, title="Python include path")
++    g.add_option("-i", "--py_inc_dir", action="callback",
++	    default=plat_py_inc_dir, type="string", metavar="DIR",
++	    dest="py_inc_dir", callback=store_abspath, help="where the Python "
++	    "include directory located [default: %s]" % plat_py_inc_dir)
++    g.add_option("-c", "--py_conf_inc_dir", action="callback",
++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
++	    dest="py_conf_inc_dir", callback=store_abspath, help="where the Python "
++	    "Configuration include directory located [default: %s]" % plat_py_conf_inc_dir)
++    g.add_option("-l", "--py_lib_dir", action="callback",
++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
++	    dest="py_lib_dir", callback=store_abspath, help="where the Python "
++	    "library located [default: %s]" % plat_py_lib_dir)
++
++
+     # Installation.
+     g = optparse.OptionGroup(p, title="Installation")
+     g.add_option("-b", "--bindir", action="callback",
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
new file mode 100644
index 0000000..80f7fa0
--- /dev/null
+++ b/package/python-sip/python-sip.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# python-sip
+#
+################################################################################
+PYTHON_SIP_VERSION = 4.15.3
+PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
+PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
+PYTHON_SIP_DEPENDENCIES = host-python-sip python
+HOST_PYTHON_SIP_DEPENDENCIES = host-python
+
+define HOST_PYTHON_SIP_CONFIGURE_CMDS
+    (cd $(@D); \
+	$(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py;\
+    )
+endef
+
+
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+PYTHON_SIP_PLATFORM = arm
+else
+PYTHON_SIP_PLATFORM =
+endif
+
+define PYTHON_SIP_SET
+  $(SED) '/$(1)[[:space:]]/c\$(1) = $(2)' $(3)/specs/linux-$(PYTHON_SIP_PLATFORM)-g++
+endef
+
+define PYTHON_SIP_CONFIGURE_CMDS
+# Fix compilers path and flags
+    $(call PYTHON_SIP_SET,QMAKE_CC,$(TARGET_CC),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_CXX,$(TARGET_CXX),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_LINK,$(TARGET_CXX),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_LINK_SHLIB,$(TARGET_CXX),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_AR,$(TARGET_AR) cqs,$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_OBJCOPY,$(TARGET_OBJCOPY),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_RANLIB,$(TARGET_RANLIB),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_STRIP,$(TARGET_STRIP),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
+    $(call PYTHON_SIP_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),$(@D))
+
+    ( cd $(@D); \
+	cp specs/linux-$(PYTHON_SIP_PLATFORM)-g++ specs;  \
+	$(HOST_DIR)/usr/bin/python configure.py \
+		-b $(TARGET_DIR)/usr/bin \
+		-d $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		-e $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
+		-v $(TARGET_DIR)/usr/share/sip \
+		-i $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+		-c $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
+		-p linux-$(PYTHON_SIP_PLATFORM)-g++; \
+    )
+endef
+
+define PYTHON_SIP_INSTALL_TARGET_CMDS
+    $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
+
