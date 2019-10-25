From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 11:31:36 +0200
Subject: [Buildroot] [PATCHv2] package/kmod: add patch fixing the build with
 Python 3.8
Message-ID: <20191025093136.7621-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump of python3 to 3.8, the kmod Python extensions fail to
build. There was a change in Python 3.8: they no longer want Python
extensions to be linked with libpython.

However, kmod Python extensions are built with -Wl,--no-undefined,
which checks that there isn't any unresolved symbol in the .so files
being built. This is not compatible with the new Python policy, so we
add a patch (submitted upstream) that passes -Wl,-z,undefs when
building the kmod Python extensions, to override the effect of
-Wl,--no-undefined.

Fixes:

  http://autobuild.buildroot.net/results/84455dbc892865b9748bedeecb1d3b0bdc15704d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes from v1 to v2:
- Add link to the patch sent upstream

 ...-undefined-symbols-when-building-the.patch | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch

diff --git a/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch b/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
new file mode 100644
index 0000000000..3be40d4993
--- /dev/null
+++ b/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
@@ -0,0 +1,75 @@
+From 55a0a0aac503f5012ff2df7af37107544c757f19 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 22 Oct 2019 09:56:32 +0200
+Subject: [PATCH kmod] Do not check for undefined symbols when building the
+ Python modules
+
+kmod's configure.ac uses the -Wl,--no-undefined linker flag to verify
+at link time that all symbols of shared libraries are available, and
+that there are no undefined symbols.
+
+This make perfect sense for regular shared libraries. However, for
+Python extensions, which will be dlopen()ed inside the Python
+interpreter, it makes less sense.
+
+Since Python 3.8, there is a change in python-config script and
+Python's pkg-config file: it no longer links Python extensions with
+the libpython library. See
+https://docs.python.org/dev/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+which states:
+
+  On the other hand, pkg-config python3.8 --libs no longer contains
+  -lpython3.8. C extensions must not be linked to libpython (except on
+  Android and Cygwin, whose cases are handled by the script); this
+  change is backward incompatible on purpose. (Contributed by Victor
+  Stinner in bpo-36721.)
+
+So, when linking the kmod Python extensions, it currently fails with
+numerous unresolved symbols, that were previously provided by
+libpython:
+
+/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/7.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: libkmod/python/kmod/.libs/list_la-list.o: in function `__Pyx_PyObject_GetAttrStr':
+list.c:(.text.__Pyx_PyObject_GetAttrStr+0x48): undefined reference to `PyObject_GetAttr'
+/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/7.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: libkmod/python/kmod/.libs/list_la-list.o: in function `__pyx_tp_dealloc_4kmod_4list_ModListItem':
+list.c:(.text.__pyx_tp_dealloc_4kmod_4list_ModListItem+0x78): undefined reference to `PyObject_CallFinalizerFromDealloc'
+/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/7.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: libkmod/python/kmod/.libs/list_la-list.o: in function `__pyx_tp_dealloc_4kmod_4list_ModList':
+list.c:(.text.__pyx_tp_dealloc_4kmod_4list_ModList+0x30): undefined reference to `PyErr_Fetch'
+
+[Complete log at http://autobuild.buildroot.net/results/79a/79a5a0398723e8cfea0d0aa3dec5f7649aee4c63/build-end.log]
+
+Linking with libpython is no longer recommended: those symbols should
+remain unresolved in the Python extensions, as they wil be properly
+resolved when the Python extension gets loaded into the Python
+interpreter.
+
+Since we want to keep -Wl,--no-undefined globally in kmod, we leave
+the configure.ac file unchanged, and instead, specifically in the
+LDFLAGS used to build the Python extensions, we override
+-Wl,--no-undefined with -Wl,-z,undefs. Ideally, -Wl,--no-undefined is
+the same as -Wl,-z,defs, and the effect of these options can be
+canceled on the linker command line by a following -Wl,-z,undefs (see
+the ld man page for details).
+
+Upstream: https://lore.kernel.org/linux-modules/20191024174710.9441-1-thomas.petazzoni at bootlin.com/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Cc: Victor Stinner <victor.stinner@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c5c2f06..8e9c90d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -173,7 +173,7 @@ CPYTHON_MODULE_CFLAGS = \
+ 	$(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
+ 	$(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
+ 	-fvisibility=default
+-CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared
++CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs
+ 
+ if BUILD_PYTHON
+ pkgpyexec_LTLIBRARIES = \
+-- 
+2.21.0
+
-- 
2.21.0
