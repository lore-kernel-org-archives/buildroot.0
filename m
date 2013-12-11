From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:55 +0100
Subject: [Buildroot] [PATCHv2 20/36] supervisor: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the select of BR2_PACKAGE_PYTHON_SETUPTOOLS, since what is
really needed is host-setuptools (as can be seen from the original .mk
file), and not setuptools for the target.

Also, remove the mangling of the Python shebang, since it's now done
by passing the --executable= option at install time (done in the
Python package infrastructure).

Finally, convert the package to use <pkg>_INSTALL_INIT_SYSV.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/supervisor/Config.in     |  1 -
 package/supervisor/supervisor.mk | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 5340181..c511dd8 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_MELD3
 	help
 	  A client/server system that allows its users to control a
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 40ad8ce..d2d58e2 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -7,19 +7,19 @@
 SUPERVISOR_VERSION = 3.0a12
 SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor/
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
+SUPERVISOR_SETUP_TYPE = setuptools
 
-SUPERVISOR_DEPENDENCIES = python host-python-setuptools
-
-define SUPERVISOR_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+define SUPERVISOR_INSTALL_CONF_FILES
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/supervisor.d
+	$(INSTALL) -D -m 644 package/supervisor/supervisord.conf \
+		$(TARGET_DIR)/etc/supervisord.conf
 endef
 
-define SUPERVISOR_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
-	sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{echo_supervisord_conf,pidproxy,supervisorctl,supervisord}
-	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/supervisor.d
-	$(INSTALL) -D -m 644 package/supervisor/supervisord.conf $(TARGET_DIR)/etc/supervisord.conf
-	$(INSTALL) -m 755 package/supervisor/S99supervisord $(TARGET_DIR)/etc/init.d/S99supervisord
+SUPERVISOR_POST_INSTALL_TARGET_HOOKS += SUPERVISOR_INSTALL_CONF_FILES
+
+define SUPERVISOR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/supervisor/S99supervisord \
+		$(TARGET_DIR)/etc/init.d/S99supervisord
 endef
 
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
