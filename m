From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 Jun 2017 10:15:13 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-web2py: move password
	generation
In-Reply-To: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1498637714-18933-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit moves the password generation as a post build step.
This prepares the option to remove the admin panel from
installation.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/python-web2py.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 074114b..e0117fc 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -29,11 +29,16 @@ PYTHON_WEB2PY_EXCLUSIONS = \
 	setup.py \
 	tox.ini
 
-define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
+define PYTHON_WEB2PY_GENERATE_PASSWORD
 	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
+endef
+
+PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
+
+define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/www/web2py
 	rsync -a $(@D)/ $(TARGET_DIR)/var/www/web2py/ \
 		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS))
-- 
2.7.4
