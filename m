From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:38 +0200
Subject: [Buildroot] [PATCH v2 06/24] python-numpy: add optional blas/lapack
	support
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-numpy can be linked with libblas and liblapack, so automatically
do it when clapack is enabled.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- split blas/lapack support in its own cset (ThomasP)
---
 package/python-numpy/python-numpy.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index e7c91c4..b0ab031 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -10,6 +10,11 @@ PYTHON_NUMPY_SITE = http://downloads.sourceforge.net/numpy
 PYTHON_NUMPY_LICENSE = BSD-3c
 PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
 PYTHON_NUMPY_SETUP_TYPE = distutils
+PYTHON_NUMPY_DEPENDENCIES = \
+	$(if BR2_PACKAGE_CLAPACK,clapack)
+
+PYTHON_NUMPY_SITE_CFG_LIBS = \
+	$(if $(BR2_PACKAGE_CLAPACK),blas lapack)
 
 PYTHON_NUMPY_BUILD_OPT = --fcompiler=None
 
@@ -19,6 +24,8 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
 	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
 	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
 	echo "libraries =" >> $(@D)/site.cfg
+	$(foreach lib,$(PYTHON_NUMPY_SITE_CFG_LIBS),\
+		echo "    $(lib)" >> $(@D)/site.cfg ;)
 endef
 
 # Some package may include few headers from NumPy, so let's install it in the
-- 
1.9.2
