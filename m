From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2013 00:23:02 +0200
Subject: [Buildroot] [git commit] python-ipy: new package
Message-ID: <20131002223629.07E7B9B919@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7c5625e0acfd62f34dd45f91ea0ea3150c2e8e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/python-ipy/Config.in     |    8 ++++++++
 package/python-ipy/python-ipy.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 363113f..b7fdb89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -390,6 +390,7 @@ source "package/python-bottle/Config.in"
 source "package/python-crc16/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
+source "package/python-ipy/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
diff --git a/package/python-ipy/Config.in b/package/python-ipy/Config.in
new file mode 100644
index 0000000..bead932
--- /dev/null
+++ b/package/python-ipy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_IPY
+	bool "python-ipy"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  IPy - class and tools for handling of IPv4 and
+	  IPv6 addresses and networks.
+
+	  https://github.com/haypo/python-ipy/
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
new file mode 100644
index 0000000..f3fb7c1
--- /dev/null
+++ b/package/python-ipy/python-ipy.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# python-ipy
+#
+################################################################################
+
+PYTHON_IPY_VERSION = 0.75-0-g58006fb
+PYTHON_IPY_SOURCE  = haypo-python-ipy-IPy-$(PYTHON_IPY_VERSION).tar.gz
+PYTHON_IPY_SITE    = https://github.com/haypo/python-ipy/tarball/IPy-0.75
+PYTHON_IPY_DEPENDENCIES = host-python python
+PYTHON_IPY_LICENSE = BSD-3c
+PYTHON_IPY_LICENSE_FILES = COPYING
+
+define PYTHON_IPY_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(HOST_DIR)/usr/bin/python setup.py build_ext \
+		--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_IPY_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
