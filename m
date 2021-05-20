From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:48 -0700
Subject: [Buildroot] [PATCH/NEXT: 10/11] package/setools: bump to version
 4.4.0
In-Reply-To: <20210520174649.1188340-1-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>
Message-ID: <20210520174649.1188340-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove upstream patch 0001-remove-werror-flag-from-setup.patch
- Refactor Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch to apply
  to 4.4.0

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...-setools.InfoFlowAnalysis-and-setoo.patch} | 19 ++++++------
 .../0001-remove-werror-flag-from-setup.patch  | 31 -------------------
 package/setools/setools.hash                  |  2 +-
 package/setools/setools.mk                    |  2 +-
 4 files changed, 12 insertions(+), 42 deletions(-)
 rename package/setools/{0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch => 0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch} (88%)
 delete mode 100644 package/setools/0001-remove-werror-flag-from-setup.patch

diff --git a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
similarity index 88%
rename from package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
rename to package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index f9519a0790..3c3ae97dff 100644
--- a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -15,6 +15,7 @@ sedta and seinfoflow to require python3-networkx
 Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 [Refreshed for 4.3.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Refreshed for 4.4.0]
 ---
  sedta                       | 3 ++-
  seinfoflow                  | 5 +++--
@@ -36,7 +37,7 @@ index 60861ca630a5..0056172a55e5 100755
 +import setools.dta
  
  
- def print_transition(trans):
+ def print_transition(trans: setools.DomainTransition) -> None:
 @@ -114,7 +115,7 @@ else:
  
  try:
@@ -58,7 +59,7 @@ index f10c39de4d8e..fe733bbd0787 100755
  import argparse
  import sys
  import logging
-@@ -101,8 +102,8 @@ elif args.booleans is not None:
+@@ -102,8 +103,8 @@ elif args.booleans is not None:
  try:
      p = setools.SELinuxPolicy(args.policy)
      m = setools.PermissionMap(args.map)
@@ -70,20 +71,20 @@ index f10c39de4d8e..fe733bbd0787 100755
      if args.shortest_path or args.all_paths:
          if args.shortest_path:
 diff --git a/setools/__init__.py b/setools/__init__.py
-index 26fa5aa34a19..9e9058a6bf90 100644
+index d72d343..4d5aaaa 100644
 --- a/setools/__init__.py
 +++ b/setools/__init__.py
-@@ -75,11 +75,11 @@ from .pcideviceconquery import PcideviceconQuery
+@@ -91,11 +91,11 @@ from .pcideviceconquery import PcideviceconQuery
  from .devicetreeconquery import DevicetreeconQuery
  
  # Information Flow Analysis
 -from .infoflow import InfoFlowAnalysis
 +# from .infoflow import InfoFlowAnalysis
- from .permmap import PermissionMap
+ from .permmap import PermissionMap, RuleWeight, Mapping
  
  # Domain Transition Analysis
--from .dta import DomainTransitionAnalysis
-+# from .dta import DomainTransitionAnalysis
+-from .dta import DomainTransitionAnalysis, DomainEntrypoint, DomainTransition
++# from .dta import DomainTransitionAnalysis, DomainEntrypoint, DomainTransition
  
  # Policy difference
  from .diff import PolicyDifference
@@ -91,7 +92,7 @@ diff --git a/setoolsgui/apol/dta.py b/setoolsgui/apol/dta.py
 index 4608b9dbf34e..2cde44c142e9 100644
 --- a/setoolsgui/apol/dta.py
 +++ b/setoolsgui/apol/dta.py
-@@ -23,7 +23,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
+@@ -24,7 +24,7 @@ from PyQt5.QtCore import pyqtSignal, Qt, QStringListModel, QThread
  from PyQt5.QtGui import QPalette, QTextCursor
  from PyQt5.QtWidgets import QCompleter, QHeaderView, QMessageBox, QProgressDialog, \
      QTreeWidgetItem
@@ -99,7 +100,7 @@ index 4608b9dbf34e..2cde44c142e9 100644
 +from setools.dta import DomainTransitionAnalysis
  
  from ..logtosignal import LogHandlerToSignal
- from .analysistab import AnalysisTab
+ from .analysistab import AnalysisSection, AnalysisTab
 diff --git a/setoolsgui/apol/infoflow.py b/setoolsgui/apol/infoflow.py
 index 7bca299d23fc..7fee2778f35f 100644
 --- a/setoolsgui/apol/infoflow.py
diff --git a/package/setools/0001-remove-werror-flag-from-setup.patch b/package/setools/0001-remove-werror-flag-from-setup.patch
deleted file mode 100644
index 0ab4006661..0000000000
--- a/package/setools/0001-remove-werror-flag-from-setup.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8ab5a49247d870d92a8287db6134877ebf7a4379 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Thu, 12 Oct 2017 22:04:58 -0400
-Subject: [PATCH] remove werror flag from setup
-
-Compilers older than gcc6 will generate uninitialized variable warnings which
-will cause compiling to fail.
-
-Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
-[Refreshed for 4.3.0]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 457c83049ca5..4dcb30196abf 100644
---- a/setup.py
-+++ b/setup.py
-@@ -106,7 +106,7 @@ ext_py_mods = [Extension('setools.policyrep', ['setools/policyrep.pyx'],
-                          libraries=['selinux', 'sepol'],
-                          library_dirs=lib_dirs,
-                          define_macros=macros,
--                         extra_compile_args=['-Werror', '-Wextra',
-+                         extra_compile_args=['-Wextra',
-                                              '-Waggregate-return',
-                                              '-Wfloat-equal',
-                                              '-Wformat', '-Wformat=2',
--- 
-2.26.2
-
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index 689b20a357..74428a177c 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	da2c1d23edd24c4aa17d01d78e86c9e5fb5bf3aa38c71d5d63f41c750f6ef26c setools-4.3.0.tar.gz
+sha256	202eac5f857475937bee8136cff278aa2b4a4b94a0dec63fbbbe18c9eb644a4e setools-4.4.0.tar.gz
 sha256  2f7547e10f76a382c24c053595f38a5cc6dda9347f508f254ca490e0046a9624 COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index a07b1367a2..8e1c0d2cc6 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SETOOLS_VERSION = 4.3.0
+SETOOLS_VERSION = 4.4.0
 SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
 SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
 SETOOLS_INSTALL_STAGING = YES
-- 
2.31.1
