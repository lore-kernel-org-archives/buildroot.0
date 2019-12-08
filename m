From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:24 -0800
Subject: [Buildroot] [PATCH 02/11] package/python-networkx: bump version to
 2.4, package/setools: bump version to 4.2.2
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Setools is currently the only package that depends on python-networkx, and the
updated version requires python-networkx >= 2.0.

This dependency chain means that both package versions must change at the same
time in order for the new version of setools to work correctly.

Other changes:
  - Update patches to work with 4.2.2.

  - Set Python3 as a dependency as Python2 is no longer supported.

  - Change the source URL to the new official upstream URL.

  - Remove the check for Python2 or 3 in the setools.mk file as Python2 is no
    longer supported.

  - Add a dependency on host-python-cython. From the changelog:
    "Replaced the Python/SWIG/static-linked-libsepol policyrep module with a
    Cython implementation. This will have performance and memory-usage
    improvements and breaks the static linking to libsepol."

  - Due to the above change: Remove SETOOLS_FIX_SETUP and
    HOST_SETOOLS_FIX_SETUP as setools no longer statically links to libsepol.a

  - Fix the path for the removal of the setoolsgui directory if
    BR2_PACKAGE_PYTHON_PYQT5 is no longer selected.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-networkx/python-networkx.hash  |  8 ++-
 package/python-networkx/python-networkx.mk    |  5 +-
 .../0001-remove-werror-flag-from-setup.patch  | 18 ++---
 ...e-setools.InfoFlowAnalysis-and-setoo.patch | 71 ++++++++++---------
 ...py-drop-path-prefix-from-man-install.patch | 42 -----------
 package/setools/setools.hash                  |  6 +-
 package/setools/setools.mk                    | 34 ++-------
 7 files changed, 59 insertions(+), 125 deletions(-)
 delete mode 100644 package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 92383e75c4..a3837fb434 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,4 +1,6 @@
-# md5 from https://pypi.python.org/pypi/networks/json, sha256 locally computed
-md5 6ef584a879e9163013e9a762e1cf7cd1 networkx-1.11.tar.gz
-sha256 0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8 networkx-1.11.tar.gz
+# From https://pypi.python.org/pypi/networks/json
+md5 63e3fdc9d3a46bcabc776acc5ea5fe48 networkx-2.4.tar.gz
+sha256 f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64 networkx-2.4.tar.gz
+
+# Locally calculated
 sha256 f4c13bf0e83bef45116ebda6c360066df6fd99610efaea9790b998c5441b0c0d LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 4dfdbd5a1c..c785ccdde4 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# The current version of setools (v4.1.1) does not work with python-networkx past v1.11
-PYTHON_NETWORKX_VERSION = 1.11
+PYTHON_NETWORKX_VERSION = 2.4
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/bf/63/7b579dd3b1c49ce6b7fd8f6f864038f255201410905dd183cf7f4a3845cf
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
diff --git a/package/setools/0001-remove-werror-flag-from-setup.patch b/package/setools/0001-remove-werror-flag-from-setup.patch
index 4f6d2efb96..95072fa235 100644
--- a/package/setools/0001-remove-werror-flag-from-setup.patch
+++ b/package/setools/0001-remove-werror-flag-from-setup.patch
@@ -1,6 +1,6 @@
-From b2fe84bfd00117d4897f1f2e8f83d3410eb188b8 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Thu, 12 Oct 2017 22:04:58 -0400
+From d2fbe16e6bb5b1b7ff53d3e33ab0d7ba95095a3b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 7 Dec 2019 17:53:44 -0800
 Subject: [PATCH] remove werror flag from setup
 
 Compilers older than gcc6 will generate uninitialized variable warnings which
@@ -12,18 +12,18 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 2ca44c9..9319bf6 100644
+index ac8a876..759a136 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -146,7 +146,7 @@ ext_py_mods = [Extension('setools.policyrep._qpol',
-                           'libqpol/policy_scan.c',
-                           'libqpol/xen_query.c'],
-                          include_dirs=include_dirs,
+@@ -105,7 +105,7 @@ ext_py_mods = [Extension('setools.policyrep', ['setools/policyrep.pyx'],
+                          libraries=['selinux', 'sepol'],
+                          library_dirs=lib_dirs,
+                          define_macros=macros,
 -                         extra_compile_args=['-Werror', '-Wextra',
 +                         extra_compile_args=['-Wextra',
                                               '-Waggregate-return',
                                               '-Wfloat-equal',
                                               '-Wformat', '-Wformat=2',
 -- 
-2.13.6
+2.23.0
 
diff --git a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index 508087ff2c..e6a476c6ee 100644
--- a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -12,30 +12,32 @@ Therefore it's better to use setools.infoflow.InfoFlowAnalysis and
 setools.dta.DomainTransitionAnalysis and let the package containing
 sedta and seinfoflow to require python3-networkx
 
+[Updated for 4.2.2]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- sedta                       | 3 ++-
- seinfoflow                  | 3 ++-
+ sedta                       | 4 ++--
+ seinfoflow                  | 4 ++--
  setools/__init__.py         | 4 ++--
  setoolsgui/apol/dta.py      | 2 +-
  setoolsgui/apol/infoflow.py | 2 +-
- tests/dta.py                | 3 ++-
- tests/infoflow.py           | 3 ++-
- 7 files changed, 12 insertions(+), 8 deletions(-)
+ tests/dta.py                | 2 +-
+ tests/infoflow.py           | 2 +-
+ 7 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/sedta b/sedta
-index 1c76ebb..255ad49 100755
+index 60861ca..41e38a2 100755
 --- a/sedta
 +++ b/sedta
-@@ -23,6 +23,7 @@ import argparse
+@@ -22,7 +22,7 @@ import argparse
  import logging
+ import signal
  
- import setools
+-import setools
 +import setools.dta
  
  
  def print_transition(trans):
-@@ -111,7 +112,7 @@ else:
+@@ -114,7 +114,7 @@ else:
  
  try:
      p = setools.SELinuxPolicy(args.policy)
@@ -45,18 +47,19 @@ index 1c76ebb..255ad49 100755
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/seinfoflow b/seinfoflow
-index b287921..d53bdef 100755
+index 97b14ba..e7f965d 100755
 --- a/seinfoflow
 +++ b/seinfoflow
-@@ -19,6 +19,7 @@
+@@ -17,7 +17,7 @@
+ # along with SETools.  If not, see <http://www.gnu.org/licenses/>.
+ #
  
- from __future__ import print_function
- import setools
+-import setools
 +import setools.infoflow
  import argparse
  import sys
  import logging
-@@ -79,7 +80,7 @@ else:
+@@ -81,7 +81,7 @@ else:
  try:
      p = setools.SELinuxPolicy(args.policy)
      m = setools.PermissionMap(args.map)
@@ -66,10 +69,10 @@ index b287921..d53bdef 100755
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/setools/__init__.py b/setools/__init__.py
-index a84c846..a53c5a7 100644
+index 7b70f5e..020be31 100644
 --- a/setools/__init__.py
 +++ b/setools/__init__.py
-@@ -74,11 +74,11 @@ from .pcideviceconquery import PcideviceconQuery
+@@ -73,11 +73,11 @@ from .pcideviceconquery import PcideviceconQuery
  from .devicetreeconquery import DevicetreeconQuery
  
  # Information Flow Analysis
@@ -84,59 +87,57 @@ index a84c846..a53c5a7 100644
  # Policy difference
  from .diff import PolicyDifference
 diff --git a/setoolsgui/apol/dta.py b/setoolsgui/apol/dta.py
-index 0aaf13f..5b1ea20 100644
+index 4608b9d..2cde44c 100644
 --- a/setoolsgui/apol/dta.py
 +++ b/setoolsgui/apol/dta.py
 @@ -23,7 +23,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
  from PyQt5.QtGui import QPalette, QTextCursor
  from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
-                             QTreeWidgetItem
+     QTreeWidgetItem
 -from setools import DomainTransitionAnalysis
 +from setools.dta import DomainTransitionAnalysis
  
  from ..logtosignal import LogHandlerToSignal
  from .analysistab import AnalysisTab
 diff --git a/setoolsgui/apol/infoflow.py b/setoolsgui/apol/infoflow.py
-index 1ae16de..fdf8f7b 100644
+index 7bca299..7fee277 100644
 --- a/setoolsgui/apol/infoflow.py
 +++ b/setoolsgui/apol/infoflow.py
-@@ -25,7 +25,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
+@@ -26,7 +26,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
  from PyQt5.QtGui import QPalette, QTextCursor
  from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
-                             QTreeWidgetItem
+     QTreeWidgetItem
 -from setools import InfoFlowAnalysis
 +from setools.infoflow import InfoFlowAnalysis
  from setools.exception import UnmappedClass, UnmappedPermission
  
  from ..logtosignal import LogHandlerToSignal
 diff --git a/tests/dta.py b/tests/dta.py
-index 32b9271..2bdd052 100644
+index a0cc938..177e6fb 100644
 --- a/tests/dta.py
 +++ b/tests/dta.py
-@@ -17,7 +17,8 @@
- #
+@@ -18,7 +18,7 @@
+ import os
  import unittest
  
--from setools import SELinuxPolicy, DomainTransitionAnalysis
-+from setools import SELinuxPolicy
+-from setools import DomainTransitionAnalysis
 +from setools.dta import DomainTransitionAnalysis
  from setools import TERuletype as TERT
- from setools.policyrep.exception import InvalidType
- from setools.policyrep.typeattr import Type
+ from setools.exception import InvalidType
+ from setools.policyrep import Type
 diff --git a/tests/infoflow.py b/tests/infoflow.py
-index 7751dda..a21c683 100644
+index aa0e44a..fca2848 100644
 --- a/tests/infoflow.py
 +++ b/tests/infoflow.py
-@@ -17,7 +17,8 @@
- #
+@@ -18,7 +18,7 @@
+ import os
  import unittest
  
--from setools import SELinuxPolicy, InfoFlowAnalysis
-+from setools import SELinuxPolicy
+-from setools import InfoFlowAnalysis
 +from setools.infoflow import InfoFlowAnalysis
  from setools import TERuletype as TERT
+ from setools.exception import InvalidType
  from setools.permmap import PermissionMap
- from setools.policyrep.exception import InvalidType
 -- 
-2.9.3
+2.23.0
 
diff --git a/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch b/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
deleted file mode 100644
index 63344506b2..0000000000
--- a/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bc36cba1393120e65bfe4d0f642fd8d38010c0f7 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Wed, 28 Nov 2018 20:49:00 -0600
-Subject: [PATCH] setup.py: drop path prefix from man install
-
-If the directory is a relative path, it is interpreted relative to the
-installation prefix (Python's sys.prefix for pure-Python packages,
-sys.exec_prefix for packages that contain extension modules).
-So the sys.prefix should not be joined because the correct one will be
-added regardless. The reason why a relative path is going to work is
-because the installation path is built internally joining python root
-with python prefix, thus forming the correct path $(TARGET_DIR)/usr.
-(https://docs.python.org/3/distutils/setupscript.html#installing-additional-files)
-
-For this man file install scenario, joining the sys.prefix makes the
-path absolute (this was previously working by accident).
-
-Upstream: https://github.com/SELinuxProject/setools/pull/13/commits/bc36cba1393120e65bfe4d0f642fd8d38010c0f7
-
-Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Cc: Arnout Vandecappelle <arnout@mind.be>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 3767fbc..80e0400 100644
---- a/setup.py
-+++ b/setup.py
-@@ -136,7 +136,7 @@ setup(name='setools',
-       cmdclass={'build_qhc': QtHelpCommand, 'clean': CleanCommand},
-       packages=['setools', 'setools.diff', 'setoolsgui', 'setoolsgui.apol'],
-       scripts=['apol', 'sediff', 'seinfo', 'seinfoflow', 'sesearch', 'sedta'],
--      data_files=[(join(sys.prefix, 'share/man/man1'), glob.glob("man/*.1"))],
-+      data_files=[('share/man/man1', glob.glob("man/*.1"))],
-       package_data={'': ['*.ui', '*.qhc', '*.qch'], 'setools': ['perm_map']},
-       ext_modules=cythonize(ext_py_mods, include_path=['setools/policyrep'],
-                             annotate=cython_annotate,
--- 
-1.9.1
-
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index 8729297064..de633ca643 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,7 +1,5 @@
-# From https://github.com/TresysTechnology/setools3/wiki/Download
-md5	d68d0d4e4da0f01da0f208782ff04b91	setools-4.1.1.tar.bz2
-# Locally computed
-sha256	46a927ea2b163cbe1d35cc35da43e45853e13720c7e02d4cf75a498783c19610 setools-4.1.1.tar.gz
+# Locally calculated
+sha256	826ab1974579357c8ec7c01aa0a2997b46beb85b8ad915898273c9619cd27a80 setools-4.2.2.tar.gz
 sha256  2f7547e10f76a382c24c053595f38a5cc6dda9347f508f254ca490e0046a9624 COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 63ca3651e8..0f53f49972 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,38 +4,14 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.1.1
-SETOOLS_SITE = $(call github,TresysTechnology,setools,$(SETOOLS_VERSION))
-SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-swig
+SETOOLS_VERSION = 4.2.2
+SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
+SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-swig host-python-cython
 SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_SETUP_TYPE = setuptools
-HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-python-networkx
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
-else
-SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
-SETOOLS_DEPENDENCIES += python-enum34
-HOST_SETOOLS_DEPENDENCIES += host-python-enum34
-endif
-
-define SETOOLS_FIX_SETUP
-	# By default, setup.py will look for libsepol.a in the host machines
-	# /usr/lib directory. This needs to be changed to the staging directory.
-	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/usr/lib']@g" \
-		$(@D)/setup.py
-endef
-SETOOLS_POST_PATCH_HOOKS += SETOOLS_FIX_SETUP
-
-define HOST_SETOOLS_FIX_SETUP
-	# By default, setup.py will look for libsepol.a in the host machines
-	# /usr/lib directory. This needs to be changed to the host directory.
-	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(HOST_DIR)/lib']@g" \
-		$(@D)/setup.py
-endef
-HOST_SETOOLS_POST_PATCH_HOOKS += HOST_SETOOLS_FIX_SETUP
+HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-python-networkx host-python-cython
 
 # apol requires pyqt5. However, the setools installation
 # process will install apol even if pyqt5 is missing.
@@ -43,7 +19,7 @@ HOST_SETOOLS_POST_PATCH_HOOKS += HOST_SETOOLS_FIX_SETUP
 ifeq ($(BR2_PACKAGE_PYTHON_PYQT5),)
 define SETOOLS_REMOVE_QT_SCRIPTS
 	$(RM) $(TARGET_DIR)/usr/bin/apol
-	$(RM) -r $(TARGET_DIR)/lib/$(SETOOLS_PYLIBVER)/site-packages/setoolsgui/
+	$(RM) -r $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/setoolsgui/
 endef
 SETOOLS_POST_INSTALL_TARGET_HOOKS += SETOOLS_REMOVE_QT_SCRIPTS
 endif
-- 
2.23.0
