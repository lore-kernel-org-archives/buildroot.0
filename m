From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 15 Jul 2020 15:07:40 +0200
Subject: [Buildroot] [PATCH 9/9] package/setools: bump to 4.3.0
In-Reply-To: <20200715130740.775804-1-antoine.tenart@bootlin.com>
References: <20200715130740.775804-1-antoine.tenart@bootlin.com>
Message-ID: <20200715130740.775804-10-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

setools is no longer hosted on https://github.com/TresysTechnology/setools/.
Update the source location to its new home,
https://github.com/SELinuxProject/setools/.

Refresh patches 0001-remove-werror-flag-from-setup.patch and
0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch for
4.3.0 and remove patch 0003-setup.py-drop-path-prefix-from-man-install.patch
that is now upstream.

Add a new dependency on host-python-cython, as setup.py now depends on
it.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 .../0001-remove-werror-flag-from-setup.patch  | 16 ++--
 ...e-setools.InfoFlowAnalysis-and-setoo.patch | 74 ++++++++++---------
 ...py-drop-path-prefix-from-man-install.patch | 42 -----------
 package/setools/setools.hash                  |  4 +-
 package/setools/setools.mk                    | 12 +--
 5 files changed, 54 insertions(+), 94 deletions(-)
 delete mode 100644 package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch

diff --git a/package/setools/0001-remove-werror-flag-from-setup.patch b/package/setools/0001-remove-werror-flag-from-setup.patch
index 4f6d2efb966c..0ab4006661f7 100644
--- a/package/setools/0001-remove-werror-flag-from-setup.patch
+++ b/package/setools/0001-remove-werror-flag-from-setup.patch
@@ -1,4 +1,4 @@
-From b2fe84bfd00117d4897f1f2e8f83d3410eb188b8 Mon Sep 17 00:00:00 2001
+From 8ab5a49247d870d92a8287db6134877ebf7a4379 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 12 Oct 2017 22:04:58 -0400
 Subject: [PATCH] remove werror flag from setup
@@ -6,24 +6,26 @@ Subject: [PATCH] remove werror flag from setup
 Compilers older than gcc6 will generate uninitialized variable warnings which
 will cause compiling to fail.
 
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+[Refreshed for 4.3.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 2ca44c9..9319bf6 100644
+index 457c83049ca5..4dcb30196abf 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -146,7 +146,7 @@ ext_py_mods = [Extension('setools.policyrep._qpol',
-                           'libqpol/policy_scan.c',
-                           'libqpol/xen_query.c'],
-                          include_dirs=include_dirs,
+@@ -106,7 +106,7 @@ ext_py_mods = [Extension('setools.policyrep', ['setools/policyrep.pyx'],
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
+2.26.2
 
diff --git a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index 508087ff2c3f..f9519a07903e 100644
--- a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -1,4 +1,4 @@
-From 2512c3ba608077db3a5e0286b976fadc8a04a5c4 Mon Sep 17 00:00:00 2001
+From ae84e5ef59bb24d5b8fd17e6756952f42c2d5c36 Mon Sep 17 00:00:00 2001
 From: rpm-build <rpm-build>
 Date: Thu, 23 Feb 2017 08:17:07 +0100
 Subject: [PATCH] Do not export/use setools.InfoFlowAnalysis and
@@ -12,30 +12,32 @@ Therefore it's better to use setools.infoflow.InfoFlowAnalysis and
 setools.dta.DomainTransitionAnalysis and let the package containing
 sedta and seinfoflow to require python3-networkx
 
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+[Refreshed for 4.3.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  sedta                       | 3 ++-
- seinfoflow                  | 3 ++-
+ seinfoflow                  | 5 +++--
  setools/__init__.py         | 4 ++--
  setoolsgui/apol/dta.py      | 2 +-
  setoolsgui/apol/infoflow.py | 2 +-
- tests/dta.py                | 3 ++-
- tests/infoflow.py           | 3 ++-
- 7 files changed, 12 insertions(+), 8 deletions(-)
+ tests/dta.py                | 2 +-
+ tests/infoflow.py           | 2 +-
+ 7 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/sedta b/sedta
-index 1c76ebb..255ad49 100755
+index 60861ca630a5..0056172a55e5 100755
 --- a/sedta
 +++ b/sedta
-@@ -23,6 +23,7 @@ import argparse
- import logging
+@@ -23,6 +23,7 @@ import logging
+ import signal
  
  import setools
 +import setools.dta
  
  
  def print_transition(trans):
-@@ -111,7 +112,7 @@ else:
+@@ -114,7 +115,7 @@ else:
  
  try:
      p = setools.SELinuxPolicy(args.policy)
@@ -45,31 +47,33 @@ index 1c76ebb..255ad49 100755
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/seinfoflow b/seinfoflow
-index b287921..d53bdef 100755
+index f10c39de4d8e..fe733bbd0787 100755
 --- a/seinfoflow
 +++ b/seinfoflow
-@@ -19,6 +19,7 @@
+@@ -18,6 +18,7 @@
+ #
  
- from __future__ import print_function
  import setools
 +import setools.infoflow
  import argparse
  import sys
  import logging
-@@ -79,7 +80,7 @@ else:
+@@ -101,8 +102,8 @@ elif args.booleans is not None:
  try:
      p = setools.SELinuxPolicy(args.policy)
      m = setools.PermissionMap(args.map)
--    g = setools.InfoFlowAnalysis(p, m, min_weight=args.min_weight, exclude=args.exclude)
-+    g = setools.infoflow.InfoFlowAnalysis(p, m, min_weight=args.min_weight, exclude=args.exclude)
+-    g = setools.InfoFlowAnalysis(p, m, min_weight=args.min_weight, exclude=args.exclude,
+-                                 booleans=booleans)
++    g = setools.infoflow.InfoFlowAnalysis(p, m, min_weight=args.min_weight, exclude=args.exclude,
++                                          booleans=booleans)
  
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/setools/__init__.py b/setools/__init__.py
-index a84c846..a53c5a7 100644
+index 26fa5aa34a19..9e9058a6bf90 100644
 --- a/setools/__init__.py
 +++ b/setools/__init__.py
-@@ -74,11 +74,11 @@ from .pcideviceconquery import PcideviceconQuery
+@@ -75,11 +75,11 @@ from .pcideviceconquery import PcideviceconQuery
  from .devicetreeconquery import DevicetreeconQuery
  
  # Information Flow Analysis
@@ -84,59 +88,57 @@ index a84c846..a53c5a7 100644
  # Policy difference
  from .diff import PolicyDifference
 diff --git a/setoolsgui/apol/dta.py b/setoolsgui/apol/dta.py
-index 0aaf13f..5b1ea20 100644
+index 4608b9dbf34e..2cde44c142e9 100644
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
+index 7bca299d23fc..7fee2778f35f 100644
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
+index a0cc9381469c..177e6fb0b961 100644
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
+index aa0e44a7e4f8..fca2848aeca5 100644
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
+2.26.2
 
diff --git a/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch b/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
deleted file mode 100644
index 63344506b216..000000000000
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
index 872929706406..689b20a3570c 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,7 +1,5 @@
-# From https://github.com/TresysTechnology/setools3/wiki/Download
-md5	d68d0d4e4da0f01da0f208782ff04b91	setools-4.1.1.tar.bz2
 # Locally computed
-sha256	46a927ea2b163cbe1d35cc35da43e45853e13720c7e02d4cf75a498783c19610 setools-4.1.1.tar.gz
+sha256	da2c1d23edd24c4aa17d01d78e86c9e5fb5bf3aa38c71d5d63f41c750f6ef26c setools-4.3.0.tar.gz
 sha256  2f7547e10f76a382c24c053595f38a5cc6dda9347f508f254ca490e0046a9624 COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 63ca3651e878..fc49fc218e6b 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.1.1
-SETOOLS_SITE = $(call github,TresysTechnology,setools,$(SETOOLS_VERSION))
-SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-swig
+SETOOLS_VERSION = 4.3.0
+SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
+SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
 SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 SETOOLS_SETUP_TYPE = setuptools
-HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-python-networkx
+HOST_SETOOLS_DEPENDENCIES = host-python-cython host-libselinux host-libsepol host-python-networkx
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
@@ -24,7 +24,7 @@ endif
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
-	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/usr/lib']@g" \
+	$(SED) "s at lib_dirs =.*@lib_dirs = ['$(STAGING_DIR)/usr/lib']@g" \
 		$(@D)/setup.py
 endef
 SETOOLS_POST_PATCH_HOOKS += SETOOLS_FIX_SETUP
@@ -32,7 +32,7 @@ SETOOLS_POST_PATCH_HOOKS += SETOOLS_FIX_SETUP
 define HOST_SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the host directory.
-	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(HOST_DIR)/lib']@g" \
+	$(SED) "s at lib_dirs =.*@lib_dirs = ['$(HOST_DIR)/lib']@g" \
 		$(@D)/setup.py
 endef
 HOST_SETOOLS_POST_PATCH_HOOKS += HOST_SETOOLS_FIX_SETUP
-- 
2.26.2
