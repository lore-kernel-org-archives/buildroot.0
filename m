From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:15:35 +0100
Subject: [Buildroot] [git commit] package/python3-setuptools: new package
Message-ID: <20190101102406.C510D882A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=331a23041de73d449f9892e4fd97f2fcf414d6de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package allows to install the host version of setuptools for
python3, regardless of what the default Python version is. It will be
used by the python-package infrastructure to make sure that host
Python packages that need python3 and setuptools have setuptools
installed for Python 3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: replace duplicated patch by a symlink to the same patch in
package/python-setuptools/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python3-setuptools/0001-add-executable.patch   |  1 +
 package/python3-setuptools/python3-setuptools.hash |  1 +
 package/python3-setuptools/python3-setuptools.mk   | 24 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
new file mode 120000
index 0000000000..5bab3d96a1
--- /dev/null
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -0,0 +1 @@
+../python-setuptools/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
new file mode 120000
index 0000000000..a3af7f0fb1
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -0,0 +1 @@
+../python-setuptools/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
new file mode 100644
index 0000000000..b6de5d4b25
--- /dev/null
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# python3-setuptools
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-setuptools/python-setuptools.mk
+PYTHON3_SETUPTOOLS_VERSION = 40.6.3
+PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
+PYTHON3_SETUPTOOLS_LICENSE = MIT
+PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
+PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
+HOST_PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
+HOST_PYTHON3_SETUPTOOLS_NEEDS_HOST_PYTHON = python3
+
+define HOST_PYTHON3_SETUPTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(HOST_PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
+endef
+
+$(eval $(host-python-package))
