From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:57:37 +0100
Subject: [Buildroot] [git commit] New package: python-setuptools
Message-ID: <20120107201230.D07F98FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0717f0357db48198a01233b0629251ba5399ca27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                              |    1 +
 package/python-setuptools/Config.in            |    8 +++++
 package/python-setuptools/python-setuptools.mk |   34 ++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d70f9b0..bfb6ac9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,6 +242,7 @@ menu "external python modules"
 source "package/python-dpkt/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-serial/Config.in"
+source "package/python-setuptools/Config.in"
 endmenu
 endif
 source "package/ruby/Config.in"
diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
new file mode 100644
index 0000000..63c2b01
--- /dev/null
+++ b/package/python-setuptools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SETUPTOOLS
+	bool "python-setuptools"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
+	help
+	  Download, build, install, upgrade, and uninstall Python packages.
+
+	  http://pypi.python.org/pypi/setuptools
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
new file mode 100644
index 0000000..b75987b
--- /dev/null
+++ b/package/python-setuptools/python-setuptools.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# python-setuptools
+#
+#############################################################
+
+PYTHON_SETUPTOOLS_VERSION = 0.6c11
+PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+PYTHON_SETUPTOOLS_DEPENDENCIES = python
+HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python
+
+
+define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_SETUPTOOLS_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
+	(cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
+
