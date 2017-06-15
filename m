From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:29:22 +0200
Subject: [Buildroot] [git commit] python-setuptools: bump to version 36.0.1
Message-ID: <20170615202845.C069E803D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5896bb8aea975fdd811eec30552fd65e5aa8dee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent setuptools versions require bootstrap.py to be invoked
before the standard setup process. So create such pre configure
hooks for both host and target versions.

Change download location to GitHub because setuptools doesn't
provide *.tar.gz any longer.

Fix legal info. setuptools is now licensed under MIT licence.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-setuptools/python-setuptools.hash |  4 +---
 package/python-setuptools/python-setuptools.mk   | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 88113fa..de6ad56 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,2 @@
-# From https://pypi.python.org/pypi/setuptools/18.7.1
-md5 a0984da9cd8d7b582e1fd7de67dfdbcc setuptools-18.7.1.tar.gz
 # Locally calculated
-sha256  aff36c95035e0b311eacb1434e3f7e85f5ccaad477773847e582978f8f45bd74  setuptools-18.7.1.tar.gz
+sha256  99339ac1b4c9bc0a74745d6ff196a207ddfb5f7ca75df76f3d8d081a7f70cecc  python-setuptools-v36.0.1.tar.gz
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 15edc6f..1bdb788 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,12 +4,20 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 18.7.1
-PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = http://pypi.python.org/packages/source/s/setuptools
-PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation or Zope Public License
-PYTHON_SETUPTOOLS_LICENSE_FILES = PKG-INFO
+PYTHON_SETUPTOOLS_VERSION = v36.0.1
+PYTHON_SETUPTOOLS_SITE = $(call github,pypa,setuptools,$(PYTHON_SETUPTOOLS_VERSION))
+PYTHON_SETUPTOOLS_LICENSE = MIT
+PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
+# recent setuptools versions require bootstrap.py to be invoked
+# before the standard setup process.
+define PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
+	cd  $(@D) && $(HOST_DIR)/usr/bin/python ./bootstrap.py
+endef
+
+PYTHON_SETUPTOOLS_PRE_CONFIGURE_HOOKS = PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
+HOST_PYTHON_SETUPTOOLS_PRE_CONFIGURE_HOOKS = PYTHON_SETUPTOOLS_RUN_BOOTSTRAP
+
 $(eval $(python-package))
 $(eval $(host-python-package))
