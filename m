From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:46:31 +0200
Subject: [Buildroot] [git commit] python-numpy: add optional blas/lapack
	support
Message-ID: <20140716204732.2680F9D25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa6a965c5eca38332d3434071e325c15368b0420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-numpy can be linked with libblas and liblapack, so
automatically do it when clapack is enabled.

[Thomas:
 - Fix issues in the original submission and reformat according to
   Yann E. Morin suggestions.
 - Properly format the "libraries" entry in site.cfg as outlined in
   the example site.cfg file: the list of libraries should be
   space-separated.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/python-numpy.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index e309ef6..3d3a6c5 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -11,6 +11,11 @@ PYTHON_NUMPY_LICENSE = BSD-3c
 PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
 PYTHON_NUMPY_SETUP_TYPE = distutils
 
+ifeq ($(BR2_PACKAGE_CLAPACK),y)
+PYTHON_NUMPY_DEPENDENCIES += clapack
+PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
+endif
+
 PYTHON_NUMPY_BUILD_OPT = --fcompiler=None
 
 define PYTHON_NUMPY_CONFIGURE_CMDS
@@ -18,7 +23,7 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
 	echo "[DEFAULT]" >> $(@D)/site.cfg
 	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
 	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-	echo "libraries =" >> $(@D)/site.cfg
+	echo "libraries =" $(subst $(space),$(comma),$(PYTHON_NUMPY_SITE_CFG_LIBS)) >> $(@D)/site.cfg
 endef
 
 # Some package may include few headers from NumPy, so let's install it
