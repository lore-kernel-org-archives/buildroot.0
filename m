From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:22:04 +0100
Subject: [Buildroot] [git commit branch/next] package/kmod: bump to version
 27
Message-ID: <20200224211042.E2AFE8E8CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94e024e942c0db2d95570f4bed90c525837050c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop second and third patches (already in version)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...k-for-undefined-symbols-when-building-the.patch | 75 ----------------------
 .../0003-Makefile.am-filter-Wl-no-undefined.patch  | 43 -------------
 package/kmod/kmod.hash                             |  6 +-
 package/kmod/kmod.mk                               |  4 +-
 4 files changed, 4 insertions(+), 124 deletions(-)

diff --git a/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch b/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
deleted file mode 100644
index 3be40d4993..0000000000
--- a/package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 55a0a0aac503f5012ff2df7af37107544c757f19 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 22 Oct 2019 09:56:32 +0200
-Subject: [PATCH kmod] Do not check for undefined symbols when building the
- Python modules
-
-kmod's configure.ac uses the -Wl,--no-undefined linker flag to verify
-at link time that all symbols of shared libraries are available, and
-that there are no undefined symbols.
-
-This make perfect sense for regular shared libraries. However, for
-Python extensions, which will be dlopen()ed inside the Python
-interpreter, it makes less sense.
-
-Since Python 3.8, there is a change in python-config script and
-Python's pkg-config file: it no longer links Python extensions with
-the libpython library. See
-https://docs.python.org/dev/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
-which states:
-
-  On the other hand, pkg-config python3.8 --libs no longer contains
-  -lpython3.8. C extensions must not be linked to libpython (except on
-  Android and Cygwin, whose cases are handled by the script); this
-  change is backward incompatible on purpose. (Contributed by Victor
-  Stinner in bpo-36721.)
-
-So, when linking the kmod Python extensions, it currently fails with
-numerous unresolved symbols, that were previously provided by
-libpython:
-
-/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/7.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: libkmod/python/kmod/.libs/list_la-list.o: in function `__Pyx_PyObject_GetAttrStr':
-list.c:(.text.__Pyx_PyObject_GetAttrStr+0x48): undefined reference to `PyObject_GetAttr'
-/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/7.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: libkmod/python/kmod/.libs/list_la-list.o: in function `__pyx_tp_dealloc_4kmod_4list_ModListItem':
-list.c:(.text.__pyx_tp_dealloc_4kmod_4list_ModListItem+0x78): undefined reference to `PyObject_CallFinalizerFromDealloc'
-/home/test/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/7.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: libkmod/python/kmod/.libs/list_la-list.o: in function `__pyx_tp_dealloc_4kmod_4list_ModList':
-list.c:(.text.__pyx_tp_dealloc_4kmod_4list_ModList+0x30): undefined reference to `PyErr_Fetch'
-
-[Complete log at http://autobuild.buildroot.net/results/79a/79a5a0398723e8cfea0d0aa3dec5f7649aee4c63/build-end.log]
-
-Linking with libpython is no longer recommended: those symbols should
-remain unresolved in the Python extensions, as they wil be properly
-resolved when the Python extension gets loaded into the Python
-interpreter.
-
-Since we want to keep -Wl,--no-undefined globally in kmod, we leave
-the configure.ac file unchanged, and instead, specifically in the
-LDFLAGS used to build the Python extensions, we override
--Wl,--no-undefined with -Wl,-z,undefs. Ideally, -Wl,--no-undefined is
-the same as -Wl,-z,defs, and the effect of these options can be
-canceled on the linker command line by a following -Wl,-z,undefs (see
-the ld man page for details).
-
-Upstream: https://lore.kernel.org/linux-modules/20191024174710.9441-1-thomas.petazzoni at bootlin.com/
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Cc: Victor Stinner <victor.stinner@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c5c2f06..8e9c90d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -173,7 +173,7 @@ CPYTHON_MODULE_CFLAGS = \
- 	$(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
- 	$(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
- 	-fvisibility=default
--CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared
-+CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs
- 
- if BUILD_PYTHON
- pkgpyexec_LTLIBRARIES = \
--- 
-2.21.0
-
diff --git a/package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch b/package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch
deleted file mode 100644
index f4d90d4c24..0000000000
--- a/package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7a55f18e14f606500fdeab6bc116ec74f3e5b1c3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 Nov 2019 17:40:32 +0100
-Subject: [PATCH] Makefile.am: filter -Wl,--no-undefined
-
-Commit 1d14ef82f4a3be741bcdf6b1c6d51ce9dce43567 does not completely fix
-the build with python 3.8 as we still get link failure due to
-'-z undefs' being ignored by some versions of ld:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld: warning: -z undefs ignored.
-
-/home/naourr/work/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld: warning: -z undefs ignored.
-
-So filter -Wl,--no-undefined to fix the issue
-
-Fixes:
- - http://autobuild.buildroot.org/results/e9645d9969481b09f507f6e0d0b35faaa283eb60
- - http://autobuild.buildroot.org/results/06a6d865b6b7d8ebd793bde214f4a4c40e0962e1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8e9c90d..47505c1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -173,7 +173,10 @@ CPYTHON_MODULE_CFLAGS = \
- 	$(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
- 	$(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
- 	-fvisibility=default
--CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs
-+# Filter -Wl,--no-undefined to fix build with python 3.8
-+comma = ,
-+CPYTHON_MODULE_LDFLAGS = $(subst -Wl$(comma)--no-undefined,,$(AM_LDFLAGS))
-+CPYTHON_MODULE_LDFLAGS += -module -avoid-version -shared
- 
- if BUILD_PYTHON
- pkgpyexec_LTLIBRARIES = \
--- 
-2.24.0
-
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index dea5c0c107..3cb60b2dd3 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256 57bb22c8bb56435991f6b0810a042b0a65e2f1e217551efa58235b7034cdbb9d  kmod-26.tar.xz
+sha256  c1d3fbf16ca24b95f334c1de1b46f17bbe5a10b0e81e72668bdc922ebffbbc0c  kmod-27.tar.xz
 
 # Locally calculated
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e21f40a845..e2dfea5c7b 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-KMOD_VERSION = 26
+KMOD_VERSION = 27
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-# 0002-Do-not-check-for-undefined-symbols-when-building-the.patch
-KMOD_AUTORECONF = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
