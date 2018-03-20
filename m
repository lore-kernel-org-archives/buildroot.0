From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 20 Mar 2018 15:39:42 -0500
Subject: [Buildroot] [PATCH v3 2/3] python-networkx: new package
In-Reply-To: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
References: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <1521578383-56128-2-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add python-networkx package to buildroot. While 2.1
is the latest version, the current version of setools does not
work with versions past 1.11.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v2 -> v3: Update to remove target dependencies but kept the
          host package dependency as it is required for
          host-python-decorator to be built and thus available
          at runtime
v1 -> v2: Update to add version dependency to networkx mk file

---
 package/Config.in                            |  1 +
 package/python-networkx/Config.in            |  9 +++++++++
 package/python-networkx/python-networkx.hash |  4 ++++
 package/python-networkx/python-networkx.mk   | 17 +++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-networkx/Config.in
 create mode 100644 package/python-networkx/python-networkx.hash
 create mode 100644 package/python-networkx/python-networkx.mk

diff --git a/package/Config.in b/package/Config.in
index 449ffcc..4d98365 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -837,6 +837,7 @@ menu "External python modules"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
+	source "package/python-networkx/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
diff --git a/package/python-networkx/Config.in b/package/python-networkx/Config.in
new file mode 100644
index 0000000..0f3e86f
--- /dev/null
+++ b/package/python-networkx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_NETWORKX
+	bool "python-networkx"
+	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
+	help
+	  A Python package for the creation, manipulation,
+	  and study of the structure, dynamics, and
+	  functions of complex networks.
+
+	  https://pypi.python.org/pypi/networkx
diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
new file mode 100644
index 0000000..92383e7
--- /dev/null
+++ b/package/python-networkx/python-networkx.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/networks/json, sha256 locally computed
+md5 6ef584a879e9163013e9a762e1cf7cd1 networkx-1.11.tar.gz
+sha256 0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8 networkx-1.11.tar.gz
+sha256 f4c13bf0e83bef45116ebda6c360066df6fd99610efaea9790b998c5441b0c0d LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
new file mode 100644
index 0000000..4dfdbd5
--- /dev/null
+++ b/package/python-networkx/python-networkx.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-networkx
+#
+################################################################################
+
+# The current version of setools (v4.1.1) does not work with python-networkx past v1.11
+PYTHON_NETWORKX_VERSION = 1.11
+PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
+PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192
+PYTHON_NETWORKX_LICENSE = BSD-3-Clause
+PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
+PYTHON_NETWORKX_SETUP_TYPE = setuptools
+HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
