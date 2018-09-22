From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:50:23 +0200
Subject: [Buildroot] [git commit] python-setuptools: use pypi package
Message-ID: <20180922165058.5DB9088820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7d89ed107f76694f08e545e5f52cce8fbf15ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The releases on Github produces a setuptools version that isn't PEP518
compliant because a .post number is attached to the .egg file
(IE: 40.0.0.post20180820) which can cause a python package using setuptools
to fail if looking for a setuptools version.

Instead, using the official release from pypi is recommended as it does not
produce a  .post version on the egg file.

Another benefit is not having to run bootstrap.py either.

See https://github.com/pypa/setuptools/issues/1462 for more details about
the issue

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.hash |  5 +++--
 package/python-setuptools/python-setuptools.mk   | 20 ++++++++++++--------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index c905d8254a..c4e151f77a 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256  327e232b1809c9481256408fe9233bcf6a27f9f63ddbbadc526f451e5027aad5  python-setuptools-v40.0.0.tar.gz
+# From https://pypi.org/pypi/setuptools/json
+md5  260630ae1a64bafa39dcc53404d63829  setuptools-40.0.0.zip
+sha256  012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f  setuptools-40.0.0.zip
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 8db8511286..fb58b028e8 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,20 +4,24 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = v40.0.0
-PYTHON_SETUPTOOLS_SITE = $(call github,pypa,setuptools,$(PYTHON_SETUPTOOLS_VERSION))
+PYTHON_SETUPTOOLS_VERSION = 40.0.0
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
-# recent setuptools versions require bootstrap.py to be invoked
-# before the standard setup process.
-define PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
-	cd  $(@D) && $(HOST_DIR)/bin/python ./bootstrap.py
+define PYTHON_SETUPTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
 endef
 
-PYTHON_SETUPTOOLS_PRE_CONFIGURE_HOOKS = PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
-HOST_PYTHON_SETUPTOOLS_PRE_CONFIGURE_HOOKS = PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
+define HOST_PYTHON_SETUPTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(HOST_PYTHON_SETUPTOOLS_DL_DIR)/$(PYTHON_SETUPTOOLS_SOURCE)
+	mv $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/setuptools-$(PYTHON_SETUPTOOLS_VERSION)
+endef
 
 $(eval $(python-package))
 $(eval $(host-python-package))
