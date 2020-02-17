From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 00:50:47 +0100
Subject: [Buildroot] [PATCH] package/pkg-python: fix for per-package
 directories
Message-ID: <20200217235048.107343-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With per-package directory support, Python external modules are
causing a problem: the _sysconfigdata.py module installed by the
Python interpreter contains a number of paths that are relative to the
current package per-package directory, i.e python or python3. For
example:

'BLDSHARED': '/home/thomas/projets/buildroot/output/per-package/python/host/bin/arm-linux-gcc -shared',
'CC': '/home/thomas/projets/buildroot/output/per-package/python/host/bin/arm-linux-gcc',
'CXX': '/home/thomas/projets/buildroot/output/per-package/python/host/bin/arm-linux-g++',
etc.

These paths are problematic, because it means that the wrong compiler
gets used when building external Python modules: instead of using the
compiler from the external Python module per-package host directory,
it uses the one from the 'python' or 'python3' per-package host
directory. Due to this, any native dependency needed by the external
Python module is not found, even though it is properly present in the
current package per-package directory.

Of course, the problem occurs with both target Python modules and host
Python modules.

To fix this, we simply rewrite those paths in _sysconfigdata.py before
building a Python package.

Interestingly, until now, the _sysconfidata.py that was used during
the build was the one from $(TARGET_DIR), which is a bit unusual: it
is more common to use files from $(STAGING_DIR) during the build
process. So this commit changes the PYTHON_PATH and PYTHON3_PATH
variables so that they point to $(STAGING_DIR), which makes the
_sysconfigdata.py fixup in $(STAGING_DIR) effective.

Fixes:

  http://autobuild.buildroot.net/results/a24b0555fd4261b50dc3986635c30717d9cbe764/ (python-psycopg2)
  http://autobuild.buildroot.net/results/080fa893e1b0e7a8c8a31ac1c98eb8871b97264d/ (python-alsaaudio)
  http://autobuild.buildroot.net/results/79bc070f98d6d9d8ef78df12b248cdc7d0e405c3/ (python-lxml)
  and many more Python packages that use native code with a native library

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-python.mk      | 10 ++++++++++
 package/python/python.mk   |  2 +-
 package/python3/python3.mk |  2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4ded4fde83..4bf762e662 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -90,6 +90,14 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define PKG_PYTHON_FIXUP_SYSCONFIGDATA
+	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
+		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
+endef
+endif
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -234,6 +242,8 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
+$(2)_PRE_CONFIGURE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
diff --git a/package/python/python.mk b/package/python/python.mk
index 41a981e3d3..1c393b255d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -240,7 +240,7 @@ HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
+PYTHON_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9432f1c59e..6a12c1f0e8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -253,7 +253,7 @@ HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
+PYTHON3_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
 
 # Support for socket.AF_BLUETOOTH
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),y)
-- 
2.24.1
