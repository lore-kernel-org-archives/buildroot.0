From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:28:19 +0200
Subject: [Buildroot] [git commit] package/python-iptables: bump to version
 1.0.0
Message-ID: <20210406200853.898838365F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=042c2ccde2ab0b814b6511fdaf15350cbed40eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://github.com/ldx/python-iptables/compare/v0.14.0...v1.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Add-separate-mechanism-to-load-libc.patch | 90 ----------------------
 ...dd-.so-as-additional-shared-object-suffix.patch | 57 --------------
 package/python-iptables/python-iptables.hash       |  5 +-
 package/python-iptables/python-iptables.mk         |  4 +-
 4 files changed, 5 insertions(+), 151 deletions(-)

diff --git a/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch b/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
deleted file mode 100644
index 2a344c2f55..0000000000
--- a/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From e3557528d7cdcdc2c579212be8837bc9b54635a4 Mon Sep 17 00:00:00 2001
-From: Frank Vanbever <frank.vanbever@essensium.com>
-Date: Thu, 20 Feb 2020 12:14:08 +0100
-Subject: [PATCH] Add separate mechanism to load libc
-
-ctypes.util.find_library() always returns None for systems which do not have the
-tools installed to determine the location of a given shared library (i.e.
-ldconfig, gcc, objdump). If find_libary() fails attempt to load known libc by
-SONAME.
-
-Upstream: https://github.com/ldx/python-iptables/commit/e3557528d7cdcdc2c579212be8837bc9b54635a4
-
-Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
----
- iptc/ip4tc.py   |  4 ++--
- iptc/util.py    | 16 ++++++++++++++++
- iptc/xtables.py |  4 ++--
- 3 files changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/iptc/ip4tc.py b/iptc/ip4tc.py
-index 4c5d690..4ddd2dc 100644
---- a/iptc/ip4tc.py
-+++ b/iptc/ip4tc.py
-@@ -9,7 +9,7 @@ import socket
- import struct
- import weakref
- 
--from .util import find_library, load_kernel
-+from .util import find_library, load_kernel, find_libc
- from .xtables import (XT_INV_PROTO, NFPROTO_IPV4, XTablesError, xtables,
-                       xt_align, xt_counters, xt_entry_target, xt_entry_match)
- 
-@@ -26,7 +26,7 @@ if not hasattr(socket, 'IPPROTO_SCTP'):
- 
- _IFNAMSIZ = 16
- 
--_libc = ct.CDLL("libc.so.6")
-+_libc = find_libc()
- _get_errno_loc = _libc.__errno_location
- _get_errno_loc.restype = ct.POINTER(ct.c_int)
- _malloc = _libc.malloc
-diff --git a/iptc/util.py b/iptc/util.py
-index ae5fb9b..e6b1649 100644
---- a/iptc/util.py
-+++ b/iptc/util.py
-@@ -109,3 +109,19 @@ def find_library(*names):
-             major = int(m.group(1))
-         return lib, major
-     return None, None
-+
-+
-+def find_libc():
-+    lib = ctypes.util.find_library('c')
-+    if lib is not None:
-+        return ctypes.CDLL(lib, mode=ctypes.RTLD_GLOBAL)
-+
-+    libnames = ['libc.so.6', 'libc.so.0', 'libc.so']
-+    for name in libnames:
-+        try:
-+            lib = ctypes.CDLL(name, mode=ctypes.RTLD_GLOBAL)
-+            return lib
-+        except:
-+            pass
-+
-+    return None
-diff --git a/iptc/xtables.py b/iptc/xtables.py
-index 93bc080..cf21029 100644
---- a/iptc/xtables.py
-+++ b/iptc/xtables.py
-@@ -6,7 +6,7 @@ import sys
- import weakref
- 
- from . import version
--from .util import find_library
-+from .util import find_library, find_libc
- from .errors import *
- 
- XT_INV_PROTO = 0x40  # invert the sense of PROTO
-@@ -792,7 +792,7 @@ class xtables_target(ct.Union):
-                 ("v12", _xtables_target_v12)]
- 
- 
--_libc, _ = find_library("c")
-+_libc = find_libc()
- _optind = ct.c_long.in_dll(_libc, "optind")
- _optarg = ct.c_char_p.in_dll(_libc, "optarg")
- 
--- 
-2.20.1
-
diff --git a/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch b/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
deleted file mode 100644
index 41d49fc1e6..0000000000
--- a/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 899d25c511c6ce779b7153e9ae2e41055b30b9c5 Mon Sep 17 00:00:00 2001
-From: Frank Vanbever <frank.vanbever@essensium.com>
-Date: Mon, 9 Mar 2020 12:36:47 +0100
-Subject: [PATCH] Add '.so' as additional shared object suffix
-
-EXT_SUFFIX includes a platform information tag starting from Python 3.5 [0]
-For example:
-
-    >>> sysconfig.get_config_var("EXT_SUFFIX")
-    '.cpython-38-aarch64-linux-gnu.so'
-
-This suffix only applies to cpython extensions i.e. not to the iptables shared
-objects.
-
-Adding '.so' as an additional suffix for shared objects fixes the issue.
-
-Fixes: Issue #301
-
-Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
-
-Backported from: 899d25c511c6ce779b7153e9ae2e41055b30b9c5
-
-[0]: https://docs.python.org/3/whatsnew/3.5.html#build-and-c-api-changes
----
- iptc/util.py | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/iptc/util.py b/iptc/util.py
-index e6b1649..04fe905 100644
---- a/iptc/util.py
-+++ b/iptc/util.py
-@@ -80,12 +80,19 @@ def _do_find_library(name):
- 
- 
- def _find_library(*names):
-+    exts = []
-     if version_info >= (3, 3):
--        ext = get_config_var("EXT_SUFFIX")
-+        exts.append(get_config_var("EXT_SUFFIX"))
-     else:
--        ext = get_config_var('SO')
-+        exts.append(get_config_var('SO'))
-+
-+    if version_info >= (3, 5):
-+        exts.append('.so')
-+
-     for name in names:
--        libnames = [name, "lib" + name, name + ext, "lib" + name + ext]
-+        libnames = [name, "lib" + name]
-+        for ext in exts:
-+            libnames += [name + ext, "lib" + name + ext]
-         libdir = os.environ.get('IPTABLES_LIBDIR', None)
-         if libdir is not None:
-             libdirs = libdir.split(':')
--- 
-2.20.1
-
diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
index 46786699ac..ee5f765fba 100644
--- a/package/python-iptables/python-iptables.hash
+++ b/package/python-iptables/python-iptables.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/python-iptables/json
-md5	98ee55f239bf8f2d002915d76b416c22  python-iptables-0.14.0.tar.gz
-sha256	61b23850ad5d917436aa73c2847ab941bc0edbe79a324b0eebdb98af0b65b10d  python-iptables-0.14.0.tar.gz
+md5  3fb27da1107bdb62196850fa70e8b0d4  python-iptables-1.0.0.tar.gz
+sha256  480470adb5f29bf84269b4e53dbad9623af91c79aa666cc0274dec199a555bc5  python-iptables-1.0.0.tar.gz
+
 # Locally calculated
 sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 66e478a89a..72bf292c77 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_IPTABLES_VERSION = 0.14.0
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/08/5e/16a5ca35c420b8059eeb72716e316eeb6f0e59ce028998d36b2dc87554e5
+PYTHON_IPTABLES_VERSION = 1.0.0
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/ca/6e/cba9c6f4b5a1963b7f5b015f5ed5e2eec7a94ac460570e3474177c4004d6
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
