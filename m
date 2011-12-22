From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 22 Dec 2011 13:08:35 +0100
Subject: [Buildroot] [PATCH v4 5/5] New package: python-netifaces
In-Reply-To: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
References: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1324555715-32123-6-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |    1 +
 package/python-netifaces/Config.in           |    9 +++++++++
 package/python-netifaces/python-netifaces.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/python-netifaces/Config.in
 create mode 100644 package/python-netifaces/python-netifaces.mk

diff --git a/package/Config.in b/package/Config.in
index 71e1889..666a224 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-dpkt/Config.in"
 source "package/python-mad/Config.in"
+source "package/python-netifaces/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 endmenu
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
new file mode 100644
index 0000000..199191c
--- /dev/null
+++ b/package/python-netifaces/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_NETIFACES
+	bool "python-netifaces"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Portable access to network interfaces from Python.
+
+	  http://alastairs-place.net/projects/netifaces
+
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
new file mode 100644
index 0000000..9a626ef
--- /dev/null
+++ b/package/python-netifaces/python-netifaces.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# python-netifaces
+#
+#############################################################
+
+PYTHON_NETIFACES_VERSION = 0.6
+PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
+PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+
+PYTHON_NETIFACES_DEPENDENCIES = python host-python-setuptools
+
+define PYTHON_NETIFACES_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)"		\
+	$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.1.1
