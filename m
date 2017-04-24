From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 11:46:06 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] pkg-python: ignore user
	site-packages directory
Message-ID: <20170424193336.7C09B827E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57120d614ede3ab51ce0721758e283d9f698b7ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

According to PEP 370 Python will also search for the packages in the
user site-packages directory. This can affect build reproducibility.

The solution is to use PYTHONNOUSERSITE=1 for all Python packages,
i.e. both host and target variants.

Fixes bug #9791.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f5da1951ad1e81cc8641f2c90e96fe36d08ec6f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 38bc45f..52c33f8 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -28,6 +28,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONNOUSERSITE=1 \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -43,7 +44,8 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH)
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
@@ -52,6 +54,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	PYTHONNOUSERSITE=1 \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -70,7 +73,8 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH=$(BR_PATH)
+	PATH=$(BR_PATH) \
+	PYTHONNOUSERSITE=1
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
