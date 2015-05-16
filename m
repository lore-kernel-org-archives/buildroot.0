From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 00:08:35 +0200
Subject: [Buildroot] [git commit] python-pyqt: fix install
Message-ID: <20150517070339.7D761800B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=348be778ff683491e99d00a5c235110fbec05584
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PyQt4 provides two version for some py files: one for python2.x and one for
python3.x. This two versions are installed in TARGET_DIR.
After installing files, python is used to generate all .pyc files, but fails
like :
class ProxyBase(metaclass=ProxyMetaclass):
                             ^
							 SyntaxError: invalid syntax

This is not a package build failure and this fix is only cosmetic.
This patch suppress directory for not targeted python version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt/python-pyqt.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 292398d..fa298c4 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -14,8 +14,10 @@ PYTHON_PYQT_DEPENDENCIES = python-sip host-python-sip qt
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_PYQT_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
+PYTHON_PYQT_RM_PORT_BASE = port_v3
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 PYTHON_PYQT_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
+PYTHON_PYQT_RM_PORT_BASE = port_v2
 endif
 
 ifeq ($(BR2_PACKAGE_QT_EMBEDDED),y)
@@ -105,6 +107,7 @@ endef
 define PYTHON_PYQT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
 	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/__init__.py
+	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/uic/$(PYTHON_PYQT_RM_PORT_BASE)
 	PYTHONPATH="$(PYTHON_PATH)" \
 		$(HOST_DIR)/usr/bin/python -c "import compileall; \
 		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4')"
