From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 Jun 2017 10:15:12 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-web2py: cleaning installation
In-Reply-To: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1498637714-18933-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit exclude some unuseful files from standard installation
to save space on embedded systems.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/python-web2py.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9aadb30..074114b 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -10,13 +10,33 @@ PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
 
+PYTHON_WEB2PY_EXCLUSIONS = \
+	welcome.w2p \
+	applications/examples \
+	applications/welcome \
+	deposit \
+	docs \
+	examples \
+	extras \
+	handlers \
+	scripts \
+	ABOUT \
+	anyserver.py \
+	CHANGELOG \
+	Makefile \
+	MANIFEST.in \
+	README.markdown \
+	setup.py \
+	tox.ini
+
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
 	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
 	mkdir -p $(TARGET_DIR)/var/www/web2py
-	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py
+	rsync -a $(@D)/ $(TARGET_DIR)/var/www/web2py/ \
+		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS))
 endef
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
-- 
2.7.4
