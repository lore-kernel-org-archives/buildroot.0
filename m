From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 15:24:55 +0100
Subject: [Buildroot] [PATCH 4/5] package/pkg-python: rely on python wrapper
 in HOST_BIN_CROSS
In-Reply-To: <20200204142456.1537358-1-arnout@mind.be>
References: <20200204142456.1537358-1-arnout@mind.be>
Message-ID: <20200204142456.1537358-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we now have a python wrapper in HOST_BIN_CROSS, we no longer need
to set all these environment variables from the python-package
infrastructure.

Add HOST_BIN_CROSS to the PATH for target packages, and remove all
environment variables which are already set by the wrapper. Use this
python as the python that is used to run setup.py.

PKG_PYTHON_SYSCONFIGDATA_NAME is no longer used so it can be removed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4ded4fde83..93f24856bf 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -20,21 +20,11 @@
 #
 ################################################################################
 
-define PKG_PYTHON_SYSCONFIGDATA_NAME
-$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
-endef
-
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH) \
+	PATH=$(HOST_BIN_CROSS):$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
-	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
-	PYTHONNOUSERSITE=1 \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
 
 PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
@@ -58,14 +48,8 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
-	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
-	PATH=$(BR_PATH) \
+	PATH=$(HOST_BIN_CROSS):$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
-	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
-	PYTHONNOUSERSITE=1 \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
 	--prefix=/usr \
@@ -225,7 +209,7 @@ endif # SETUP_TYPE
 #   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
+$(2)_PYTHON_INTERPRETER = $$(HOST_BIN_CROSS)/python
 else
 ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
 $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
-- 
2.24.1
