From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:38:49 +0100
Subject: [Buildroot] [git commit] python-pyzmq: convert to the Python
	package infrastructure
Message-ID: <20131215130826.3871E9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3485afbce67de30ea486357971e2afae9555ee28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyzmq/python-pyzmq.mk |   26 +++-----------------------
 1 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index e9702fc..b3a8f9d 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -10,7 +10,8 @@ PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq/
 PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache License Version 2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-PYTHON_PYZMQ_DEPENDENCIES = zeromq python host-python
+PYTHON_PYZMQ_DEPENDENCIES = zeromq
+PYTHON_PYZMQ_SETUP_TYPE = distutils
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
 define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
@@ -20,25 +21,4 @@ endef
 
 PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
 
-PYTHON_PYZMQ_PARAMS = CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDSHARED="$(TARGET_CC) -shared" \
-		CROSS_COMPILING=yes \
-		_python_sysroot=$(STAGING_DIR) \
-		_python_srcdir=$(PYTHON_DIR) \
-		_python_prefix=/usr \
-		_python_exec_prefix=/usr
-
-define PYTHON_PYZMQ_CONFIGURE_CMDS
-	(cd $(@D); $(PYTHON_PYZMQ_PARAMS) \
-		$(HOST_DIR)/usr/bin/python setup.py configure \
-		--zmq=$(STAGING_DIR)/usr)
-endef
-
-define PYTHON_PYZMQ_INSTALL_TARGET_CMDS
-	(cd $(@D); $(PYTHON_PYZMQ_PARAMS) \
-		$(HOST_DIR)/usr/bin/python setup.py install \
-		--prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
