From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Wed, 11 Mar 2020 11:54:47 +0100
Subject: [Buildroot] [PATCH v3 4/4] package/python-iptables: account for
 platform tag in extensions
In-Reply-To: <20200311105447.23808-1-frank.vanbever@essensium.com>
References: <20200228163917.10596-1-frank.vanbever@essensium.com>
 <20200311105447.23808-1-frank.vanbever@essensium.com>
Message-ID: <20200311105447.23808-4-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EXT_SUFFIX in Python versions > 3.5 contains a platform tag which only applies
to cpython extensions. Given that ctypes.util.find_library does not work on the
target due to the absence of the underlying tools '.so' needs to be added as a
possible suffix for libraries to enable python-iptables to find the iptables
shared libraries.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
v2 -> v3:
   - Add additional patch to fix python-iptables for python > 3.5
---
 ...o-as-additional-shared-object-suffix.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch

diff --git a/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch b/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
new file mode 100644
index 0000000000..41d49fc1e6
--- /dev/null
+++ b/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
@@ -0,0 +1,57 @@
+From 899d25c511c6ce779b7153e9ae2e41055b30b9c5 Mon Sep 17 00:00:00 2001
+From: Frank Vanbever <frank.vanbever@essensium.com>
+Date: Mon, 9 Mar 2020 12:36:47 +0100
+Subject: [PATCH] Add '.so' as additional shared object suffix
+
+EXT_SUFFIX includes a platform information tag starting from Python 3.5 [0]
+For example:
+
+    >>> sysconfig.get_config_var("EXT_SUFFIX")
+    '.cpython-38-aarch64-linux-gnu.so'
+
+This suffix only applies to cpython extensions i.e. not to the iptables shared
+objects.
+
+Adding '.so' as an additional suffix for shared objects fixes the issue.
+
+Fixes: Issue #301
+
+Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
+
+Backported from: 899d25c511c6ce779b7153e9ae2e41055b30b9c5
+
+[0]: https://docs.python.org/3/whatsnew/3.5.html#build-and-c-api-changes
+---
+ iptc/util.py | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/iptc/util.py b/iptc/util.py
+index e6b1649..04fe905 100644
+--- a/iptc/util.py
++++ b/iptc/util.py
+@@ -80,12 +80,19 @@ def _do_find_library(name):
+ 
+ 
+ def _find_library(*names):
++    exts = []
+     if version_info >= (3, 3):
+-        ext = get_config_var("EXT_SUFFIX")
++        exts.append(get_config_var("EXT_SUFFIX"))
+     else:
+-        ext = get_config_var('SO')
++        exts.append(get_config_var('SO'))
++
++    if version_info >= (3, 5):
++        exts.append('.so')
++
+     for name in names:
+-        libnames = [name, "lib" + name, name + ext, "lib" + name + ext]
++        libnames = [name, "lib" + name]
++        for ext in exts:
++            libnames += [name + ext, "lib" + name + ext]
+         libdir = os.environ.get('IPTABLES_LIBDIR', None)
+         if libdir is not None:
+             libdirs = libdir.split(':')
+-- 
+2.20.1
+
-- 
2.20.1
