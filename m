From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:24:43 +0100
Subject: [Buildroot] [git commit] package/pkg-python: use proper --prefix
 and --root values
Message-ID: <20181202071559.28EFE8A3F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e94280e5a537b8b6bebc6df3e16c7922b8c63950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some python software refers to setuptool/distutils options
to install files in python root directory (like data_files option).
To use this type of option, python root should point to the real python
root in buildroot folder and not to the guest os /.
Prefix path is always built starting from the python root, so it should
be simply /usr.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-python.mk | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index f57e486dad..1ee465ba5d 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -42,10 +42,12 @@ PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
 PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
-	--prefix=$(TARGET_DIR)/usr
+	--prefix=/usr \
+	--root=$(TARGET_DIR)
 
 PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
-	--prefix=$(STAGING_DIR)/usr
+	--prefix=/usr \
+	--root=$(STAGING_DIR)
 
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
@@ -66,16 +68,16 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	_python_exec_prefix=/usr
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
-	--prefix=$(TARGET_DIR)/usr \
+	--prefix=/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
-	--root=/
+	--root=$(TARGET_DIR)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
-	--root=/
+	--root=$(STAGING_DIR)
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
