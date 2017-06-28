From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 Jun 2017 10:15:14 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-web2py: remove admin panel
In-Reply-To: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1498637714-18933-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commmit adds an option to remove admin panel to save
speace if not needed.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/Config.in        | 11 +++++++++++
 package/python-web2py/python-web2py.mk |  6 +++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

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
index e0117fc..3dd4bee 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -36,7 +36,11 @@ define PYTHON_WEB2PY_GENERATE_PASSWORD
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
 endef
 
-PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
+ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN),y)
+	PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
+else
+	PYTHON_WEB2PY_EXCLUSIONS += applications/admin
+endif
 
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/www/web2py
-- 
2.7.4
