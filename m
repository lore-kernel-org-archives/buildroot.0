From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 22:45:49 +0100
Subject: [Buildroot] [git commit branch/next] pkg-python: no longer use
	distutilscross for setuptools
Message-ID: <20140218220743.3345E9CA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7bf337ec56c4753d58de3e4c16f3f74e17d5001
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Thanks to the bump of Python 2.x, distutilscross is no longer needed
to achieve cross-compilation for setuptools packages. The host Python
2.x interpreter can be tricked into using the target compiler thanks
to pointing it to a different sysconfigdata module, which is achieved
using PYTHON_PATH.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk |   21 ++++++++-------------
 1 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index a862895..11ad75d 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -114,7 +114,7 @@ endif
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_TGT   = build -x
+$(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
 $(2)_BASE_INSTALL_OPT = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
 else
@@ -133,13 +133,12 @@ endif
 # front of the dependencies.
 #
 # However it must be repeated from inner-generic-package, as we need
-# to exclude the python, host-python, host-python-setuptools and
-# host-distutilscross packages, which are added below in the list of
-# dependencies depending on the package characteristics, and shouldn't
-# be derived automatically from the dependencies of the corresponding
-# target package. For example, target packages need
-# host-python-distutilscross, but not host packages.
-$(2)_DEPENDENCIES ?= $(filter-out host-python host-python-setuptools host-python-distutilscross host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+# to exclude the python, host-python and host-python-setuptools
+# packages, which are added below in the list of dependencies
+# depending on the package characteristics, and shouldn't be derived
+# automatically from the dependencies of the corresponding target
+# package.
+$(2)_DEPENDENCIES ?= $(filter-out host-python host-python-setuptools host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
@@ -152,17 +151,13 @@ $(2)_DEPENDENCIES += host-python
 endif
 
 # Setuptools based packages will need host-python-setuptools (both
-# host and target) and host-python-distutilscross (only target
-# packages). We need to have a special exclusion for the
+# host and target). We need to have a special exclusion for the
 # host-setuptools package itself: it is setuptools-based, but
 # shouldn't depend on host-setuptools (because it would otherwise
 # depend on itself!).
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifneq ($(2),HOST_PYTHON_SETUPTOOLS)
 $(2)_DEPENDENCIES += host-python-setuptools
-ifeq ($(4),target)
-$(2)_DEPENDENCIES += host-python-distutilscross
-endif
 endif
 endif
 
