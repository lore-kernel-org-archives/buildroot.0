From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:50 +0100
Subject: [Buildroot] [PATCH 21/38] python-netifaces: convert to the Python
	package infrastructure
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-22-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, remove the "select BR2_PACKAGE_PYTHON_SETUPTOOLS", since
setuptools is a host dependency (needed to built the package), not a
target dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-netifaces/Config.in           |  1 -
 package/python-netifaces/python-netifaces.mk | 19 ++-----------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
index b9d66d8..29f9fc3 100644
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
 	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	help
 	  Portable access to network interfaces from Python.
 
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 1570fd1..faa39bd 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -7,21 +7,6 @@
 PYTHON_NETIFACES_VERSION = 0.7
 PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
 PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+PYTHON_NETIFACES_SETUP_TYPE = setuptools
 
-PYTHON_NETIFACES_DEPENDENCIES = python host-python-setuptools host-python-distutilscross
-
-define PYTHON_NETIFACES_BUILD_CMDS
-	(cd $(@D); \
-		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
-		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
-	$(HOST_DIR)/usr/bin/python setup.py build -x)
-endef
-
-define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-	$(HOST_DIR)/usr/bin/python setup.py install \
-	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
