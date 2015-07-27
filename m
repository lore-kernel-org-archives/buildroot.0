From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 27 Jul 2015 11:57:11 +0200
Subject: [Buildroot] [PATCH v2] package/python-web2py: cleaning for space
	saving
Message-ID: <1437991031-20433-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes web2py folder from welcome and examples application,
furthermore, it cleans the admin interface if unneeded.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes:

v1->v2:
 * Reworked otion sequence as suggested by Thomas.
 * Changed to a makefile based conditional as suggested by Thomas.

 package/python-web2py/Config.in        | 10 ++++++++++
 package/python-web2py/python-web2py.mk | 18 +++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index b10d3a4..79afcb5 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -14,6 +14,14 @@ config BR2_PACKAGE_PYTHON_WEB2PY
 
 if BR2_PACKAGE_PYTHON_WEB2PY
 
+config BR2_PACKAGE_PYTHON_WEB2PY_REMOVE_ADMIN
+	bool "remove admin panel application"
+	help
+	  This option removes admin panel application form web2py,
+	  useful for deploy on embedded systems.
+
+if ! BR2_PACKAGE_PYTHON_WEB2PY_REMOVE_ADMIN
+
 config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	string "admin panel password"
 	default web2py
@@ -21,3 +29,5 @@ config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	  Set the admin panel password.
 
 endif
+
+endif
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 313114a..30d8848 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -11,13 +11,21 @@ PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
 
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
-	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+	mkdir -p $(TARGET_DIR)/var/www/web2py;
+	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py;
+	rm -rf $(TARGET_DIR)/var/www/web2py/welcome.w2p;
+	rm -rf $(TARGET_DIR)/var/www/web2py/applications/examples;
+	rm -rf $(TARGET_DIR)/var/www/web2py/applications/welcome;
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_REMOVE_ADMIN),y)
+	PYTHON_WEB2PY_INSTALL_TARGET_CMDS += rm -rf $(TARGET_DIR)/var/www/web2py/applications/admin;
+else
+	PYTHON_WEB2PY_INSTALL_TARGET_CMDS +=  $(HOST_DIR)/usr/bin/python2 -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
-		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
-	mkdir -p $(TARGET_DIR)/var/www/web2py
-	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py
-endef
+		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)';
+endif
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
-- 
1.9.1
