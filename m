From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Apr 2014 22:01:23 +0200
Subject: [Buildroot] [git commit] pypcap: new package
Message-ID: <20140411200233.495739BEA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8b281354c934f2b03eb6e7d8dfb03284983c4ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/python-pypcap/Config.in        |    8 ++++++++
 package/python-pypcap/python-pypcap.mk |   22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6abc7b3..98d94e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -459,6 +459,7 @@ source "package/python-pyasn/Config.in"
 source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
+source "package/python-pypcap/Config.in"
 source "package/python-pyro/Config.in"
 source "package/python-pysnmp/Config.in"
 source "package/python-pysnmp-apps/Config.in"
diff --git a/package/python-pypcap/Config.in b/package/python-pypcap/Config.in
new file mode 100644
index 0000000..ed336ca
--- /dev/null
+++ b/package/python-pypcap/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYPCAP
+	bool "python-pypcap"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  The pypcap module is an object-oriented wrapper of the C libpcap library.
+
+	  https://code.google.com/p/pypcap/
diff --git a/package/python-pypcap/python-pypcap.mk b/package/python-pypcap/python-pypcap.mk
new file mode 100644
index 0000000..89f2dc1
--- /dev/null
+++ b/package/python-pypcap/python-pypcap.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-pypcap
+#
+################################################################################
+
+PYTHON_PYPCAP_VERSION = 102
+PYTHON_PYPCAP_SITE = https://pypcap.googlecode.com/svn/trunk
+PYTHON_PYPCAP_SITE_METHOD = svn
+PYTHON_PYPCAP_LICENSE = BSD-3c
+PYTHON_PYPCAP_LICENSE_FILES = LICENSE
+PYTHON_PYPCAP_SETUP_TYPE = distutils
+PYTHON_PYPCAP_DEPENDENCIES = host-python-pyrex libpcap
+
+define PYTHON_PYPCAP_CONFIGURE_CMDS
+	$(HOST_DIR)/usr/bin/pyrexc $(@D)/pcap.pyx
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python setup.py \
+		config --with-pcap=$(STAGING_DIR)/usr)
+endef
+
+$(eval $(python-package))
