From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Wed, 11 Mar 2020 11:54:45 +0100
Subject: [Buildroot] [PATCH v3 2/4] package/python-iptables: try known libc
 instead of find_library()
In-Reply-To: <20200311105447.23808-1-frank.vanbever@essensium.com>
References: <20200228163917.10596-1-frank.vanbever@essensium.com>
 <20200311105447.23808-1-frank.vanbever@essensium.com>
Message-ID: <20200311105447.23808-2-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ctypes.util.find_library() depends on gcc and friends to detect the location of
a given shared library. Given that these are not available on the target and
that python-iptables depends on this functionality we need to work around this.
The SONAMEs of the libc are well known so we try the known ones for glibc,
uClibc and musl.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
----
v2 -> v3:
  - None
v1 -> v2:
  - Change URL in patch from pull request to commit

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 ...-Add-separate-mechanism-to-load-libc.patch | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch

diff --git a/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch b/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
new file mode 100644
index 0000000000..2a344c2f55
--- /dev/null
+++ b/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
@@ -0,0 +1,90 @@
+From e3557528d7cdcdc2c579212be8837bc9b54635a4 Mon Sep 17 00:00:00 2001
+From: Frank Vanbever <frank.vanbever@essensium.com>
+Date: Thu, 20 Feb 2020 12:14:08 +0100
+Subject: [PATCH] Add separate mechanism to load libc
+
+ctypes.util.find_library() always returns None for systems which do not have the
+tools installed to determine the location of a given shared library (i.e.
+ldconfig, gcc, objdump). If find_libary() fails attempt to load known libc by
+SONAME.
+
+Upstream: https://github.com/ldx/python-iptables/commit/e3557528d7cdcdc2c579212be8837bc9b54635a4
+
+Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
+---
+ iptc/ip4tc.py   |  4 ++--
+ iptc/util.py    | 16 ++++++++++++++++
+ iptc/xtables.py |  4 ++--
+ 3 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/iptc/ip4tc.py b/iptc/ip4tc.py
+index 4c5d690..4ddd2dc 100644
+--- a/iptc/ip4tc.py
++++ b/iptc/ip4tc.py
+@@ -9,7 +9,7 @@ import socket
+ import struct
+ import weakref
+ 
+-from .util import find_library, load_kernel
++from .util import find_library, load_kernel, find_libc
+ from .xtables import (XT_INV_PROTO, NFPROTO_IPV4, XTablesError, xtables,
+                       xt_align, xt_counters, xt_entry_target, xt_entry_match)
+ 
+@@ -26,7 +26,7 @@ if not hasattr(socket, 'IPPROTO_SCTP'):
+ 
+ _IFNAMSIZ = 16
+ 
+-_libc = ct.CDLL("libc.so.6")
++_libc = find_libc()
+ _get_errno_loc = _libc.__errno_location
+ _get_errno_loc.restype = ct.POINTER(ct.c_int)
+ _malloc = _libc.malloc
+diff --git a/iptc/util.py b/iptc/util.py
+index ae5fb9b..e6b1649 100644
+--- a/iptc/util.py
++++ b/iptc/util.py
+@@ -109,3 +109,19 @@ def find_library(*names):
+             major = int(m.group(1))
+         return lib, major
+     return None, None
++
++
++def find_libc():
++    lib = ctypes.util.find_library('c')
++    if lib is not None:
++        return ctypes.CDLL(lib, mode=ctypes.RTLD_GLOBAL)
++
++    libnames = ['libc.so.6', 'libc.so.0', 'libc.so']
++    for name in libnames:
++        try:
++            lib = ctypes.CDLL(name, mode=ctypes.RTLD_GLOBAL)
++            return lib
++        except:
++            pass
++
++    return None
+diff --git a/iptc/xtables.py b/iptc/xtables.py
+index 93bc080..cf21029 100644
+--- a/iptc/xtables.py
++++ b/iptc/xtables.py
+@@ -6,7 +6,7 @@ import sys
+ import weakref
+ 
+ from . import version
+-from .util import find_library
++from .util import find_library, find_libc
+ from .errors import *
+ 
+ XT_INV_PROTO = 0x40  # invert the sense of PROTO
+@@ -792,7 +792,7 @@ class xtables_target(ct.Union):
+                 ("v12", _xtables_target_v12)]
+ 
+ 
+-_libc, _ = find_library("c")
++_libc = find_libc()
+ _optind = ct.c_long.in_dll(_libc, "optind")
+ _optarg = ct.c_char_p.in_dll(_libc, "optarg")
+ 
+-- 
+2.20.1
+
-- 
2.20.1
