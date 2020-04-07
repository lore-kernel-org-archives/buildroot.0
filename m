From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue,  7 Apr 2020 16:45:12 +0530
Subject: [Buildroot] [PATCH v8 2/5] package/python-numpy: fixup npymath.ini
 for numpy extensions
In-Reply-To: <20200407111515.21131-1-jagan@amarulasolutions.com>
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
Message-ID: <20200407111515.21131-3-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@geanix.com>

Inorder to build the numpy distutils extension packages like
python-scipy, python-numba, it require an explicit pkg-config
path fixup for npymath.ini.

This pkg-config path fixup would update the prefix path of
npymath.ini with actual target staging area where numpy core
was built, so-that numpy distutils extension packages would
explicitly link this config path for their package environment.

Without this extension packages cannot find -lnpymath since
it uses host libraries (like libnpymath.a).

So, attach the post install staging hook with pkg-config
path fixup for npymath.ini.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v8:
- none
Changes for v7:
- rephrase commit and comments of fixup npymath.ini

 package/python-numpy/python-numpy.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 3f0df7a640..4d2e852b43 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -32,6 +32,21 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
 	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
 endef
 
+# Fixup the npymath.ini prefix path with actual target staging area where
+# numpy core was built. Without this, target builds using numpy distutils
+# extensions like python-scipy, python-numba cannot find -lnpymath since
+# it uses host libraries (like libnpymath.a).
+# So, the numpy distutils extension packages would explicitly link this
+# config path for their package environment.
+PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
+PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
+define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
+	sed -e '/^pkgdir=/d' \
+	    -e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
+	    -i $(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
+endef
+PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
+
 # Some package may include few headers from NumPy, so let's install it
 # in the staging area.
 PYTHON_NUMPY_INSTALL_STAGING = YES
-- 
2.17.1
