From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sat, 25 Apr 2015 12:41:17 +0200
Subject: [Buildroot] [PATCH v2 2/3] python-pyqt: fix install
In-Reply-To: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
References: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1429958478-29114-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

PyQt4 provides two version for some py files: one for python2.x and one for
python3.x. This two versions are installed in TARGET_DIR.
After installing files, python is used to generate all .pyc files, but fails
like :
class ProxyBase(metaclass=ProxyMetaclass):
                             ^
							 SyntaxError: invalid syntax

This patch supdress directory for not targeted python version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-pyqt/python-pyqt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index c151dfd..d6587a8 100644
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
@@ -104,6 +106,7 @@ endef
 define PYTHON_PYQT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
 	touch $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/__init__.py
+	$(RM) -rf $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4/uic/$(PYTHON_PYQT_RM_PORT_BASE)
 	PYTHONPATH="$(PYTHON_PATH)" \
 		$(HOST_DIR)/usr/bin/python -c "import compileall; \
 		compileall.compile_dir('$(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages/PyQt4')"
-- 
2.0.5
