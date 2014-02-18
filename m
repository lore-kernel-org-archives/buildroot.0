From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 23:30:36 +0100
Subject: [Buildroot] [git commit branch/next] package: add python3 support
	in the package infrastructure
Message-ID: <20140219080355.94BED99B3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24cbcf13f90430e3474dab9d0983e36f7e64c307
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit improves the Python package infrastructure to allow Python
packages to be built with Python 3. The changes are fairly simple:

 * Use either PYTHON_PATH or PYTHON3_PATH as the PYTHONPATH depending
   on which Python is used.

 * Depend on host-python or host-python3 and python or python3
   depending on which Python is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 11ad75d..512ef66 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -27,7 +27,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
-	PYTHONPATH="$(PYTHON_PATH)" \
+	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -48,7 +48,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH="$(TARGET_PATH)" \
-	PYTHONPATH="$(PYTHON_PATH)" \
+	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -138,16 +138,16 @@ endif
 # depending on the package characteristics, and shouldn't be derived
 # automatically from the dependencies of the corresponding target
 # package.
-$(2)_DEPENDENCIES ?= $(filter-out host-python host-python-setuptools host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $(filter-out host-python host-python3 host-python-setuptools host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
 # compilation). However, host packages only need the python
 # interpreter on the host.
 ifeq ($(4),target)
-$(2)_DEPENDENCIES += host-python python
+$(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
 else
-$(2)_DEPENDENCIES += host-python
+$(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 endif
 
 # Setuptools based packages will need host-python-setuptools (both
