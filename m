From: Diankun Zhang <kundy.zhang@gmail.com>
Date: Thu, 20 Jul 2017 22:49:08 +0800
Subject: [Buildroot] [PATCH 1/1] python: fix the _ctype module compiling
 error caused by ffi library
Message-ID: <CAO6UsjBMM4PUTuY5HK+AJAS2FQTTGOgQHHrSpUmZVSJ5ibQsZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ctype compiling error for python 2 is caused by the mixed
ifdefs X86_WIN32 and X86_WIN64. The issue is tracked by
python upstream issue  https://bugs.python.org/issue23042.
Whereas the patch is not completely applied on python package.
This additional patch is a supplement for the issue.

Signed-off-by: Diankun Zhang <kundy.zhang@gmail.com>
---
 package/python/0035-fix-ffi-windws-ifdefs.patch | 27
+++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/python/0035-fix-ffi-windws-ifdefs.patch

diff --git a/package/python/0035-fix-ffi-windws-ifdefs.patch
b/package/python/0035-fix-ffi-windws-ifdefs.patch
new file mode 100644
index 0000000..74511cf
--- /dev/null
+++ b/package/python/0035-fix-ffi-windws-ifdefs.patch
@@ -0,0 +1,27 @@
+ffi.c: fix the compiling error caused by the mixed definition of calls for
+       different platforms(x86 and x64) in function ffi_prep_closure_loc()
+
+The issue is tracked by upstream python bug
+https://bugs.python.org/issue23042
+
+Signed-off-by: Diankun Zhang <kundy.zhang@gmail.com>
+
+--- a/Modules/_ctypes/libffi/src/x86/ffi.c     Wed Mar 18 14:39:33 2015
+0100
++++ b/Modules/_ctypes/libffi/src/x86/ffi.c     Thu Mar 19 08:39:52 2015
+0000
+@@ -673,6 +673,7 @@
+                            &ffi_closure_SYSV,
+                            (void*)codeloc);
+     }
++#ifdef X86_WIN32
+   else if (cif->abi == FFI_FASTCALL)
+     {
+       FFI_INIT_TRAMPOLINE_STDCALL (&closure->tramp[0],
+@@ -691,7 +692,6 @@
+                                    &ffi_closure_STDCALL,
+                                    (void*)codeloc);
+     }
+-#ifdef X86_WIN32
+   else if (cif->abi == FFI_MS_CDECL)
+     {
+       FFI_INIT_TRAMPOLINE (&closure->tramp[0],
+
--
2.7.4


-- 
-Diankun
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/56371484/attachment.html>
