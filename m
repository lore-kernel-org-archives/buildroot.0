From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:45:41 +0200
Subject: [Buildroot] [git commit] pkg-python: ignore user site-packages
	directory
Message-ID: <20170408134559.150FA826D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5da1951ad1e81cc8641f2c90e96fe36d08ec6f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to PEP 370 Python will also search for the packages in the
user site-packages directory. This can affect build reproducibility.

The solution is to use PYTHONNOUSERSITE=1 for all Python packages,
i.e. both host and target variants.

Fixes bug #9791.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index fb124e1..2418f5d 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -32,6 +32,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONNOUSERSITE=1 \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -48,7 +49,8 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH)
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
@@ -58,6 +60,7 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONNOUSERSITE=1 \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -76,7 +79,8 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH)
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
