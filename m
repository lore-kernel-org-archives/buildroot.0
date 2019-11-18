From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:24:38 +0100
Subject: [Buildroot] [git commit] package/kmod: fix build with python 3.8
Message-ID: <20191118211738.E52048F22D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ae86ebeceedc3316815004747db6b90e51be65a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to filter -Wl,--no-undefined as -Wl,-z,undefs was only
added in binutils 2.30, and therefore is not available in some older
toolchains, causing build failures such as:

/home/naourr/work/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld: warning: -z undefs ignored.

Fixes:
 - http://autobuild.buildroot.org/results/06a6d865b6b7d8ebd793bde214f4a4c40e0962e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Makefile.am-filter-Wl-no-undefined.patch  | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch b/package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch
new file mode 100644
index 0000000000..f4d90d4c24
--- /dev/null
+++ b/package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch
@@ -0,0 +1,43 @@
+From 7a55f18e14f606500fdeab6bc116ec74f3e5b1c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Nov 2019 17:40:32 +0100
+Subject: [PATCH] Makefile.am: filter -Wl,--no-undefined
+
+Commit 1d14ef82f4a3be741bcdf6b1c6d51ce9dce43567 does not completely fix
+the build with python 3.8 as we still get link failure due to
+'-z undefs' being ignored by some versions of ld:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld: warning: -z undefs ignored.
+
+/home/naourr/work/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld: warning: -z undefs ignored.
+
+So filter -Wl,--no-undefined to fix the issue
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e9645d9969481b09f507f6e0d0b35faaa283eb60
+ - http://autobuild.buildroot.org/results/06a6d865b6b7d8ebd793bde214f4a4c40e0962e1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8e9c90d..47505c1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -173,7 +173,10 @@ CPYTHON_MODULE_CFLAGS = \
+ 	$(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
+ 	$(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
+ 	-fvisibility=default
+-CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs
++# Filter -Wl,--no-undefined to fix build with python 3.8
++comma = ,
++CPYTHON_MODULE_LDFLAGS = $(subst -Wl$(comma)--no-undefined,,$(AM_LDFLAGS))
++CPYTHON_MODULE_LDFLAGS += -module -avoid-version -shared
+ 
+ if BUILD_PYTHON
+ pkgpyexec_LTLIBRARIES = \
+-- 
+2.24.0
+
