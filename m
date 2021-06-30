From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu,  1 Jul 2021 01:47:16 +0200
Subject: [Buildroot] [PATCH 4/4] package/python-pymupdf: bump to version
 1.18.14
In-Reply-To: <20210630234717.21742-1-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
Message-ID: <20210630234717.21742-4-raphael.melotte@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent tarballs from PyPI use setuptools instead of distutils, so
change `PYTHON_PYMUPDF_SETUP_TYPE`.

They also include a license file, so include it and a hash for it.

This version also has a new dependency: freetype2.

PYTHON_PYMUPDF_REMOVE_PATHS is updated to take the new dependency into
account, but also the sed command are changed to delete include lines
instead of turning them into empty strings. Indeed, empty include
strings lead to using multiple `-I` flags which were not followed by
anything. Depending on the number of empty include strings (because
two successive `-I` "cancel" each other out), it would have failed to
compile.

Also, it turns out the patch version of python-pymupdf doesn't have to
match mupdf's version (e.g. python-pymupdf 1.18.14 is compatible with
mupdf 1.18.*) so while at it, remove the word "exactly" from the
comment.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@mind.be>
---
 package/python-pymupdf/Config.in           |  1 +
 package/python-pymupdf/python-pymupdf.hash |  6 ++++--
 package/python-pymupdf/python-pymupdf.mk   | 19 +++++++++++--------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index cd4c8cfcbb..54714eb3bf 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index a5a53997cd..ee7a916519 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
-sha256  1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  PyMuPDF-1.16.0.tar.gz
+md5  70d6c2232e531772bbe9a813044262f9  PyMuPDF-1.18.14.tar.gz
+sha256  efe85cb80f79cc3f3890aa2ab82b962b8a999ca078e33e9bacc5d0be5c4656dc  PyMuPDF-1.18.14.tar.gz
+# Locally computed:
+sha256  282751b8c98ee9e445346eb57a992c9ecbe25ed8dd554df046777313e19b10f9  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 9f8d1744b1..ceeeb0a55b 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -4,21 +4,24 @@
 #
 ################################################################################
 
-# python-pymupdf's version must match exactly mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.16.0
+# python-pymupdf's version must match mupdf's version
+PYTHON_PYMUPDF_VERSION = 1.18.14
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/d2/da/692102b6e6868a57d1dc7f98d07413116a02493b3b49a798dcd6f676d368
-PYTHON_PYMUPDF_SETUP_TYPE = distutils
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/41/f6/dbefe3d6949fa81fb7bcac9141e4345330d272724718ac5a6af78297498b
+PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = GPL-3.0, AGPL-3.0+ (code generated from mupdf)
+PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
-PYTHON_PYMUPDF_DEPENDENCIES = mupdf zlib
+PYTHON_PYMUPDF_DEPENDENCIES = freetype mupdf zlib
 
-PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf"
+PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
 
 # We need to remove the original paths as we provide them in the CFLAGS:
 define PYTHON_PYMUPDF_REMOVE_PATHS
-	sed -i "s:\/usr\/include\/mupdf::g" $(@D)/setup.py
-	sed -i "s:\/usr\/local\/include\/mupdf::g" $(@D)/setup.py
+	sed -i "/\/usr\/include\/mupdf/d" $(@D)/setup.py
+	sed -i "/\/usr\/include\/freetype2/d" $(@D)/setup.py
+	sed -i "/\/usr\/local\/include\/mupdf/d" $(@D)/setup.py
+	sed -i "/mupdf\/thirdparty\/freetype\/include/d" $(@D)/setup.py
 endef
 
 PYTHON_PYMUPDF_POST_PATCH_HOOKS = PYTHON_PYMUPDF_REMOVE_PATHS
-- 
2.31.1
