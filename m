From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:56:33 +0100
Subject: [Buildroot] [git commit] New package: python-dpkt
Message-ID: <20120107201230.BE6F28FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdd274110a160ec67fceae642d14a5c3f77a87aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/python-dpkt/Config.in      |   11 +++++++++++
 package/python-dpkt/python-dpkt.mk |   22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 78174e5..d70f9b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,7 @@ source "package/php/Config.in"
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
