From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 22:45:12 +0200
Subject: [Buildroot] [git commit] package/python-web2py: reduce installation
	size
Message-ID: <20170731205239.4FAC581F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5316495c8e2a791ec090897dd415d44f5082af0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit exclude some useless files from standard installation to
save space on embedded systems.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-web2py/python-web2py.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 878a588..250453d 100644
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
 	$(HOST_DIR)/bin/python2 -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
 	mkdir -p $(TARGET_DIR)/var/www/web2py
-	cp -dpfr $(@D)/* $(TARGET_DIR)/var/www/web2py
+	rsync -a $(@D)/ $(TARGET_DIR)/var/www/web2py/ \
+		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS))
 endef
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
