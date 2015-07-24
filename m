From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 24 Jul 2015 22:05:15 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-web2py: cleaning for space
	savings
In-Reply-To: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1437768317-9283-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch cleans web2py folder from welcome and examples application,
furthermore, it cleans the admin interface if unneeded

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/Config.in        | 10 ++++++++++
 package/python-web2py/python-web2py.mk | 15 +++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index b10d3a4..d5a0164 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_PYTHON_WEB2PY
 
 if BR2_PACKAGE_PYTHON_WEB2PY
 
+if ! BR2_PACKAGE_PYTHON_WEB2PY_CLEAN_ADMIN
+
 config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	string "admin panel password"
 	default web2py
@@ -21,3 +23,11 @@ config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	  Set the admin panel password.
 
 endif
+
+config BR2_PACKAGE_PYTHON_WEB2PY_CLEAN_ADMIN
+	bool "clean admin panel application"
+	help
+	  This option removes admin panel application form web2py,
+	  useful for deploy on embedded systems.
+
+endif
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 641d7ef..8eab6bd 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -11,12 +11,19 @@ PYTHON_WEB2PY_LICENSE_FILES = LICENSE
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
+	if test -n "$(BR2_PACKAGE_PYTHON_WEB2PY_CLEAN_ADMIN)" ; then\
+		rm -rf $(TARGET_DIR)/var/www/web2py/applications/admin;\
+	else\
+		$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+		os.chdir("$(@D)"); \
+		from gluon.main import save_password; \
+		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)';\
+	fi
 endef
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
-- 
1.9.1
