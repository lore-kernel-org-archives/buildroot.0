From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 14 Dec 2011 11:35:32 +0100
Subject: [Buildroot] [PATCH] New package: python-dpkt
Message-ID: <1323858932-10219-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |    1 +
 package/python-dpkt/Config.in      |   11 +++++++++++
 package/python-dpkt/python-dpkt.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/python-dpkt/Config.in
 create mode 100644 package/python-dpkt/python-dpkt.mk

diff --git a/package/Config.in b/package/Config.in
index cca2b0a..e5c2cae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,7 @@ source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/multimedia/python-mad/Config.in"
+source "package/python-dpkt/Config.in"
 source "package/python-serial/Config.in"
 endmenu
 endif
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
new file mode 100644
index 0000000..2d337dd
--- /dev/null
+++ b/package/python-dpkt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_DPKT
+	bool "python-dpkt"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
+	help
+	  Fast, simple packet creation / parsing, with definitions 
+	  for the basic TCP/IP protocols. 
+
+	  http://code.google.com/p/dpkt/ 
+
+
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
new file mode 100644
index 0000000..a76e8ca
--- /dev/null
+++ b/package/python-dpkt/python-dpkt.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# python-dpkt
+#
+#############################################################
+
+PYTHON_DPKT_VERSION = 1.7
+PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
+PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
+
+PYTHON_DPKT_DEPENDENCIES = python
+
+define PYTHON_DPKT_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)"		\
+		CFLAGS="$(TARGET_CFLAGS)" 	\
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS)" 	\
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_DPKT_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.1.1
