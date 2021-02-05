From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  5 Feb 2021 14:07:56 +0100
Subject: [Buildroot] [PATCH] package/python3: add upstream security fix for
 CVE-2021-3177
Message-ID: <20210205130756.17142-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- CVE-2021-3177: Python 3.x through 3.9.1 has a buffer overflow in
  PyCArg_repr in _ctypes/callproc.c, which may lead to remote code execution
  in certain Python applications that accept floating-point numbers as
  untrusted input, as demonstrated by a 1e300 argument to
  c_double.from_param.  This occurs because sprintf is used unsafely.

For details, see the advisory:
https://python-security.readthedocs.io/vuln/ctypes-buffer-overflow-pycarg_repr.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Replace-snprintf-with-Python-unicod.patch | 190 ++++++++++++++++++
 package/python3/python3.mk                    |   3 +
 2 files changed, 193 insertions(+)
 create mode 100644 package/python3/0035-closes-bpo-42938-Replace-snprintf-with-Python-unicod.patch

diff --git a/package/python3/0035-closes-bpo-42938-Replace-snprintf-with-Python-unicod.patch b/package/python3/0035-closes-bpo-42938-Replace-snprintf-with-Python-unicod.patch
new file mode 100644
index 0000000000..5f20265a23
--- /dev/null
+++ b/package/python3/0035-closes-bpo-42938-Replace-snprintf-with-Python-unicod.patch
@@ -0,0 +1,190 @@
+From c347cbe694743cee120457aa6626712f7799a932 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 18 Jan 2021 13:29:31 -0800
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
+ formatting in ctypes param reprs. (GH-24247)
+
+(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
+ .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
+ Modules/_ctypes/callproc.c                    | 51 +++++++------------
+ 3 files changed, 64 insertions(+), 32 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_parameters.py
+index e4c25fd880..531894fdec 100644
+--- a/Lib/ctypes/test/test_parameters.py
++++ b/Lib/ctypes/test/test_parameters.py
+@@ -201,6 +201,49 @@ class SimpleTypesTestCase(unittest.TestCase):
+         with self.assertRaises(ZeroDivisionError):
+             WorseStruct().__setstate__({}, b'foo')
+ 
++    def test_parameter_repr(self):
++        from ctypes import (
++            c_bool,
++            c_char,
++            c_wchar,
++            c_byte,
++            c_ubyte,
++            c_short,
++            c_ushort,
++            c_int,
++            c_uint,
++            c_long,
++            c_ulong,
++            c_longlong,
++            c_ulonglong,
++            c_float,
++            c_double,
++            c_longdouble,
++            c_char_p,
++            c_wchar_p,
++            c_void_p,
++        )
++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?'@0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c' ('a')>")
++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u'@0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b' (98)>")
++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B' (98)>")
++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h' (511)>")
++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H' (511)>")
++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cparam '[liq]' \(20000\)>$")
++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cparam '[LIQ]' \(20000\)>$")
++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f' (1.5)>")
++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd' (1.5)>")
++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd' (1e+300)>")
++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cparam ('d' \(1.5\)|'g'@0x[A-Fa-f0-9]+)>$")
++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam 'z' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam 'Z' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam 'P' \(0x0*12\)>$")
++
+ ################################################################
+ 
+ if __name__ == '__main__':
+diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+new file mode 100644
+index 0000000000..7df65a156f
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+@@ -0,0 +1,2 @@
++Avoid static buffers when computing the repr of :class:`ctypes.c_double` and
++:class:`ctypes.c_longdouble` values.
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
+index b0a36a3024..f2506de544 100644
+--- a/Modules/_ctypes/callproc.c
++++ b/Modules/_ctypes/callproc.c
+@@ -489,58 +489,47 @@ is_literal_char(unsigned char c)
+ static PyObject *
+ PyCArg_repr(PyCArgObject *self)
+ {
+-    char buffer[256];
+     switch(self->tag) {
+     case 'b':
+     case 'B':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.b);
+-        break;
+     case 'h':
+     case 'H':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.h);
+-        break;
+     case 'i':
+     case 'I':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.i);
+-        break;
+     case 'l':
+     case 'L':
+-        sprintf(buffer, "<cparam '%c' (%ld)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
+             self->tag, self->value.l);
+-        break;
+ 
+     case 'q':
+     case 'Q':
+-        sprintf(buffer,
+-#ifdef MS_WIN32
+-            "<cparam '%c' (%I64d)>",
+-#else
+-            "<cparam '%c' (%lld)>",
+-#endif
++        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
+             self->tag, self->value.q);
+-        break;
+     case 'd':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.d);
+-        break;
+-    case 'f':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.f);
+-        break;
+-
++    case 'f': {
++        PyObject *f = PyFloat_FromDouble((self->tag == 'f') ? self->value.f : self->value.d);
++        if (f == NULL) {
++            return NULL;
++        }
++        PyObject *result = PyUnicode_FromFormat("<cparam '%c' (%R)>", self->tag, f);
++        Py_DECREF(f);
++        return result;
++    }
+     case 'c':
+         if (is_literal_char((unsigned char)self->value.c)) {
+-            sprintf(buffer, "<cparam '%c' ('%c')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
+                 self->tag, self->value.c);
+         }
+         else {
+-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
+                 self->tag, (unsigned char)self->value.c);
+         }
+-        break;
+ 
+ /* Hm, are these 'z' and 'Z' codes useful at all?
+    Shouldn't they be replaced by the functionality of c_string
+@@ -549,22 +538,20 @@ PyCArg_repr(PyCArgObject *self)
+     case 'z':
+     case 'Z':
+     case 'P':
+-        sprintf(buffer, "<cparam '%c' (%p)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
+             self->tag, self->value.p);
+         break;
+ 
+     default:
+         if (is_literal_char((unsigned char)self->tag)) {
+-            sprintf(buffer, "<cparam '%c'@%p>",
++            return PyUnicode_FromFormat("<cparam '%c'@%p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+         else {
+-            sprintf(buffer, "<cparam 0x%02x@%p>",
++            return PyUnicode_FromFormat("<cparam 0x%02x@%p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+-        break;
+     }
+-    return PyUnicode_FromString(buffer);
+ }
+ 
+ static PyMemberDef PyCArgType_members[] = {
+-- 
+2.20.1
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8dbd0bab66..e85e704626 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -11,6 +11,9 @@ PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
 PYTHON3_LICENSE_FILES = LICENSE
 
+# 0035-closes-bpo-42938-Replace-snprintf-with-Python-unicod.patch
+PYTHON3_IGNORE_CVES += CVE-2021-3177
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.20.1
