From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 22 Dec 2011 13:08:33 +0100
Subject: [Buildroot] [PATCH v4 3/5] New package: python-dpkt
In-Reply-To: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
References: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1324555715-32123-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                  |    1 +
 package/python-dpkt/Config.in      |   11 +++++++++++
 package/python-dpkt/python-dpkt.mk |   22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/python-dpkt/Config.in
 create mode 100644 package/python-dpkt/python-dpkt.mk

diff --git a/package/Config.in b/package/Config.in
index 6ab893f..bb5e5b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -238,6 +238,7 @@ source "package/php/Config.in"
 source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
+source "package/python-dpkt/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-serial/Config.in"
 endmenu
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
new file mode 100644
index 0000000..aac9f09
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
index 0000000..7ac873c
--- /dev/null
+++ b/package/python-dpkt/python-dpkt.mk
@@ -0,0 +1,22 @@
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
