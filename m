From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 19:13:17 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/pkg-python: use
 _CONFIGURE_OPTS in the build environment
Message-ID: <20191222204327.52A8F8D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13a812e53695ef0923119cf80461820225233bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

When building host or target python packages, we need to ensure that
the build environment utilize {HOST|TARGET}_CONFIGURE_OPTS. This
ensures that the correct linker and compiler environment variables are
set to compile utilizing either the host or target folders.

It was discovered that when compiling a host-python package, it was
using linking against the build machines library folder instead of the
host folder because LDFLAGS was not properly set and was improperly
detecting whether or not a shared or static library was present in the
host folder.

CC: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1745fcde740057951dcc5429f3bfabd103b764a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index be1ce071df..4ded4fde83 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -27,9 +27,7 @@ endef
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
-	CC="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_CONFIGURE_OPTS) \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
@@ -52,7 +50,8 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1
+	PYTHONNOUSERSITE=1 \
+	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)
@@ -61,6 +60,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
+	$(TARGET_CONFIGURE_OPTS) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
 	_python_sysroot=$(STAGING_DIR) \
@@ -82,7 +82,8 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH) \
-	PYTHONNOUSERSITE=1
+	PYTHONNOUSERSITE=1 \
+	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR) \
