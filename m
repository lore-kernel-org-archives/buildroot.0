From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 16:38:25 +0200
Subject: [Buildroot] [git commit] pkg-python: support host-python dependency
	different from the python in the target
Message-ID: <20140405153937.B69FB9BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05754fa01d1fef0e5c5120d954847573fdf9cbb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages need a host-python interpreter with a version different
from the one installed in the target to run some build scripts (eg.
scons requires python2 to run, to build any kind of packages even if
the python interpreter selected for the target is python3).

In such cases, we need to add the right host-python dependency to the
package using the host-python-package infrastructure, and we also want
to invoke the right host python interpreter during the build steps.

This patch adds a *_NEEDS_HOST_PYTHON variable that can be set either
to 'python2' or 'python3'. This variable can be set by any package
using the host-python-package infrastructure to force the python
interpreter for the build. This variable also takes care of setting
the right host-python dependency.

This *_NEEDS_HOST_PYTHON variable only affects packages using the
host-python-package infrastructure.

If some configure/build/install commands are overloaded in the *.mk
file, the right python interpreter should be explicitly called.

If the package defines some tool variable (eg.: SCONS), the variable
should explicitly call the right python interpreter.

[Thomas:
 - fixes to the commit log and documentation suggested by Yann
 - rename the variable from <pkg>_FORCE_HOST_PYTHON to
   <pkg>_NEEDS_HOST_PYTHON, as suggested by Yann
 - do not allow any other value than python2 and python3 in
   <pkg>_NEEDS_HOST_PYTHON, as suggested by Yann.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt |    7 ++++
 package/pkg-python.mk                  |   52 +++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index b8d5331..8f78f89 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -144,6 +144,13 @@ therefore only use a few of them, or none.
   setuptools packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+
   (for host setuptools packages).
 
+* +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
+  interpreter. The usage of this variable is limited to host
+  packages. The two supported value are +python2+ and +python3+.  It
+  will ensures the right host python package is available and will
+  invoke it for the build. If some build steps are overloaded, the
+  right python interpreter must be explicitly called in the commands.
+
 With the Python infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
 for most Python-based packages. However, when required, it is still
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 512ef66..c78915e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -143,12 +143,32 @@ $(2)_DEPENDENCIES ?= $(filter-out host-python host-python3 host-python-setuptool
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
 # compilation). However, host packages only need the python
-# interpreter on the host.
+# interpreter on the host, whose version may be enforced by setting
+# the *_NEEDS_HOST_PYTHON variable.
+#
+# So:
+# - for target packages, we always depend on the default python interpreter
+#   (the one selected by the config);
+# - for host packages:
+#   - if *_NEEDS_HOST_PYTHON is not set, then we depend on use the default
+#     interperter;
+#   - otherwise, we depend on the one requested by *_NEEDS_HOST_PYTHON.
+#
 ifeq ($(4),target)
 $(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
 else
+ifeq ($($(2)_NEEDS_HOST_PYTHON),)
 $(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+else
+ifeq ($($(2)_NEEDS_HOST_PYTHON),python2)
+$(2)_DEPENDENCIES += host-python
+else ifeq ($($(2)_NEEDS_HOST_PYTHON),python3)
+$(2)_DEPENDENCIES += host-python3
+else
+$$(error Incorrect value '$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
 endif
+endif # ($($(2)_NEEDS_HOST_PYTHON),)
+endif # ($(4),target)
 
 # Setuptools based packages will need host-python-setuptools (both
 # host and target). We need to have a special exclusion for the
@@ -161,6 +181,30 @@ $(2)_DEPENDENCIES += host-python-setuptools
 endif
 endif
 
+# Python interpreter to use for building the package.
+#
+# We may want to specify the python interpreter toi be used for building a
+# package, especially for host-packages (target packages must be built using
+# the same version of the interpreter as the one installed on the target).
+#
+# So:
+# - for target packages, we always use the default python interpreter (which
+#   is the same version as the one built and installed on the target);
+# - for host packages:
+#   - if *_NEEDS_HOST_PYTHON is not set, then we use use the default
+#     interperter;
+#   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
+#
+ifeq ($(4),target)
+$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
+else
+ifeq ($($(2)_NEEDS_HOST_PYTHON),)
+$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
+else
+$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/$($(2)_NEEDS_HOST_PYTHON)
+endif
+endif
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -169,7 +213,7 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py \
+		$$($(2)_PYTHON_INTERPRETER) setup.py \
 		$$($$(PKG)_BASE_BUILD_TGT) \
 		$$($$(PKG)_BASE_BUILD_OPT) $$($$(PKG)_BUILD_OPT))
 endef
@@ -183,7 +227,7 @@ ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py install \
+		$$($(2)_PYTHON_INTERPRETER) setup.py install \
 		$$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
 endef
 endif
@@ -196,7 +240,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py install \
+		$$($(2)_PYTHON_INTERPRETER) setup.py install \
 		$$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
 endef
 endif
