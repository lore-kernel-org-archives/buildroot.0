From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 09:56:45 +0100
Subject: [Buildroot] [git commit] package/domoticz: fix build with python 3.9
Message-ID: <20201110084328.C6E8C81F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=349cca4e9decf43668c2b306cccd6562929ba53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/994c95b2e3635c30e4a575fcf707eaa57b89e198

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Build-failure-with-python-3-9.patch       | 36 +++++++++++++++++++
 .../0004-Load-python-3-9-shared-libs.patch         | 41 ++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/package/domoticz/0003-Build-failure-with-python-3-9.patch b/package/domoticz/0003-Build-failure-with-python-3-9.patch
new file mode 100644
index 0000000000..3b07436e83
--- /dev/null
+++ b/package/domoticz/0003-Build-failure-with-python-3-9.patch
@@ -0,0 +1,36 @@
+From b3525e2a970ae3e783665040b1e0db5fc3391327 Mon Sep 17 00:00:00 2001
+From: Jose Zapater <jzapater@gmail.com>
+Date: Mon, 2 Nov 2020 09:46:17 +0100
+Subject: [PATCH] Build failure with python 3.9
+
+Signed-off-by: Jose Zapater <jzapater@gmail.com>
+
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/b3525e2a970ae3e783665040b1e0db5fc3391327]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ hardware/plugins/DelayedLink.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/hardware/plugins/DelayedLink.h b/hardware/plugins/DelayedLink.h
+index c90a7d8e69..cb71478685 100644
+--- a/hardware/plugins/DelayedLink.h
++++ b/hardware/plugins/DelayedLink.h
+@@ -14,6 +14,17 @@
+ #include <frameobject.h>
+ #include "../../main/Helper.h"
+ 
++#ifndef _Py_DEC_REFTOTAL
++  /* _Py_DEC_REFTOTAL macro has been removed from Python 3.9 by:
++    https://github.com/python/cpython/commit/49932fec62c616ec88da52642339d83ae719e924 */
++#  ifdef Py_REF_DEBUG
++#    define _Py_DEC_REFTOTAL _Py_RefTotal--
++#  else
++#    define _Py_DEC_REFTOTAL
++#    define _Py_Dealloc
++#  endif
++#endif
++
+ #if PY_VERSION_HEX >= 0x030800f0
+ static inline void
+ py3__Py_DECREF(const char *filename, int lineno, PyObject *op)
diff --git a/package/domoticz/0004-Load-python-3-9-shared-libs.patch b/package/domoticz/0004-Load-python-3-9-shared-libs.patch
new file mode 100644
index 0000000000..c157fd354e
--- /dev/null
+++ b/package/domoticz/0004-Load-python-3-9-shared-libs.patch
@@ -0,0 +1,41 @@
+From 4e1d21967d27d286cbc837b98a1a9f031f7dde58 Mon Sep 17 00:00:00 2001
+From: Jose Zapater <jzapater@gmail.com>
+Date: Fri, 6 Nov 2020 07:40:37 +0100
+Subject: [PATCH] Load python 3.9 shared libs
+
+Signed-off-by: Jose Zapater <jzapater@gmail.com>
+
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/4e1d21967d27d286cbc837b98a1a9f031f7dde58]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ hardware/plugins/DelayedLink.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hardware/plugins/DelayedLink.h b/hardware/plugins/DelayedLink.h
+index cb71478685..409c9dce1b 100644
+--- a/hardware/plugins/DelayedLink.h
++++ b/hardware/plugins/DelayedLink.h
+@@ -193,12 +193,14 @@ namespace Plugins {
+ 			if (!shared_lib_) {
+ #ifdef WIN32
+ #	ifdef _DEBUG
++				if (!shared_lib_) shared_lib_ = LoadLibrary("python39_d.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python38_d.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python37_d.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python36_d.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python35_d.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python34_d.dll");
+ #	else
++				if (!shared_lib_) shared_lib_ = LoadLibrary("python39.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python38.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python37.dll");
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python36.dll");
+@@ -206,6 +208,7 @@ namespace Plugins {
+ 				if (!shared_lib_) shared_lib_ = LoadLibrary("python34.dll");
+ #	endif
+ #else
++				if (!shared_lib_) FindLibrary("python3.9", true);
+ 				if (!shared_lib_) FindLibrary("python3.8", true);
+ 				if (!shared_lib_) FindLibrary("python3.7", true);
+ 				if (!shared_lib_) FindLibrary("python3.6", true);
