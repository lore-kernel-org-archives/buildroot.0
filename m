From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 22:46:19 +0200
Subject: [Buildroot] [git commit] package/python-web2py: move password
	generation
Message-ID: <20170731205239.5FDA181EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91f20433053cc4558256344ed4cebb8d147a3ee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit moves the password generation as a post build step.
This prepares the option to remove the admin panel from
installation.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-web2py/python-web2py.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 250453d..3f9d089 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -29,11 +29,16 @@ PYTHON_WEB2PY_EXCLUSIONS = \
 	setup.py \
 	tox.ini
 
-define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
+define PYTHON_WEB2PY_GENERATE_PASSWORD
 	$(HOST_DIR)/bin/python2 -c 'import os; \
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
