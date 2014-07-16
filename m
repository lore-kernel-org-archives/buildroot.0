From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:27:34 +0200
Subject: [Buildroot] [git commit] pkg-python: add staging installation
	support
Message-ID: <20140716202917.7AA259D25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=643627fc43abf0f2dff248992219ad56e27a21c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-numpy needs to be installed to the staging directory, since it
also installs some header files. Therefore, this commit extends the
Python package infrastructure to support staging installation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt |   27 +++++++++++------------
 package/pkg-python.mk                  |   36 +++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index d7ce387..c4a13e0 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -85,15 +85,10 @@ xref:generic-package-reference[generic package infrastructure] also
 exist in the Python infrastructure: +PYTHON_FOO_VERSION+,
 +PYTHON_FOO_SOURCE+, +PYTHON_FOO_PATCH+, +PYTHON_FOO_SITE+,
 +PYTHON_FOO_SUBDIR+, +PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
-+PYTHON_FOO_LICENSE_FILES+, etc.
++PYTHON_FOO_LICENSE_FILES+, +PYTHON_FOO_INSTALL_STAGING+, etc.
 
 Note that:
 
- * Setting +PYTHON_FOO_INSTALL_STAGING+ to +YES+ has no effect (unless
-   a +PYTHON_FOO_INSTALL_STAGING_CMDS+ variable is defined), since
-   Python modules generally don't need to be installed to the
-   +staging+ directory.
-
  * It is not necessary to add +python+ or +host-python+ in the
    +PYTHON_FOO_DEPENDENCIES+ variable of a package, since these basic
    dependencies are automatically added as needed by the Python
@@ -132,14 +127,18 @@ therefore only use a few of them, or none.
   packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPT+ options are already
   passed automatically by the infrastructure.
 
-* +PYTHON_FOO_INSTALL_OPT+, to specify additional options to pass to
-  the Python +setup.py+ script during the installation step. Note that
-  the infrastructure is automatically passing some options, defined in
-  +PKG_PYTHON_DISTUTILS_INSTALL_OPT+ (for target distutils packages),
-  +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT+ (for host distutils
-  packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+ (for target
-  setuptools packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+
-  (for host setuptools packages).
+* +PYTHON_FOO_INSTALL_TARGET_OPT+, +PYTHON_FOO_INSTALL_STAGING_OPT+,
+  +HOST_PYTHON_FOO_INSTALL_OPT+ to specify additional options to pass
+  to the Python +setup.py+ script during the target installation step,
+  the staging installation step or the host installation,
+  respectively. Note that the infrastructure is automatically passing
+  some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT+
+  or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT+ (for target distutils
+  packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT+ (for host
+  distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT+ or
+  +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT+ (for target setuptools
+  packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+ (for host
+  setuptools packages).
 
 * +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
   interpreter. The usage of this variable is limited to host
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 9e6160f..fedfd69 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -35,9 +35,12 @@ PKG_PYTHON_DISTUTILS_ENV = \
 PKG_PYTHON_DISTUTILS_BUILD_OPT = \
 	--executable=/usr/bin/python
 
-PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
+PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT = \
 	--prefix=$(TARGET_DIR)/usr
 
+PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT = \
+	--prefix=$(STAGING_DIR)/usr
+
 # Host distutils-based packages
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH)
@@ -53,12 +56,18 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT = \
 	--prefix=$(TARGET_DIR)/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
 	--root=/
 
+PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT = \
+	--prefix=$(STAGING_DIR)/usr \
+	--executable=/usr/bin/python \
+	--single-version-externally-managed \
+	--root=/
+
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH)
@@ -103,7 +112,8 @@ ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPT)
-$(2)_BASE_INSTALL_OPT = $$(PKG_PYTHON_DISTUTILS_INSTALL_OPT)
+$(2)_BASE_INSTALL_TARGET_OPT  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT)
+$(2)_BASE_INSTALL_STAGING_OPT = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
@@ -116,7 +126,8 @@ ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
-$(2)_BASE_INSTALL_OPT = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
+$(2)_BASE_INSTALL_TARGET_OPT  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT)
+$(2)_BASE_INSTALL_STAGING_OPT = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
@@ -243,7 +254,22 @@ define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$($(2)_PYTHON_INTERPRETER) setup.py install \
-		$$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
+		$$($$(PKG)_BASE_INSTALL_TARGET_OPT) \
+		$$($$(PKG)_INSTALL_TARGET_OPT))
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$($(2)_PYTHON_INTERPRETER) setup.py install \
+		$$($$(PKG)_BASE_INSTALL_STAGING_OPT) \
+		$$($$(PKG)_INSTALL_STAGING_OPT))
 endef
 endif
 
