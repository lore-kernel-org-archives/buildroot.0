From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Apr 2020 22:24:46 +0200
Subject: [Buildroot] [git commit] package/python-iptables: account for
 platform tag in extensions
Message-ID: <20200415201730.729FC8ECF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52276cdda34aa986410626592031560bf64d788b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

EXT_SUFFIX in Python versions > 3.5 contains a platform tag which only applies
to cpython extensions. Given that ctypes.util.find_library does not work on the
target due to the absence of the underlying tools '.so' needs to be added as a
possible suffix for libraries to enable python-iptables to find the iptables
shared libraries.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...dd-.so-as-additional-shared-object-suffix.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

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
