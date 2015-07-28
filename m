From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 28 Jul 2015 10:04:43 +0200
Subject: [Buildroot] [PATCH v4] package/python-web2py: cleaning for space
	saving
Message-ID: <1438070683-2109-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes from web2py folder welcome, examples application
and a bunch of other files uneeded in production,
furthermore, it removes the admin interface if unneeded.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes:

v3->v4:
 * Fixed erroneously removed installation of system v init script

v2->v3:
 * Changed to a positive logic for PYTHON_WEB2PY_INSTALL_ADMIN (suggested by Thomas)
 * Changed to a makefile based conditional logic (suggested by Thomas)
 * Extended cleaning of uneeded files.
 
v1->v2:
 * Reworked otion sequence as suggested by Thomas.
 * Changed to a makefile based conditional as suggested by Thomas.

 package/python-web2py/Config.in        | 11 +++++++++++
 package/python-web2py/python-web2py.mk | 36 ++++++++++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index b10d3a4..3b55153 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -14,6 +14,15 @@ config BR2_PACKAGE_PYTHON_WEB2PY
 
 if BR2_PACKAGE_PYTHON_WEB2PY
 
+config BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN
+	bool "install admin panel application"
+	default y
+	help
+	  This option install web2py admin panel application.
+	  It can be removed to save space on embedded systems.
+
+if BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN
+
 config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	string "admin panel password"
 	default web2py
@@ -21,3 +30,5 @@ config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	  Set the admin panel password.
 
 endif
+
+endif
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 313114a..be95517 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -11,13 +11,41 @@ PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
 
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
-	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
-		os.chdir("$(@D)"); \
-		from gluon.main import save_password; \
-		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
 	mkdir -p $(TARGET_DIR)/var/www/web2py
 	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py
+	rm -rf $(TARGET_DIR)/var/www/web2py/welcome.w2p
+	rm -rf $(TARGET_DIR)/var/www/web2py/applications/examples
+	rm -rf $(TARGET_DIR)/var/www/web2py/applications/welcome
+	rm -rf $(TARGET_DIR)/var/www/web2py/deposit
+	rm -rf $(TARGET_DIR)/var/www/web2py/docs
+	rm -rf $(TARGET_DIR)/var/www/web2py/examples
+	rm -rf $(TARGET_DIR)/var/www/web2py/extras
+	rm -rf $(TARGET_DIR)/var/www/web2py/handlers
+	rm -rf $(TARGET_DIR)/var/www/web2py/scripts
+	rm -rf $(TARGET_DIR)/var/www/web2py/ABOUT
+	rm -rf $(TARGET_DIR)/var/www/web2py/anyserver.py
+	rm -rf $(TARGET_DIR)/var/www/web2py/CHANGELOG
+	rm -rf $(TARGET_DIR)/var/www/web2py/Makefile
+	rm -rf $(TARGET_DIR)/var/www/web2py/MANIFEST.in
+	rm -rf $(TARGET_DIR)/var/www/web2py/README.markdown
+	rm -rf $(TARGET_DIR)/var/www/web2py/setup.py
+	rm -rf $(TARGET_DIR)/var/www/web2py/tox.ini
+endef
+
+ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN),y)
+define PYTHON_WEB2PY_GENERATE_PASSWORD
+	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+	os.chdir("$(@D)"); \
+	from gluon.main import save_password; \
+	save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)';
+endef
+PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
+else
+define PYTHON_WEB2PY_REMOVE_ADMIN
+	rm -rf $(TARGET_DIR)/var/www/web2py/applications/admin
 endef
+PYTHON_WEB2PY_POST_INSTALL_TARGET_HOOKS += PYTHON_WEB2PY_REMOVE_ADMIN
+endif
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
-- 
1.9.1
