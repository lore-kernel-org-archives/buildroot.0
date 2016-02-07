From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:40:55 +0100
Subject: [Buildroot] [git commit] package/musepack: fix musl build
Message-ID: <20160207214153.3FCAF80758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f3aed3f50ff48c8a60185407d7220aeedfea5e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds two patches needed to fix musl related build issues
in musepack: a missing <sys/select.h> inclusion, and an inclusion of
<fpu_control.h> that should be made conditional on __GLIBC__.

Fixes:

  http://autobuild.buildroot.net/results/6eb/6ebc9cbee3fc48f4f5b658d11b040ad62fb6607f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: split the patch in two patches, add proper patch
description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-include-fpu-control-with-glibc-only.patch | 26 ++++++++++++++++++++++
 package/musepack/0004-missing-sys-select.patch     | 21 +++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/package/musepack/0003-include-fpu-control-with-glibc-only.patch b/package/musepack/0003-include-fpu-control-with-glibc-only.patch
new file mode 100644
index 0000000..6f50155
--- /dev/null
+++ b/package/musepack/0003-include-fpu-control-with-glibc-only.patch
@@ -0,0 +1,26 @@
+Include <fpu_control.h> only on glibc systems
+
+The <fpu_control.h> header provides _FPU_*() macros, which the
+Init_FPU() function uses only on i386, and only when they are
+defined. Since <fpu_control.h> is not available, this causes a build
+failure with C libraries such as musl. By simply including
+<fpu_control.h> explicitly on glibc systems, we avoid the build
+failure, since mpcenc.c already conditionally uses the <fpu_control.h>
+macros only if they are defined.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: better commit log.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -uNr musepack_src_r475.org/mpcenc/mpcenc.h musepack_src_r475/mpcenc/mpcenc.h
+--- musepack_src_r475.org/mpcenc/mpcenc.h	2009-02-23 19:15:46.000000000 +0100
++++ musepack_src_r475/mpcenc/mpcenc.h	2016-01-30 09:29:08.000000000 +0100
+@@ -50,7 +51,7 @@
+ # include <unistd.h>
+ #endif
+ 
+-#if   defined __linux__
++#if   defined __GLIBC__
+ #  include <fpu_control.h>
+ #elif defined __FreeBSD__
+ # include <machine/floatingpoint.h>
diff --git a/package/musepack/0004-missing-sys-select.patch b/package/musepack/0004-missing-sys-select.patch
new file mode 100644
index 0000000..1e3a4b1
--- /dev/null
+++ b/package/musepack/0004-missing-sys-select.patch
@@ -0,0 +1,21 @@
+Add missing <sys/select.h> include
+
+This header is needed when types like fd_set are used. This fixes a
+build issue occuring on the musl C library.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: better commit log.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/mpcenc/mpcenc.h
+===================================================================
+--- a/mpcenc/mpcenc.h
++++ b/mpcenc/mpcenc.h
+@@ -34,6 +34,7 @@
+ //// portable system includes //////////////////////////////////////
+ #include <stddef.h>
+ #include <math.h>
++#include <sys/select.h>
+ 
+ //// system dependent system includes //////////////////////////////
+ // low level I/O, where are prototypes and constants?
