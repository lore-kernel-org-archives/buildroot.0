From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 19:35:47 +0100
Subject: [Buildroot] [git commit] package/domoticz: fix build with python 3.8
Message-ID: <20191110182848.E21D98EC83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9613fa8230112ae2b29076270fa42d3ca9dcd56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7790f4726d1fca3e5c0630f71f15417eeb7bf02a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...4-DelayedLink.h-fix-build-with-python-3-8.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch b/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
new file mode 100644
index 0000000000..5b9abffabd
--- /dev/null
+++ b/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
@@ -0,0 +1,66 @@
+From e9bd383ceb63db7cfe8a284014f0cdf8c2bfe4f0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 1 Nov 2019 10:54:11 +0100
+Subject: [PATCH] DelayedLink.h: fix build with python 3.8
+
+Fix build with python 3.8 by copy/pasting the vim workaround from
+https://github.com/vim/vim/commit/13a1f3fb0c9d08bba6109fe2131c9524e6ba7e15
+
+Fix 3703
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/e9bd383ceb63db7cfe8a284014f0cdf8c2bfe4f0]
+---
+ hardware/plugins/DelayedLink.h | 38 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+
+diff --git a/hardware/plugins/DelayedLink.h b/hardware/plugins/DelayedLink.h
+index 4bf1973281..c90a7d8e69 100644
+--- a/hardware/plugins/DelayedLink.h
++++ b/hardware/plugins/DelayedLink.h
+@@ -14,6 +14,44 @@
+ #include <frameobject.h>
+ #include "../../main/Helper.h"
+ 
++#if PY_VERSION_HEX >= 0x030800f0
++static inline void
++py3__Py_DECREF(const char *filename, int lineno, PyObject *op)
++{
++	(void)filename; /* may be unused, shut up -Wunused-parameter */
++	(void)lineno; /* may be unused, shut up -Wunused-parameter */
++	_Py_DEC_REFTOTAL;
++	if (--op->ob_refcnt != 0)
++	{
++#ifdef Py_REF_DEBUG
++	if (op->ob_refcnt < 0)
++	{
++		_Py_NegativeRefcount(filename, lineno, op);
++	}
++#endif
++	}
++	else
++	{
++		_Py_Dealloc(op);
++	}
++}
++
++#undef Py_DECREF
++#define Py_DECREF(op) py3__Py_DECREF(__FILE__, __LINE__, _PyObject_CAST(op))
++
++static inline void
++py3__Py_XDECREF(PyObject *op)
++{
++	if (op != NULL)
++	{
++		Py_DECREF(op);
++	}
++}
++
++#undef Py_XDECREF
++#define Py_XDECREF(op) py3__Py_XDECREF(_PyObject_CAST(op))
++#endif
++
+ namespace Plugins {
+ 
+ #ifdef WIN32
